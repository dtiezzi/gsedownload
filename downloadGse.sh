#!/bin/bash

######### HOW TO USE ################s
# Example
# $ ./downloadGse.sh GSE7010 outdir/
#####################################

OUTDIR=$2
FTP='ftp.ncbi.nlm.nih.gov/geo/series/'
N1='nnn'
GSE=$1
L=${#GSE} 
let "L=L-3"

MATRIX=${FTP}${GSE::L}${N1}'/'${GSE}'/matrix/'
SUPPL=${FTP}${GSE::L}${N1}'/'${GSE}'/suppl/'

curl --list-only $SUPPL > ftpfiles

while read file;
do
    echo '[INFO] downloading '${file}' ...'
    curl -o ${OUTDIR}$file ${SUPPL}$file

done < ftpfiles

rm ./ftpfiles

echo '[INFO] '${GSE}' download DONE!'