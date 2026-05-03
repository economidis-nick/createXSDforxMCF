#!/usr/bin/env bash

set -euo pipefail

SCHEMATRON="../xmcf_3_2.sch"

INPUT_DIR="valid_files"
REPORT_DIR="valid_files/schematron/reports"
SAXON_JAR="SaxonHE12-9J/saxon-he-12.9.jar"
XSLT="validator.xsl"

java -jar "$SAXON_JAR" -s:"$SCHEMATRON" -xsl:iso_dsdl_include.xsl -o:step1.xsl
java -jar "$SAXON_JAR" -s:step1.xsl     -xsl:iso_abstract_expand.xsl -o:step2.xsl
java -jar "$SAXON_JAR" -s:step2.xsl     -xsl:iso_svrl_for_xslt2.xsl -o:"$XSLT"


for xml_file in "$INPUT_DIR"/*.xml; do
    # Get filename without path
    filename=$(basename -- "$xml_file")
    
    # Strip extension
    name="${filename%.xml}"
    
    # Output report file
    report_file="$REPORT_DIR/${name}.report.xml"
    
    echo "Processing $xml_file -> $report_file"
    
    java -jar "$SAXON_JAR" \
        -s:"$xml_file" \
        -xsl:"$XSLT" \
        -o:"$report_file"
done

echo "All reports generated."

echo "Num reports with failed : " 
grep "svrl:failed-assert" -l $REPORT_DIR/*.report.xml | wc