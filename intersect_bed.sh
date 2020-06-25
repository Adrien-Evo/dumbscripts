#!/bin/bash

chr=$1;
begin=$2;
end=$3;
file=$4;

echo Looking for regions for chr $chr between $begin and $end in file $4

awk -v chr_region=$chr -v begin_region=$begin -v end_region=$end '
{
	if($1 == chr_region){
		if($2 >= begin_region && $2 < end_region){
			print $0;
	}else if($3 > begin_region && $3 <= end_region){
			print $0;
	}else if($2 > begin_region && $3 < end_region){
			print $0;
	}else if($2 < begin_region && $3 > end_region){
			print $0;
		}
	
	}

}' $file 
