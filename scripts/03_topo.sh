#!/bin/bash
#SBATCH -t 00:20:00
#SBATCH --mem 4G
#SBATCH --cpus-per-task=8
#SBATCH -e logs/test-%J.err
#SBATCH -o logs/test-%J.out

WORKDIR=/users/aguang/ccv_bootcamp_phylogenetics

export SINGULARITY_BINDPATH="${WORKDIR}"
IMG=${WORKDIR}/metadata/bootcamp.sif

# Runs PartitionFinder algorithm to merge partitions to reduce overfitting
# -m MFP+MERGE performs PartitionFinder + tree reconstruction
# -rcluster 10 reduces computations by only examining top 10% partitioning schemes using relaxed clustering

singularity exec ${IMG} iqtree2 -s ${WORKDIR}/data/turtle.fa -p ${WORKDIR}/data/turtle.nex -B 1000 -T AUTO -m MFP+MERGE -rcluster 10 -pre ${WORKDIR}/results/merge

# topology test
# concatenate single + partition trees into trees file
# -p merge.best_scheme.nex provides best partitioning scheme found from ModelFinder
# -z turtle.trees inputs set of trees
# -zb 10000 number of replicates for bootstrap for test
# -au Approximately Unbiased test
# -n 0 avoids tree search, just does testing

cat ${WORKDIR}/results/turtle.treefile ${WORKDIR}/results/partition.treefile >${WORKDIR}/results/turtle.trees
singularity exec ${IMG} iqtree2 -s ${WORKDIR}/data/turtle.fa -p ${WORKDIR}/results/merge.best_scheme.nex -z ${WORKDIR}/results/turtle.trees -zb 10000 -au -n 0 -pre ${WORKDIR}/results/topo
