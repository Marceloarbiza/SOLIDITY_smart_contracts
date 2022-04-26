//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract hash {
    
    function calcularHash(string memory _cadena) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_cadena));
    }

    //Creamos una función a la cual le pasamos 3 parametros del tipo: string, entero y address
    //Queremos calcular el hash (32 bytes) de esos parametros
    //Utilizamos la función keccak256(< values >); para calcular el hash de esos parametros
    //Los values (parametros) deben ser del tipo bytes, por lo que utilizamos la función
    //abi.encodePacked(< values >) para esto; y le pasamos esos bytes a keccak256.
    function calcularHash2(string memory _cadena, uint _k, address _direccion) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_cadena, _k, _direccion));
    }

    function calcularHash3(string memory _cadena, uint _k, address _direccion) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_cadena, _k, _direccion, "hola", uint(32)));
    }
}
