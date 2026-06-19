# Analyse van genexpressie, biologische processen en T cell receptor signalerings pathway van patiënten met reumatoïde artritis ten opzichte van gezonde patiënten. 
<p align="center">
  <img src="Assets/Dna_foto.webp" alt="DNA logo" width="600"/>
</p>



## 📁 Inhoud/structuur

- `data/raw/` – fictionele datasets voor de analyse van spreuk effectiviteit, gevaar en welke spreuken het beste samengaan met verschillende types staf.  
- `data/processed` - verwerkte datasets gegenereerd met scripts 
- `scripts/` – scripts om prachtige onzin te genereren
- `resultaten/` - grafieken en tabellen
- `bronnen/` - gebruikte bronnen 
- `README.md` - het document om de tekst hier te genereren
- `assets/` - overige documenten voor de opmaak van deze pagina
- `data_stewardship/` - Voor de competentie beheren ga je aantonen dat je projectgegevens kunt beheren met behulp van GitHub. In deze folder kan je hulpvragen terugvinden om je op gang te helpen met de uitleg van data stewardship. 


## Inleiding

Reumatoïde artritis is een chronische auto-immuunziekte die aanhoudende ontstekingen aan gewrichten veroorzaakt. Deze ontstekingen kunnen lijden tot pijn en zelfs beschadiging van kraakbeen en bot. Wereldwijd heeft ongeveer 0,3 tot 1% van de bevolking Reumatoïde artritis. De exacte oorzaak van reumatoïde artritis is niet bekend[(1)](https://pmc.ncbi.nlm.nih.gov/articles/PMC5385708/?). Wel spelen erfelijke factoren[(2)](https://www.vzinfo.nl/reumatoide-artritis/oorzaken-en-gevolgen) en een verstoord immuunsysteem een grote rol bij het ontstaan van de ziekte. 
Eerdere genexpressie onderzoeken hebben aangetoond dat patiënten met reumatoïde artritis afwijkende genexpressie vertonen vergeleken met gezonde mensen. Deze verschillen worden voornamelijk gevonden in genen die betrokken zijn bij het immuunsysteem, zoals genen die betrokken zijn bij de activatie van immuuncellen en ontstekingsreacties[(3)](https://pmc.ncbi.nlm.nih.gov/articles/PMC6657850/#pone.0219698.ref003). Deze resultaten suggereren dat de veranderingen in genexpressie bijdragen tot het verstoorde immuunsysteem wat een grote rol speelt bij het ontstaan van de ziekte.
Het doel van deze studie is om verschillen in genexpressie tussen patiënten met reumatoïde artritis en gezonde mensen te identificeren en de betrokken biologische processen te visualiseren. Dit is gedaan door eerst een volcanoplot te maken van de expressie van alle genen ten opzichte van de controles, daarna een GO analyse uit te voeren om veranderde biologische processen te bepalen en uiteindelijk een pathway analyse te maken om de verandering van biologische processen te visualiseren. 



## Materiaal en methode

De gebruikte data is afkomstig uit een eerder onderzoek [(Platzer et al., 2019)](https://pubmed.ncbi.nlm.nih.gov/31344123/). De samples van de data zijn verkregen via een synoviumbiopt en uit eindelijke gesequenced met illuminia sequencing. De personen met Reumatoïde artritis waren positief getest op ACPA, personen zonder negatief.  

#Mappen en kwantificatie van de reads

De volledige analyse was gedaan in R (4.5.3) 
Het [menselijke referentiegenoom](https://www.ncbi.nlm.nih.gov/datasets/taxonomy/9606/) werd eerst geïndexeerd met de package [Rsubread](https://pubmed.ncbi.nlm.nih.gov/30783653/)(2.24.0). Vervolgens werden de reads van alle monsters (tabel 1) uitgelijnd tegen het referentiegenoom met behulp van Rsubread. 
De uitgelijnde reads werden na het uitlijnen geteld doormiddel van Rsubread. Het gebruikte [annotatiebestand](https://www.ncbi.nlm.nih.gov/datasets/taxonomy/9606/) zorgde ervoor dat de genen een naam kregen. Deze data werd opgeslagen in een Count_matrix voor verdere analyse. Het mappen en kwantificeren van de reads werd gedaan met [script mappen en kwantificeren](script/script_mappen_en_kwantificeren.R).

#Differentiële genexpressie analyse

Van de Count_matrix werd de differentiële expressie geanalyseerd met het pakket [DESeq2](https://www.bioconductor.org/packages//2.12/bioc/vignettes/DESeq2/inst/doc/DESeq2.pdf)(1.50.2) en [script Differentiële gen expressie analyse](script/script_Differentiële_genexpressie_analyse.R). Voordat de analyse gedaan kon worden werd de date eerst bewerkt en daarna werd er DESeqDataSet aangemaakt.
Voor elk gen werd er een log2foldchange, een p waarde en een voor gecorrigeerde p-waarde  berekend. Vanaf kleinere gecorrigeerde p waarde van 0,05 werd een gen aanschouwt tot differentieel tot expressie gebracht. 
Van de differentiële genexpressie analyse resultaten werd een volcanoplot gemaakt met behulp van [EnchancedVolcano](https://pmc.ncbi.nlm.nih.gov/articles/PMC12263102/)(1.28.2) en [script volcanoplot](script/script_volcanoplot.R).

#GO analyse

Voor de go analyse werden alleen de genen gebruikt die differentieel tot expressie gebrachte werden met een hogere log2foldchange dan 1.  Deze data werd bewerkt door gebruik van [Dplyr](https://dplyr.tidyverse.org/ )(1.2.1). Uiteindelijk werd er een pwf object gemaakt met het genoom hg19 doormiddel van [goseq](https://www.researchgate.net/publication/238769214_goseq_Gene_Ontology_testing_for_RNA-seq_datasets)(1.62.0) en [genelendatabase]( https://www.researchgate.net/publication/238769214_goseq_Gene_Ontology_testing_for_RNA-seq_datasets)(1.46.0 ). Na het maken van het pwf object werd de go analyse uitgevoerd en opgeslagen doormiddel van [script Go analyse](script/script_Go_analyse.R). Om de go analyse te visualiseren is met behulp van [ggplot2](https://link.springer.com/book/10.1007/978-3-319-24277-4)(4.0.3) en [script staadiagram GO analyse](script/script_staadiagram_GO_analyse.R) een staafdiagram gemaakt. 

Pathway analyse
Voor de pathway analyse werden eerst de genen van de go term GO:0045321 verkregen door middel van [script welke genen bij GO term](script/script_welke_genen_bij_GO_term.R), [AnnotationDbi](https://bioconductor.posit.co/packages/release/bioc/vignettes/AnnotationDbi/inst/doc/IntroToAnnotationPackages.pdf)(1.72.0)  en [org.Hs.eg.db](https://bioconductor.statistik.tu-dortmund.de/packages/3.6/bioc/html/OrganismDbi.html)(3.22.0). Met deze genen werd met AI gevonden dat de veel van deze genen hoorden met de T cell receptor signalerings pathway (hsa04660). Vervolgens werd er een pathway analyse gedaan met de pathway [hsa04660]((https://www.genome.jp/dbget-bin/www_bget?pathway+hsa04660 ) met [script pathway analyse](script/script_pathway_analyse.R). Voor de materiaal en methode was figuur 1 gevolgd. 

<p align="center">
  <img src="Resultaten/stroomschema.png" alt="stroomschema" width="600"/>
</p>

## 📊 Resultaten

#Differentiële genexpressie analyse 

Uit de resultaten van de differentiële genexpressie analyse bleken 5119  genen differentieel tot expressie zijn gebracht. Hiervan waren er 2085 meer dan verdubbeld en 2487 meer dan gehalveerd in expressie. Om dit te visualiseren is er een volcano plot gemaakt waarin alle geteste genen staan met hun log2foldchange en hun gecorrigeerde p waarde 

<p align="center">
  <img src="Resultaten/volcanobijschrift.png" alt="volcanobijschrift" width="600"/>
</p>

#GO analyse

In Figuur 4 is een te zien waarin de meest statistisch significante  verrijkte GO-termen. In de diagram valt op dat elke verrijkte GO-term te maken heeft het immuunsysteem. Ook valt te zien dat de 2 meest statistisch significante verrijkte GO-termen allebei over het immuun respons gaan. 

<p align="center">
  <img src="Resultaten/meestverrijktegotermen.png" alt="meestverrijktegotermen" width="600"/>
</p>

#Pathway analyse

In figuur 5 is de pathway analyse van de T cell receptor signalerings patway te zien. Hierin valt op dat genen betrokken bij T cel activatie (CD28, ZAP70, ICOS en IFN-γ) sterk verhoogd tot expressie kwamen wat kan leiden tot het produceren van ontstekingsreacties. Ook lijkt de cel groei proliferatie verminderd te worden door omlaag gereguleerde bijbehorende genen (IL-2, AKT, ERK en CDK4)

<p align="center">
  <img src="Resultaten/pathwayanalyse.png" alt="pathwayanalyse" width="600"/>
</p>

## Conclusie
In het onderzoek is gevonden dat er 5119  differentieel tot expressie zijn gekomen bij mensen met reumatoïde artritis ten opzichte van de controles. Hiervan waren er 2085 meer dan verdubbeld en 2487 meer dan gehalveerd in expressie. Uit de GO analyse viel te zien dat de differentieel tot expressie gebracht genen voornamelijk betrokken waren bij het immuunsysteem. Met de 2 meest verrijkte GO termen  betrokken bij de immuun response. 
Vanuit de T cell receptor signalering pathway bekeken viel te zien dat de genen betrokken bij T cell activatie sterk verhoogd tot expressie kwamen wat zich aan 

## Bronnenlijst
uo, Q., Wang, Y., Xu, D., Nossent, J., Pavlos, N. J., & Xu, J. (2018). Rheumatoid arthritis: Pathological mechanisms and modern pharmacologic therapies. Bone Research, 6(1), 15. https://doi.org/10.1038/s41413-018-0016-9 

Rijksinstituut voor Volksgezondheid en Milieu. (z.d.). Reumatoïde artritis: Oorzaken en gevolgen. VZinfo. Geraadpleegd op 19 juni 2026, van https://www.vzinfo.nl/reumatoide-artritis/oorzaken-en-gevolgen 

Lin, Y.-J., Anzaghe, M., & Schülke, S. (2020). Update on the pathomechanism, diagnosis, and treatment options for rheumatoid arthritis. Cells, 9(4), 880. https://doi.org/10.3390/cells9040880 

National Center for Biotechnology Information. (z.d.). Homo sapiens (human), taxonomy ID 9606. National Library of Medicine. Geraadpleegd op 19 juni 2026, van https://www.ncbi.nlm.nih.gov/datasets/taxonomy/9606/ 

Love, M. I., Huber, W., & Anders, S. (z.d.). DESeq2 vignette. Bioconductor. Geraadpleegd op 19 juni 2026, van https://www.bioconductor.org/packages//2.12/bioc/vignettes/DESeq2/inst/doc/DESeq2.pdf 

Wickham, H., François, R., Henry, L., Müller, K., & Vaughan, D. (z.d.). dplyr: A grammar of data manipulation. https://dplyr.tidyverse.org/ 

Young, M. D., Wakefield, M. J., Smyth, G. K., & Oshlack, A. (2010). Gene ontology analysis for RNA-seq: Accounting for selection bias. Genome Biology, 11(2), R14. https://doi.org/10.1186/gb-2010-11-2-r14 

Wickham, H. (2016). ggplot2: Elegant graphics for data analysis (2e ed.). Springer. https://doi.org/10.1007/978-3-319-24277-4 

Pagès, H., Carlson, M., Falcon, S., & Li, N. (z.d.). Introduction to Bioconductor annotation packages. Bioconductor. Geraadpleegd op 19 juni 2026, van https://bioconductor.posit.co/packages/release/bioc/vignettes/AnnotationDbi/inst/doc/IntroToAnnotationPackages.pdf 

Bioconductor Project. (z.d.). OrganismDbi: Smooth interfacing of different database packages. Geraadpleegd op 19 juni 2026, van https://bioconductor.statistik.tu-dortmund.de/packages/3.6/bioc/html/OrganismDbi.html 

Kanehisa Laboratories. (z.d.). KEGG pathway: T cell receptor signaling pathway (hsa04660). Kyoto Encyclopedia of Genes and Genomes. Geraadpleegd op 19 juni 2026, van https://www.genome.jp/dbget-bin/www_bget?pathway+hsa04660

# AI gebruik
In dit verslag is er voor het vinden van de bronnen, het maken van een bronnen lijst en het zoeken voor een pathway gebruikt gemaakt van ai. Voor de rest heeft ai geholpen met het interpreteren van de resultaten en het helpen bij problemen met het script schrijven. 

