//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;

contract mas_variables {

    //Variables del tipo string (cadenas de texto)
    string mi_primer_string;
    string public saludo = "Hola!"; //las hacemos public para poder consultar su valor
    string public string_vacio = "";

    //variables bolleanas
    bool mi_primer_booleano;
    bool public flag_true = true;
    bool public flag_false = false;

    //Variables de tipo bytes
    bytes32 mi_primer_bytes;
    bytes4 segundo_bytes;
    string public nombre = "Marcelo";
    bytes32 public hash = keccak256(abi.encodePacked(nombre));
 
    bytes4 public identificador;
    function ejemploBytes4() public{
        identificador = msg.sig; //Devuelve el id de la función
    }

    //Variable address
    address mi_primera_direccion;
    address public direccion_local_1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public direccion_local_2 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
}
