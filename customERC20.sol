// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import"./1_ERC-20.sol";

contract customERC20 is ERC20 { 

    // Constructor del Smart Contract
    constructor ()ERC20("Joan","JA") { }

    // Creacion de nuevos Tokens
    function createTokens() public  {
        _mint(msg.sender,1000);
    }
    
}