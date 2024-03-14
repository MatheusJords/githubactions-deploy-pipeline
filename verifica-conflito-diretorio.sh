#!/bin/bash

# Função que faz a verificação de conflito de merge
function verifica_conflito() {
        local arquivo="$1"
        if grep -q -E '<<<<<<<|=======|>>>>>>>' "$arquivo"; then
                echo "O arquivo $arquivo contem marcacao de conflito"
        fi
}

# Função que varre o diretório
function verifica_diretorio() {
        local diretorio="$1"
        local arquivo
	local arquivos=("$diretorio"/*)
	local i=0

        while [ $i -lt ${#arquivos[@]} ]; do
		arquivo="${arquivos[$i]}"
                if [ -f "$arquivo" ]; then
                        verifica_conflito "$arquivo"
                elif [ -d "$arquivo" ]; then
                        verifica_diretorio "$arquivo"
                fi
		((i++))
        done
}

# Verifica se o quantidade de parâmetros passada está correta
if [ $# -ne 1 ]; then
	echo "Uso: $0 <diretorio>"
	exit 1
fi

# Verifica se o diretório existe
if [ ! -d "$1" ]; then
	echo "Diretorio nao encontrado: $1"
	exit 1
fi

# Faz a chamada da função verifica_diretorio
verifica_diretorio "$1"
