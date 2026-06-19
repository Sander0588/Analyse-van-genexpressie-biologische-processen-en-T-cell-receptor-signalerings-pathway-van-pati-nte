#Downloaden en inladen van benodigde packages
install.packages('BiocManager')
library(BiocManager)
BiocManager::install('Rsubread')
library(Rsubread)


#Indexeren van het referenteigenoom.
buildindex(
  basename = 'ref_human',
  reference = 'mens_referentie_genoom.fna',
  memory = 12000,
  indexSplit = TRUE)

#Mappen van de samples
align.normal1 <- align(index = "ref_human", readfile1 = "SRR4785819_1_subset40k.fastq", readfile2 = "SRR4785819_2_subset40k.fastq", output_file = "normal1.BAM")
align.normal2 <- align(index = "ref_human", readfile1 = "SRR4785820_1_subset40k.fastq", readfile2 = "SRR4785820_2_subset40k.fastq", output_file = "normal2.BAM")
align.normal3 <- align(index = "ref_human", readfile1 = "SRR4785828_1_subset40k.fastq", readfile2 = "SRR4785828_2_subset40k.fastq", output_file = "normal3.BAM")
align.normal4 <- align(index = "ref_human", readfile1 = "SRR4785831_1_subset40k.fastq", readfile2 = "SRR4785831_2_subset40k.fastq", output_file = "normal4.BAM")
align.reuma1 <- align(index = "ref_human", readfile1 = "SRR4785979_1_subset40k.fastq", readfile2 = "SRR4785979_2_subset40k.fastq", output_file = "reuma1.BAM")
align.reuma2 <- align(index = "ref_human", readfile1 = "SRR4785980_1_subset40k.fastq", readfile2 = "SRR4785980_2_subset40k.fastq", output_file = "reuma2.BAM")
align.reuma3 <- align(index = "ref_human", readfile1 = "SRR4785986_1_subset40k.fastq", readfile2 = "SRR4785986_2_subset40k.fastq", output_file = "reuma3.BAM")
align.reuma4 <- align(index = "ref_human", readfile1 = "SRR4785988_1_subset40k.fastq", readfile2 = "SRR4785988_2_subset40k.fastq", output_file = "reuma4.BAM")

# Combineer alle samples in een vector
allsamples <- c("normal1.BAM", "normal2.BAM", "normal3.BAM", "normal4.BAM", "reuma1.BAM", "reuma2.BAM", "reuma3.BAM", "reuma4.BAM")

# Maak een countmatrix van alle samples 
count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "mens.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.featureType = "gene", 
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)

# Stel duidelijke kolomnamen in die overeen komen met de samples
counts <- count_matrix$counts
colnames(counts) <- c('normal1', 'normal2', 'normal3', 'normal4', 'reuma1', 'reuma2', 'reuma3', 'reuma4')

# Opslaan van de countsmatrix
write.csv(counts, "reuma_countmatrix.csv")