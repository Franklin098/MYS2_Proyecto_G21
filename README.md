# MYS2_Proyecto_G21
Proyecto Modelación y Simulación 2 - Grupo 21 - 1S 2021.

## Diseño del Sistema con Justificación

Se utilizaron procesos para filtrar la información del archivo DataFile.xlsx que posteriormente fue analizado utilizando el lenguaje de programación orientado al análisis de datos, llamado R; específicamente utilizando el ambiente de desarrollo integrado RStudio.



A continuación se puede visualizar el proceso para limpiar y filtrar los datos de la hoja Processing Data.

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/a.jpg?raw=true)


A continuación se puede visualizar el proceso para limpiar y filtrar los datos de la hoja Quality Data.

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/b.jpg?raw=true)

A continuación se puede visualizar el proceso para limpiar y filtrar los datos de la hoja Supplier Data.



Los resultados de las fases de limpieza y filtrado se guardaron ordenados mediante hojas en el archivo final de Excel llamado Final.xlsx. 

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/e.jpg?raw=true)

### Bom Matrix
Se muestra el proceso realizado para la lectura de la bom matrix dentro de simio  

![image](https://user-images.githubusercontent.com/37677468/112588350-d9ac8280-8dc4-11eb-8e48-0b1d1a963474.png)

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


## Gráficas del modelo


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Modela2/c.jpg?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-B22-Paint_3-Gamma.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-B22_SA-SA_Drill_2-Normal.png?raw=true)

A continuación se muestran algunas de las distribuciones para los datos de Quality Data

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-B24_BP-BP_Paint_2-Gamma.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-3-Weibull.png?raw=true)



![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-4-Normal.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Pareja-O24_SA-SA_Assemble_2-Gamma.png?raw=true)  
  
  
## Modelo Utilizado

# Generador de Componentes 

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Captura%20de%20Pantalla%202021-04-11%20a%20la(s)%2023.00.55.png?raw=true)

# Modelo igual al enunciado 

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/Captura%20de%20Pantalla%202021-04-11%20a%20la(s)%2023.07.09.png?raw=true)


## Current State Inventory Policy
![image](https://user-images.githubusercontent.com/37677468/112588316-cac5d000-8dc4-11eb-91ff-eeb14f6be2fa.png)

## Video Presenting the Team

https://youtu.be/9yRs-xjL3jw

## Our Video Solution Explanation

https://youtu.be/sZQm-eV3R_4


## Modelado

![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/cap1.png?raw=true)


![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/cap2.png?raw=true)  
  
  
  
![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/cap3.png?raw=true)

  
![alt text](https://github.com/Franklin098/MYS2_Proyecto_G21/blob/main/cap4.png?raw=true)

## Conclusiones


* Utilizando el conector de excel en Simio y procesos iterativos es posible leer la información de los archivos de entrada para su procesamiento, limpieza y ordenamiento.

* Es importante analizar la distribución de los datos en cada uno de los servidores y para cada uno de sus productos a procesar de acuerdo a los conjutos de datos históricos que se tienen, para de esta manera realizar una simulación realista y que entregue resultados coherentes.

* El lenguaje de progamación R provee un paquete completo de funciones y librerías para el análisis de datos de forma sistemática.

* El manejo de estructuras de datos como matrices, tablas y  datasets  es importante para la manipulación de datos en excel, tanto en Simio como en R.

* Realizar un análisis correcto de los datos y el enunciado del problema es parte importante del proceso de simulación y resolución de un problema aplicado a una situación realista que busca ser analizada y mejorada mediante el empleo de simulación y el análisis de datos.




