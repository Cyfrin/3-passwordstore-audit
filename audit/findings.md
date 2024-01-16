### [S-1] ONCHAIN STATE VARIABLE

**Description:** All data stored on chain is visible to anyone and can be read directly by blockchain .
The `PasswordStore::s_password` variable is intended to be private and can only be called by owner

**Impact:** Anyone can read the password and set password.

**Proof of Concept:** (proof of code) The below test case shows how anyone can read the password directly from blockchain

**Recommended Mitigation:** 
Dont add the view function and also the encrypt the password on chain and store it in off chain.

### [S-2] `PasswordStore::setPassword` has no access control , meaning a non owner could change it

**Description:** The `PasswordStore::setPassword` function set_password is set to `external` function, however the function and overall purpose of smartcontract is that `only owners are allowed to set password`

**Impact:** anyone can set change the password of contract

**Proof of Concept:**
Add the following to t.sol file
<details>

```javascript
function test_anyone_can_set_password(address randomAddress) public{
        vm.assume(randomAddress!=owner);
        vm.prank(randomAddress);
        string memory expectedPassword = "myNewPassword";
        passwordStore.setPassword(expectedPassword);
        vm.prank(owner);
        string memory actualPassword = passwordStore.getPassword();
        assertEq(actualPassword,expectedPassword);
    }


```

</details>

**Recommended Mitigation:** Add an access control conditional to `setPassword` function

```javascript
if (!msg.sender != s_owner){
    revert Password_NotOwner();
}

```

### [S-3] `PasswordStore::getPassword` has a parameter doesnt exist

**Description:** The `PasswordStore::getPassword` function set_password is set to `external` function, however the function and overall purpose of smartcontract is that `only owners are allowed to get password`

**Impact:** natspec 




**Recommended Mitigation:** remove natspec

```diff
- * @param newPassword The new password to set.

```