# &chi;MCF (aka xMCF)

&chi;MCF stands for "extended Master Connection File", a standard for files describing connections of mechanical parts for automotive and similar industries. 
The project has been initiated by [VDA](https://www.vda.de/en), the German Association of the Automotive Industry

The &chi;MCF 3.0 format specification has been described in text, without a schema. 
The following version &chi;MCF 3.1 features an XML schema and some improvements.

We have made slight corrections to the original document, and 
we are developing the schema, as well as complete examples to accompany the documentation.

In order for us to test-drive the development of the schema, we have built a test suite.

With version &chi;MCF 3.1.1, we achieved ISO standardization in Aug. 2024, see [ISO/PAS 8329](https://www.iso.org/standard/83119.html).


## Folder Contents

#### `V3.0/` contains:
the original specification document and pdf

#### `V3.1/` contains:
* the corrected specification document, 
* the developed &chi;MCF3.1 schema,
* the accompanying examples for the updated document, and
* a `test_suite` used for test-driven development of the schema

#### `V3.1.1/` contains:
* the improved specification document V3.1.1, 
* the improved &chi;MCF3.1.1 schema, and
* the accompanying examples for the updated document
* a `test_suite` used for test-driven development of the schema

#### `ISO PAS 8329/` contains:
* the source for the officially published ISO standard, 
  which is &chi;MCF3.1.1, with some occasional minor bug fixes.
* referring to the artefacts (graphics, examples, test cases) of &chi;MCF3.1.1.

#### `VDA_FAT_AK_25/` contains:
* external presentations of &chi;MCF, e.g. at conferences, 
* additional helpful material, *not* used by the official standard document, and
* minutes and attachments from working group meetings.
