// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


struct Transaction {
    address from;
    address to;
    uint256 value;
    uint256 nonce;
    uint256 gasLimit;
    uint256 gasPrice;
    string  data;
}

contract TransactionImitation {
    Transaction[] public  transactions;
     
    address[8] addressesFrom = [
        0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045, // Vitalik Buterin (публичный)
        0x0000000000000000000000000000000000000000, // Null / burn address
        0x000000000000000000000000000000000000dEaD, // Burn address (популярный)
        0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2, // WETH contract
        0xdAC17F958D2ee523a2206206994597C13D831ec7, // USDT contract
        0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48, // USDC contract
        0x5a52E96BAcdaBb82fd05763E25335261B270Efcb, // Binance cold wallet
        0x28C6c06298d514Db089934071355E5743bf21d60  // Binance hot wallet
    ];

    address[8] public addressesTo = [
        0x21a31Ee1afC51d94C2eFcCAa2092aD1028285549, // Binance 14
        0x1522900B6daFac587d499a862861C0869Be6E428, // Coinbase cold wallet
        0x71660c4005BA85c37ccec55d0C4493E66Fe775d3, // Coinbase 2
        0xF977814e90dA44bFA03b6295A0616a897441aceC, // Binance 8
        0x3f5CE5FBFe3E9af3971dD833D26bA9b5C936f0bE, // Binance-affiliated
        0x503828976d22510aaD0201ac7eC882593211D923, // Kraken
        0xE93381fB4c4F14bDa253907b18faD305D799241a, // Huobi
        0x2FAF487A4414Fe77e2327F0bf4AE2a264a776AD2  // FTX (историческая)
    ];

    constructor(){
        createImitationTransaction();
    }

    function createImitationTransaction() internal {
        for(uint8 i = 0; i < addressesFrom.length; i++){
            transactions.push(Transaction({
                from:     addressesFrom[i],
                to:       addressesTo[i],
                value:    777,
                nonce:    transactions.length,
                gasLimit: 21000,
                gasPrice: 20 gwei,
                data:     "hi =)"    
            }));
        }
    
    }
   function getTransactionSize() public view returns(uint256){
        return transactions.length;
    }
}

 

 