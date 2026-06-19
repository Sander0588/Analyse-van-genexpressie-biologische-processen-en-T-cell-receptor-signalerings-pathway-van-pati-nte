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

De data is verstrekt door de Afdeling Magische Wetshandhaving en Ollivanders Wandwinkel Archieven. 

De ruwe data van spreuken is eerst bewerkt voor analyse met behulp van [scripts/01_clean_spell_data.R](scripts/01_clean_spell_data.R). Vervolgens zijn de spreuken geanalyseerd op kracht en nauwkeurigheid met [scripts/02_spell_analysis.R](scripts/02_spell_analysis.R).

## 📊 Resultaten

Om inzicht te krijgen in eigenschappen van de te gebruiken spreuken is er een overzicht gemaakt, te vinden in [deze tabel](resultaten/top_10_spells.csv). Onvergeeflijke vloeken zijn niet meegenomen in dit overzicht. 

Om een afweging te maken welke spreuken het meest effectief zijn, is er onderzocht of er een verband te vinden is tussen kracht en accuraatheid. In [het resultaat hiervan](resultaten/spell_power_vs_accuracy.png) is te zien dat er een negatieve daling lijkt te zijn in kracht als de accuraatheid toeneemt. Een uitschieter is de onvergeeflijke vloek *Avada Kedavra*, met zowel hoge kracht als accuraatheid. 

## Conclusie

Spreuken met meer accuraatheid lijken minder krachtig te zijn. Een uitzondering op deze trend is de onvergeeflijke vloek *Avada Kedavra*, welke beter niet gebruikt kan worden. 