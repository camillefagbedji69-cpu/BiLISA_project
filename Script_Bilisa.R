## Script BiLISA 

library(terra)
library(spdep)
library(bispdep)
library(sf)
library(exactextractr)

##importation des rasters 

r1 <- rast("~/Mémoire Master 2025-2026/Data_folder/Workflow_test/c_storage_bas.tif")

water <- st_read("C:/Users/ACER/Downloads/Dossier_Invest/Resultats/output/watershed_results_wyield.shp")
  
shape <- st_read("C:/Users/ACER/Downloads/Dossier_Invest/watershed.shp")

##extraction de R1 

carbon <- exact_extract(r1, shape, fun = "sum", 
                        progress = TRUE, append_cols = "ws_id")

##jointure à water 

library(dplyr)

df <- water %>% 
  left_join(carbon, by = join_by(ws_id == ws_id))

##graphique eau 

library(ggplot2)

g1 <- ggplot(df)+
  geom_sf(aes(fill = wyield_vol))+
  scale_fill_viridis_c()+
  theme_minimal()

g2 <- ggplot(df)+
  geom_sf(aes(fill = df$sum))+
  scale_fill_viridis_c()+
  theme_minimal()

##matrice de contiguité 

poly <- poly2nb(shape)

mat_spdep <- nb2listw(poly, style = "W")

##autocorrélation spatiale carbone 

moran.test(df$sum, mat_spdep)

moran.test(df$wyield_vol, mat_spdep)

##bivariate analysis 

moran.bi(df$wyield_vol, df$sum, mat_spdep)


cluster <-moranbi.cluster(df$wyield_vol, df$sum, mat_spdep, st_geometry(shape),
                          zero.policy = FALSE, conditional = TRUE,
                          significant = TRUE, pleg = "bottomleft")



##corrélation 

x <- df[5:10] %>% 
  st_drop_geometry()

corr_matrix <- stats::cor(x, method = "pearson")

corrplot(corr_matrix, method = "color")


##Plots paires 

library(GGally)

ggpairs(x)


##régression 

model <- lm(df$wyield_vol~ df$precip_mn + df$AET_mn + df$area, data = df)

library(car)

vif(model)

summary(model)

##carbon aérien 

carbon_air <- rast("~/Mémoire Master 2025-2026/Data_folder/Workflow_test/intermediate_outputs/c_above_bas.tif")
##



df $ above_carbon <- exact_extract(carbon_air, shape, fun = "sum",
                            progress = TRUE, append_cols = "ws_id")


ggplot(df)+
  geom_sf(aes(fill = df$above_carbon$sum))+
  scale_fill_viridis_c()+
  theme_minimal()

##régression

model_2 <- lm(log(df$wyield_vol) ~ log(df$above_carbon$sum) + 
                log(df$precip_mn)+
                log(df$AET_mn), data = df)

vif(model_2)

summary(model_2)
