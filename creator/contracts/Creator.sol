// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Creator is ERC721{
    
  uint256 products=0;
  uint256 minted=0;


  //Signer address
  address data_signer;

  //material_ids to address
  mapping(uint256=>address) material_addresses;

  //NFT id to product id
  mapping(unit256=>unit256) products;
  
  //Product id to name
  mapping(unit256=>string) product_names;

  //Product id to url
  mapping(unit256=>string) metadata;

  //Product id to material array
  mapping(unit256=>uint256[]) product_materials;

  //Product id to amounts
  mapping(unit256=>uint256[]) product_amounts;


  constructor() public {
  
  }

  function tailor(string name, uint256[] materials, unit256[] amounts, name, amount) public{
    uint256 product_id = products;
    createProduct(name,materials,amounts);
    custiomMint(amount,materials,amounts,product_id);
  }

  function createProduct(string name,uint256[] materials, unit256[] amounts){
    product_materials[products]=materials;
    product_amounts[products]=amounts;
    product_names[products]=name;
    products++;
  }

  function customMint(unit256 amount, unit256[] materials, unit256[] amounts, unit256 product_id){
    for(int i=0;i<materials.length;i++){
      IERC20 material = IERC20(material_addresses[materials[i]]);
      material.transfer(address(0),amounts[i]*amount);
    }

    _safeMint(address(this), amount);

    for(int i=minted;i<minted+amount;i++){
      products[i]=product_id;
    }


  }

  function addMoreStock(uint256 amount, uint256 product_id){
    //pass
  }

  function verifySignature(uint256 nft_id, uint8 v, bytes32 r,
              bytes32 s) public pure returns (address signer) {
    bytes32 data_hash = keccak256(abi.encodePacked(string.concat("\x19Ethereum Signed Message:\n",nft_id));
    return ecrecover(data_hash, v, r, s);
  }


  function claim(string proof, address receiver, uint256 nft_id){
    //verify proof
    _transferFrom(address(this), receiver, nft_id);
  }

  function setMetadata(uint256 product_id, string url){
    metadata[product_id]=url;
  }

}
