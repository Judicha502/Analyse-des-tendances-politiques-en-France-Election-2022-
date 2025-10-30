install.packages("FactoMineR")
setwd("C:/Users/andon/Documents/Cours/L3/S5/Socio Analyse de données/Projet")
dep<-read.csv2("pres2022comm.csv", sep=",",header=TRUE)
View(dep)
names(dep)
#On efface les colonnes qui ne vont pas être utilisées dans l'analyse
bdd <- dep[, -c(1, 3:7, 8:21,34:45,47,49, 50:98)]
View(bdd)
dim(bdd)
names(bdd)

library(dplyr)

#On convertis les colonnes relatifs aux pourcentage de voix en données numériques, afin de pouvoir les utiliser
#On renomme les colonnes convertis en rajoutant "num_" au début de leur nom.
bdd <- bdd %>%
  mutate(across(matches("^(pvoix|pvoixT2MACRON|pvoixT2MLEPEN)"), ~ as.numeric(.), .names = "num_{.col}"))

#En utilisant dim(bdd) on constate qu'il y'a 34 867 lignes, car il y a toutes les villes de chaque
#département. Dans les lignes de codes ci-dessous, nous allons regrouper les villes par département en calculant
#la moyenne des votes. Ainsi, nous allons nous baser sur la moyenne des votes des départements (basée sur le pourcentage de vote de chaque ville).
#Faire cela va nous permettre d'alleger la base de données, et de manipuler les données plus facilement.
sum_dep <- bdd %>%
  group_by(nomdep) %>%                    
  summarise(across(starts_with("num_"), ~ mean(.x, na.rm = TRUE)), .groups = 'drop')

View(sum_dep)
dim(sum_dep)

#Moyenne des pourcentage de voix pour Emmanuel Macron et Marine Le Pen au second tour.
mean(sum_dep$num_pvoixT2MACRON, na.rm = TRUE)
mean(sum_dep$num_pvoixT2MLEPEN, na.rm = TRUE)

#Médianes
median(sum_dep$num_pvoixT2MACRON, na.rm = TRUE)
median(sum_dep$num_pvoixT2MLEPEN, na.rm = TRUE)

#Matrice de corrélation entre les pourcentage de voix de chaque candidat
cor(sum_dep[,-1])
round(cor(sum_dep[,-1]),2)
library(corrplot)
corrplot(cor(sum_dep[,-1]), type="upper", order="original", tl.col="black", tl.srt=45)

library(corrplot)
library(FactoMineR)
library(explor)

ACP<-PCA(sum_dep[,-1],scale.unit=TRUE,graph=F)
## Valeurs propres
ACP$eig
sum(ACP$eig[,1])
#On ajoute le nom de chaque département dans le nuage des individus, pour mieux les identifier
ACP<-PCA(sum_dep[,-1],scale.unit=TRUE, quanti.sup = c(13,14),graph=F)
rownames(ACP$ind$coord) <- sum_dep$nomdep
explor(ACP)

