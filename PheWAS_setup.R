library(readxl)
library(tidyverse)
library(writexl)

#Access all the sheets downloaded from GWAS Atlas with readxl function 
sheet <- excel_sheets("All SNPs.xlsx")

#Apply sheet names to dataframe names
all_snps <- lapply(setNames(sheet, sheet), 
                    function(x) read_excel("All SNPs.xlsx", sheet=x))

#Attach all dataframes together with dplyr function 
all_snps <- bind_rows(all_snps, .id="Sheet")

#Print data of all sheets
print(all_snps)


#Find a specific trait
facial_ageing <- subset(all_snps, Trait == 'Facial ageing')
print(facial_ageing)

#Find a specific domain
significant_traits_meta <- subset(significant_traits, Domain == 'Metabolic')
print(significant_traits_metabolic)


#Change colname of one column
colnames(all_snps)[colnames(all_snps) == "P-value"] <- "Pvalue"

#Apply Bonferroni correction
significant_traits <- subset(all_snps, Pvalue < 0.000000404347)
print(significant_traits)


#Count number of occurrences of each domain using tidyverse function and turn into a dataframe 
domain_counts <- significant_traits %>%
  count(Domain, sort = TRUE) 


#Count number of occurrences of each trait 
trait_counts <- significant_traits %>%
  count(Trait, sort = TRUE) 


#Export to excel
write_xlsx(trait_counts,"table_trait.xlsx")
