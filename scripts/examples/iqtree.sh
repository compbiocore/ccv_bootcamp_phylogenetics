#!/bin/bash
#SBATCH -t 4-0 --mem=16G -c8
#SBATCH --array=0-999
#SBATCH -J iqtree
#SBATCH -e /gpfs/data/cbc/aguang/hiv_wide/logs/iqtree-%A-%a.err
#SBATCH -o /gpfs/data/cbc/aguang/hiv_wide/logs/iqtree-%A-%a.out

# To reproduce: change singularity_bindpath and workdir to appropriate directories (likely repository)
# This script runs iqtree on a publically available dataset from LANL using a singularity image with iqtree.
# It will not likely work for you without major modifications, but feel free to use it as an example

# iqtree2 can also be loaded with
# module load iq-tree/2.1.3-gu64b4j

export SINGULARITY_BINDPATH="/gpfs/data/cbc/aguang/hiv_wide"

WORKDIR=/gpfs/data/cbc/aguang/hiv_wide
SINGULARITY_IMG=${WORKDIR}/metadata/rkantor_hiv.simg
ALIGNMENTS=${WORKDIR}/results/alignments

cd $ALIGNMENTS
seeds=(*/)
seed=${seeds[$(( $SLURM_ARRAY_TASK_ID % 100 ))]%/} # values 0-99 for indexing
masks=( 010 020 030 040 050 060 070 080 090 100 )
mask=${masks[$(( $SLURM_ARRAY_TASK_ID % 10 ))]} # values 0-9 for indexing

fa=HIV1_FLT_2018_genome_DNA_subtypeB_${seed}_mask${mask}.fa

mkdir -p ${WORKDIR}/results/trees/${seed}
singularity exec ${SINGULARITY_IMG} iqtree -nt 8 -mem 16G  -s ${ALIGNMENTS}/${seed}/${fa} -m GTR+F+I+G4 -alrt 1000 -bb 1000 -wbt -wbtl -pre ${WORKDIR}/results/trees/${seed}/${fa}
