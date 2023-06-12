#!/bin/bash
#LINK_NOMBRES=https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv
#wget $LINK_NOMBRES
cambiarNombreFoto(){
	LISTADO_NOMBRES_CANTIDAD=`wc -l dict.csv | cut -d " " -f 1`
	LISTADO_NOMBRES_RANDOM_LINEA=$((1+$RANDOM%$LISTADO_NOMBRES_CANTIDAD))p
	FOTO_RANDOM_NOMBRE=`sed -n $LISTADO_NOMBRES_RANDOM_LINEA dict.csv | cut -d "," -f 1 | tr " " "_"`
	mv $1 $FOTO_RANDOM_NOMBRE 	
}	
comprimirFoto(){
	jpegoptim $FOTO_RANDOM_NOMBRE
}	
obtenerSumaVerificacion(){
	sha256sum $FOTO_RANDOM_NOMBRE >> sumaVerificacion
}	
moverFoto(){
	mv $FOTO_RANDOM_NOMBRE ./imagenes_comprimidas
}	
descargarFotos(){
	for I in `seq 1 $2`;do
		wget $1
		FOTO=`find -name "index.html?person"`
		cambiarNombreFoto $FOTO
		comprimirFoto 
		obtenerSumaVerificacion 
		moverFoto 
		sleep 5
	done
}	
LINK_FOTOS=https://source.unsplash.com/random/900×700/?person
CANTIDAD=$1
descargarFotos $LINK_FOTOS $CANTIDAD
exit 0
