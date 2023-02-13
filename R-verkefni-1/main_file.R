# TODO: Description

# Install packages if necessary.
# Load packages.
library(datasets)

### Hluti 1 ###

# Load data. [1a]
HS = read.csv("Data/husnaedisverd_2017_21.csv", sep = ";", header = TRUE)

# Preliminary data exploration of full dataset.
head(HS)
summary(HS)

# Narrowing of dataset to three neighbourhoods.[1b]
hverfi <- c(500, 170, 300)
HS <- filter(HS, matssvaedi%in%hverfi)

# Preliminary data exploration of narrowed dataset.
#  All variables are of the right type. [1c]
head(HS)
summary(HS)

# Create new variable, fermetraverd, in the DF, which
#  contains the property price per square meter.[1d]
HS$fermetraverd <- HS$kaupverd / HS$birtm2

# Create new variable, teg_eign_s_i, in the DF, which
#  categorizes property type into two categories:
#  sérbýli and íbúð. [1e]

HS$teg_eign_s_i <- fct_recode(HS$teg_eign, 
           Sérbýli = "Einbýlishús", 
           Sérbýli = "Parhús",
           Sérbýli = "Raðhús",
           Íbúð = "Íbúðareign")

# Rename neighbourhoods with more descriptive names.[1f]
HS$matssvaedi <- as.factor(HS$matssvaedi)
HS$matssvaedi <- fct_recode(HS$matssvaedi,
                            Garðabær = "500",
                            BreiðholtNeðra = "170",
                            KópavogurVesturbær = "300")

### Hluti 2 ###

# Plot kaupverd and birtm2. [2g]
mynd_kaupverd <- ggplot(HS, aes(kaupverd)) +
  geom_histogram(bins = 100) + 
  labs(x = "Kaupverð", y = "Fjöldi húsnæða") +
  theme_clean()
mynd_kaupverd

mynd_birtm2 <- ggplot(HS, aes(birtm2)) +
  geom_histogram(bins = 100) + 
  labs(x = "Stærð húsnæðis í m^2",
       y = "Fjöldi húsnæða") +
  theme_clean()
mynd_birtm2

# Plot number of properties by neighbourhood and type. [2h]
mynd2h <- ggplot(HS, aes(x=matssvaedi, fill=teg_eign_s_i)) +
  geom_bar(position = "dodge") +
  labs(x = "Hverfi",
       y = "Fjöldi húsnæða",
       fill = "Tegund eignar") +
  theme_clean()
mynd2h

# Plot price per square meter by type of property. [2i]
mynd2i <- ggplot(HS, aes(x=matssvaedi, y=fermetraverd)) +
  geom_boxplot() +
  labs(x = "Hverfi",
       y = "Fermetraverð") +
  theme_clean() 
mynd2i

# Plot property size and price by neighbourhood side-by-side. [2j]
mynd2j <- ggplot(HS, aes(x=birtm2, y=kaupverd)) +
  geom_point() +
  facet_grid(cols = vars(matssvaedi)) +
  labs(x = "Fermetrar",
       y = "Kaupverð") +
  theme_clean()
mynd2j

### Hluti 3 ###