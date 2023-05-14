// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";


contract Creator is ERC721, IERC721Receiver{
    
  uint256 public products=0;
  uint256 public minted=0;
  uint256 public materials=0;


  //Signer address
  address public data_signer;

  //material_ids to address
  ERC20Burnable[] public material_tokens;

  //NFT id to product id
  mapping(uint256=>uint256) public product_ids;
  
  //Product id to name
  mapping(uint256=>string) public product_names;

  //Product id to url
  mapping(uint256=>string) public metadata;

  //Product id to material array
  mapping(uint256=>uint256[]) public product_materials;

  //Product id to amounts
  mapping(uint256=>uint256[]) public product_amounts;


  constructor(string memory name, string memory short_name) public ERC721(name,short_name){
  
  }

  function addMaterial(ERC20Burnable material) public{
    material_tokens.push(material);
    materials++;
  }

  function tailor(string memory name, uint256[] memory materials_array, uint256[] memory amounts, uint256 amount) public{
    uint256 product_id = products;
    createProduct(name,materials_array,amounts);
    customMint(amount,materials_array,amounts,product_id);
  }

  function createProduct(string memory name,uint256[] memory materials_array, uint256[] memory amounts) public{
    product_materials[products]=materials_array;
    product_amounts[products]=amounts;
    product_names[products]=name;
    products++;
  }

  function customMint(uint256 amount, uint256[] memory materials_array, uint256[] memory amounts, uint256 product_id) public{
    for(uint i=0;i<materials_array.length;i++){
      ERC20Burnable token = material_tokens[materials_array[i]];
      // token.burn(amounts[i]*amount);     
    }

    _safeMint(address(this), amount);

    for(uint i=minted;i<minted+amount;i++){
      product_ids[i]=product_id;
    }


  }

  function addMoreStock(uint256 amount, uint256 product_id) public{
    uint256[] memory materials_array = product_materials[product_id];
    uint256[] memory amounts = product_amounts[product_id];
    customMint(amount,materials_array,amounts,product_id);
  }

   function verifySignature(string memory nft_id, uint8 v, bytes32 r,
              bytes32 s) public pure returns (address signer) {
    bytes32 data_hash = keccak256(abi.encodePacked(string.concat("\x19Ethereum Signed Message:\n", Strings.toString(bytes(nft_id).length)),nft_id));
    return ecrecover(data_hash, v, r, s);
  }

  function setMetadata(uint256 product_id, string memory url) public{
    metadata[product_id]=url;
  }

  function setSignerAddress(address signer) public {
    data_signer=signer;
  }

  function onERC721Received(address operator,address from,uint256 tokenId,bytes calldata data) external returns (bytes4){
    return IERC721Receiver.onERC721Received.selector;
  }

}
