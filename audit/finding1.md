### [S-#] TITLE (Root Cause + Impact)

**Description:** All data stored on chain is visible to anyone and can be read directly by blockchain .
The `PasswordStore::s_password` variable is intended to be private and can only be called by owner

**Impact:** Anyone can read the password and set password.

**Proof of Concept:** (proof of code) The below test case shows how anyone can read the password directly from blockchain

**Recommended Mitigation:** 
Dont add the view function and also the encrypt the password on chain and store it in off chain.