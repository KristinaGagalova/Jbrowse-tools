#!/usr/bin/env bash

for file in *_new.gff3;
do
name_short=$(echo $file | sed 's/.gff3//')

grep -v "^#" $file | sort -t"`printf '\t'`" -k1,1 -k4,4n | bgzip > ${name_short}.sorted.gff3.gz
tabix ${name_short}.sorted.gff3.gz

echo "running Jbrowse add-track for " ${name_short}
jbrowse add-track ${name_short}.sorted.gff.gz \
	--load inPlace \
	--name $name_short \
	--assemblyNames $name_short

done


