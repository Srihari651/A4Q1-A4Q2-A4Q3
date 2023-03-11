pragma solidity ^0.5.1;
import 'Token.sol'; // import the ERC20 token contract from 'https://github.com/polynetwork/eth-contracts/blob/master/contracts/libs/token/ERC20/ERC20.sol'
contract tokenSale
{
    enum State {inactive,active,completed} //declares three states of the the contract
    State public state;
    constructor() public //shows inactive state of contract when deloyed and returns 0
    {
        state==State.inactive;
    }
    function startSale() public returns(bool) //returns 1 when the contract is active
    {
        state=State.active;
        return state==State.active;
    }
    function buySale() public returns(bool) //function declaration to buy tokens by sending ethers
    {
        Token token = Token(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4); //transfers the token the the address mentioned
        token.transfer(msg.sender,2); //transfer 2 tokens for 2 ethrs to the sender
        state=State.active;
        return state==State.active; //returns 1 if the contract is active
    }
    modifier transfer(address payable recipient) //sender required amount of ethers the the token sender
    {
        recipient.transfer(2 ether); //transfers 2 ethers to the address of the token sender
        _;
    }

    function endSale() public returns(bool) //returns 1 if the contract is completed
    {
        state==State.completed;
        return state==State.completed;
    }
}