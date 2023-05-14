const Nike = artifacts.require("Nike");


contract("Nike", (accounts)=>{
    var NikeInstance;

    before(async()=> {
        NikeInstance = await Nike.deployed();
        await NikeInstance.addMaterial("0x0C5a15Ef48b60FeCE8e188517Bb675A1320CC523");
    });

    it("should create a product",async()=>{
        await NikeInstance.createProduct("Tech fleece",[0], [0]);
    });

    it("should mint a product",async()=>{
        await NikeInstance.customMint(10,[0],[0],0);
    });

    it("should tailor a product",async()=>{
        await NikeInstance.tailor("Tech fleece 2",[0], [0], 100);
    });

});