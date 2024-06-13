FROM rocker/rstudio:4

# make sure OOD can find rsession and rserver
RUN ln -s /usr/lib/rstudio-server/bin/rsession /usr/local/bin/rsession
#RUN ln -s /usr/lib/rstudio-server/bin/rserver /usr/local/bin/rserver

# install IQtree2 and materials
RUN wget https://github.com/iqtree/iqtree2/releases/download/v2.1.2/iqtree-2.1.2-Linux.tar.gz
RUN tar -zxf iqtree-2.1.2-Linux.tar.gz
RUN cp iqtree-2.1.2-Linux/bin/iqtree2 bin

RUN wget http://www.iqtree.org/workshop/data/turtle.fa
RUN wget http://www.iqtree.org/workshop/data/turtle.nex

# install ggtree and relevant packages
RUN R -e "install.packages(c('tidyverse','rmarkdown','knitr','quarto','bookdown','here'))"
RUN R -e "install.packages('BiocManager')"
RUN R -e "BiocManager::install('ggtree')"