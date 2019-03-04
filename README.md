# createXSDforxMCF

We are building the XML schema for xMCF 3.0. 
xMCF is the extended Master Connection File, a standard of storing connection files for the Automotive Industry. 
The project has been initiated by VDA. 

The xMCF 3.0 format specification has been described in text, without a schema. 

We have made slight corrections to the original document, and 
we are developing the schema, as well as complete examples to accompany the documentation.

In order for us to test-drive the development the schema, we have built a test suite.

## Folder Contents

#### `V3.0/` contains:
the original specification document and pdf

#### `V3.1/` contains:

* the corrected specification document, 
* the developed xMCF3 schema, and
* the accompanying examples for the updated document

#### `test_suite/` contains:

* `valid_files/` contains a set of files which should all pass the validation
* `invalid_files/` contains a set of xml files which are wrong, and the schema validation should catch the errors.
* `validator/` contains the validator, `xmcf3Validator.jar`, and the java source files and instructions used to create it.

## Instructions

To run the test suite, use the validator provided:

    $ cd test_suite
    $ java -jar xmcf3Validator.jar  -s ../V3.1/xmcf.xsd  valid_files/*.xml
    $ java -jar xmcf3Validator.jar  -s ../V3.1/xmcf.xsd  invalid_files/*.xml

The first call  of the validator should report that all tests have passed.
The second call of the  validator should report that all tests have at least 1 error.

In order to get more details regarding the error of a file under test, use the `-v` option:

    $ java -jar xmcf3Validator.jar  -v  -s ../V3.1/xmcf.xsd  test_file.xml
