#!/bin/bash
# This script generates a ZIP archive with all documents relevant for ISO submission.
# @DrCaFr, 2023-02-21

# Let Interfield Separator (IFS) be "new line".
IFS='
'

Time=`date +"%Y%m%d-%H%M%S"`

word_version="../ISO-CD_PAS_8329.docx"
pdf_version="../ISO-CD_PAS_8329.pdf"
electr_inserts="\
../xmcf_3_1_1.xsd
../../V3.1.1/examples"
electr_inserts_dir="ISO-CD_PAS_8329_electronic-inserts"
electr_inserts_zip="${electr_inserts_dir}.zip"
figures="\
../ISO-CD_PAS_8329_Figures-master.pptx
../../V3.1.1/resources/xMCF-AP242-federative_use.svg
../../V3.1.1/resources/Seamweld_Images/*.svg"
figures_dir="ISO-CD_PAS_8329_Figures"
figures_zip="${figures_dir}.zip"
complete="$word_version
$pdf_version
$electr_inserts_zip
$figures_zip"
complete_zip="ISO-CD_PAS_8329_${Time}.zip"

echo "electr_inserts=$electr_inserts"
echo "figures=$figures"
echo "complete=$complete"

# Verification that each file can be read
for f in $electr_inserts $figures $word_version $pdf_version; do
### echo "1--- `echo $f`"
  if [[ ! -r $f ]]; then
    echo "+++++ File $f cannot be read!"
	exit 1
  fi
done


# Verification that PDF version is newer than Word version
if [[ "$word_version" -nt "$pdf_version" ]]; then
  echo "+++++ PDF version $pdf_version is outdated. Please update it!"
  exit 2
fi


# Creating "$electr_inserts_zip"
if [[ -e "$electr_inserts_dir" ]]; then
  rm -r "$electr_inserts_dir"
fi
mkdir "$electr_inserts_dir"
rc=$?
if [[ rc -ne 0 ]]; then
  echo "+++++ Directory $electr_inserts_dir could not be created! Return code: $rc"
  exit 3
fi
cd "$electr_inserts_dir"
for f in $electr_inserts; do
  ln -s "../$f"
done
cd ..
rm "$electr_inserts_zip"
# echo zip -r "$electr_inserts_zip" "$electr_inserts_dir"
zip -r "$electr_inserts_zip" "$electr_inserts_dir"


# Creating "$figures_zip"
if [[ -e "$figures_dir" ]]; then
  rm -r "$figures_dir"
fi
mkdir "$figures_dir"
rc=$?
if [[ rc -ne 0 ]]; then
  echo "+++++ Directory $figures_dir could not be created! Return code: $rc"
  exit 3
fi

# Expand wildcards
figures_expanded=""
for f in $figures ; do
  figures_expanded="$figures_expanded
$f"
done

cd "$figures_dir"
for f in $figures_expanded; do
  ln -s ../$f 
done
cd ..
rm "$figures_zip"
# echo zip -r "$figures_zip" "$figures_dir"
zip -r "$figures_zip" "$figures_dir"


# Creating "$complete_zip"
rm "$complete_zip"
echo zip "$complete_zip" $complete
zip "$complete_zip" $complete


exit 0
