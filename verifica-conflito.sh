#!/bin/bash

arquivo=$1

if [ $# -ne 1 ]; then
        echo "Uso: $0 arquivo"
        exit 1
fi

if [ ! -f "$arquivo" ]; then
        echo "O arquivo $arquivo nao existe"
        exit 1
fi


if grep -q -E '<<<<<<<|=======|>>>>>>>' $arquivo; then
        echo "O arquivo $arquivo contem marcacao de conflito"
else
        echo "O arquivo $arquivo nao contem marcacao de conflito"
fi