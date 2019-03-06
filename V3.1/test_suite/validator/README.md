`
Usage: java -jar xmcf3Validator.jar [-v] -s schema_file_name xml_file_name_1 [xml_file_name_2 ...]
  options:
    -s, --schema    Defines XSD Schema validation file
    -v, --verbose   Shows verbose error messages
    -h, --help       Shows usage


-------------------------------xMCF Validator Build Instructions-------------------------------

In order to modify the xMCF .java validator bear in mind:

* Note that you need Xerces2 Java 2.11.0 (XML Schema 1.1) (Beta)
  and above in order to validate XSD Schema 1.1

* Configure Build path of project and add, at least the following .jar files in order 
  to use Xerces2.12.0:
	cupv10k-runtime.jar
	org.eclipse.wst.xml.xpath2.processor_1.2.0.jar
	xercesImpl.jar
	xml-apis.jar
 
* Update pop.xml file with the appropriate Maven dependency. For example:
	  <dependency>
  		<groupId>xerces</groupId>
  		<artifactId>xercesImpl</artifactId>
  		<version>2.12.0</version>
  	</dependency>

* At last, check that MANIFEST file contains these lines:
	Manifest-Version: <versionNumber>
	Main-Class: <packageName>.<className>

	eg.
	Manifest-Version: 1.0
	Main-Class: xmcfValidation.Xsd11SchemaValidator

`
