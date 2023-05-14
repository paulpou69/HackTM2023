// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract MaterialCoin is ERC20, ERC20Burnable, Ownable{
  uint256 public certifications=0;
  address[] public certificationList;

  mapping (address=>bool) public managers;
  mapping (address=>bool) public certificates;

  constructor(string memory name, string memory unit) ERC20(name, unit){
  }

  function editManager(address manager_address, bool is_manager) public onlyOwner{
    managers[manager_address]=is_manager;
  }

  function sendCoins(address receiver, uint amount) public{
    require(managers[msg.sender]==true,"You are not a manager of this coin!");
    _mint(receiver, amount);
  }

  function editCertificate(address certificate_address, bool is_certificated) public{
    require(managers[msg.sender]==true,"You are not a manager of this coin!");
    certificates[certificate_address]==is_certificated;
  }

  function addCertificate(address producerAddress) public{
    require(managers[msg.sender]==true,"You are not a manager of this authority!");
    certificates[producerAddress]=true;
    certificationList.push(producerAddress);
    certifications++;
  }

  function removeCeritificate(address producerAddress) public{
    require(managers[msg.sender]==true,"You are not a manager of this authority!");
    certificates[producerAddress]=false;
  }
}

