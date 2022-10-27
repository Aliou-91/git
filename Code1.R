install.packages("tidyverse")
install.packages("json")
install.packages("xml")
library("tidyverse")
library("json")
data<-read.table("C:/Users/asus/Videos/Recueil des donnees/exo1.csv",header = TRUE, dec = ",", sep = ",", skip = 5)

# bonjour

library("XML")

data<-xmlTreeSparse("exo3.xml")
xmltop<-


a = data.frame(v1=runif(5000),v2=rnorm(5000),v3=rbinom(5000,5,0.2))
a[a$v1>0.98 & a$v3==3,]

subset(a,v1>0.98 & v3==3)

r = cut(a$v2,c(-Inf,-3,-2,2,1,Inf))
class(r); head(r)

a = data.frame(id=1:500,val1=runif(500))
b = data.frame(id=sample(500,500),val2=runif(500))

c = merge(a,b)

match(a$id,b$id)[1:10]

d = cbind(a,b$val2[match(a$id,b$id)])
sum(d!=c)


data <- read.csv("owid-covid-data.csv")
dim(data) #122379 65

# Une ligne par pays
today <- data[nrow(data),"date"] #Dernier pays = Zimbabwe
data <- data[
  data[,"date"] == today,
  c("iso_code","continent","location","total_deaths_per_million",
    "people_vaccinated_per_hundred","people_fully_vaccinated_per_hundred")
    ]
  
# ?limination brutale des lignes avec valeurs manquantes :
missing <- apply(data, 1, function(row) any(is.na(row)))

# Autre strat?gie = essayer de compl?ter (Google...)
data <- data[!missing,]

# Regroupement par continent + calcul des indicateurs.

# Note : premi?re ligne = statistiques mondiales
aggregate(data[,4:5], list(as.factor(data$continent)),
          function(x) { if (is.numeric(x)) mean(x) else NULL })
          
# A priori peu fiable car continents (tr?s) sous-?chantillonn?s

# Comparaison avec les chiffres par continent fournis :
data[nchar(data$iso_code) >= 4 & data$continent == "",3:5]


