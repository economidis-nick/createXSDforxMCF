# xMCF v3.1.1 specification

This folder contains:

1. A v3.1.1 **document**, with the *proposed* changes with respect to its predecessor, v3.1.0.  
   __Attention:__ File 
   [Documentation_xMCF_File_v3.1.1.docx](Documentation_xMCF_File_v3.1.1.docx) 
   was _deprecated_ in course of ISO standardization (see also issue #66). 
   Please use [xMCF_V3.1_PAS_V1.0_210826.docx](xMCF_V3.1_PAS_V1.0_210826.docx) instead! 
   (Effective 2021-09-02.)
2. The **schema file** that captures the v3.1.1 specification 
3. **Examples** that accompany the v3.1.1 document
4. A **test suite**, used to develop the schema

ultimately, when the document changes and the xsd are confirmed, we will place the final pdf with the official specification document in this folder.

## Notes

* test suite contains a validator, which you can use to validate your xmcf files against the schema.

* the schema is best viewed using the Altova XML Spy, because it is quite complicated and written in xsd1.1

* the only entry point of the schema is assumed to be the `<xmcf>` element.
