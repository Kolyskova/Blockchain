pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract flowers {
    uint32 public timestamp;

    struct Flower {
        string name;
        string color;
        uint price;
    }
    
    Flower[] flowersArr;

    mapping (uint => uint) flowerToOwner;

    

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();

        timestamp = now;
    }

    modifier isOwner(uint ID) {
        require(msg.pubkey() == flowerToOwner[ID], 101);
        tvm.accept();
		_;
	}

    modifier uniqueFlower (string name) {
        for (uint8 i = 0; i < uint8(flowersArr.length); i++){
            require(name != flowersArr[i].name, 101);
        }
        tvm.accept();
		_;
	}

    function createFlower (string name, string color) public uniqueFlower(name) {
        flowersArr.push(Flower(name, color, 0));
        uint key = flowersArr.length - 1;
        flowerToOwner[key] = msg.pubkey();
    }

    function flowerInfo(uint ID) public view returns(string flowerName, string flowerColor, uint flowerPrice) {
        flowerName = flowersArr[ID].name;
        flowerColor = flowersArr[ID].color;
        flowerPrice = flowersArr[ID].price;
    }

    function getFlowerOwner(uint ID) public view returns(uint) {
        return flowerToOwner[ID];
    }

    function sellFlower(uint ID, uint flowerPrice) public isOwner(ID){
        flowersArr[ID].price = flowerPrice;
    }
}
