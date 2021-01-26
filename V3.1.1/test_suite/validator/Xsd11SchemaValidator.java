package xmcfValidation;

import javax.xml.validation.*;
import javax.xml.transform.sax.*;
import java.io.*;
import org.xml.sax.*;

import java.util.*;
import java.nio.file.*;

class Xsd11SchemaValidator {
  private static int errorCount = 0;
  private static int fileErrorCount = 0;
  
  public static void main(String[] args) {
    if (args.length<3) {
      System.out.println("Usage: java -jar xmcf3Validator.jar [-v] -s schema_file_name xml_file_name_1 [xml_file_name_2 ...]");
      System.out.println("  options:");
      System.out.println("    -s, --schema    Defines XSD Schema validation file");
      System.out.println("    -v, --verbose   Shows verbose error messages");
      System.out.println("    -h, --help      Shows usage");
    } else {
      StringBuilder schemaNameBld = new StringBuilder();
	  Vector<String> xmlFiles = new Vector<String>();
	  
	  boolean verbose = parseCommandLineArguments(args, schemaNameBld, xmlFiles);
	  
	  String schemaName = schemaNameBld.toString();

	  for(int i=0; i < xmlFiles.size(); i++) {
		  fileErrorCount = 0;

		  Path path = Paths.get(xmlFiles.get(i));
		  if( Files.isRegularFile(path) ) {
			  System.out.print(xmlFiles.get(i)+"\t");
			  Schema schema = loadSchema(schemaName);
			  validateXml(schema, xmlFiles.get(i), verbose);

			  if( fileErrorCount > 0 ) {
				  System.out.println("   Errors: "+fileErrorCount);
			  } else if( fileErrorCount == 0 ) {
				  System.out.println("   Passed.");
			  }
		  } else {
			  System.out.println(xmlFiles.get(i)+"\tFile not found.");
		  }
	  }

	  if (errorCount>0) {
		  System.out.println("Total Errors: "+errorCount);
	  }
  }
}
  
  public static boolean parseCommandLineArguments(String[] args, StringBuilder schemaName, Vector<String> xmlFiles) {
	  boolean verbose = false;
	  
	  for(int i=0;i<args.length;i++) {
		  if( args[i].equals("-v") || args[i].equals("--verbose") ) {
			  verbose = true;
		  } else if( args[i].equals("-h") || args[i].equals("--help") ) {
			  System.out.println("Usage: java -jar xmcf3Validator.jar [-v] -s <schema_file_name> <xml_file_name>");
		      System.out.println("  options:");
		      System.out.println("    -s, --schema    Defines XSD Schema validation file");
		      System.out.println("    -v, --verbose   Shows verbose error messages");
		      System.out.println("    -h, --help      Shows usage");
		      
			  System.exit(1);
		  } else if( args[i].equals("-s") || args[i].equals("--schema") ) {
			  i++;
			  if( i == args.length ) {
				  System.out.println("Usage: java -jar xmcf3Validator.jar [-v] -s <schema_file_name> <xml_file_name>");
			      System.out.println("  options:");
			      System.out.println("    -s, --schema    Defines XSD Schema validation file");
			      System.out.println("    -v, --verbose   Shows verbose error messages");
			      System.out.println("    -h, --help      Shows usage");
			      
				  System.exit(1);
			  } else {
				  schemaName.append( args[i] );
			  }
		  } else {
			  xmlFiles.add(args[i]);
		  }
	  }
	  
	  return verbose;
  }
  
  public static void validateXml(Schema schema, String xmlName, boolean verbose) {
    try {
      // creating a Validator instance
      Validator validator = schema.newValidator();

      // setting my own error handler
      if( verbose ) {
    	  validator.setErrorHandler(new VerboseErrorHandler());
      } else {
    	  validator.setErrorHandler(new NonVerboseErrorHandler());
      }

      // preparing the XML file as a SAX source
      SAXSource source = new SAXSource(
        new InputSource(new java.io.FileInputStream(xmlName)));

      // validating the SAX source against the schema
      validator.validate(source);
    } catch (Exception e) {
    	// catching all validation exceptions
    	if( verbose ) {
    		System.out.println();
    		System.out.println(e.toString());
    	}
    }
  }
  
  public static Schema loadSchema(String name) {
    Schema schema = null;
    try {
      String language = "http://www.w3.org/XML/XMLSchema/v1.1";
      SchemaFactory factory = SchemaFactory.newInstance(language);
      schema = factory.newSchema(new File(name));
    } catch (Exception e) {
      System.out.println(e.toString());
    }
    return schema;
  }
  
  private static class VerboseErrorHandler implements ErrorHandler {
    public void warning(SAXParseException e) throws SAXException {
       System.out.println("Warning: "); 
       printException(e);
    }
    public void error(SAXParseException e) throws SAXException {
       System.out.println("Error: "); 
       printException(e);
    }
    public void fatalError(SAXParseException e) throws SAXException {
       System.out.println("Fattal error: "); 
       printException(e);
    }
    private void printException(SAXParseException e) {
      errorCount++;
      fileErrorCount++;
      System.out.println("   Line number: "+e.getLineNumber());
      System.out.println("   Column number: "+e.getColumnNumber());
      System.out.println("   Message: "+e.getMessage());
    }
  }
  
  private static class NonVerboseErrorHandler implements ErrorHandler {
	    public void warning(SAXParseException e) throws SAXException { 
	       printException(e);
	    }
	    public void error(SAXParseException e) throws SAXException { 
	       printException(e);
	    }
	    public void fatalError(SAXParseException e) throws SAXException { 
	       printException(e);
	    }
	    private void printException(SAXParseException e) {
	      errorCount++;
	      fileErrorCount++;
	    }
	  }
}