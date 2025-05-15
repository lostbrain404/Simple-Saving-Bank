// SPDX-License-Identifier: MIT 
pragma solidity 0.8.30;


import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract SimpleSavingsBank is  ReentrancyGuard{

    mapping (address => uint256) public transactions ;
    address private owner ;
    bool private paused ;

    event DepositEvent(address indexed _acount , uint256 _balance);
    event WithdrawalEvent(address indexed _acount , uint256 _balance); 
    event Paused();
    event Unpaused();

    constructor(){
        owner = msg.sender;
    }

    modifier OnlyOwner(){
        require(msg.sender ==owner,"Only the Onwer can preform this action");_;
    }

    modifier whenNotPaused(){
        require(!paused,"the contact is paused");_;
    }

    function depositEther()external payable whenNotPaused{
        require(msg.value>0,"No balance found ");
        transactions[msg.sender] += msg.value ;

        emit DepositEvent(msg.sender,msg.value);
    }

    function withdrawlEther(uint256 _amount)external nonReentrant whenNotPaused{
        require(_amount>0,"Invalid amount");
        require(transactions[msg.sender]>=_amount,"Insufficient balance ");

        transactions[msg.sender] -= _amount ;

        (bool sent ,) = msg.sender.call{value : _amount}("");
        require(sent,"Failed to send Ether");

        emit WithdrawalEvent(msg.sender ,_amount);
    }


    function pauseContract() external OnlyOwner{
        paused = true ;
        emit Paused();
    }

    function unpauseContract() external OnlyOwner{
        paused = false ;
        emit Unpaused();
    }

    function getBalance()public view returns(uint256){
        return transactions[msg.sender];
    }
}
