#!/usr/bin/env bash

list_fasta=$1
out_dir=$2

for file in ./*fasta;
do

name_short=$(echo $file | | sed 's/_genomic_softmasked//;s/_softmasked//')
samtools faidx $file

jbrowse add-assembly $file \
	--load inPlace \
	--type indexedFasta \
	--displayName $name_short \
	--name $name_short #\
	#--out $2

done


