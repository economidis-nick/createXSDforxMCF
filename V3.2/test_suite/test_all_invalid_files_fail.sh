#!/usr/bin/env bash

set -euo pipefail


INPUT_DIR=""
REPORT_DIR="reports"
SAXON_JAR="SaxonHE12-9J/saxon-he-12.9.jar"
XSLT="validator.xsl"


usage() {
	echo "validates every .xml files agains a validator .xsl and generates reports"
    echo "Usage: $0 -i <validator.xsl> -d <dir with xmls> [-x <saxon-he.jar>]  [-r <report_dir>] [-v]"
    exit 1
}

help_text() {
	echo "validates every .xml files agains a validator .xsl and generates reports"
    echo "Usage: $0 "
	echo "	-i or --validator : use <validator.xsl> (generated from schematron)"
	echo "	-d or --dir:        a directory containing all the .xmls you want to check"
	echo "	-x or --saxon:      the directory containing the <saxon-he.jar> downloaded files"
	echo "	-r --report_dir:    the directory where all the report files will be exported. Default is ./report"
	echo "	-v --verbose:       outputs the report messages"
    exit 1
}


VERBOSE=false


# Parse args
while [[ $# -gt 0 ]]; do
    case "$1" in
		-h|--help)
			help_text
			exit 0
			;;
        -v|--verbose)
            VERBOSE=true
            shift
            ;;
		-i|--validator)
			[[ $# -lt 2 ]] && usage
			XSLT="$2"
			shift 2
			;;			
		-d|--dir)
			[[ $# -lt 2 ]] && usage
			INPUT_DIR="$2"
			shift 2
			;;			
		-r|--report-dir)
			[[ $# -lt 2 ]] && usage
			REPORT_DIR="$2"
			shift 2
			;;			
		-x|--saxon)
			[[ $# -lt 2 ]] && usage
			SAXON_JAR="$2"
			shift 2
			;;			
        *)
            usage
            ;;
    esac
done

# Validate required args
if [[ -z "$INPUT_DIR" || -z "$XSLT" || -z "$REPORT_DIR" || -z "$SAXON_JAR" ]]; then
    usage
fi





NUM_CHECKS=0
NUM_REPORTS=0

for xml_file in "$INPUT_DIR"/*.xml; do
	NUM_CHECKS=$((NUM_CHECKS + 1))
	
done

echo $NUM_CHECKS

for xml_file in "$INPUT_DIR"/*.xml; do
    # Get filename without path
    filename=$(basename -- "$xml_file")
    
    # Strip extension
    name="${filename%.xml}"
    
    # Output report file
    report_file="$REPORT_DIR/${name}.report.xml"
    
	#if $VERBOSE; then
	#	echo "Processing $xml_file -> $report_file"
	#fi 
	
    java -jar "$SAXON_JAR" \
        -s:"$xml_file" \
        -xsl:"$XSLT" \
        -o:"$report_file"

	
	if grep -q "svrl:failed-assert"  $report_file ; then

		# If verbose, extract svrl:text messages
		if $VERBOSE; then
			echo "---- Assertions for $filename ----"
	
			java -cp "$SAXON_JAR"  net.sf.saxon.Query \
				-s:"$report_file" \
				-qs:"//*:text/string()" 
            
			echo "---------------------------------"
		else
			echo "${name}.report.xml"
		fi
		
		NUM_REPORTS=$((NUM_REPORTS + 1))

	else
		rm $report_file
	fi
	
	
done

echo "$NUM_CHECKS files validated."
echo "$NUM_REPORTS reports generated."

