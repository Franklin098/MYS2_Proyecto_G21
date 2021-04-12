#install.packages("readxl")
#options(java.parameters = "-Xmx2000m")

require(dplyr)
require(distChoose)
require(EnvStats)
library("fitdistrplus")
library("xlsx")
library("readxl")

#raw_data = read_excel("DataFile.xlsx", sheet = "Quality Data")

#raw_data = read.xlsx("DataFile.xlsx", 6, header=TRUE)

#raw_data$Time = raw_data$Inspection.End - raw_data$Inspection.Start

#datos = na.omit(raw_data)

#datos$Time = as.numeric(datos$Time)


#materials_and_suppliers = datos[,c("Material","Supplier")]

#print(nrow(materials_and_suppliers))

#unique_pairs = materials_and_suppliers %>% distinct(Material,Supplier)

# l

#datos = read.xlsx("./Modela2/Final.xlsx", 7, header=FALSE)

datos = read.csv("./Modela2/Agrupamiento2.csv",na.strings = c("","NA"),sep=";",header = FALSE)

colnames(datos) <- c("Order Number","Inspection Start","Inspection End","Material","Supplier","Units Inspected","Units Defective","Time")

print(nrow(datos))


#unique_pairs = read.xlsx("./Modela2/Final.xlsx", 6, header=FALSE)

unique_pairs = read.csv("./Modela2/Parejas2.csv",na.strings = c("","NA"),sep=";",header = FALSE)

colnames(unique_pairs) <- c("Material","Supplier")

unique_pairs

# -l


print(nrow(unique_pairs))

distributions = c("norm","gamma", "weibull")
names(distributions) = c("Normal","Gamma","Weibull")


excel <- matrix(, nrow = nrow(unique_pairs) , ncol = 7)
colnames(excel) <- c("Material","Supplier","Distribucion","Val1Name","Val1","Val2Name","Val2")

unique_pairs

for(i in 1:dim(unique_pairs)[1]){
  material =  unique_pairs[i,1]
  supplier = unique_pairs[i,2]
  pair_values =  filter(datos, Material == material & Supplier== supplier )
  choosen_dist <- distChoose(pair_values$Time, alpha = 0.05, method = "sw",
                             choices = c("gamma","weibull","norm"), est.arg.list = NULL,
                             warn= TRUE, keep.data = TRUE, data.name = NULL,
                             parent.of.data = NULL, subset.expression = NULL)
  

  
  if(choosen_dist$decision=="Nonparametric"){
    choosen_dist$decision="Normal"
  }
  
  dist_name = distributions[[choosen_dist$decision]]
  valor_de_ajuste <- fitdist(pair_values$Time,dist_name)
  
  if(i%%3 ==0){
    file_name=sprintf("Pareja-%i-%s.png",i,choosen_dist$decision)
    print(file_name)
    png(file=file_name)
    hist(pair_values$Time, xlab="Time" , main=file_name)
    dev.off()
    system(paste("open ",file_name), wait=FALSE)
  }
  
  
  
  excel[i,1] <- sprintf( "%s", material)
  excel[i,2] <- sprintf( "%s", supplier)
  excel[i,3] <- choosen_dist$decision
  excel[i,4] <- names(valor_de_ajuste[[1]][1])
  excel[i,5] <- valor_de_ajuste[[1]][1]
  excel[i,6] <- names(valor_de_ajuste[[1]][2])
  excel[i,7] <- valor_de_ajuste[[1]][2]
  
  cat(sprintf("Preja %s - %s => %s \n",material,supplier,choosen_dist$decision))
}





write.xlsx(excel,"Estadisticas_QualityData.xlsx",sheetName = "Resultados - Processing Data",
           col.names = TRUE, row.names = FALSE, append = FALSE)



