#######################################################




#######################################################

# Initation ----

rm(list = ls())
source("constant.R")
pkgInitialization("ggplot2")
dirInitialization("fmax/")

# Functions ----


# Data readln for 6 Comp ----

dat <- read.csv("data/Result_Fmax_6Comp.csv") %>%
  dplyr::inner_join(read.csv("data/meta_SedimentSampleList.csv")) %>%
  dplyr::inner_join(read.csv("data/meta_Quadrat.csv")) %>%
  dplyr::inner_join(read.csv("data/meta_SiteGroup.csv"))

# Ploting for 6 Comp ----

## exploratory ploting ----

plot.outline <- 
  ggplot(aes(x = SiteID, y = value), 
         data = dat %>% 
           dplyr::select(Comp1:Comp6, SiteID, group) %>%
           tidyr::gather(trait, value,Comp1:Comp6))+
  geom_boxplot(aes(col = group)) + 
  facet_wrap(~ trait, scales = "free")

ggsave("fmax/box_exploratory_6Comp.png",plot.outline,dpi = 300)

# Data readln for 3 Comp ----

dat <- read.csv("data/Result_Fmax_3Comp.csv") %>%
  dplyr::inner_join(read.csv("data/meta_SedimentSampleList.csv")) %>%
  dplyr::inner_join(read.csv("data/meta_Quadrat.csv")) %>%
  dplyr::inner_join(read.csv("data/meta_SiteGroup.csv"))

# Ploting for 3 Comp ----

## exploratory ploting ----

plot.outline <- 
  ggplot(aes(x = SiteID, y = value), 
         data = dat %>% 
           dplyr::select(Comp1:Comp3, SiteID, group) %>%
           tidyr::gather(trait, value,Comp1:Comp3))+
  geom_boxplot(aes(col = group)) + 
  facet_wrap(~ trait, scales = "free")

ggsave("fmax/box_exploratory_3Comp.png",plot.outline,dpi = 300)
