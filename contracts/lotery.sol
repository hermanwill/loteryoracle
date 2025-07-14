// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract lotery{

    event VRF();

    uint256 public counter;
    uint256 public price;
    address public oracle;
    address public owner;
    address public winner;
    mapping(uint256 => address) public player;

    modifier minAmaunt(uint256 value) {
        require(value == price,"InsuficientFunds");
        _;
    }

    modifier onlyOracle (){
        require(msg.sender == oracle, "No Permissions");
        _;
    }

    modifier onlyOwner (){
        require(msg.sender == owner, "No Permissions");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function play() external payable minAmaunt(msg.value) {
        uint256 _counter = counter++;
        player[_counter] = msg.sender;
        if(_counter == 3){
            //Termino.
            emit VRF();
        }
    }

    function setOracle(address _oracle) external onlyOwner{
        oracle = _oracle;
    }

    function fullfilRandomness(uint256 _ramdon) external {
        address payable _winner;
        winner = payable(player[_ramdon]);
        _winner.transfer(address(this).balance);
        winner = _winner;
    }

}