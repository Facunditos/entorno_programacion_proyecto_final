#!/bin/bash

obtenerNombreArchivosDescargados(){
    ARCHIVO_LOTE_IMAGENES=`echo $1 | tr "/" "\n"| tail -n 1`;
    ARCHIVO_SUMA_VERIFICACION_LOTE_IMAGENES=`echo $2 | tr "/" "\n"| tail -n 1`;
}

comprobarIntegridadLoteImagenesDescargado(){
    SUMA_VERIFICACION_LOTE_IMAGENES_DESCARGADO=`sha256sum $ARCHIVO_LOTE_IMAGENES`;
    SUMA_VERIFICACION_PROVISTA_LOTE_IMAGENES_DESCARGADO=`cat $ARCHIVO_SUMA_VERIFICACION_LOTE_IMAGENES`;
    if [ "$SUMA_VERIFICACION_LOTE_IMAGENES_DESCARGADO" != "$SUMA_VERIFICACION_PROVISTA_LOTE_IMAGENES_DESCARGADO" ];then
        rm $ARCHIVO_LOTE_IMAGENES $ARCHIVO_SUMA_VERIFICACION_LOTE_IMAGENES;
        echo "no pudo verificarse la integridad del lote de imágenes, por lo cual, se procedió a eliminarlo";
        exit 1;
    else
	echo "lote de imágenes descargado con éxito"	    
    fi;
    
}

descargarArchivos(){	
    wget $1 $2;	    
}

URL_LOTE_IMAGENES=$1;
URL_SUMA_VERIFICACION_LOTE_IMAGENES=$2;
#descargarArchivos $1 $2;
obtenerNombreArchivosDescargados $1 $2
comprobarIntegridadLoteImagenesDescargado $1 $2;
exit 0
