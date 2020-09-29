######################################################################
#### Palmer penguins — example project in R ##########################
#### Author: Barbara Vreede ##########################################
#### Penguin data from the palmerpenguins package, by Allison Horst ##
######################################################################


# Load data
penguins <- read.csv("penguins_raw.csv")

# Clean data
penguins$Species_short <- sub('(^\\w+)\\s.+','\\1',penguins$Species) # pick first word in Species column

names(penguins) <- sub('\\.{2}.+\\.','',names(penguins)) # remove text after double period
names(penguins) <- gsub('\\.','_',names(penguins)) # replace periods in column names

penguins <- penguins[!is.na(penguins$Sex),] # remove data where sex is unknown

# Turn species, island, sex into factors
penguins$Species_short <- as.factor(penguins$Species_short)
penguins$Sex <- as.factor(penguins$Sex)
penguins$Island <- as.factor(penguins$Island)



# Plot basic measurements
plot(penguins$Culmen_Length,penguins$Culmen_Depth, col="white",
     xlab="Beak length (mm)",
     ylab="Beak depth (mm)")
title("Beak dimensions in Palmer penguins")
legend("bottomright",
       legend=c("Adelie","Chinstrap","Gentoo", " ", "Male", "Female"),
       pch=c(16, 8, 6, 16, 16, 16),
       col=c("black","black","black","white","darkblue","pink"))

# Adelie, males
points(
  penguins$Culmen_Length[penguins$Sex=="MALE"&penguins$Species_short=="Adelie"],
  penguins$Culmen_Depth[penguins$Sex=="MALE"&penguins$Species_short=="Adelie"],
  pch=16, col="darkblue")
# Adelie, females
points(
  penguins$Culmen_Length[penguins$Sex=="FEMALE"&penguins$Species_short=="Adelie"],
  penguins$Culmen_Depth[penguins$Sex=="FEMALE"&penguins$Species_short=="Adelie"],
  pch=16, col="pink")

# Chinstrap, males
points(
  penguins$Culmen_Length[penguins$Sex=="MALE"&penguins$Species_short=="Chinstrap"],
  penguins$Culmen_Depth[penguins$Sex=="MALE"&penguins$Species_short=="Chinstrap"],
  pch=8, col="darkblue")
# Chinstrap, females
points(
  penguins$Culmen_Length[penguins$Sex=="FEMALE"&penguins$Species_short=="Chinstrap"],
  penguins$Culmen_Depth[penguins$Sex=="FEMALE"&penguins$Species_short=="Chinstrap"],
  pch=8, col="pink")

# Gentoo, males
points(
  penguins$Culmen_Length[penguins$Sex=="MALE"&penguins$Species_short=="Gentoo"],
  penguins$Culmen_Depth[penguins$Sex=="MALE"&penguins$Species_short=="Gentoo"],
  pch=6, col="darkblue")
# Gentoo, females
points(
  penguins$Culmen_Length[penguins$Sex=="FEMALE"&penguins$Species_short=="Gentoo"],
  penguins$Culmen_Depth[penguins$Sex=="FEMALE"&penguins$Species_short=="Gentoo"],
  pch=6, col="pink")

