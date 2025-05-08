[S-1] Weak Password Storage (Root: Insecure Configuration + Impact: High)
The application stores user passwords in plaintext, which exposes sensitive data to unauthorized access if the storage is compromised.

**Impact**  
An attacker gaining access to the storage can retrieve all user passwords, leading to account compromise and potential data breaches.

**Proof of Concepts**  
1. Access the password storage file located at `3-passwordstore-audit/audit-data/passwords.txt`.  
2. Observe that passwords are stored in plaintext without any encryption or hashing.

**Recommended Mitigation**  
1. Implement strong password hashing algorithms such as bcrypt, Argon2, or PBKDF2.  
2. Ensure proper salting and iteration counts to enhance security.  
3. Regularly review and update password storage mechanisms to align with industry best practices.