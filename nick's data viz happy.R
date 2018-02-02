# Data visualization Workshop 1
# by Haoran
# 1/31/2018
# R developed from S (statistics) by John Chambers

rm(list = ls())
url <- ("https://raw.githubusercontent.com/NicksonWeng/Data-visualization-class/master/hpi-data-2016.csv")
happy <- read.csv(url)

library(ggplot2)

mainDir <- "c:/new plots" # folder to save
dir.create(file.path(mainDir))
setwd(file.path(mainDir))



variable.list <- colnames(happy)
variable.list <- variable.list[-c(2,3,11,14)] # list of x-y variable for ploting removed categorical


# iteration to build (aes_string() to take items in list as argument)
i <- 1
i.2 <- 1
while(i<11){
  i.2 <- i+1
  while(i.2<11){
    XX <- variable.list[i]
    YY <- variable.list[i.2]
    plot <- ggplot(happy, aes_string(x = variable.list[i], y = variable.list[i.2]))+
      geom_point(aes(size = Happy.Planet.Index, color = Region))+
      geom_smooth(se = FALSE)
    #geom_text(aes(label = Country))
    print(i.2)
    file.name <- paste ("plot", variable.list[i],"#", variable.list[i.2],".jpeg", sep = " ", collapse = NULL)
    ggsave(file.name, plot = plot, device = "jpeg")
    i.2 <- i.2+1
  }
  print(i)
  i <- i+1
}
