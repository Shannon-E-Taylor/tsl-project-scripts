
#########
#GLOBALS#
#########

all_folders <- c("3B_gridB4/", "0B_gridA3/", "4B/", "5B/", "7B_gridB1/", "9B/")
dir = "Documents/nasonia results/EM pictures/"
#setwd("C:/Users/shann/") #works on my computer only


######
#CODE#
######

df = NULL #stop adding crap to df

for (n in 1:length(all_folders)){
  
  temp_file_names <- list.files(path = paste(dir, all_folders[n], sep=""), 
                                pattern = "*.csv")
  
  for (i in 1:length(temp_file_names)) { #iterate through all files, make  
    temp_file <- read.csv(paste("Documents/nasonia results/EM pictures/", 
                                all_folders[n],
                                temp_file_names[i], sep=""))
    temp_df <- data.frame(raw = temp_file$Length, 
                          mean = mean(temp_file$Length), 
                          sigma = sd(temp_file$Length), 
                          biol_rep = all_folders[n],
                          name = paste(n, i, sep='.')
    )
    df <- rbind(df, temp_df)
  }
  
}

######
#PLOT#
######

ggplot(df, aes(x=df$name, y=df$raw)) + 
  geom_boxplot() + 
  xlab("type") + ylab("width(nm)") + 
  geom_jitter() + 
  geom_point(data = df, 
             col = "red", shape = 7, size = 5, 
             aes (x = df$name, y = df$sigma)) + 
  geom_point(data = df, 
             col = "blue", shape = 7, size = 5, 
             aes (x = df$name, y = df$mean)) + 
  facet_grid(~ df$biol_rep, scales = "free")
