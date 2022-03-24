# DHd_BoA-separated

Dieses Repositorium enthält Skripte zur Erstellung einzelner PDF-Dateien aus den TEI kodierten XML-Dateien zum Book of Abstracts für DHd-Jahreskonferenzen.

Skripte zur Erstellung einzelner Abstracts aus TEI kodierten XML-Dateien in PDF:
- separated.sh
- ./config/config_separated.sh
- ./lib/tei2pdf/TEIcorpus_producer-separated.xsl
- ./lib/tei2pdf/xsl-fo-producer-separated.xsl

Alle Skripte basieren auf https://github.com/karindalziel/TEI-to-PDF.

# Umgebung einrichten
## Download Saxon
- Download Saxon HE (http://saxon.sourceforge.net/) 
- Ablage im Ordner ./lib

Der Code wurde mit SaxonHE9-9-0-2J getestet.

## Download FO processor
- Download FOP Binary files (https://xmlgraphics.apache.org/fop/) 
- Ablage im Ordner ./lib
- Download fop-hyph.jar (https://xmlgraphics.apache.org/fop/0.95/hyphenation.html) für automatische Silbentrennung (Ablage im Ordner ./lib/fop-2.3/lib)

Der Code fwurde mit FOP 2.3 getestet.

## Ablage der XML-Dateien
- ./input/xml

## Ablage der Bild-Datein
- ./input/images

# Prozess
1. Öffne Terminal und gehe in Verzeichnis
2. separated.sh ausführen
3. Die einzelnen PDF-Dateien werden in den automatisch generierten Ordner ./outputs geladen

# Zusätzliche Infos
- Individuelle Anpassungen (insbesondere des Layouts) sind bei Bedarf in ./lib/tei2pdf/xsl-fo-producer-separated.xsl vorzunehmen 
- Vorgenommene Anpassungen für die Darstellung der Abstracts aus den verschiedenen Jahrgängen (2016-2022) sind im Code dokumentiert
- Grundsätzlich bedarf es noch einer Bereinigung des Codes
