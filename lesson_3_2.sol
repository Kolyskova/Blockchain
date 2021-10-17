
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;

contract lesson_3_2 {
    uint public timestamp;
    
    struct Task {
        string name;
        uint time;
        bool done;
    }
    
    mapping (uint8 => Task) idTask;

    constructor() public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();

        timestamp = now;
    }

    function newTask(uint8 id, string Name, uint Time, bool Done) public{
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        idTask[id] = Task(Name, Time, Done);
    }

    function notDoneNum() public returns(uint){
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        uint num = 0;
        for (uint8 i = 0; i<10; i++){ //как я нагуглила, размер сопоставления найти нельзя, поработаем с десятью
                if(idTask[i].done == false) num++;
            }
            return num;
    }

    function showTask(uint8 id) public returns (Task){
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        Task  task = idTask[id];
        return task;
    }

    function showTasks() public returns (Task[]){
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        Task[]  arr;
        for (uint8 i = 0; i<10; i++){ 
                arr.push(idTask[i]);
            }
        return arr;
    }

    function deleteTask(uint8 id) public{
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        delete idTask[id];
    }

    function isDone(uint8 id) public{
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        idTask[id].done = true;
    }

}
