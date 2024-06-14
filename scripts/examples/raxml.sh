#!/bin/bash
#SBATCH -J raxml
#SBATCH -t 3-00:00
#SBATCH -n 16
#SBATCH --mem=60GB

# This script runs RAxML on 16 tasks using MPI using loaded modules
set -e
module load hpcx-mpi/4.1.5rc2s
module load raxml-mpi/8.2.12

srun --mpi=pmix raxmlHPC-MPI-AVX -f a -p 73714 -m GTRCAT -x 201714 -# 1000 -s data.fa -n partition.nwk

