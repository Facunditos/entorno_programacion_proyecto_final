#!/bin/bash
cambiarNombreImagen(){
	LISTADO_NOMBRES_CANTIDAD=`wc -l dict.csv | cut -d " " -f 1`;
	LISTADO_NOMBRES_RANDOM_LINEA=$((1+$RANDOM%$LISTADO_NOMBRES_CANTIDAD))p;
	IMAGEN_RANDOM_NOMBRE=`sed -n $LISTADO_NOMBRES_RANDOM_LINEA dict.csv | cut -d "," -f 1 | tr " " "_"`;
	mv $1 $IMAGEN_RANDOM_NOMBRE; 	
}	
moverImagen(){
	mv $IMAGEN_RANDOM_NOMBRE ./lote_imagenes;
}	
comprimirImagenes(){
	zip -j lote_imagenes ./lote_imagenes/*;
}	
obtenerSumaVerificacion(){
	touch suma_verificacion;
	sha256sum lote_imagenes.zip > suma_verificacion;
}	
descargarImagenes(){
	mkdir lote_imagenes;
	for I in `seq 1 $2`;do
		wget $1;
		IMAGEN=`find -name "index.html?person"`;
		cambiarNombreImagen $IMAGEN;
		moverImagen; 
		sleep 5;
	done
	comprimirImagenes;
	obtenerSumaVerificacion;
       rm -r lote_imagenes;	
}	
LINK_IMAGENES=https://source.unsplash.com/random/900×700/?person;
CANTIDAD=$1;
descargarImagenes $LINK_IMAGENES $CANTIDAD;
exit 0
