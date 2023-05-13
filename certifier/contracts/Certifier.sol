// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Certifier is Ownable{

  string public certifierName;
  mapping(address=>bool) public managers;
  mapping(address=>bool) public isCertified;
  constructor() public{
  }

  function editManager(address managerAddress, bool isManager) public onlyOwner{
    managers[managerAddress]=isManager;
  }

  function editProducer(address producerAddress, bool certified) public{
    require(managers[msg.sender]==true,"You are not a manager of this authority!");
    isCertified[producerAddress]=certified;
  }

}
