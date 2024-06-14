#!/bin/bash
#SBATCH -t 00:20:00
#SBATCH --mem 4G
#SBATCH --cpus-per-task=8
#SBATCH -e logs/partition-%J.err
#SBATCH -o logs/partition-%J.out

#WORKDIR=/users/aguang/ccv_bootcamp_phylogenetics
WORKDIR=~/ccv_bootcamp_phylogenetics

export SINGULARITY_BINDPATH="${WORKDIR}"
IMG=${WORKDIR}/metadata/bootcamp.sif

# allows each partition to have its own model
# -p turtle.nex to specify an edge-linked proportional partition model (Chernomor et al., 2016).
# That means, there is one set of branch lengths.
# But each partition can have proportionally shorter or longer tree length,
# representing slow or fast evolutionary rate, respectively.

singularity exec ${IMG} iqtree2 -s ${WORKDIR}/data/turtle.fa -p ${WORKDIR}/data/turtle.nex -B 1000 -T AUTO -pre ${WORKDIR}/results/partition
