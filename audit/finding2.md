### [S-#] `PasswordStore::setPassword` has no access control , meaning a non owner could change it

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