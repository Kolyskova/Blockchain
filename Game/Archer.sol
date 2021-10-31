
pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "Unit.sol";

contract Archer is Unit{
    
    constructor () public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        timestamp = now;
        power += 3;
        health += 4;
        protection += 1;
    }
}
