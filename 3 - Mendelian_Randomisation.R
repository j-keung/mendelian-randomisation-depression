
library(TwoSampleMR)
library(MRPRESSO)

#Load in the exposure data
#Example uses summary statistics from forthcoming GWAS paper (not yet available)
variant_csv <- read.csv("VariantsMR.csv")
variant_exposures <- format_data(variant_csv, type="exposure")


#Load in the outcome data i.e. test for one of the significant traits
Edu_outcomes <- read_outcome_data(
  snps = variant_exposures$SNP,
  filename = "Education.txt",
  sep = "\t",
  snp_col = "SNP",
  beta_col = "Beta",
  se_col = "SE",
  effect_allele_col = "A1",
  other_allele_col = "A2",
  eaf_col = "EAF",
  pval_col = "P"
)

#Harmonise the data
Edu_data <- harmonise_data(
  exposure_dat = variant_exposures, 
  outcome_dat = Edu_outcomes
)


#Carry out Mendelian Randomisation
res <- mr(Edu_data)
p1 <- mr_scatter_plot(res, Edu_data)
p1[[1]]

mr_method_list()
res<-mr(Edu_data)
het<-mr_heterogeneity(Edu_data)
plt<-mr_pleiotropy_test(Edu_data)
sin<-mr_singlesnp(Edu_data)



#Remove outliers for Inverse-variance weighted regression method
#Run MR-PRESSO global method
mr_presso(BetaOutcome = "beta.outcome", BetaExposure = "beta.exposure", SdOutcome = "se.outcome", SdExposure = "se.exposure", OUTLIERtest = TRUE, DISTORTIONtest = TRUE, data = Edu_data, NbDistribution = 1000,  SignifThreshold = 0.05)


