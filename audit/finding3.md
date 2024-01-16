### [S-3] `PasswordStore::getPassword` has a parameter doesnt exist

**Description:** The `PasswordStore::getPassword` function set_password is set to `external` function, however the function and overall purpose of smartcontract is that `only owners are allowed to get password`

**Impact:** natspec 




**Recommended Mitigation:** remove natspec

```diff
- * @param newPassword The new password to set.

```