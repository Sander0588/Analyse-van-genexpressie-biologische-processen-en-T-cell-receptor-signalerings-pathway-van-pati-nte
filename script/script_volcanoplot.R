# Maken van volcanoplot
EnhancedVolcano(resultaten_reuma,
                lab = rownames(resultaten_reuma),
                x = 'log2FoldChange',
                y = 'padj')

# Opslaan van volcanoplot
dev.copy(png, 'Volcanoplot_reuma.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()