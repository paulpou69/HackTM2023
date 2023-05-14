const BumbacGhita = artifacts.require("BumbacGhita");


contract("BumbacGhita", (accounts)=>{
    before(async()=> {
        a = await BumbacGhita.deployed();
        a.editManager(accounts[0],true)
    });

    it("should burn",async()=>{
        a.sendCoins(accounts[3],BigInt(10*(10**18)));
        a.burn(BigInt(5*(10**18)),{"from":accounts[3]});
    });

   

});