let variable = "Hola";
var variable2 = `habia una vez un circo que ll
lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll`
// Const numero = 19;

// let variable3;

// alert(variable3);

// prompt muestra una ventana emergente para introducir un valor
// let nombre = prompt("Introduce nombre");
// document.write(nombre);

let numero = 10;
numero **= 2;// exponente
//document.write(numero); 

let numero1 = 10;
let numero2 = 5;

let resultado = numero1**numero2;
document.write(resultado);


numero1--;
//document.write(numero1);

let saludo = "¡Hola Pedro!"
let pregunta = "¿Cómo estas?"
let frase = saludo + pregunta;

document.write(frase);

let nombre = "Esther";
frase = `soy ${nombre} y estoy caminando`;
document.write(frase);


frase = `soy 'Esther' y estoy caminando`;
document.write(frase);

let guestList = `Invitados:
* Juan
* Pedro
* Maria
`;
document.write(guestList);
alert(guestList); // con alert me muestra el texto en varias líneas
function sum(a, b) {
  return a + b;
}

alert(`1 + 2 = ${sum(1, 2)}.`); // 1 + 2 = 3.
let str1 = "Hello\nWorld"; // dos líneas usando el "símbolo de nueva línea"

// dos líneas usando nueva línea normal y backticks
let str2 = `Hello
World`;

alert(str1);
alert(str2); // true


frase = "soy 'Esther1' y estoy caminando";
document.write(frase);


frase = 'soy "Esther2" y estoy caminando';
document.write(frase);

// Operadores de comparación
let numero = 23;
let numero2 = 13;
document.write(numero == numero2); // false

// También se puede hacer con cadenas
let texto = "texto 1";
let texto2 = "texto 2";

document.write(texto != texto2); // devulve true por que son diferentes