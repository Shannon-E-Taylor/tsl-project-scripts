##########
#LIBRARY#
#########

library("pcr")
library("tidyr")
library("dplyr")
library("ggpubr")

set_wd <- function() {
  library(rstudioapi) # make sure you have it installed
  current_path <- getActiveDocumentContext()$path 
  setwd(dirname(current_path ))
  print( getwd() )
}
set_wd()
#setwd("~/Documents/tsl-project/qpcr/")
ct1 <- readr::read_csv("st_qPCR_1.30.18.csv")

#clean ct1 
ct1 <- data.frame(Target = ct1$Target, Sample = ct1$Sample, CqMean = ct1$`Cq Mean`)
ct1 <- distinct(ct1)
ct1 <- ct1[ct1$Target != "E3", ] #E3 failed
ct1 <- ct1[ct1$Sample != "2", ] #remove standard curve
ct1 <- ct1[ct1$Sample != "4", ] #remove standard curve
ct1 <- ct1[ct1$CqMean != 0.0000, ] #remove null values from negative controls/failed reactions

#tidy it!
tidy_ct <- spread(ct1, key = "Target", value = "CqMean")
tidy_ct <- separate(tidy_ct, col = Sample, 
                    sep = "[:digit:]", into = "Gene")

group_var <- rep(c('egfp', 'tsl'), each = 3)

#calculate reference gene means
tidy_ct$ref <- rowMeans(tidy_ct[c('L3', 'R1')], na.rm=TRUE)

tidy_ct$L3 <- NULL
tidy_ct$R1 <- NULL
#tidy_ct$Gene <- NULL

delta_CT_egfp <-  mean(tidy_ct$ref[tidy_ct$Gene == "egfp"]) - mean(tidy_ct$Tsl[tidy_ct$Gene == "egfp"])
delta_CT_tsl <-  mean(tidy_ct$ref[tidy_ct$Gene == "tsl"]) - mean(tidy_ct$Tsl[tidy_ct$Gene == "tsl"])

tidy_ct$d_ct <- tidy_ct$Tsl - tidy_ct$ref


nice_plot <- ggerrorplot(tidy_ct, x="Gene", y = "d_ct", 
                    add = "jitter", desc_stat = "mean_ci") + 
  stat_compare_means(aes(group = Gene), method = "t.test") + 
  ylab(expression(paste(Delta, " ", C[T])))

nice_plot 


cohen.d(d = tidy_ct[tidy_ct$Gene == "tsl",]$d_ct, 
        f = tidy_ct[tidy_ct$Gene == "egfp",]$d_ct)
