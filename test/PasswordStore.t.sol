// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {PasswordStore} from "../src/PasswordStore.sol";
import {DeployPasswordStore} from "../script/DeployPasswordStore.s.sol";

contract PasswordStoreTest is Test {
    PasswordStore public passwordStore;
    DeployPasswordStore public deployer;
    address public owner;

    function setUp() public {
        deployer = new DeployPasswordStore();
        passwordStore = deployer.run();
        owner = msg.sender;
    }

    function test_owner_can_set_password() public {
        vm.startPrank(owner);
        string memory expectedPassword = "myNewPassword";
        passwordStore.setPassword(expectedPassword);
        string memory actualPassword = passwordStore.getPassword();
        assertEq(actualPassword, expectedPassword);
    }

    function test_non_owner_reading_password_reverts() public {
        vm.startPrank(address(1));

        vm.expectRevert(PasswordStore.PasswordStore__NotOwner.selector);
        passwordStore.getPassword();
    }

    function test_anyone_can_set_password(address randomAddress) public {
        vm.assume(randomAddress != address(0));
        vm.assume(randomAddress != owner);
        vm.assume(randomAddress != address(this));
        vm.assume(randomAddress != address(passwordStore));
        vm.assume(randomAddress != address(deployer));
        vm.assume(randomAddress != address(0x1234567890123456789012345678901234567890));
        vm.assume(randomAddress != address(0x9876543210987654321098765432109876543210));
        vm.startPrank(randomAddress);
        string memory expectedPassword = "myNewPassword";
        // Check if the address is not the owner
        if (randomAddress != owner) {
            // Expect revert if the address is not the owner
            // This is a test case where the random address is not the owner
            // and should not be able to set the password
            // but we are testing the revert condition
            // so we expect the revert to happen
            // and the password should not be set
            // to the new value
        vm.expectRevert(PasswordStore.PasswordStore__NotOwner.selector);
        passwordStore.setPassword("myNewPassword");
        passwordStore.setPassword(expectedPassword);

        vm.prank(owner);
        string memory actualPassword = passwordStore.getPassword();
        assertEq(actualPassword, expectedPassword);
        
    }
        
        
        string memory actualPassword = passwordStore.getPassword();
        assertEq(actualPassword, expectedPassword);
    }
    
}
