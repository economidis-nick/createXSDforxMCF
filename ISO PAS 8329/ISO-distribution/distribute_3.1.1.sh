#!/bin/bash
# This script generates a ZIP archive with all documents relevant for ISO submission.
# @DrCaFr, 2023-02-21

# Let Interfield Separator (IFS) be "new line".
IFS='
'

Time=`date +"%Y%m%d-%H%M%S"`

base_name="ISO_PAS_8329"
word_version="${base_name}.docx"
if [[ ! -e "$word_version" ]];  then
  base_name="ISO-CD_PAS_8329"
fi
word_version="${base_name}.docx"
pdf_version="${base_name}.pdf"

electr_inserts="\
../xmcf_3_1_1.xsd
../../V3.1.1/examples"
electr_inserts_dir="${base_name}_electronic-inserts"
electr_inserts_zip="${electr_inserts_dir}.zip"
figures="\
../${base_name}_Figures-master.pptx
../../V3.1.1/resources/Seam_weld_types_and_attributes_as_embedded_Excel-table.docx
../../V3.1.1/resources/xMCF-AP242-federative_use.svg
../../V3.1.1/resources/Seamweld_Images/*.svg
../../V3.1.1/resources/Seamweld_Images/8329_ed1fig49.xlsx"
figures_dir="${base_name}_Figures"
figures_zip="${figures_dir}.zip"
complete="$word_version
$pdf_version
$electr_inserts_zip
$figures_zip"
complete_zip="${base_name}_${Time}.zip"

echo "electr_inserts=$electr_inserts"
echo "figures=$figures"
echo "complete=$complete"


ln -s "../$word_version"
ln -s "../$pdf_version"


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
  rm -rf "$electr_inserts_dir"
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
  rm -rf "$figures_dir"
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
# Make file names conformant to ISO naming scheme
# mv ButtJoint.svg  8329_ed1fig54.svg
rm ButtJoint.svg
mv ButtJoint_sheetparameters.svg				8329_ed1fig54.svg
mv ButtJoint_weldparameters.svg					8329_ed1fig55.svg
rm ButtJoint_wo_notation.svg
rm CornerWeld.svg
mv CornerWeld_sheetparameter.svg 				8329_ed1fig56.svg
mv CornerWeld_weldparameter.svg   				8329_ed1fig57.svg
# mv CrossJoint.svg  8329_ed1fig74.svg
rm CrossJoint.svg
mv CrossJoint_sheetparameters.svg 				8329_ed1fig74.svg
mv CrossJoint_weldparameters.svg 				8329_ed1fig75.svg
mv DoubleCornerWeld.svg  8329_ed1fig58.svg
mv DoubleCornerWeld_weldparameters.svg  		8329_ed1fig59.svg
rm DoubleOverlapWeld1Side.svg
mv DoubleOverlapWeld1Side_sheetparameters.svg	8329_ed1fig66.svg
mv DoubleOverlapWeld1Side_weldparameters.svg	8329_ed1fig67.svg
rm DoubleOverlapWeld2Sides.svg  
mv DoubleOverlapWeld2Sides_sheetparameters.svg	8329_ed1fig68.svg
mv DoubleOverlapWeld2Sides_weldparameters.svg	8329_ed1fig69.svg
rm EdgeWeld.svg
mv EdgeWeld_sheetparameters.svg 		 		8329_ed1fig60.svg
mv EdgeWeld_weldparameters.svg  				8329_ed1fig61.svg
mv flaredweld_sheetparameters.svg  				8329_ed1fig76.svg
mv flaredweld_weldparameters.svg  				8329_ed1fig77.svg
rm IWeld.svg
mv IWeld_sheetparameter.svg  					8329_ed1fig62.svg
mv IWeld_weldparameter.svg  					8329_ed1fig63.svg
mv OverlapWeld_sheetparameters.svg  			8329_ed1fig64.svg
mv OverlapWeld_weldparameters.svg  				8329_ed1fig65.svg
rm KJoint.svg
# mv KJoint.svg  8329_ed1fig72.svg
mv KJoint_sheetparameters.svg 					8329_ed1fig72.svg
mv KJoint_weldparameters.svg 					8329_ed1fig73.svg
mv OverlapWeld.svg  8329_ed1fig64.svg
mv YJoint.svg  									8329_ed1fig51.svg
# mv YJoint_sheetparameters.svg					8329_ed1fig51a.svg
mv YJoint_sheetparameters.svg  					8329_ed1fig70.svg
# mv YJoint_weldparameters.svg 					8329_ed1fig51b.svg
mv YJoint_weldparameters.svg   					8329_ed1fig71.svg
mv xMCF-AP242-federative_use.svg  8329_ed1figB1.svg
mv Seam_weld_types_and_attributes_as_embedded_Excel-table.docx  8329_ed1fig49.docx

cd ..
rm "$figures_zip"
# echo zip -r "$figures_zip" "$figures_dir"
zip -r "$figures_zip" "$figures_dir"


# Creating "$complete_zip"
rm "$complete_zip"
echo zip "$complete_zip" $complete
zip "$complete_zip" $complete


exit 0
