pragma ton-solidity >= 0.35.0;
pragma AbiHeader expire;
import "gameInterface.sol";

contract  Unit is gameInterface{
    
    uint32 public timestamp;
    uint public health;
    uint public protection; 
    address  attackingAddress;
    uint public power;

    function attacked(uint attackedPower) virtual external override{
        tvm.accept(); 
        health -= attackedPower-protection;
        attackingAddress = msg.sender;
        dead();
    }

    function attack(gameInterface purpose) virtual external {
        dead();
        tvm.accept();
        purpose.attacked(power);
    }

    function isDead() internal returns(bool){
        tvm.accept();
        if (health == 0){
            return true;
        }
        else{
            return false;
        }
    }

    function dead() virtual public {
        tvm.accept();
        if (isDead() == true){
            attackingAddress.transfer(1, true, 160);
        }
    }

}
