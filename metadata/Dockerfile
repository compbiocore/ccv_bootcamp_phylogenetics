FROM ghcr.io/compbiocore/ccv_bootcamp_phylogenetics:jun_14_10-29-35_2024
RUN apt-get update && \
	apt-get -y --no-install-recommends install --fix-missing \
         libz-dev \
         && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN R -e "BiocManager::install(c('XVector','Biostrings'))"
         
