// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // q is this the correct compiler version?

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();

    /*//////////////////////////////////////////////////////////
                     STATE VARIABLES
//////////////////////////////////////////////////////////*/
    address private s_owner;
    // @audit the s_password variable is not private, which means that anyone can read the password. We should make it private to ensure that only the owner can access it. It only means that other contracts can't read from it, but human beings can still read it from the blockchain. We should make it private to ensure that only the owner can access it.
    string private s_password;

    /*//////////////////////////////////////////////////////////
                        EVENTS
//////////////////////////////////////////////////////////*/

    event SetNetPassword();

    constructor() {
        s_owner = msg.sender;
    }

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
    // q can a none owner set the password? if so, how can we prevent that?
    // q should a non-owner be able to set a password? if so, how can we prevent that?
    // 🔴@audit any user can set a password, this is a security risk. We should add a check to ensure that only the owner can set the password.
    // 🛠@thefix: missing access control, anyone can set the password, which is a security risk. We should add a check to ensure that only the owner can set the password.
    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     // @audit there is no newPassword parameter!
     * @param newPassword The new password to set.
     */
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}
