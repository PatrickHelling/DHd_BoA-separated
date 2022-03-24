# Separated Funktion
Um alle Beiträge als einzelne pdf erstellen zu können, muss im root Verzeichnis des Repositories
```
./separated.sh
```
ausgeführt werden.
Die Funktion erstellt dann den Output Ordner mit den benötigten Unterordnern.
Die XSLT Funktionen sind so umgestellt das die PDF direkt mit dem Artikel beginnt. Seitenzahlen, Inhalts- und Authorenverzeichnisse werden nicht generiert.
Die fertigen Dateien sind unter output zu finden.
## Benötigte Bibliotheken
In der config_separated.sh werden die Bibliothken zur generierung angegeben.
Benötigt werden [fop-2.3](https://xmlgraphics.apache.org/fop/download.html) und [Saxon-HE 9.9](http://saxon.sourceforge.net/#F9.9HE).
Beide werden im lib Verzeichniss gespeichert.
<br/>
Die Ordnerstruktur muss wie folgt aussehen
```
lib
- fop-2.3
-- build
-- conf
-- examples
-- lib
- SaxonHE9-9-0-2J
-- doc
-- notices
```
