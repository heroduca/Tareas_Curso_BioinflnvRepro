Después de que los datos fueron pre-procesados, yo utilizaría el programa **Platanus** para el ensamble de *contigs* 
de una secuencia, en este caso tenemos un ejemplo de mariposa de la especie *Papilio xuthus* que brinda el ejemplo del 
programa. 
Para el ensamble de los contigs, un comando sería

    Platanus assemble –o Pxut –f ./DRR02167[34]_[12].fastq –t 16 –m 128 2> assemble.log


* -o. Prefijo de archivos de salida.
* -f. El archivo que tiene que leer. En este caso se está espefificando con el ID de la secuencia.
* -t. Indica el número de *threads* en la secuencia
* -m. Indica el límite de memoria que se quiere usar.

Para más información se puede consultar el [README](https://vcru.wisc.edu/simonlab/bioinformatics/programs/platanus/README.txt)
del programa, que tiene los comandos.

Dulce Hernández
