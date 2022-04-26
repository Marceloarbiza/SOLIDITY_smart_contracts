//Indicamos la version
pragma solidity >=0.4.4 <0.7.0;

contract enteros {
    //Variables enteras sin signo (uint)
    uint mi_primer_entero;
    uint mi_primer_entero_inicializado = 3;
    uint j = 5000;

    //Variables enteras sin signo con un número específico de bits
    uint8 entero_8_bits;
    uint64 enteri_64_bits = 7000; //hay que verificar que no haya overeflow. O sea, que el número quepa en 64 bits.
    uint16 entero_16_bits;
    uint256 entero_256_bits;

    //Variable entero con signo
    int mi_primer_entero_con_signo;
    int mi_numero = -32;
    int mi_numero_2 = 65;

    //Variables enteras con signo con un número específico de bits
    int72 entero_con_signo_72_bits;
    int240 enter_con_240_bits = 90000;
    int256 entero_con_256_bits;
}
