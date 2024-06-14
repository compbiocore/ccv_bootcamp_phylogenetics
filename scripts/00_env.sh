#!/bin/bash

# make results folder
mkdir -p ../results

# download singularity image
apptainer pull ../metadata/bootcamp.sif docker://ghcr.io/compbiocore/ccv_bootcamp_phylogenetics:latest
