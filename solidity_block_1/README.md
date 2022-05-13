# BLOCK_1 SOLIDITY

[INFO GENERAL](https://docs.soliditylang.org/en/v0.5.3/types.html)  


# :closed_book: Tema 1 - Contratos
## :pushpin: Creación de un contrato 

El contrato es el bloque de construcción más básico de todas las aplicaciones de Ethereum.  

*contract < nombre_contrato > {  
  ...  
}*  

Todas las funcionalidades para ese contrato deben ir dentro del bloque del contrato.  

# :closed_book: Tema 2 - Propiedades de transacciones y bloques
## :pushpin: keccak256()  

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
# :closed_book: Tema 3 - Tipos de variables y operaciones 
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


# :closed_book: Tema 4 - Estructuras de datos
## :pushpin: Struct

Las estructuras nos permiten definir tipos de datos más complejos.  

*struct < nombre_estructura > {  
  < data_type_1 > < nombre_variable_1 >;  
  < data_type_2 > < nombre_variable_2 >;  
  < data_type_3 > < nombre_variable_3 >;  
  ...
}*  

**Trabajar con estructuras**  

Para crear una variable del tipo "estructura" debemos hacerlo del siguiente modo:  

// Declarar una variable "struct"  
*< nombre_estructura > < nombre_variable >;*  

// Declarar e inicializar una variable "struct"  
*< nombre_estructura > < nombre_variable > = < nombre_estructura > (< propiedades_estructura >);*  

## :pushpin: Mapping  

Asociación key-value para guardar y ver datos.  

Al igual que las estructuras, los mapping nos sirven para organizar datos. Es una relación key-value.  

*mapping ( _keyType => _valueType ) [ public ] < nombre_mapping >;*  

**_keyType** puede ser de cualquier tipo de dato, pero **no puede ser otro mapping**.  
**_valueType** puede ser de cualquier tipo de dato, **incluyendo mapping**.

**Guardar datos**  
*< nombre_mapping > [ _key ] = _value;*  

**Ver datos**  
*< nombre_mapping > [ _key ];*  

## :pushpin: Arrays

Tipo de dato estructurado que almacena un conjunto homogéneo de datos.  

![alt text](https://javiergarciaescobedo.es/images/stories/apuntes/arrays01.jpg)  

:warning: Cada posición contiene un tipo de dato y **todos los datos son del mismo tipo**.  
  
___________  
**Array de longitud fija**  
*< tipo_de_dato > [< longitud >] [ public ] < nombre_array >;*  

**Arrays dinámico**  
*< tipo_de_dato > [ ] [ public ] < nombre_array >;*  
___________  
  
**Inicializar un array de longitud fija**  
*< tipo_de_dato > [< longitud >] [ public ] < nombre_array > = [< valores >];*  

**Inicializar un array dinámico**  
*< tipo_de_dato > [ ]  [ public ] < nombre_array > = [< valores >];*  
___________  
  
**Para acceder a un elemnto del array necesitamos su posición**  
*< nombre_array > [< posición >];*  

**Para fijar el valor de una posición del array**  
*< nombre_array > [< posición >] = < valor >;*  
___________  

**Función .push() y .length**  

**La función .push() añade un elemento al final del array.**  
*< nombre_array >.push(< value >);*  

**La función .length devuelve la longitud del array.**  
*< nombre_array>.length;*  

# :closed_book: Tema 5 - Funciones
## :pushpin: Declaración de funciones en Solidity  

Las funciones son las unidades ejecutables del código dentro de un contrato.  

*function < nombre_funcion > (< tipos_parametro >) [ public | private ] {  
  ...  
}*  

Los parámetros de las funciones, por convención (no es obligatorio), deben comenzar con barra baja, **_nombreparamtro**. De este modo podemos diferenciar las variables globales de las variables que se pasan como parámetros.  

Por convención también se debe poner como **private** a todas aquellas funciones que no queremos que sean **public**.  


## :pushpin: Valores de retorno de una función  

Las funciones pueden devolver valores de retorno al ser ejecutadas.  

*function < nombre_funcion > (< tipos_parametro >) [ public | private ] **returns (< return_types >)** {  
  ...  
  **return (< return_types >)**  
}*  

Si quisiéramos devolver más de un parámetro, lo especificamos dentro del paréntesis con una ",".  

Supongamos que quiero retornar 3 enteros, entonces: ... returns (int, int, int) { ... }  

No tienen porqué ser del mismo tipo. Podría ser: ... returns (int, bool, string) { ... }  

**Valores devueltos**  

**Un** solo valor de retorno  
*< type > = < nombre_funcion >(< parametros >);*  

**Múltiples** valores devueltos    
⚠️ Tienen que estar en el mismo orden que en la declaración de la función.  

//Asignación múltiple de todos los valores devueltos  

*< type_1, type_2, type_3,..., type_n > = < nombre_funcion >(< parametros >);*  

En este caso queremos guardar **todos** los valores devueltos  

//Asignación de un subconjunto de los valores devueltos  

*< ,,,type_i,,, > = < nombre_funcion >(< parametros >);*  

En este caso queremos guardar **algunos** de los valores devueltos  


## :pushpin: Modificador view, pure y payable (son opcionales) 

*function < nombre_funcion > (< tipos_parametro >) [ public | private ] [ view | pure | payable ] [ returns (< return_types >) ] {  
...  
}*  

**View:** No modifica los datos pero si accede a ellos. Vamos a poder acceder a los datos, pero no podremos modificarlos.  
  
**Pure:** No accede ni siquiera a los datos. No los vas a poder leer. Este modificador es útil cuando la función solo depende de los parámetros.  
  
**Payable:** Permite recibir ether.  


# :closed_book: Tema 6 - Bucles y condicionales  
## :pushpin: Sentencia if  
  
La sentencia if ejecuta un bloque de código si la expresión booleana es cierta  
  
*if (< condicion >) {  
// código a ejecutar si < condición > es verdadera
}*  
  
  
*if (< condicion >) {  
// código a ejecutar si < condición > es verdadera  
} else  {  
// código a ejecutar si < condición > es falsa  
}*   


## :pushpin: Bucle for  

El bucle for ejecuta un bloque de código un número finito de veces  
  
*for (< iniciar_contador >; < comprobar_contador >; < aumentar_contador >) {  
// código a ejecutar en cada iteración  
}*  
  
## :pushpin: Bucle while  

El bucle while ejecuta un bloque de código mientras se cumple la expresión booleana  
  
*while (< condición >) {  
// código a ejecutar mientra se cumple < condición >  
}*  

# :closed_book: Tema 7 - Interactuando con varios Smart Contracts  
## :pushpin: Herencia  
* La herencia simplifica y organiza el código.  
* La herencia nos permite la definición de un contrato a partir de un contrato existente.  
* Basicamente la herencia nos permite compartir las diferentes funcionalidades y variables de un contrato a otro.  

  
*contract < nombre_contrato_1 > {  
...  
}*  
  
*contract < nombre_contrato_2 > is < nombre_contrato_1 > {  
...  
}*  
