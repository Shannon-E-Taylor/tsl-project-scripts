#Daniel's plots
library("ggplot2")
library("ggpubr")
library("rstatix") #need to install using devtools

plt <- list(geom_jitter(width = 0.3, height = 0.0, alpha = 0.5), 
            xlab("Genotype")) 

fontsize <- 8

spliced <- data.frame(trt = rep(c("c355>Dm-tsl", "c355>Nv-tsl"), each = 3), 
                      num = c(7.74, 7.82, 7.74, 
                              1.94, 2.5, 2.64)) 
                      
spliced_plot <- ggerrorplot(spliced, x= "trt", y = "num") + 
  plt + 
  ylab("# missing denticle belts") + ylim(0, 8) + 
  geom_hline(yintercept=0, linetype = "dashed", color = "grey") + 
  stat_compare_means(method = "t.test", label.x.npc = 0.25, 
                     size = 3, 
                     ref.group = 0)

spliced_plot
                     #label.y = 9) 

  #spliced_plot <- ggpar(spliced_plot, font.tickslab =9)
  
  spliced_plot <- ggpar(spliced_plot, font.tickslab =fontsize, 
                       font.main= fontsize, 
                       font.submain = fontsize,
                       font.caption = fontsize, 
                       font.x = fontsize, 
                       font.y = fontsize)
  
spliced_plot <- spliced_plot + theme(axis.title.x = element_blank())

spliced_plot
ggsave(spliced_plot, file = "spliced_plot_smallerfont.png", 
       width = 72*1.3, height = 45*1.3, units = "mm")
  


###percent rescue

posterior_rescue <- data.frame(trt = c("Slbo>Dm-tsl", 
                                       "Slbo>Dm-tsl", 
                                       "Slbo>Dm-tsl", 
                                       "Slbo>Nv-tsl", 
                                       "Slbo>Nv-tsl", 
                                       "Slbo>Nv-tsl"), 
                               num = c(4, 4, 0, 
                                       0, 0, 0))
posterior_rescue$position <- "Posterior"


posterior_rescue_plot <- ggerrorplot(posterior_rescue, x = "trt", y = "num") + 
  plt + 
  ylab("% Posterior Rescue") + ylim(0, 70)


anterior_rescue <- data.frame(trt = c("Slbo>Dm-tsl", 
                                      "Slbo>Dm-tsl", 
                                      "Slbo>Dm-tsl", 
                                      "Slbo>Nv-tsl", 
                                      "Slbo>Nv-tsl", 
                                      "Slbo>Nv-tsl"), 
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
  stat_compare_means(method = "t.test", label.x.npc = 0.25, 
                     label.y = 70, 
                     size = 3) + 
  geom_hline(yintercept=0, linetype = "dashed", color = "grey") + 
  theme(strip.text.x = element_text(size = fontsize), 
        axis.title.x=element_blank())
rescue_plot <- ggpar(rescue_plot, font.tickslab =fontsize, 
                     font.main= fontsize, 
                     font.submain = fontsize,
                     font.caption = fontsize, 
                     font.x = fontsize, 
                     font.y = fontsize,
                     ylim = c(0, 70))


rescue_plot <- rescue_plot + theme(axis.title.x = element_blank())

ggsave(rescue_plot, file = "rescue_plot_dash_biggerfont.png", width = 72*1.3, height = 45*1.3, units = "mm")

rescue_plot_nodash <- ggerrorplot(rescue, x = "trt", y = "num", facet.by="position") + 
  plt + 
  ylab("% Rescue") + 
  stat_compare_means(method = "t.test", label.x.npc = 0.25, 
                     label.y = 70) + 
  geom_hline(yintercept=0, linetype = "dashed", color = "grey")
rescue_plot <- ggpar(rescue_plot, font.tickslab =6, 
                     font.main= 6, 
                     font.submain = 6,
                     font.caption = 6, 
                     font.x = 6, 
                     font.y = 6,
                     ylim = c(0, 70))

ggsave(rescue_plot, file = "rescue_plot.png", width = 66*2, height = 45, units = "mm")


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

arr <- ggarrange(spliced_plot, rescue_plot, widths = c(1, 2)) 
arr

ggsave(arr, file = "dm-plots.png", width = 66*3, height = 66, units = "mm")


#4.5   7.2 
#one-sided t-tests

t.test(spliced$num[spliced$trt=="c355>Dm-tsl"])
t.test(spliced$num[spliced$trt=="c355>Nv-tsl"])
t.test(posterior_rescue$num[posterior_rescue$trt=="Slbo>Dm-tsl"])


stat.test <- spliced %>% group_by(trt) %>% 
  t_test(num ~ 1, mu = 0) %>%
  adjust_pvalue(method = "bonferroni") %>% 
  mutate(y.position = 9)

spliced_plot + stat_pvalue_manual(stat.test, label = "p.adj",
                                  xmin = "trt", 
                                  xmax = NULL) + 
  ylim(0, 9)

stat.test.rescue <- rescue %>% group_by(trt, position) %>% 
  t_test(num ~ 1, mu = 0) %>%
  adjust_pvalue(method = "bonferroni") %>% 
  mutate(y.position = 65)

rescue_plot + stat_pvalue_manual(stat.test.rescue, label = "p.adj",
                                 xmin = "trt", 
                                 xmax = NULL)

