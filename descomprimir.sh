#/bin/bash
moverImagenesDescomprimidas(){
	ARCHIVOS_JPEG=`find . -type f -exec file {} \; | grep "JPEG" | cut -d ":" -f 1`;
	mkdir lote_imagenes;
	mv $ARCHIVOS_JPEG ./lote_imagenes;
}
descomprimirImagenes(){
	if [ -f *.zip ];then
		unzip *.zip;
	else	
		echo "No se encontró el lote de imágenes, por ende, no se pudo descomprimir";
		exit 1;
	fi;	
}
descomprimirImagenes;
moverImagenesDescomprimidas;	
rm *.zip;
rm *.sha256;
echo "las imágenes se descomprimieron y fueron guardadas en el directorio lote_imagenes, se procedió a eliminar el archivo comprimido";
exit 0;
