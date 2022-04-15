# BLOCK_1 SOLIDITY

## :books: keccak256()  

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
## :books: Variables  
## :pushpin: Variables Enteras

*< tipo_dato > < nombre_variable >;*  
*< tipo_dato > < nombre_variable > = < valor_variable >;*  

*uint*: variables enteras sin signo (enteros positivos)  
*int*: variables enteras con signo (enteros positivos y negativos)  

**Podemos especificar el número de bits de la variable**

*uint< x > < nombre_variable >;*  
*int< x > < nombre_variable >;*  

***< x >*** varia de 8 a 256 en múltiplos de 8  
No podríamos declarar uint2  
El siguiente de uint8 es uint16  
Si no especificamos < x >, por defecto es 256 -> uint256  

:warning: Cuando determinamos la cantidad de bits hay que verificar que no haya overflow, o sea que el valor de la variable no exceda la cantidad de bits.

Por ejemplo: 

2 ^ 64 = 18446744073709551616 

:heavy_check_mark: uint64 = 7000; 

## :pushpin: Variables Strings

Son cadenas de texto UTF-8 de longitud arbitraria.

*string < nombre_variable >;*  

Los strings son en realidad un array de bytes.  

## :pushpin: Variables Booleanas

Son variables del tipo lógico: **true o false**  

*bool < nombre_variable >;*   

## :pushpin: Variables Bytes  

Contienen una secuencia de bytes.  

*bytes < nombre_variable >;*  

***< x >*** varia de 1 a 32 (bytes)  

Si no asignamos un < x > por defecto es 1 byte (bytes1).  

## :pushpin: Variables Address  

Las variables del tipo address contienen una dirección de 20 bytes.  

Hace referencia a ls direcciones (address) en Ethereum.  

*address < nombre_variable >;*  

Cada cuenta en ETH tiene una dirección (address) como tu cuenta de banco, donde se tiene el dinero. En este caso sería una address donde se tienen los ETH.  

## :books: Enums

Enums son una manera de crear tu propio tipo de datos.  

enum significa enumerable.  

*enum < nombre_enumeracion > { valores_enumeracion }*  

:warning: La declaración de una enumeración no debemos terminarla en **;**.  
Los *valores_enumeracion* van separados por coma.  

Los enums son explícitamente convertibles a enteros y desde enteros.  

Declarar variable de tipo enum:  

*< nombre_enumeracion > < nombre_variable >*  

**** Modificar el valor de una variable enum ****  

- Especificando la opción de la enumeración  
*< nombre_variable > = < nombre_enumeracion >.< valor_enumeracion >;*  
- Con el índice  
*< nombre_variable > = < nombre_enumeracion >(< posicion >);*  
