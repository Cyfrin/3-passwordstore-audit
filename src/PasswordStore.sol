// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // @q Is it the right version of solidity?

/*
 * @author not-so-secure-dev
 * @title PasswordStore
 * @notice This contract allows you to store a private password that others won't be able to see. 
 * You can update your password at any time.
 */
contract PasswordStore {
    error PasswordStore__NotOwner();

    // @audit the owner has declared one time. This variable must be 'immutable'
    address private s_owner;
    // @audit the password is not decrypted and even the private variables can be read in the blockchain!
    string private s_password;

    event SetNewPassword();

    constructor() {
        s_owner = msg.sender;
    }

    /*
     * @notice This function allows only the owner to set a new password.
     * @param newPassword The new password to set.
     */
    //  @audit only the owner has to be able to set the password!
    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNewPassword();
    }

    /*
     * @notice This allows only the owner to retrieve the password.
     * @audit wrong params mentioned below!
     * @param newPassword The new password to set.
     */
    function getPassword() external view returns (string memory) {
        if (msg.sender != s_owner) {
            revert PasswordStore__NotOwner();
        }
        return s_password;
    }
}
