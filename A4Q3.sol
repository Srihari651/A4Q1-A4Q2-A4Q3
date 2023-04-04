//0x85E9CDc39e3C6b6890BB935e9F31e77CD051875B//

pragma solidity ^0.8.1;
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
contract contractSubscription
{
    using SafeMath for uint256;
    enum State {inactive} //declares the the states of the contract
    State public state;
    bool private active; //boolean type to represents the active state of the subscription

    constructor() public 
    {
        state=State.inactive; //returns 0 if he contract is in inactive state
    }

    function activateSubscription() public 
    {
        active = true; //show that the contract is in active state
    }

    address public contactAddress = payable (address(0x617F2E2fD72FD9D5503197092aC168c91465E7f2)); //address that sender will pay for the subscription
    
    function subscribe() external payable onlyWhileActive() 
    {
        payable(contactAddress).transfer(10 ether); //statement that transfers the mentioned amount of ethers
    }

    modifier onlyWhileActive() //modifer that will execute before the above mentioned function which checks thats the system is active
    {
        require(active==true); //gives error if the condition is false
        _;
    }

    function timePeriod() public view  returns(string memory payFee, uint durationDays) 
    {
        uint256 a = 6000;
        uint256 b = 10;
        return (payFee = "10 ethers", durationDays = (((block.timestamp.add(b.mul(a.mul(60).mul(24)))).div(a.mul(60).mul(24)))).sub(194)); //return statement that shows the subcription fees and the duration of the service to the user
    }
}
