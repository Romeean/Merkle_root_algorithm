// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { TransactionImitation } from "./TransactionImitation.sol";
import { Transaction } from "./TransactionImitation.sol";

contract MerkleRoot {
    // my data to be hashed 
    TransactionImitation public data;
    Transaction[] transactions;

    // gets the size of transactions globally, because it's value needed more than once;
    uint256 internal size = data.getTransactionSize();

    // stores a hash value of transactions
    bytes32[] public hashes;

    // Amount of transactions should be 2^n, otherwise we cannot build the Merkle root
    modifier isValidAmountOfTransactions(){
        if(size > 0 && (size & (size - 1 ) == 0)){
            revert("The amount of transactions should be 2^n");
        }
        _;
    } 


    function makeHash() internal isValidAmountOfTransactions {
        uint256 size_mutable = size;

        // Builds the leafs, hashes of transactions 
        for(uint256 i = 0; i < size_mutable; i++){
            bytes32 hashedTransaction = keccak256(abi.encode(transactions[i]));
            hashes.push(hashedTransaction);
        }

        uint256 offset = 0;
        while(size_mutable > 1){
            uint256 nextOffset = hashes.length;
            for(uint256 i = 0; i < size_mutable; i += 2){
                bytes32 hashedTransaction = keccak256(abi.encodePacked(hashes[offset + i], hashes[offset + i + 1]));
                hashes.push(hashedTransaction);
            }
            size_mutable = size_mutable / 2;
            offset = nextOffset;
        }

    }


}