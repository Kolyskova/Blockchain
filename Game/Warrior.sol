pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "Unit.sol";

contract Warrior is Unit{
    
    constructor () public {
        require(tvm.pubkey() != 0, 101);
        require(msg.pubkey() == tvm.pubkey(), 102);
        tvm.accept();
        timestamp = now;
        power += 2;
        health += 5;
        protection += 2;
    }
}