#Daniel's plots


plt <- list(geom_jitter(width = 0.3, height = 0.0, alpha = 0.5), 
            xlab("Genotype")) 



spliced <- data.frame(trt = rep(c("c355>Dm-tsl", "c355>Nv-tsl"), each = 3), 
                      num = c(7.74, 7.82, 7.74, 
                              1.94, 2.5, 2.64)) 
                      
spliced_plot <- ggerrorplot(spliced, x= "trt", y = "num") + 
  plt + ylab("Average number of denticle belts missing") + ylim(0, 8)

spliced_plot

###percent rescue

posterior_rescue <- data.frame(trt = c("Slbo>Dm-tsl, tsl∆", 
                                       "Slbo>Dm-tsl, tsl∆", 
                                       "Slbo>Dm-tsl, tsl∆", 
                                       "Slbo>Nv-tsl, tsl∆", 
                                       "Slbo>Nv-tsl, tsl∆", 
                                       "Slbo>Nv-tsl, tsl∆"), 
                               num = c(4, 4, 0, 
                                       0, 0, 0))
posterior_rescue$position <- "Posterior"


posterior_rescue_plot <- ggerrorplot(posterior_rescue, x = "trt", y = "num") + 
  plt + 
  ylab("% Posterior Rescue") + ylim(0, 70)


anterior_rescue <- data.frame(trt = c("Slbo>Dm-tsl, tsl∆", 
                                      "Slbo>Dm-tsl, tsl∆", 
                                      "Slbo>Dm-tsl, tsl∆", 
                                      "Slbo>Nv-tsl, tsl∆", 
                                      "Slbo>Nv-tsl, tsl∆", 
                                      "Slbo>Nv-tsl, tsl∆"), 
                              num = c(46, 64, 54, 
                                      0, 0, 0))
anterior_rescue$position <- "Anterior"

anterior_rescue_plot <- ggerrorplot(anterior_rescue, x = "trt", y = "num") + 
  plt + 
  ylab("% Anterior Rescue")

anterior_rescue_plot




rescue <- rbind(anterior_rescue, posterior_rescue)

rescue_plot <- ggerrorplot(rescue, x = "trt", y = "num", facet.by="position") + 
  plt + 
  ylab("% Rescue") + 
  stat_compare_means(method = "t.test")
rescue_plot


uasp_vs_uast <- data.frame(trt = rep(c("nos>pUAST-Nv-tsl", "nos>pUASP-Nv-tsl", 
                                       "c355>pUAST-Nv-tsl", "c355>pUASP-Nv-tsl"), each = 3), 
                           num = c(0.04, 0, 0, 
                                   0.04, 0.04, 0.06, 
                                   1.94, 2.5, 2.64, 
                                   0.96, 0.24, 1.5)
                           )

uasp_vs_uast_plot <- ggerrorplot(uasp_vs_uast, x = "trt", y = "num") + 
  plt + 
  ylab("Average number of denticle belts missing")
uasp_vs_uast_plot

