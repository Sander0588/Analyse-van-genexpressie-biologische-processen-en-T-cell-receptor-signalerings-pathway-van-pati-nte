install.packages('BiocManager')
library(BiocManager)
BiocManager::install('Rsubread')
library(Rsubread)

browseVignettes('Rsubread')

buildindex(
  basename = 'ref_human',
  reference = 'Referentie_genoom_mens',
  memory = 12000,
  indexSplit = TRUE)