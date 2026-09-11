// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { TransactionImitation } from "./TransactionImitation.sol";
import { Transaction } from "./TransactionImitation.sol";

contract MerkleRoot {
    // my data to be hashed 
    TransactionImitation public data;
    Transaction[] transactions;

    // stores a hash value of transactions
    bytes32[] public hash;

    // Amount of transactions should be 2^n,
    // otherwise we cannot build the Merkle root
    function isValidAmountOfTransactions() internal view returns(bool){
        uint256 size = data.getTransactionSize();
        return size > 0 && (size & (size - 1 ) == 0);
    } 

    function makeHash() internal {

    }


}