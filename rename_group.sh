##!/usr/bin/env bash
#
#
#
#   Rename Group - Rename a group of files with same 
#   Copyright (C) 2020 Marlon W. Santos <marlon.santos.santos@icen.ufpa.br>
#
#
#	
#   This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>


count=1

local_path="$(pwd)"

#Regex que captura o nome inteiro do arquivo
old_name=^.*$

#Recebe o novo nome dos arquivos
new_name=$1

#Recebe o local onde os arquivos estão salvos
path=$2

cd "$path"

#Lista os arquivos do diretório
ls -1 . > .log.txt

#Lê o arquivo com nomes dos arquivos
while read line
do

  #Muda o nome de cada um
  rename -v s/$old_name/"$new_name ($count)"/g "$line"

  count=$((count+1))

done < .log.txt

cd "$local_path"







