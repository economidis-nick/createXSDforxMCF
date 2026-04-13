## What to download to use Schematron:

* Download Saxon-HE (free, Java-based).
* Download the ISO Schematron XSLT skeleton files from github (Schematron/stf):
  - `iso_dsdl_include.xsl`
  - `iso_abstract_expand.xsl`
  - `iso_svrl_for_xslt2.xsl`
  - `iso_schematron_skeleton_for_saxon.xsl`


## How to validate using Schematron (long version)

Before validation, schematron file needs to be converted to a suitable validator.xsl.

~~~~
java -jar SaxonHE12-9J\saxon-he-12.9.jar -s:xmcf_3_2.sch -xsl:iso_dsdl_include.xsl -o:step1.xsl
java -jar SaxonHE12-9J\saxon-he-12.9.jar -s:step1.xsl -xsl:iso_abstract_expand.xsl -o:step2.xsl
java -jar SaxonHE12-9J\saxon-he-12.9.jar -s:step2.xsl -xsl:iso_svrl_for_xslt2.xsl -o:validator.xsl
~~~~

Then this `validator.xsl` can be used to validate the `.xml`. 

Here is an example on how to test `gumdrop_template.xml` with the above `validator.xsl` schematron:

~~~~
java -jar SaxonHE12-9J\saxon-he-12.9.jar -s:valid_files\gumdrop_template.xml -xsl:validator.xsl -o:report.xml
~~~~


## How to validate using Schematron (short version)

I've added the generation of validator.xsl from schematron under a simple bash script, `generate_validator.sh`:
~~~~
Usages: 
./generate_validator.sh  -i ../xmcf_3_2.sch  -x SaxonHE12-9J/saxon-he-12.9.jar  -o validator.xsl
./generate_validator.sh  -i ../xmcf_3_2.sch  -x SaxonHE12-9J/saxon-he-12.9.jar
~~~~

Again, to test `gumdrop_template.xml` with the above `validator.xsl` schematron:

~~~~
java -jar SaxonHE12-9J\saxon-he-12.9.jar -s:valid_files\gumdrop_template.xml -xsl:validator.xsl -o:report.xml
~~~~

To view the assertion texts contained in the `report.xml`, you can simply do it with this:
~~~~
java -cp SaxonHE12-9J\saxon-he-12.9.jar    net.sf.saxon.Query 		-s:report.xml      -qs:"//*:text/string()" 
~~~~
