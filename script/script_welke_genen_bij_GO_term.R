# Inladen van benodigde packages
library(org.Hs.eg.db)
library(AnnotationDbi)

# Uit zoeken welke genen er bij de GO analyse GO:0045321 horen
genes_go <- AnnotationDbi::select(
  org.Hs.eg.db,
  keys = "GO:0045321",
  keytype = "GOALL",
  columns = "SYMBOL")