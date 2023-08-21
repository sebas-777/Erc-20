// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//https://github.com/sebas-777/openzeppelin-contracts/tree/master/contracts/token/ERC20
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GLDToken is ERC20 {
    constructor(uint256 initialSupply) ERC20("Gold", "GLD") {
        _mint(msg.sender, initialSupply);
    }
}