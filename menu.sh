#/bin/bash
echo "Bienvendios al programa";
menu(){
	echo "Ahora puede elegir una de las siguientes opciones";
	echo "opción 1 - generar imágenes";
	echo "opción 2 - descargar imágenes";
	echo "opción 3 - descomprimir imágenes";
	echo "opción 4 - procesar imágenes con nombres válidos";
	echo "opción 5 - comprimir imágenes y listas";
	echo "opción 0 - salir del programa";
}
main (){
	OPCION_ELEGIDA=$1;
	case $OPCION_ELEGIDA in
		1)
			read -p "¿Cuántas imágenes desea generar? " CANTIDAD_IMAGENES;
			./generar.sh $CANTIDAD_IMAGENES;
		;;
		2)
			read -p "Indique la dirección del lote de imágenes a descargar " URL_LOTE_IMAGENES;
			read -p "Indique la dirección de la suma de verificación relativa al lote de imágenes a descargar " URL_SUMA_VERIFICACION_LOTE_IMAGENES;
			./descargar.sh $URL_LOTE_IMAGENES $URL_SUMA_VERIFICACION_LOTE_IMAGENES;
		;;
		3)
			./descomprimir.sh;
		;;
		4)
			./procesar.sh;
		;;
		5)
			./comprimir.sh;
		;;
		0)
			echo "fin del programa";
			exit 0;
		;;
		*)
			echo "opción incorrecta";
			OPCION=1

	esac;
}
OPCION=1
while [ $OPCION -ne 0 ];do
	menu
	read -p "Ingrese la opción deseada " OPCION
	main $OPCION
done;
exit 0;
