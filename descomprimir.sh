#/bin/bash
if [ -f *.zip ];then
	unzip *.zip;
else	
	echo "No se encontró el lote de imágenes, por ende, no se pudo descomprimir";
	exit 1;
fi;	
exit 0;
