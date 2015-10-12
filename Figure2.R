library(cowplot)
library(ggplot2)
library(grid)
n = 100
data = data.frame(X = rep(c(0,1),each=n/2),Ind = c(1:n))

I = rnorm(length(unique(data$Ind)))
b = 2*c(1,1)
data$y1 = rnorm(nrow(data),0,.4) + I[data$Ind] + b[1]*data$X
data$y2 = rnorm(nrow(data),0,.4) + I[data$Ind] + b[2]*data$X

p1 = ggplot(data,aes(x=y1,y=y2)) + geom_point(aes(col = factor(X)),size=3) + theme(legend.position="none")


I = rnorm(length(unique(data$Ind)))
b = 2*c(-1,1)
data$y1 = rnorm(nrow(data),0,.4) + I[data$Ind] + b[1]*data$X
data$y2 = rnorm(nrow(data),0,.4) + I[data$Ind] + b[2]*data$X
p2 = ggplot(data,aes(x=y1,y=y2)) + geom_point(aes(col = factor(X)),size=3) + theme(legend.position="none")

ps = plot_grid(p1,p2,nrow=1,labels=c('A','B'))
save_plot(ps,file='Figure2.pdf',base_aspect_ratio = 2,base_height=4)