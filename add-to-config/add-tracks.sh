#!/usr/bin/env bash

list_gff=$1

while read line;
do
nam=$(echo $line | cut -d" " -f2)
file=$(echo $line | cut -d" " -f1)
name_short=$(echo $nam | sed 's/_genomic_softmasked//;s/_softmasked//')

grep -v "^#" $file | sort -t"`printf '\t'`" -k1,1 -k4,4n | bgzip > ${name_short}.sorted.gff3.gz
tabix ${name_short}.sorted.gff3.gz

jbrowse add-track ${name_short}.sorted.gff.gz \
	--load inPlace \
	--name $name_short \
	--assemblyNames $name_short

done<$list_gff


