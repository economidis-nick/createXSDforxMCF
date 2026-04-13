#!/usr/bin/env bash

set -euo pipefail


# Defaults (optional)
SCHEMATRON=""
SAXON_JAR="SaxonHE12-9J/saxon-he-12.9.jar"
OUTPUT="validator.xsl"

usage() {
	echo "generates a validator .xsl from a schematron .sch file"
    echo "Usage: $0 -i <schematron.sch>  [-x <saxon-he.jar>]  [-o <output.xsl>]"
    exit 1
}

# Parse named options
while getopts ":i:o:x:" opt; do
    case ${opt} in
        i )
            SCHEMATRON="$OPTARG"
            ;;
        x )
            SAXON_JAR="$OPTARG"
            ;;
        o )
            OUTPUT="$OPTARG"
            ;;
        \? )
            echo "Invalid option: -$OPTARG"
            usage
            ;;
        : )
            echo "Option -$OPTARG requires an argument."
            usage
            ;;
    esac
done

# Validate required args
if [[ -z "$SCHEMATRON" || -z "$OUTPUT" || -z "$SAXON_JAR" ]]; then
    usage
fi





STEP1=$(mktemp)
STEP2=$(mktemp)

cleanup() {
    rm -f "$STEP1" "$STEP2"
}
trap cleanup EXIT

echo "Compiling Schematron: $SCHEMATRON"
echo "Output XSLT: $OUTPUT"

# Step 1: Resolve includes
java -jar "$SAXON_JAR" \
    -s:"$SCHEMATRON" \
    -xsl:iso_dsdl_include.xsl \
    -o:"$STEP1"

# Step 2: Expand abstract patterns
java -jar "$SAXON_JAR" \
    -s:"$STEP1" \
    -xsl:iso_abstract_expand.xsl \
    -o:"$STEP2"

# Step 3: Generate final validator XSLT
java -jar "$SAXON_JAR" \
    -s:"$STEP2" \
    -xsl:iso_svrl_for_xslt2.xsl \
    -o:"$OUTPUT"

echo "Generated: $OUTPUT"