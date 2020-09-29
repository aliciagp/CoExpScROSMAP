# CoExpscROSMAP
Single-cell co-expression network suite from ROS/MAP project

Here you will find annotated networks for 114 combinations subcluster-pathological condition of a total of 132, result of the combination of 44 different subclusters and three pathological conditions (AD, NotAD and All). These subclusters are included in the following cell types: excitatory neurons (Ex), inhibitory neurons (In), astrocytes (Ast), oligodendrocytes (Oli), microglia (Mic), oligodendrocyte progenitor cells (Opc), endothelial cells (End) and pericytes (Per).

The name of each network (each combination) is broken down into: full name of the subcluster + pathological condition (i.e. Astrocytes0AD). For each combination, we have three files available:

1. The file that contains the corrected expression data that has been used to create the network (residuals). The name of this file is decomposed into: network name + "resids" + ".rds"

2. The network file that has been created from the residuals. The name of this file is decomposed into: "net" + network name + "." + betavalue + ".it.50.rds"

3. The file that contains the functional annotations obtained from the Gene Ontology, KEGG and REACTOME databases. The name of this file is the same as the file name of the network adding "_gprof.csv"


Recommended that you install first CoExpNets
```
devtools::install_github('juanbot/CoExpNets') 
```
And then this package
```
devtools::install_github('aliciagp/CoExpscROSMAP')
```
