
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract lesson_3_1 {
    uint public timestamp;
    string[] public arr = ["name1", "name2", "name3"];
    
    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();

        timestamp = now;
    }

    function f_1 (string name) public  {
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        arr.push(name);
    }

    function f_2 () public  {
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        for (uint i = 0; i<arr.length-1; i++){
            arr[i] = arr[i+1];
        }
        arr.pop();
    }
}
