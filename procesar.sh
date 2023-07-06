#/bin/bash;
procesarImagen(){
	convert ./lote_imagenes/$1 -gravity center -resize 512x512+0+0 -extent 512x512 ./lote_imagenes/$1;
}	
for IMAGEN in `ls lote_imagenes`;do
	NOMBRE_VALIDO=`echo $IMAGEN  | grep "^[A-Z][a-z]*$"`;
	if [ $NOMBRE_VALIDO ];then
		procesarImagen $NOMBRE_VALIDO
	fi	
done;
echo "las imágenes se procesaron con éxito"
exit 0;
