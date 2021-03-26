# MYS2_Proyecto_G21
Proyecto Modelación y Simulación 2 - Grupo 21 - 1S 2021.

## Diseño del Sistema con Justificación

Se utilizaron procesos para filtrar la información del archivo DataFile.xlsx que posteriormente fue analizado utilizando el lenguaje de programación orientado al análisis de datos, llamado R; específicamente utilizando el ambiente de desarrollo integrado RStudio.



A continuación se puede visualizar el proceso para limpiar y filtrar los datos de la hoja Processing Data.

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/a.jpg?raw=true)


A continuación se puede visualizar el proceso para limpiar y filtrar los datos de la hoja Quality Data.

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/b.jpg?raw=true)

A continuación se puede visualizar el proceso para limpiar y filtrar los datos de la hoja Supplier Data.

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/c.jpg?raw=true)


Los resultados de las fases de limpieza y filtrado se guardaron ordenados mediante hojas en el archivo final de Excel llamado Final.xlsx. 

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/e.jpg?raw=true)


## Descripción del Análisis Realizado

Se realizaron pruebas de ajuste para cada uno de los datos agrupados, utilizando la libería de R llamada "distChoose".  Cada uno de los subconjutos de los datos agrupados fue puesto a prueba con el objetivo de encontar la distribución  que mejor reflejara la distrubición de sus frecuencias.


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/c1.png?raw=true)


Los datos resultantes incluyen la distribución elegida, y sus parámetros, que se proceden a guardar en archivos de Excel para su posterior lectura en Simio. 

Por ejemplo para la distribución normal se guarda la media y la desviación estandar.

Para la distrubución gamma se tienen las métricas de Shape y Rate.

Para la distrubución Weibull se tienen las métricas de Shape y Scale.

Se elegieron estas tres distribuciónes debido a que abarcaban un comportamiento distinto en los datos y también se encuentran disponibles dentro del paquete de Simio para su implementación.


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/c2.png?raw=true)


También se grafican los histogramas de frecuencias para algunos de los conjuntos de datos para verificarlos visualmente.

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/c3.png?raw=true)





![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-B22-Paint_3-Gamma.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-B22_SA-SA_Drill_2-Normal.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-B24_BP-BP_Paint_2-Gamma.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-3-Weibull.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-4-Normal.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-O24_SA-SA_Assemble_2-Gamma.png?raw=true)



