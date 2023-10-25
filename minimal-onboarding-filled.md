# Minimal Smart Contract Security Review Onboarding

# Table of Contents

- [Minimal Smart Contract Security Review Onboarding](#minimal-smart-contract-security-review-onboarding)
- [Table of Contents](#table-of-contents)
- [About the project / Documentation](#about-the-project--documentation)
- [Stats](#stats)
- [Setup](#setup)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Testing](#testing)
- [Security Review Scope](#security-review-scope)
  - [Commit Hash](#commit-hash)
  - [Repo URL](#repo-url)
  - [In scope vs out of scope contracts](#in-scope-vs-out-of-scope-contracts)
  - [Compatibilities](#compatibilities)
- [Roles](#roles)
- [Known Issues](#known-issues)

# About the project / Documentation

A smart contract applicatoin for storing a password. Users should be able to store a password and then retrieve it later. Others should not be able to access the password. 

# Stats

- nSLOC: 20
- Complexity Score: 10
- Security Review Timeline: Date -> Date

# Setup

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Quickstart

```
git clone https://github.com/Cyfrin/3-passwordstore-audit
cd 3-passwordstore-audit
forge build
```

## Testing

```
forge test
```

# Security Review Scope

## Commit Hash

7d55682ddc4301a7b13ae9413095feffd9924566

## Repo URL

https://github.com/Cyfrin/3-passwordstore-audit

## In scope vs out of scope contracts

```
./src/
└── PasswordStore.sol
```

## Compatibilities

- Solc Version: 0.8.18
- Chain(s) to deploy contract to: 
  - ETH
- Tokens: None
  
# Roles

- Owner: The user who can set the password and read the password.
- Outsides: No one else should be able to set or read the password.

# Known Issues

None