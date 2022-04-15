# BLOCK_1 SOLIDITY

## keccak256()

[Info: keccak256()](https://www.exceptionlife.com/ethereum/question/3595/how-does-keccak256-with-abi-encodepacked-internally-works-i-am-getting-two-conflicting-results)

#### Secure hash algorithm

**Función criptográfica:** Realiza un cómputo de hash de 256 bits (32bytes).

*keccak256(< values >);*

< values > debe ser del tipo bits. Por lo tanto todos lo que le queramos pasar a la función keccak, primero debemos transformarlo a bits.

Para ellos utilizamos la función abi.encodePacked()

Esta función toma una serie de argumentos y devuelve los bits.

Para poder usar la función abi.encodePacked() debemos poner antes del contrato la siguientes sentencia:

pragma experimental ABIEncoderV2;

Por lo tanto quedaría de esta forma:

```sh
contract < nombre_contrato > { 
  ... 
  //Computo del hash 
  keccak256(abi.encodePacked(< values >));
  ... 
}
```

## Variables Enteras

*< tipo_dato > < nombre_variable >;*

*< tipo_dato > < nombre_variable > = < valor_variable >;*

*uint*: variables enteras sin signo (enteros positivos)
*int*: variables enteras con signo (enteros positivos y negativos)

**Podemos especificar el número de bits de la variable**

*uint< x > < nombre_variable >;*
*int< x > < nombre_variable >;*

***< x >*** varia de 8 a 256 en múltiplos de 8
No podríamos declarar uint2
Ejemplo: El siguiente de uint8 es uint16

Si no especificamos < x >, por defecto es 256 -> uint256
