# SecureVault

## Overview
SecureVault is a simple and secure Ethereum smart contract designed to act as a personal savings bank. It allows users to deposit and withdraw Ether safely, with built-in protections against reentrancy attacks and the ability for the contract owner to pause or resume contract operations.

## Features

- **Deposit Ether**: Users can deposit Ether into their personal balance.
- **Withdraw Ether**: Users can safely withdraw their Ether balance.
- **Reentrancy Protection**: Uses OpenZeppelin's `ReentrancyGuard` to prevent reentrancy attacks.
- **Pause/Unpause**: The contract owner can pause or unpause the contract in case of emergency.
- **Ownership Control**: Sensitive functions are restricted to the contract owner.

## Contract Details

- Solidity version: 0.8.30
- Dependencies: OpenZeppelin `ReentrancyGuard`

## Usage

- To deposit Ether, call `depositEther()` with payable value.
- To withdraw Ether, call `withdrawEther(uint256 amount)`.
- Only the owner can call `pauseContract()` and `unpauseContract()`.

## Events

- `DepositEvent(address indexed account, uint256 amount)`: Emitted on successful deposit.
- `WithdrawalEvent(address indexed account, uint256 amount)`: Emitted on successful withdrawal.
- `Paused()`: Emitted when contract is paused.
- `Unpaused()`: Emitted when contract is unpaused.

## Security

- Prevents reentrancy attacks using OpenZeppelin's `ReentrancyGuard`.
- Allows the owner to pause contract operations to mitigate risks during emergencies.

## License

This project is licensed under the MIT License.

---

*Created by [YourName] - A simple, secure smart contract for Ether savings.*
