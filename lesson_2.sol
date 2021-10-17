
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract lesson_2 {
    uint public timestamp;
    uint public num = 1;
    
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();

        timestamp = now;
    }

    function f2_1 (uint value) public  {
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        require ((0 < value) && (value < 11), 101);
        num *= value;
    }
}
