install.packages("devtools")
install.packages("utf8")
install.packages("dplyr")

require(dplyr)
require(distChoose)
require(EnvStats)




raw_data = read.csv("ProcessingData.csv",na.strings = c("","NA"))

print(nrow(raw_data))

datos = na.omit(raw_data)

print(nrow(datos))

products_and_stations = datos[,c("Product.Type","Station")]

print(nrow(products_and_stations))

unique_pairs = products_and_stations %>% distinct(Product.Type,Station)


print(nrow(unique_pairs))


for(i in 1:dim(unique_pairs)[1]){
  product_type =  unique_pairs[i,1]
  station = unique_pairs[i,2]
  pair_values =  filter(datos, Product.Type == product_type & Station==station )
  choosen_dist <- distChoose(pair_values$Time, alpha = 0.05, method = "sw",
                             choices = c("gamma","weibull","norm"), est.arg.list = NULL,
                             warn= TRUE, keep.data = TRUE, data.name = NULL,
                             parent.of.data = NULL, subset.expression = NULL)
  
  if(choosen_dist$decision=="Nonparametric"){
    choosen_dist$decision="Normal"
  }
}










install.packages("EnvStats")








