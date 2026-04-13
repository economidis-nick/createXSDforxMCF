# test_suite contents:

* `valid_files/*` contains a set of files which should all pass the validation
* `invalid_files/*` contains a set of xml files which are wrong, and the **schema validation** should catch the errors.
* `invalid_files/schematron/*` contains a set of xml files which are wrong, and the **schematron validation** should catch the errors.
* a validator, `xmcf3Validator.jar` which you can use to validate the test suite
* `validator/` contains the java source files and instructions used to create the `xmcf3Validator.jar`.

## Instructions

To run the test suite, use the validator provided:

    $ java -jar xmcf3Validator.jar  -s ../xmcf_3_2.xsd  valid_files/*.xml
    $ java -jar xmcf3Validator.jar  -s ../xmcf_3_2.xsd  invalid_files/*.xml

The first call  of the validator should report that all tests have passed.
The second call of the validator should report that all tests have at least 1 error.

In order to get more details regarding the error of a file under test, use the `-v` option:

    $ java -jar xmcf3Validator.jar  -v  -s ../xmcf_3_2.xsd  test_file.xml

To test with schematron, read the section [how to run with schematron](how%20to%20run%20with%20schematron.md)

## Requirements

In order to run the xmcf3validator.jar, you have to use Java 8.
