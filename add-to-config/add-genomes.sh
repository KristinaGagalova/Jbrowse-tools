#!/usr/bin/env bash

list_fasta=$1
out_dir=$2

while read line;
do
nam=$(echo $line | cut -d" " -f2)
file=$(echo $line | cut -d" " -f1)
name_short=$(echo $nam | sed 's/_genomic_softmasked//;s/_softmasked//')

samtools faidx $file

jbrowse add-assembly $file \
	--load inPlace \
	--type indexedFasta \
	--displayName $name_short \
	--name $name_short #\
	#--out $2

done<$list_fasta


