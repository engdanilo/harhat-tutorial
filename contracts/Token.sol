// SPDX-License- Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token{

    // Some string variables to identify the token
    string public name = "My Hardhat Token";
    string public symbol = "MHT";

    // The fixed amount of tokens stored in the contract
    uint256 public totalSupply = 1000000;

    // An address variable is used to store ethereum accounts
    address public owner;

    // A mapping is a key-value map. Here we store each account's balance.
    mapping(address => uint256) balances;

    //The transfer event helps off-chain applications understand
    // what happens within your contract.
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    //////////////////// CONTRACT INITIALIZATION ////////////////////
    constructor(){
        // The total supply is assigned to the owner of the contract
        balances[msg.sender] = totalSupply;
        owner = msg.sender;
    }   

    //////////////////// TRANSFER FUNCTION ////////////////////
    // The external modifier makes a function *only* callable from *outside* the contract.
    function transfer(address to, uint256 amount) external{
        // Check if the sender has enough tokens
        // If require's first argument evaluates to false, the function will revert.
        require(balances[msg.sender] >= amount, "Not enough tokens");

        // Using the console.log function to print data to the console.
        console.log("Transferring from %s to %s %s tokens", msg.sender, to, amount);

        // Transfer the amount
        balances[msg.sender] -= amount;
        balances[to] += amount;

        // Notify off-chain applications of the tranfer.
        emit Transfer(msg.sender, to, amount);
    }

    //////////////////// BALANCE FUNCTION ////////////////////
    // The view modifier indicates that the function will not modify the contract's state,
    // which allows us to call it without spending gas by executing a transaction.
    function balanceOf(address account) external view returns (uint256){
        return balances[account];
    }

    // to compile the contract, run the following command in the terminal
    // npx hardhat compile
}