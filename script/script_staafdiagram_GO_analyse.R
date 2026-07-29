#visualiseren van GO analyse
GO.sig <- GO.wall %>% 
  filter(over_represented_pvalue < 0.05)
topGO <- GO.sig %>%
  arrange(over_represented_pvalue) %>%
  head(20)
topGO
library(ggplot2)
ggplot(topGO,
       aes(x = reorder(term, -log10(over_represented_pvalue)),
           y = -log10(over_represented_pvalue))) +
  geom_bar(stat = "identity", fill = "steelblue") +
  coord_flip() +
  xlab("GO term") +
  ylab("-log10(P)") +
  ggtitle("Meest verrijkte GO-termen in reumatoïde artritis")