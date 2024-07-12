# 2014-11-18 SIMVEC Simulation und Erprobung in der Fahrzeugentwicklung 2014 

## &chi;MCF – Standard zur Beschreibung von Fügeinformationen 

Presented at the 
17. Kongress
SIMVEC Simulation und Erprobung in der Fahrzeugentwicklung 2014, Baden-Baden, 2014-11-18

DOI: &mdash;


### Abstract

Komplexe technische Systeme wie ein Fahrzeug bestehen typischerweise aus tausenden Einzelteilen bzw. Komponenten unterschiedlichster Eigenschaften, die durch Fügen (Schweißen, Kleben, Nieten, Schrauben u.a.) zusammengebaut werden. Je nach Teilprozessen in der Entwicklung erfolgt dies physikalisch oder virtuell. Fügen ist ein zentraler Aspekt, der ein Produkt von der Konstruktion, Simulation, Erprobung bis hin zur Produktion ständig begleitet und seine Eigenschaften am Ende entscheidend mitbestimmt. Während der Produktlebensdauer erlangen Eigenschaften wie z. B. Lebensdauer und Wartbarkeit der Fügestellen oft wesentliche Bedeutung. 

Die Information zur Beschreibung eines Fügeelements bzw. Fügeverfahrens (u.a. Geometrie, Fügepartner, Zusatzwerkstoffe und Fügeprozesse u.a.) kann vielfältig und daher umfangreich sein. Da die heute üblichen Fügeverfahren sehr verschieden sind, unterscheiden sich die Informationen dementsprechend deutlich. Häufig kooperieren tausende von Ingenieuren gleichzeitig an der Entwicklung eines Produktes, wobei sich jeder Beteiligte aber nur für einen Teil dieser Information interessiert. Erschwerend kommt hinzu, dass Fügeelemente in Teilprozessen unterschiedlich modelliert werden. Für einen Simulationsingenieur im CAE-Prozess könnte ein Schweißpunkt ein Balkenelement, ein Knoten oder ein MPC sein, während der gleiche Schweißpunkt für einen Konstrukteur häufig nur eine Koordinate und eine Zahl (Linsendurchmesser) bedeutet. All diese Umstände führen zu einem nicht durchgängigen, ineffizienten und fehlerträchtigen Gesamtprozess. Mangelnder Informationsaustausch zieht somit kostspielige Mehraufwände nach sich.

Unter der Federführung des Arbeitskreises 25 „Fügetechnik“ der FAT/VDA wurde ein Entwurf für einen Standard zur Beschreibung von Fügeinformationen (&chi;MCF: Extended Master Connection File) für die Automobilindustrie erarbeitet. &chi;MCF ist so konzipiert, dass alle gängigen Fügeelemente nach ihren geometrischen Ausprägungen (0d, 1d, 2d) generisch beschrieben werden. &chi;MCF bildet einerseits die topologischen Beziehungen der Fügepartner ab, enthält andererseits aber auch alle relevanten Informationen (geometrisch, verfahrenstechnisch und fertigungstechnisch), die zur vollständigen Beschreibung des jeweiligen Fügeelements benötigt werden. &chi;MCF kann daher als Datenbank oder Container betrachtet werden, wobei die Architektur von &chi;MCF einfache Erweiterungen um neue Fügetechnologien und Prozessdaten erlaubt. 

Das einzelne Fügeelement in &chi;MCF kann von einem Mindestumfang ausgehend ergänzt werden. Dies macht es möglich, &chi;MCF individuell in einen dynamischen Entwicklungsprozess zu integrieren. Jeder Prozessbeteiligte kann dort die aktuellen Informationen finden, die für ihn von Interesse sind. Ein Simulationsingenieur für Betriebsfestigkeit kann dort neben der Angabe zum Verlauf einer Schweißnaht auch detaillierte Auskunft über den Nahttyp, die Nahtquerschnitte und Fertigungsparameter finden, die für die Schwingfestigkeit von essenzieller Bedeutung sind. 

Mit Hilfe von &chi;MCF entsteht auch bezüglich Fügedaten eine durchgängige Prozesskette aus CAD, CAE und CAM, die erhebliche Effizienzgewinne bietet. Der Umfang des heutigen Entwurfs ist in den CAE-Tools MEDINA (FE-Präprozessor) sowie LMS Virtual.Lab und Femfat (Fatigue) implementiert und wird in der technischen Entwicklung (z. B. bei Volkswagen) eingesetzt. 




## Folder Contents

* Presentation: See SIMVEC web site [SIMVEC Simulation und Erprobung in der Fahrzeugentwicklung 2014](https://www.vdi-nachrichten.com/shop/simvec-simulation-und-erprobung-in-der-fahrzeugentwicklung-2014/) 
* the extended abstract: [_SIMVEC_2014_xMCF_Franke_et_al_20140929_1424.pdf_](./SIMVEC_2014_xMCF_Franke_et_al_20140929_1424.pdf)
