# &chi;MCF (aka xMCF)

&chi;MCF stands for "extended Master Connection File", a standard for files storing part connections for automotive and similar industries. 
The project has been initiated by [VDA](https://www.vda.de/en.html), the German Association of the Automotive Industry

The &chi;MCF 3.0 format specification has been described in text, without a schema. 
The following version &chi;MCF 3.1 features an XML schema and some improvements.

We have made slight corrections to the original document, and 
we are developing the schema, as well as complete examples to accompany the documentation.

In order for us to test-drive the development the schema, we have built a test suite.

With version &chi;MCF 3.1.1, we strive for ISO standardization, see [ISO/AWI PAS 8329](https://www.iso.org/standard/83119.html).


## Folder Contents

#### `V3.0/` contains:
the original specification document and pdf

#### `V3.1/` contains:
* the corrected specification document, 
* the developed &chi;MCF3.1 schema, and
* the accompanying examples for the updated document
* a `test_suite` used for test-driven development of the schema

#### `V3.1.1/` contains:
* the improved specification document V3.1.1, 
* the developed &chi;MCF3.1 schema, and
* the accompanying examples for the updated document
* a `test_suite` used for test-driven development of the schema


---

@DrCaFr, 2022-11-04: Since the previous update of this README.md-file (2020-05-30), the topic of this project has been significantly expanded. 
It is no longer about "Create XSD for &chi;MCF", but rather about ISO standardization. I have modified this README.md file accordingly.
