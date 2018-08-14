#######################################################




#######################################################

# Initation ----

rm(list = ls())
source("constant.R")
pkgInitialization("ggplot2")
dirInitialization("index/")

# Functions ----


# Data readln ----

dat <- read.csv("data/Result_fluoIndex.csv") %>%
  dplyr::inner_join(read.csv("data/meta_SedimentSampleList.csv")) %>%
  dplyr::inner_join(read.csv("data/meta_Quadrat.csv")) %>%
  dplyr::inner_join(read.csv("data/meta_SiteGroup.csv"))

# Ploting ----

## exploratory ploting ----

plot.outline <- 
ggplot(aes(x = SiteID, y = value), 
       data = dat %>% 
         dplyr::select(A260:bix, SiteID, group) %>%
         tidyr::gather(trait, value,A260:bix))+
  geom_boxplot(aes(col = group)) + 
  facet_wrap(~ trait, scales = "free")

ggsave("index/box_exploratory.png",plot.outline,dpi = 300)


  
  
  