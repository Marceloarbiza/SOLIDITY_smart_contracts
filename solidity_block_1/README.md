# BLOCK_1 SOLIDITY

[INFO GENERAL](https://docs.soliditylang.org/en/v0.5.3/types.html)  

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

[Info: enums](https://www.geeksforgeeks.org/solidity-enums-and-structs/)  

Enums son una manera de crear tu propio tipo de datos.  

enum significa enumerable.  

*enum < nombre_enumeracion > { valores_enumeracion }*  

:warning: La declaración de una enumeración no debemos terminarla en **;**.  
Los *valores_enumeracion* van separados por coma.  

Los enums son explícitamente convertibles a enteros y desde enteros.  

Declarar variable de tipo enum:  

*< nombre_enumeracion > < nombre_variable >*  

***Modificar el valor de una variable enum***  

- Especificando la opción de la enumeración  
*< nombre_variable > = < nombre_enumeracion >.< valor_enumeracion >;*  
- Con el índice  
*< nombre_variable > = < nombre_enumeracion >(< posicion >);*  

## :books: Unidades de tiempo  

En Solidity tenemos los siguientes sufijos, que nos ayudan a tratar con el tiempo:

***< x >  seconds***  
***< x >  minutes***  
***< x >  hours***  
***< x >  days***  
***< x >  weeks***  
***< x >  years***  

***< x >*** es un número entero positivo (1, 2, 3,...)    

Ej:  

Si quiero almacenar en una variable 10 años ->  

uint y = 10 years;  

***:alarm_clock: la base de todos estos sufijos son los segundos***

1 minutes = 60 segundos  
1 hours = 3.600 segundos  
1 years = 31.536.000 segundos  

## :books: Casteo de variables

Podemos pasar de un entero (uint o int) con "y" número de bits a un entero (uint o int) con "x" número de bits.  

*uint< x > ( datos_uint< y >);*  
*int< x > ( datos_int< y >);*  

Podemos transformas un int con "y" número de bits a un uint con "x" número de bits y viceversa.  

*uint< x > ( datos_int< y >);*  
*int< x > ( datos_uint< y >);*  

La suma de una variable de tipo **uint8** más una variable del tipo **uint** nos va a devolver como resultado una variable del tipo **uint**.  
Por lo que deberíamos castear la variable del tipo **uint** a una variable del tipo **uint8**, para evitar problemas.  

Ejemplo:  
```sh
uint8 entero_8_bits = 42;
uint64 casteo_1 = uint64(entero_8_bits);
```
En este ejemplo casteamos la variable **entero_8_bits** del tipo **uint8** a **uint64** y lo guardamos en la variable **casteo_1**.  

```sh
uint entero_256_bits = 1000000;
uint64 casteo_2 = uint64(entero_256_bits);
```  
En este ejemplo casteamos la variable **entero_256_bits** del tipo **uint** a **uint64** y lo guardamos en la variable **casteo_2**.  
:bulb: El casteo puede ser de menos a más bits como de más bits a menos, siempre que no haya overflow.  

También podemos castear variables del tipo **uint< y >** a tipo **int< x >** y viceversa.  

```sh
int16 entero_16_bits = 156;
uint8 casteo_3 = uint8(entero_16_bits);
```  
En este ejemplo casteamos la variable **entero_16_bits** del tipo **int16** a **uint8** y lo guardamos en la variable **casteo_3**.  

Y viceversa.  

```sh
uint entero_256_bits = 1000000;
int casteo_4 = int(entero_256_bits);
``` 
En este ejemplo casteamos la variable **entero_256_bits** del tipo **uint** a **int** y lo guardamos en la variable **casteo_4**.  

## :books: Modificadores 
## :pushpin: Modificador public

Si añadimos el modificador **public** al declarar una variable, se creará una función getter.  
Una función getter es una función que nos permite consultar su valor. El valor que está dentro de esa variable.  

*< tipo_dato > [ public ] < nombre_variable >;*

- Las variables públicas serán parte del contrato cuando se despliegue.  
- Las variables públicas son accesibles desde dentro del contrato como fuera del contrato.  

Hacer pública una variable es opcional.  

## :pushpin: Modificador private e internal

*< tipo_dato > [ public | private | internal ] < nombre_variable >;*  

**Private:** Las variables *private* solo son visibles desde dentro del mismo contrato. No serán accesibles para ningún otro contrato ni serán accesibles para contratos que deriven del mismo.  

**Internal:** Las variables *internal* solo son accesibles internamente. Es parecido al modificador de *private*, pero con la diferencia de que las variables del tipo *internal* solo podrán ser llamadas internamente, desde dentro del mismo contrato, **pero** además también pueden ser llamadas desde contratos que deriven del mismo.   

## :pushpin: Modificador memory y storage

*< tipo_dato > [ memory | storage ] < nombre_variable >;*  

**Memory:** Guardado de manera temporal.  

**Storage:** Guardado permmanentemente en la blockchain.  

En general las variables de estado (aquellas variables declaradas fuera de ningún tipo de función), son por defecto del tipo storage, y se guardan permanentemente en la blockchain.

Mientras que las variables que se declaran dentro de las funciones son por defecto de tipo memory y van a desaparece una vez que la llamada a la función haya terminado.

## :pushpin: Modificador payable

:warning: Solo está disponible para los tipos de datos **address**.  

*address [ payable ] < nombre_variable >;*  

:moneybag: Prmite enviar y recibir ether.  

**La address que declaremos como payable debe ser la dirección de un usuario, no la dirección de un contrato. Porque para enviar y recibir ether, debemos hacerlo a una address concreta.**  

## :books: Comparar Strings con keccak256 :straight_ruler:

```sh
//Indicar la version
pragma solidity >=0.4.4 <0.7.0;
pragma experimental ABIEncoderV2;

contract compararStrings{
    
    function Comparar(string memory _j ,string memory _i) public pure returns(bool){
        
        bytes32 hash_i = keccak256(abi.encodePacked(_i));
        bytes32 hash_j = keccak256(abi.encodePacked(_j));
        
        if(hash_i == hash_j){
            return true;
        }else{
            return false;
        }
        
    }
}
```  
## :pushpin: Operadores booleanos

| Signo | declaración |
| ------------- | ------------- |
| **!** | negación |    
| **&&** | and |  
| **\|\|** | or |  
| **==** | igualdad |  
| **!=** | inigualdad |  


