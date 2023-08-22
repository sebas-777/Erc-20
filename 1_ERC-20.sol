// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//ERC-20:https://github.com/sebas-777/openzeppelin-contracts/tree/master/contracts/token/ERC20 

//Interfaz
interface IERC20 {
    
    function totalSupply()external view  returns (uint256); 

    function balanceOf(address account) external view returns(uint256); 

    function transfer(address to,uint256 amount) external returns (bool);

    function allowance(address owner,address spender) external view returns(uint256);

    function transferFrom(
        address from,
        address to,
        address amount
    ) external returns (bool);

    // evento
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed  owner,address indexed  spender, uint256 value);
}