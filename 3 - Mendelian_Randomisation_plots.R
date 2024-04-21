
library(ggplot2)
library(scales)


#Read in file with the beta values and confidence levels for all traits

plot_beta <- ggplot(data = IVWbeta, aes(x = Trait, y = Beta, ymin = Lower, ymax = Upper)) +
  geom_point(col="royalblue3", size=3) +   # Draw points
  geom_errorbar(position = position_dodge(width = 0.2), width = 0.2) +
  coord_flip() +
  theme_bw()+
  theme(panel.grid.major.y = element_line(colour = "grey", linetype = "dashed"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) 

plot_beta + scale_y_continuous(expand = c(0, 0),limits = c(-1.5, 1.5))





#Separate plot for traits with odds ratios

plot_OR <- ggplot(data = IVWOR, aes(x = OR, y =Trait, xmin = Lower, xmax = Upper)) +
  geom_point(col="royalblue3", size=3) +   # Draw points
  geom_errorbar(position = position_dodge(width = 0.2), width = 0.2) +
  theme_bw()+
  coord_fixed(ratio = 0.7) +
  theme(panel.grid.major.y = element_line(colour = "grey", linetype = "dashed"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) 

plot_OR + scale_x_continuous(expand = c(0, 0),limits = c(0, 4), breaks=c(0,1,2,3,4,5))




#Plot on a natural log scale

plot_OR <- ggplot(data = IVWOR, aes(x = OR, y =Trait, xmin = Lower, xmax = Upper)) +
  geom_point(col="royalblue3", size=3) +   # Draw points
  geom_errorbar(position = position_dodge(width = 0.2), width = 0.2) +
  theme_bw()+
  coord_fixed(ratio = 0.7) +
  theme(panel.grid.major.y = element_line(colour = "grey", linetype = "dashed"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) 

plot_OR + scale_x_continuous(expand = c(0, 0), limits = c(0.22, 4.5), breaks = c(0.25,0.5,1,2,3,4), trans = scales::log_trans())





