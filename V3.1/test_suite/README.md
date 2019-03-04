# test_suite contents:

* `valid_files/` contains a set of files which should all pass the validation
* `invalid_files/` contains a set of xml files which are wrong, and the schema validation should catch the errors.
* `validator/` contains the validator, `xmcf3Validator.jar`, and the java source files and instructions used to create it.
* a validator, `xmcf3Validator.jar` which you can use to validate the test suite

## Instructions

To run the test suite, use the validator provided:

    $ java -jar xmcf3Validator.jar  -s ../V3.1/xmcf.xsd  valid_files/*.xml
    $ java -jar xmcf3Validator.jar  -s ../V3.1/xmcf.xsd  invalid_files/*.xml

The first call  of the validator should report that all tests have passed.
The second call of the validator should report that all tests have at least 1 error.

In order to get more details regarding the error of a file under test, use the `-v` option:

    $ java -jar xmcf3Validator.jar  -v  -s ../V3.1/xmcf.xsd  test_file.xml
