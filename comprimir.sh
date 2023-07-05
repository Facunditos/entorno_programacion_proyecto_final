#!/bin/bash
crearListadoNombresImagenes(){
	ls lote_imagenes > listadoNombresImagenes;
}
crearListadoNombresValidosImagenes(){
	for IMAGEN in `ls ./lote_imagenes`;do
		RESOLUCION_IMAGEN=`file ./lote_imagenes/$IMAGEN | cut -d "," -f "8"`;
		RESOLUCION_IMAGEN_NOMBRE_VALIDO="512x512"
		if [ $RESOLUCION_IMAGEN = $RESOLUCION_IMAGEN_NOMBRE_VALIDO ];then
			echo $IMAGEN >> listadoNombresValidosImagenes;
		fi;
	done;	
}	
#crearListadoNombresImagenes;
crearListadoNombresValidosImagenes;
exit 0
