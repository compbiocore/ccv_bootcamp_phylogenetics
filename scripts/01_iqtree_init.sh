#!/bin/bash
#SBATCH -t 00:20:00
#SBATCH --mem 4G
#SBATCH --cpus-per-task=8
#SBATCH -e logs/iqtree_init-%J.err
#SBATCH -o logs/iqtree_init-%J.out

WORKDIR=/oscar/data/datasci/aguang/ccv_bootcamp_phylogenetics

export SINGULARITY_BINDPATH="${WORKDIR}"
IMG=${WORKDIR}/metadata/bootcamp.sif

singularity exec ${IMG} iqtree2 -s ${WORKDIR}/data/turtle.fa -B 1000 -T AUTO -pre ${WORKDIR}/results/turtle
