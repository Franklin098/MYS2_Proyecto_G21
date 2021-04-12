# setwd("~/Documents/Tareas/Modela 2/MYS2_Proyecto_G21")
require(dplyr)
require(distChoose)
require(EnvStats)
library("fitdistrplus")
library("xlsx")
library("readxl")



raw_data = read.xlsx("DataFile.xlsx", 8, header=TRUE)

raw_data$Time = raw_data$Reception.Datetime - raw_data$Order.Datetime

datos = na.omit(raw_data)

datos$Time = as.numeric(datos$Time) * 100

materials_and_suppliers = datos[,c("Material","Supplier.Name")]


print(nrow(materials_and_suppliers))

unique_pairs = materials_and_suppliers %>% distinct(Material,Supplier.Name)

print(nrow(unique_pairs))

distributions = c("norm","gamma", "weibull")
names(distributions) = c("Normal","Gamma","Weibull")


excel <- matrix(, nrow = nrow(unique_pairs) , ncol = 7)
colnames(excel) <- c("Material","Supplier","Distribucion","Val1Name","Val1","Val2Name","Val2")

unique_pairs

for(i in 1:dim(unique_pairs)[1]){
  material =  unique_pairs[i,1]
  supplier = unique_pairs[i,2]
  pair_values =  filter(datos, Material == material & Supplier.Name == supplier )
  choosen_dist <- distChoose(pair_values$Time, alpha = 0.05, method = "sw",
                             choices = c("gamma","weibull","norm"), est.arg.list = NULL,
                             warn= TRUE, keep.data = TRUE, data.name = NULL,
                             parent.of.data = NULL, subset.expression = NULL)
  
  
  
  if(choosen_dist$decision=="Nonparametric"){
    choosen_dist$decision="Normal"
  }
  
  dist_name = distributions[[choosen_dist$decision]]
  valor_de_ajuste <- fitdist(pair_values$Time,dist_name)
  
  
  excel[i,1] <- sprintf( "%s", material)
  excel[i,2] <- sprintf( "%s", supplier)
  excel[i,3] <- choosen_dist$decision
  excel[i,4] <- names(valor_de_ajuste[[1]][1])
  excel[i,5] <- valor_de_ajuste[[1]][1]
  excel[i,6] <- names(valor_de_ajuste[[1]][2])
  excel[i,7] <- valor_de_ajuste[[1]][2]
  
  cat(sprintf("Preja %s - %s => %s \n",material,supplier,choosen_dist$decision))
}




write.xlsx(excel,"Estadisticas_SupplierData.xlsx",sheetName = "Resultados - Processing Data",
           col.names = TRUE, row.names = FALSE, append = FALSE)


