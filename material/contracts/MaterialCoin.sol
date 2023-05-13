// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MaterialCoin is ERC20, Ownable{
  string dataHash;
  mapping (address=>bool) managers;
  mapping (address=>bool) certificates;

  constructor(string name, string unit) ERC20(name, unit){
  }

  function editManager(address manager_address, bool is_manager) public onlyOwner{
    managers[manager_address]=is_manager;
  }

  function sendCoins(address receiver, uint amount) public{
    require(managers[msg.sender]==true,"You are not a manager of this coin!");
    _mint(receiver, amount);
  }

  function editCertificate(address certificate_address, bool is_certificated){
    require(managers[msg.sender]==true,"You are not a manager of this coin!");
    certificates[certificate_address]==is_certificated;
  }
}

