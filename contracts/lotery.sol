// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract lotery{

    event VRF();

    uint256 public counter;
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

    function play(unit256 deadline) external payable minAmaunt(msg.value) {
        uint256 _counter = counter++;
        player[_counter] = msg.sender;
        if(_counter == 99){
            //Termino.
            emit VRF();
        }
    }

    constructor() {
        owner = msg.sender;
    }

    function setOracle(address _oracle) external onlyOwner{
        oracle = _oracle;
    }

    function fullfilRandomness(unit256 _ramdon) external {
        address _winner;
        winner = player[_ramdon];
        _winner.transfer(address(this).balance);
        winner = _winner;
    }

}