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
        uint56 amount
    ) external returns (bool);

    // evento
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed  owner,address indexed  spender, uint256 value);
}

contract ERC20 is IERC20 { 

    mapping(address => uint256) private _balances;
    mapping(address => mapping(address => uint256)) private _allowances;

    uint256 private _totalSupply;
    string private _name;
    string private _symbol;

    constructor(string memory name_,string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    } 

    function name() public view virtual  returns (string memory){
        return _name;
    } 

    function symbol() public view virtual  returns (string memory){
        return _symbol;
    } 

    //505 -> 5.05(505 / 10**2)
    function decimals() public view virtual returns(uint8) {
        return 18;
    } 

    function totalSupply() public view virtual  override  returns (uint256) {
        return _totalSupply;
    } 

    function balaceOf(address account) public view virtual  override  returns (uint256) {
        return _balances[account];
    }

    function transfer() public virtual override returns(bool) {
        address owner = msg.sender;
        _transfer(owner,to,amount);
        return  true;
    } 

    function allowance(address owner,address spender) public view virtual override returns (uint256) {
       return  _allowances[owner][spender];
    } 

    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = msg.sender;
        _approve(owner,spender,amount);
        return true;
    } 

    function transferFrom(
        address from,
        address to,
        uint256 amount) public override returns (bool){ 
            address spender = msg.sender;
            _spendAllowance(from,spender,amount);
            _transfer(from, to , amount);
            return true;

        } 

    function increaseAllwance( address spender, uint256 addedValue) public virtual returns (bool){
        address owner = msg.sender;
        _approve(owner,spender, _allowances[owner][spender] + addedValue);
        return true;
    } 

    function decreaseAllowance(address spender,uint256 subtractedValue) public virtual returns (bool) {
        address owner = msg.sender;
        uint256 currentAllowance = _allowances[owner][spender];
        require(currentAllowance >= subtractedValue,"ERC20: decreased allowance below zero");
        unchecked{
            _approve(owner,spender,currentAllowance-subtractedValue);
        } 
        return true;
    }




}