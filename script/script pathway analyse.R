# Vector maken van genen die uit de go analyse kwamen en die differentieel tot expressie gebracht werden 
go_deg <- intersect(genes_go$SYMBOL, rownamesdeg)

# Vector maken van genen met de bij behorden log2foldchange
fc <- resultaten_reuma$log2FoldChange
names(fc) <- rownames(resultaten_reuma)

# Inladen van benodigde package
library(pathview)

# Pathview analyse uitvoeren
pathview(
  gene.data = fc,
  pathway.id = "hsa04660",
  species = "hsa",
  gene.idtype = "SYMBOL",
  limit = list(gene = 5))
