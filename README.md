## TUIA Entorno de Programación - Trabajo final
### Programa desarrollado para generar o descargargar imágenes y luego procesarlas. Este programa se ejecuta dentro de un contenedor de docker, luego de su ejecución quedará disponible en la computadora anfitriona el archivo comprimido que contendrá las imágenes respectivas y también archivos de texto plano con información relevante sobre estas imágenes.   
## Comenzar:
- Correr *https://github.com/Facunditos/entorno_programacion_proyecto_final.git* para clonar el repositorio de GitHub en la máquina local.
- Correr *docker build --tag ubuntu-trabajo-final-entorno:1 .* para crear la imagen de docker.
- Correr *docker run -it -v /var/containers/trabajo-final-entorno:/app/carpetaCompartida --name trabajo-final-entorno ubuntu-trabajo-final-entorno:1* para crear el contenedor donde se ejecturá el programa.
- Luego de ejecutar el comando anterior se ingresará al menú del programa para indicar cuál instrucción corresponde llevarse a cabo. 
- En primera instancia debe indicarse la opción 1 si se quiere generar las imágenes o la opción 2 en caso que se prefiera descargarlas.
- Luego se debe indicar la opción 3 para descomprimirlas.
- Luego la opción 4 para procesarlas.
- Y finalmente la opción 5 para comprirmir las imágenes procesadas y para crear las listas con información relevante sobre estas imaǵenes.
- Al cabo de salir del programa al indicar la opción 0, los archivos creados en el paso anterior estarán disponibles en esta carpeta de la máquina anfitriona: */var/containers/trabajo-final-entorno*
