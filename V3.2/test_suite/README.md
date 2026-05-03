# test_suite contents:

* `valid_files/*` contains a set of files which should all pass the validation
* `invalid_files/*` contains a set of xml files which are wrong, and the **schema validation** should catch the errors.
* `invalid_files/schematron/*` contains a set of xml files which are wrong, and the **schematron validation** should catch the errors.
* a schema-validator, `xmcf3Validator.jar` which you can use to validate the test suite against the .xsd
* bash scripts, `test_that_all_valid_files_pass` and `test_all_invalid_files_fail.sh` to test against the .sch 
* `validator/` contains the java source files and instructions used to create the `xmcf3Validator.jar`.


## Instructions

To run the test suite, use the validator provided:

    $ cd test_stuite
    $ java -jar xmcf3Validator.jar  -s ../xmcf_3_2.xsd  valid_files/*.xml
    $ java -jar xmcf3Validator.jar  -s ../xmcf_3_2.xsd  invalid_files/*.xml

The first call  of the validator should report that all tests have passed.
The second call of the validator should report that all tests have at least 1 error.

In order to get more details regarding the error of a file under test, use the `-v` option:

    $ java -jar xmcf3Validator.jar  -v  -s ../xmcf_3_2.xsd  test_file.xml

To test that all files pass the schematron tests:

    $ ./test_that_all_valid_files_pass.sh
    $ ./test_all_invalid_files_fail.sh -i validator.xsl -d invalid_files/schematron/ -v

The first call  of the validator should report that all tests in `valid_files/` have passed.
The second call of the validator should report that all tests in `invalid_files/schematron` have at least 1 error.

For more information about schematron validation, read the section [how to run with schematron](how%20to%20run%20with%20schematron.md)

## Requirements

In order to run the xmcf3validator.jar, you have to use Java 8.
