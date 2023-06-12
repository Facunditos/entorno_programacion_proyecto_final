#!/bin/bash
#LINK_NOMBRES=https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv
#wget $LINK_NOMBRES
descargarFotos(){
	for I in `seq 1 $2`;do
		wget $1
		sleep 5
	done
}	
LINK_FOTOS=https://source.unsplash.com/random/900×700/?person
CANTIDAD=$1
descargarFotos $LINK_FOTOS $CANTIDAD
cambiarNombreFoto(){
	LISTADO_NOMBRES_CANTIDAD=`wc -l dict.csv | cut -d " " -f 1`
	LISTADO_NOMBRES_RANDOM_LINEA=$((1+$RANDOM%$LISTADO_NOMBRES_CANTIDAD))p
	RANDOM_NOMBRE=`sed -n $LISTADO_NOMBRES_RANDOM_LINEA dict.csv | cut -d "," -f 1 | tr " " "_"`
	mv $1 $RANDOM_NOMBRE 	
}
LISTADO_FOTOS=`find -name "index.html?person*"`
for FOTO in $LISTADO_FOTOS;do
	cambiarNombreFoto $FOTO
done	
exit 0
