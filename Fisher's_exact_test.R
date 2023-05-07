
#Create a dataframe


#MDD = Major Depressive Disorder
#EDU = Educational attainment
#Example for educational attainment uses summary statistics from publicly available dataset: https://doi.org/10.1038/s41588-018-0147-3

df <- data.frame(
  "MDD+" = c(5, 30),   #if there were 30 variants and 5 were found to be significant for both MDD and EDU:
  "MDD-" = c(313,782995),
  row.names = c("EDU+","EDU-"),
  stringsAsFactors = FALSE
)
df

colnames(df) <- c("MDD+", "MDD-")

library(stats)

fisher.test(df)




#----------------------------------

#Dotplot of the significant traits

library(ggplot2)
library(scales)
library(readxl)

data <- read_excel("Fisher_exact_results.xlsx")


p <- ggplot(data = df, aes(x = Trait, y = OR, ymin = Lower, ymax = Upper)) +
        geom_point(col="royalblue3", size=3) +   # Draw points
        geom_errorbar(position = position_dodge(width = 0.2), width = 0.2) +
        labs(title="Fisher's exact test") +
        coord_flip() +
        theme_bw()+
        theme(panel.grid.major.y = element_line(colour = "grey", linetype = "dashed"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) 

p + scale_y_continuous(expand = c(0, 0),limits = c(0, 2700))
