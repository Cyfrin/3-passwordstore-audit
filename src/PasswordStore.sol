// SPDX-License-Identifier: MIT
pragma solidity ^0.8; // is this the correct

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();

    address private s_owner;
    // @audit s_password is not actually private
    /*
    Smart contract data is publicly visible on the blockchain. If you store a password as a
     state variable, it will be visible to anyone who inspects the blockchain. While you have
      marked it as private, it only means that it can't be directly accessed outside the 
      ``contract. However, its value is 
    still visible to anyone who examines the blockchain, and it could potentially be exploited.

    */
    string private s_password;

    event SetNetPassword();

    constructor() {
        s_owner = msg.sender;
    }

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */

    // can a non owner set the password?
    //@audit any user can set a password
    //missing access controls

    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNetPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     * @param newPassword The new password to set.
     */

    //no newPassword
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}
