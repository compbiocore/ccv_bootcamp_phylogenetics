# CCV Bootcamp 2024: Phylogenetics

August Guang

---

This 1.5hr workshop will cover:

 * How to best make use of Open OnDemand and OSCAR for computationally complex work and reproducibility
 * Some good practices for keeping track of this kind of work
 * How to run and allocate resources for IQ-TREE2 to infer phylogenies
 * How to use ggtree2+tidytree to visualize phylogenetic trees and do some basic tree manipulation

This will **not** cover:

 * Phylogenetic theory, models, and statistical tests
 * Assembly, alignment, time tree dating, other components in phylogenetic pipelines
 * Other flavors of phylogenetic inference programs like raxml, mrbayes, etc

Phylogenetics is a very deep and computation heavy field and covering the basics of it is the topic of specific molecular evolution workshops that take the entire week. This will be enough to get you started with understanding how to run very computationally intensive programs on OSCAR and then how to visualize trees in a programmatic way.

## Environment setup and reproducibility

All workshop materials are in `workshop.qmd` and can be followed along from there. Scripts to run various flavors of IQTREE2 on Oscar are all in `scripts`. Data for workshop is in `data`.

To reproduce quickly, after cloning (`git clone https://github.com/compbiocore/ccv_bootcamp_phylogenetics.git`) run `scripts/00_env.sh`:
```
cd ccv_bootcamp_phylogenetics/scripts
./00_env.sh
```

This will pull a singularity image to your `metadata` folder. From there you should be able to run all scripts `01_init.sh`, `02_partition.sh`, and `03_topo.sh` on OSCAR:
```
sbatch 01_init.sh
sbatch 02_partition.sh
sbatch 03_topo.sh
```

Similarly, you should be able to get through all code chunks in `workshop.qmd` just fine by spinning up the image and executing code chunks, or doing so on OOD with RStudio on Singularity.

## Resources and Materials

Material is based off of these resources with some modifications:

 * [IQTREE workshop](http://www.iqtree.org/workshop/sydney2022)
