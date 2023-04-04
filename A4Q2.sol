//0x49e81e5Fa243b20526EE9E8714502dd1a818FF98//

pragma solidity ^0.8.1;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
contract crowdFunding
{
    using SafeMath for uint256;
    enum State {inactive,active,completed} //declares three states of the contract
    State public state;
    uint256 public fundingGoal; //total funding goal is declared as an integer
    uint256 public deadLine; //deadline of the contract declared as an integer
    constructor() public
    {
        state==State.inactive; //shows that the contract is in inactive state
    }
    address payable public fundAddress = payable (address(0x617F2E2fD72FD9D5503197092aC168c91465E7f2)); //represents the address to which the fundis raised

    function sendFunding(uint256 goalAmount, uint256 durationDays) external payable returns (bool)
    {
        fundingGoal=goalAmount; //represents the total amount of the goal
        uint256 a = 6000;
        deadLine = block.timestamp.add(a.mul(60).mul(24).mul(durationDays)); //gives the deadline of the contract in days
        state=State.active; //shows boolean value 1 when the contract is in active state
        return state==State.active;
    }

    function transfer(uint256 amount) external payable
    {
        fundAddress.transfer(amount); //transfers the fund amount from sender to the mentioned fund address
    }

    function fundBalance() public view returns(uint256 a)
    {
        a=(address(0x617F2E2fD72FD9D5503197092aC168c91465E7f2).balance); //gives the total balance of the fund
        return a;
    }
    
    function endFunding() public view returns(string memory)
    {
        uint256 a = address(0x617F2E2fD72FD9D5503197092aC168c91465E7f2).balance ;
        if (a >= fundingGoal) //condition statement to returns if the funds collected is greater than the goal
        { 
            return "completed and successful"; //returns the message if the contract is successful
        }
        else
        {
            return "completed but unsuccessful"; //returns the message if the contract is unsuccesssful
        }
    }
}
