#!/bin/bash
LINK_FOTOS=https://source.unsplash.com/random/900×700/?person
LINK_NOMBRES=https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv
for I in `seq 1 $1`;do
	wget $LINK_FOTOS
	sleep 5

done
wget $LINK_NOMBRES
LISTADO_FOTOS=`find -name "index.html?person*"`
for FOTO in $LISTADO_FOTOS;do
	echo $FOTO	
done	
cat dict.csv
exit 0
