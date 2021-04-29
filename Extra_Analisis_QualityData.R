require(dplyr)
require(distChoose)
require(EnvStats)
library("fitdistrplus")
library("xlsx")
library("readxl")

#Leo el archivo
raw_data = read_excel("DataFile.xlsx", sheet = "Quality Data")

#Elimino los datos vacios
datos = na.omit(raw_data)

#Ordeno la columna de supplier 
datos = datos[order(datos$Supplier),]

#Solamente obtengo los supliers unicos
datos_unicos = datos[!duplicated(datos$Supplier),][5]
dim(datos_unicos)

#Creo donde guardare mis resultados
resultados = matrix(, nrow = nrow(datos_unicos) , ncol = 5)

#Variable que contiene el elemento analizado
temp = ""
pos_resultado = 0
cantidad_total = 0

for(i in 1:dim(datos)[1]){
  if(datos[i,5,1] == temp){
    cantidad_total = cantidad_total + 1
    
    #Guardo el total de unidades inspeccionadas
    resultados[pos_resultado, 3] = as.numeric(resultados[pos_resultado, 3]) + as.numeric(datos[i,6,1])
    #Guardo el total de unidades defectuosas
    resultados[pos_resultado, 4] = as.numeric(resultados[pos_resultado, 4]) + as.numeric(datos[i,7,1])
  }else{
    #Calculo el promedio de los elementos
    resultados[pos_resultado, 3] = as.numeric(resultados[pos_resultado, 3]) / cantidad_total
    resultados[pos_resultado, 4] = as.numeric(resultados[pos_resultado, 4]) / cantidad_total
    resultados[pos_resultado, 5] = (as.numeric(resultados[pos_resultado, 4]) / as.numeric(resultados[pos_resultado, 3])) * 100
    
    pos_resultado = pos_resultado + 1
    cantidad_total = 1
    
    #Guardo el siguiente temp
    temp = datos[i,5,1]
    #Asigno el elemento leido a resultado
    resultados[pos_resultado,1] = datos[i,4,1]
    resultados[pos_resultado,2] = temp
    
    #Guardo el total de unidades inspeccionadas
    resultados[pos_resultado, 3] = as.numeric(datos[i,6,1])
    #Guardo el total de unidades defectuosas
    resultados[pos_resultado, 4] = as.numeric(datos[i,7,1])
  }
  if(i == dim(datos)[1]){
    #Calculo el promedio de los elementos
    resultados[pos_resultado, 3] = as.numeric(resultados[pos_resultado, 3]) / cantidad_total
    resultados[pos_resultado, 4] = as.numeric(resultados[pos_resultado, 4]) / cantidad_total
    resultados[pos_resultado, 5] = (as.numeric(resultados[pos_resultado, 4]) / as.numeric(resultados[pos_resultado, 3])) * 100
  }
}

colnames(resultados) <- c("Material","Supplier","Mean Units Inspected", "Mean Units Defective", "Percent");
resultados