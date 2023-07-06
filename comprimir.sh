#!/bin/bash
crearListadoNombresImagenes(){
	ls lote_imagenes > listadoNombresImagenes;
}
crearListadoNombresValidosImagenes(){
	touch listadoNombresValidosImagenes;
	for IMAGEN in `ls ./lote_imagenes`;do
		RESOLUCION_IMAGEN=`file ./lote_imagenes/$IMAGEN | cut -d "," -f "8"`;
		RESOLUCION_IMAGEN_NOMBRE_VALIDO="512x512"
		if [ $RESOLUCION_IMAGEN = $RESOLUCION_IMAGEN_NOMBRE_VALIDO ];then
			echo $IMAGEN >> listadoNombresValidosImagenes;
		fi;
	done;	
}	
crearListadoNombresImagenesFinalizan_a(){
	touch listadoNombresImagenesFinalizan_a;
	for IMAGEN in `ls ./lote_imagenes`;do
		FINALIZA_a=`echo $IMAGEN | grep "a$"`;
		if [ $FINALIZA_a ];then
			echo $IMAGEN >> listadoNombresImagenesFinalizan_a;
		fi;
	done;	
}	
comprimirArchivos(){
	zip -j -r archivo ./{listadoNombresImagenes,listadoNombresValidosImagenes,listadoNombresImagenesFinalizan_a,lote_imagenes/*};
	rm -r ./{listadoNombresImagenes,listadoNombresValidosImagenes,listadoNombresImagenesFinalizan_a,lote_imagenes}
}
crearListadoNombresImagenes;
crearListadoNombresValidosImagenes;
crearListadoNombresImagenesFinalizan_a;
comprimirArchivos;
exit 0
