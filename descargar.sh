#!/bin/bash

descargar() {
imag_comp=$1
suma_ver=$2

#wget "$imag_comp"

if md5sum "$imag_comp"; then
echo "mmmmmatch"
#exit 0
else
return 1
fi

[[ $imag_comp == *.tar.gz ]] && tar xf $imag_comp && echo "tar"
[[ $imag_comp == *.zip ]] && unzip $imag_comp && echo "zip"
[[ $imag_comp == *.tar.gz ]] || [[ $imag_comp == *.tar.gz ]] || exit 2

#if [[ $imag_comp == *.tar.gz ]]; then
#tar xf "$imag_comp" && echo "tar"
#elif [[ $imag_comp == *.zip ]]; then
#unzip "$imag_comp" && echo "zip"
#else echo "Extension incorrecta" && return 1
#fi
}

descargar "$1" "$2"
