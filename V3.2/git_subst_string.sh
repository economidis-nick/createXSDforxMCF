#!/bin/bash

IFS='
'

file_ext="xml"
 search1="xmcf_3_1_1.xsd" 
replace1="xmcf_3_2.xsd" 
 search2="<version> 3.1.1 </version>" 
replace2="<version> 3.2 </version>" 
commit_msg="Updated schema version and <version/> element from 3.1.1 to 3.2 in directory 'V3.2'."

recursive=0
dir_list="."
file_list=$@
if [[ -z $file_list ]]; then
  recursive=1
  dir_list=`find . -type d  -not \( -iname "*.OBSOLETE" \)  -not \( -path "*/.git*" \)`
fi


changes=0

for d in $dir_list; do

  cd $d
  echo "
${PWD}  .....................................
" 
  
  if [[ $recursive == 1 ]]; then
    file_list=`ls -1 *.${file_ext}`
  fi
  
  # echo "------------- 0  $file_list"
  
  for f in $file_list; do
    
    # echo "------------- A  $f"
    
    grep -s -c "${search1}" $f > /dev/null
    rc=$?
    if [[ $rc == 0 ]] ; then 
      # echo "------------- B1"
      sed -i "s:${search1}:${replace1}:g" $f  \
	  && git add $f
      changes=$(($changes + 1))
    fi
    
    grep -s -c "${search2}" $f > /dev/null
    rc=$?
    if [[ $rc == 0 ]] ; then 
      # echo "------------- B2"
      sed -i "s:${search2}:${replace2}:g" $f  \
	  && git add $f
      changes=$(($changes + 1))
    fi
	
  done # for all files
  
  cd -  > /dev/null

done # for all directories


if [[ $changes > 0 ]] ; then 
  echo "$PWD : $changes changes applied to files."
  read -p "Press Enter to commit these changes, Ctrl-C to abort!"
  echo "${commit_msg}" | git commit -S -F-
fi

