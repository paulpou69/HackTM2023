// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Certifier is Ownable{
  uint256 public certified=0;
  address[] public certifiedProducers;

  string public certifierName;
  mapping(address=>bool) public managers;
  mapping(address=>bool) public isCertified;
  

  constructor() public{
  }

  function editManager(address managerAddress, bool isManager) public onlyOwner{
    managers[managerAddress]=isManager;
  }

  function addProducer(address producerAddress) public{
    require(managers[msg.sender]==true,"You are not a manager of this authority!");
    isCertified[producerAddress]=true;
    certifiedProducers.push(producerAddress);
    certified++;
  }

  function removeProducer(address producerAddress) public {
    require(managers[msg.sender]==true,"You are not a manager of this authority!");
    isCertified[producerAddress]=false;
  }

}
