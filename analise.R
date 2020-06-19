library(tidyverse)

install.packages("Hmisc", "summarytools", "anchors")

install.packages( "anchors")

library(tidyverse, Hmisc, summarytools)

library(dplyr)

library(anchors)

library(forcats)

houses_rent <- read_csv(here::here("houses_to_rent_v2.csv"), col_names = TRUE)

str(houses_rent)

summarytools::dfSummary(houses_rent)

summary(houses_rent)

columns <- c('Cidade','Area','Quartos','Banheiros','Vaga_estac','Andar',
             'Permite_pet','Mobilia','hoa (R$)','Aluguel','Condominio',
             'Seguro_incendio','total (R$)')

colnames(C) <- c('Cidade','Area','Quartos','Banheiros','Vaga_estac','Andar',
                 'Permite_pet','Mobilia','hoa (R$)','Aluguel','Condominio',
                 'Seguro_incendio','total (R$)')

names(houses_rent)

houses_rent %>%
  group_by(Cidade) %>% 
  tally()

Hmisc::describe(houses_rent)

houses_rent <- replace.value( houses_rent, c("Permite_pet"), from="acept", to="sim", verbose = FALSE)
houses_rent <- replace.value( houses_rent, c("Permite_pet"), from="not acept", to="nao", verbose = FALSE)
houses_rent <- replace.value( houses_rent, c("Mobilia"), from="furnished", to="sim", verbose = FALSE)
houses_rent <- replace.value( houses_rent, c("Mobilia"), from="not furnished", to="nao", verbose = FALSE)

head(houses_rent,5)

boxplot(Aluguel~Quartos,data=houses_rent, 
        xlab="Quartos", ylab="Aluguel")


boxplot(Area~Aluguel,data=houses_rent, 
        xlab="Aluguel", ylab="Area")

houses_rent$preco_m2 <- (houses_rent$Aluguel / houses_rent$Area)

areahouses_rent <- subset(houses_rent, Area < 350)

hist(areahouses_rent$Area)


boxplot(preco_m2~Quartos,data=areahouses_rent, 
        xlab="Quartos", ylab="preco_m2")





