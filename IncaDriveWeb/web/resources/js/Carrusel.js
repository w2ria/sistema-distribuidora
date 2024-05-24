/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

const carrusel = document.querySelector('.carrusel');
const diapositivas = carrusel.querySelectorAll('.diapositiva');
const navegacion = carrusel.querySelector('.navegacion');
const anterior = navegacion.querySelector('.anterior');
const siguiente = navegacion.querySelector('.siguiente');

let indice = 0;
let intervalo = 5000;

const actualizarDiapositiva = () => {
  diapositivas.forEach(diapositiva => diapositiva.style.display = 'none');

  diapositivas[indice].style.display = 'block';
};

const siguienteDiapositiva = () => {
  if (indice === diapositivas.length - 1) {
    indice = 0;
  } else {
    indice++;
  }
  actualizarDiapositiva();
};

const anteriorDiapositiva = () => {
  if (indice === 0) {
    indice = diapositivas.length - 1;
  } else {
    indice--;
  }
  actualizarDiapositiva();
};

siguiente.addEventListener('click', siguienteDiapositiva);
anterior.addEventListener('click', anteriorDiapositiva);

actualizarDiapositiva();

setInterval(() => {
  siguienteDiapositiva();
}, intervalo);
