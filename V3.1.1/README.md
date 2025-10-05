# xMCF v3.1.1 specification

This folder contains:

1. A v3.1.1 **document**, with the *accepted* changes (see 2021-10-21 WG meeting) with respect to its predecessor, v3.1.  
   __Attention:__ File 
   [Documentation_xMCF_File_v3.1.1.docx](./deprecated/Documentation_xMCF_File_v3.1.1.docx) 
   was _deprecated_ in course of ISO standardization (see also issue #66). 
   Please use [xMCF_V3.1_PAS.docx](./xMCF_V3.1.1_PAS.docx) instead! 
   (Effective 2021-09-02.)
0. A **spread sheet** [Mapping_Table_Excel_xMCF_STEP.xlsx](Mapping_Table_Excel_xMCF_STEP.xlsx), 
   which will become essential content of new section
   _Annex B (informative)  Cross-Reference Table between STEP (ISO 10303-242:2020) & &chi;MCF_.
2. The **schema file** that captures the v3.1.1 specification 
3. **Examples** that accompany the v3.1.1 document
4. A **test suite**, used to develop the schema

Ultimately, when the document changes and the xsd are confirmed, we will place the final pdf with the official specification document in this folder.

## Notes

* test suite contains a validator, which you can use to validate your xmcf files against the schema.

* the schema is best viewed using the Altova XML Spy, because it is quite complicated and written in xsd1.1

* the only entry point of the schema is assumed to be the `<xmcf/>` element.
