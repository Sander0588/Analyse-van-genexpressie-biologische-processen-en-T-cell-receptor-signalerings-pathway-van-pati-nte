# Downloaden en inladen van benodigde packages
BiocManager::install("DESeq2")
BiocManager::install("EnhancedVolcano")
library(DESeq2)
library(EnhancedVolcano)

# Inladen van de countsmatrix
counts_reuma <- read.table("count_matrix_RA.txt", row.names = 1)

# Stel duidelijke kolomnamen in die overeen komen met de samples
colnames(counts_reuma) <- c('normal1', 'normal2', 'normal3', 'normal4', 'reuma1', 'reuma2', 'reuma3', 'reuma4')

# Aanmaken van tabel waarbij welke samples reuma hebben en welke normaal zijn
patient <- c("normal", "normal", "normal", "normal", "reuma", "reuma", "reuma", "reuma")
patients_table <- data.frame(patient)
rownames(patients_table) <- c('normal1', 'normal2', 'normal3', 'normal4', 'reuma1', 'reuma2', 'reuma3', 'reuma4')

# Aanmaken van DESeqDataSet 
ddsReuma <- DESeqDataSetFromMatrix(countData = counts_reuma,
                                   colData = patients_table,
                                   design = ~ patient)
# Uitvoeren van analyse 
ddsReuma <- DESeq(ddsReuma)
resultaten_reuma <- results(ddsReuma)

sum(resultaten_reuma$padj < 0.05, na.rm = TRUE)
sum(resultaten_reuma$padj < 0.05 & resultaten_reuma$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten_reuma$padj < 0.05 & resultaten_reuma$log2FoldChange < -1, na.rm = TRUE)

# Opslaan van analyse resultaten 
write.table(resultaten_reuma, file = 'Resultaten_Reuma.csv', row.names = TRUE, col.names = TRUE)