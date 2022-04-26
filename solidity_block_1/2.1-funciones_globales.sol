//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;

contract funciones_globales{
    
    //Funcion msg.sender
    //Devuelve la dirección (address) del remitente de la llamada actual
    function MsgSender() public view returns(address){
        return msg.sender;
    }
    
    //funcion now
    //Devuelve número entero (uint) que es el tiempo del bloque en segundos. Es un alias de block.timestamp.
    function Now() public view returns(uint){
        return now;
    }
    
    //funcion block.coinbase
    //Devuelve la dirección (address) del minero
    function BlockCoinbase() public view returns(address){
        return block.coinbase;
    }
    
    //funcion block.difficulty
    //Devuelve un entero (uint) con la dificultad del bloque. Mientras más 0, mayor dificultad
    function BlockDifficulty() public view returns(uint){
        return block.difficulty;
    }
    
    //funcion block.number
    //Nos devuelve un entero (uint) con el número del bloque actual
    function BlockNumber() public view returns(uint){
        return block.number;
    }
    
    //Funcion msg.sig 
    //Devuelve 4 bytes (bytes4) que son el identificador (id) de la función
    function MsgSig() public view returns(bytes4){
        return msg.sig;
    }
    
    //funcion tx.gaspricev
    //Devuelve un entero (uint) que es el precio del gas de la transacción
    function txGasPrice() public view returns(uint){
        return tx.gasprice;
    }
    
}
