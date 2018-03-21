#!/bin/bash

#Dulce Carolina Hernandez Rosales

#Script para hacer un blast desde docker en mi computadora

#Paso 1. Hacer el pull de la imagen 

sudo docker pull biocontainers/blast

#Paso 2. Correr el blast desde docker 

sudo docker run biocontainers/blast blastp -help

# Paso 2.1 Descargar la secuencia que se usará, dicha secuencia se descargará en el directorio que estamos parados /home/dulce/Escritorio/EjercicioBLAST

wget http://www.uniprot.org/uniprot/P04156.fasta

#Paso 2.2 Se descargará una base de datos del pez zebra, desde NCBI, además de que será comprimido

curl -O ftp://ftp.ncbi.nih.gov/refseq/D_rerio/mRNA_Prot/zebrafish.1.protein.faa.gz
gunzip zebrafish.1.protein.faa.gz

#Paso 2.3 Se prepara la base de datos
#Primero, los archivos deben estar dentro de los contenedores, por lo que, deben crearse
#dichos contenedores, haciendo visibles los archivos dentro del contenedor. 
#Asímismo, los resultados del BLAST estarán diponibles fuera del contenedor.
#Por lo que, se usará la siguiente ruta /home/dulce/Escritorio/EjercicioBLAST donde se 
#creará el volumen llamado /data/

sudo docker run -v /home/dulce/Escritorio/EjercicioBLAST:/data/ biocontainers/blast makeblastdb -in zebrafish.1.protein.faa -dbtype prot 

#Paso 3 Ahora deberá ejecutarse el siguiente comando para tener las alineaciones finales

sudo docker run -v /home/dulce/Escritorio/EjercicioBLAST:/data/ biocontainers/blast blastp -query P04156.fasta -db zebrafish.1.protein.faa -out results.txt
