#!usr/bin/bash
#remove write privleges 
for i in GCF_00*/; do chmod u-w $i/*gz; done

#link the data here
for i in GCF_00*/; do ln -fs $i/*gz .; done

#Calc sourmash signatures for these data
for i in *gz; do ~/dev/sourmash/sourmash compute -k 31 --scaled 100 $i --name-from-first -f; done
