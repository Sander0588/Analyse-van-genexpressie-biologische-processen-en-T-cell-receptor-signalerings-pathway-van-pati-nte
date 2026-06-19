# Inladen van package 
library(dplyr)

# Vector maken van de rijnamen(genen) 
rownamesallgenes <- rownames(resultaten_reuma)

# Data frame maken van de resultaten_reuma
resultaten2 <- as.data.frame(resultaten_reuma)

# Data frame maken van de differentieel tot expressie gebrachte genen met een hogere log2 foldchange dan 1
deg <- resultaten2 %>%
  filter(padj < 0.05, log2FoldChange > 1)

# Vector maken van de rijnamen(differentieel tot expressie gebrachte genen) 
rownamesdeg<- rownames(deg)

# Vector maken van alle genen waarbij differentieel tot expressie gebrachte genen een 1 hebben en de rest een 0. 
gene.vector=as.integer(rownamesallgenes %in% rownamesdeg)
names(gene.vector)=rownamesallgenes 

# Downloaden en inladen van benodigde packages
BiocManager::install("org.Hs.eg.db")
BiocManager::install("goseq")
library(goseq)
library(geneLenDataBase)
library(AnnotationDbi)
library(org.Hs.eg.db)

# Maken van een PWF object 
pwf <- nullp(
  DEgenes = gene.vector,
  genome = "hg19",
  id = "geneSymbol")

# Uitvoeren van GO analyse
GO.wall=goseq(pwf,"hg19","geneSymbol")
goseq()
# Uitvoeren van GO analyse met Go termen die statisch significant zijn
enriched.GO=GO.wall$category[GO.wall$over_represented_pvalue<.05]

# Opslaan van GO analyse
library(GO.db)
capture.output(for(go in enriched.GO[1:258]) { print(GOTERM[[go]])
  cat("--------------------------------------\n")
}
, file="GO_analyse.txt")
