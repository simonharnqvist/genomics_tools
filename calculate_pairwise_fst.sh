#!/bin/bash

VCF=$1
DIR=$2


for POP1 in ${DIR}/*
do
        for POP2 in ${DIR}/*
        do
                POP1_name=$(basename ${POP1} | cut -d. -f1)
        POP2_name=$(basename ${POP2} | cut -d. -f1)

        if [[ ! -f ${POP1_name}_${POP2_name}.fst ]] && [[ ! -f ${POP2_name}_${POP1_name}.fst ]] && [[ ${POP1_name} != ${POP2_name} ]]
                then
                        vcftools --gzvcf ${VCF} --weir-fst-pop ${POP1} --weir-fst-pop ${POP2} --stdout > ${POP1_name}_${POP2_name}.fst
                fi
        done
done
