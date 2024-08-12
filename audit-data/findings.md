### [H-1] Storing the password on-chain makes it visible to anyone, and is no longer private

**Description:** 

 Variables stored in storage on-chain are visable to anyone, no matter the solidity visibility keyword meaning the passord is not actually a private password. The `PasswordStore::s_password` variable is intended to be a private variable and only accessed through the `PasswordStore::getPassword` function, which is intended to be called only by the owner of the contract.

 We show one such method od reading any data off chain below.

**Impact:** Anyone can read the private password, severely breaking the functionality of the protocol.

**Proof of Concept:** (Proof of Code)

The below test can show how anyone can read the password directly from the blockchain.

1. Create a locally running chain
```bash
make anvil
```

2. Deploy the contract to the chain

```
make deploy
```

3. Run the storage tool
we use `1` because that is the storage slot of `s_password` in the contract.
```
cast storage <ADDRESS_HERE> 1 
```

You will get an outout that looks like this:
`0x6d7950617373776f726400000000000000000000000000000000000000000014`

You can then parse the hex to a string with:

```
cast parse-bytes32-string 0x6d7950617373776f726400000000000000000000000000000000000000000014
```

And get an ouput of:

```
myPassword
```

**Recommended Mitigation:** 

Due to this, the overall architecture of the contract should be rethought. One could encrypt the password off-chain, and then store the encrypted password on-chain. This would require the user to remember another password off-chain to decrypt the password. However, you would also likely want to remove the view function as you would not want the user to accidentally send a transaction with the password that decrypts your password.



### [H-2] `PasswordStore::setPassword` has no access control, meaning a non-owner could change the password

**Description:** 

The `PasswordStore::setPassword` function is set to be an `external` function, however, the natspec of the function and overall purpose of the smart contract is that `This function allows only the owner to set a new password`.

```javascript
    // @audit any user can set a password
    // missing access control
    function setPassword(string memory newPassword) external {
        s_password = newPassword;
        emit SetNetPassword();
    }
```

**Impact:** Anyone can set/change the password of the contract, severly breaking the contract intended functionality.

**Proof of Concept:** (Proof of Code)

Add the followeint to the `PasswordStore.t.sol` test file.

<details>
<summary>Code</summary>

```javascript
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


**Recommended Mitigation:** 

Add an access control conditional to the `setPassword` function.

```javascript

if(msg.sender != s_owner){
    revert PasswordStore__NotOwner();
}

```


### [I-1] `PasswordStore::getPassword` netspec indicates a parameter that does not exist, causing the natspec to be incorrect

**Description:** 

```javascript
    // @audit their is no newPassowrd parameter!
     * @param newPassword The new password to set.
     */

    function getPassword() external view returns (string memory) 
```

The `PasswordStore::getPassword` function signature is `getPassword()` which the natspec say it should be `getPassword(string)`. 



**Impact:** The natspec is incorrect.


**Recommended Mitigation:** 

Remove the incorrect natspec line.

```diff
- * @param newPassword The new password to set.
```