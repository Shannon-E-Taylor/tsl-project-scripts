# tsl-project-scripts

Supplementary scripts and raw data for Taylor, Tuffrey et al. 2019- available at __BIORXIV__. 

## Useful data: 

All of my *Nasrat*, *ph*, *clos*, *egfp* knockdown embryo cuticles. These are included because there was a lot of variation in the knockdown phenotypes. It is more honest to simply present all our data, than attempt to classify and tabulate it. Note that some of these embryos had empty cucticles because they died in development. 

I've also included electron microscopy images of *Nasonia vitripennis* eggshell membranes and other regions. These are uninterpreted, refer to King (1969) for descriptions. These images are shared because they are slightly clearer than provided in the original paper *Nasonia* vitelline membrane paper. 

## Data and scripts to reproduce the figures provided in the paper: 

EM-analysis/ contains raw data (membrane widths) and R markdown files required to generate data for FIG2 of the paper. The ImageJ macro is also be included. Note that this was written by birgerro here: http://imagej.1557.x6.nabble.com/Distance-Between-Lines-a-plugin-for-ImageJ-td3701802.html; it is only shared here for reproducibility. 

qpcr/ contains raw data and scripts for qPCR analysis. 

## Folder structure 

<pre>
├── dm-tsl-plots.R #code for Drosophila overexpression plots 
├── EM-analysis
│   ├── 0b_transposed.csv
│   ├── 3b_transposed.csv
│   ├── 4b_transposed.csv
│   ├── 5b_transposed.csv
│   ├── 7b_transposed.csv
│   ├── 9b_transposed.csv
│   ├── Distance_Between_Polylines.java
│   ├── EM-analysis-3.1.19.Rmd
│   ├── EM_lengths.ods
│   ├── Figs
│   │   ├── unnamed-chunk-4-1.png
│   │   ├── unnamed-chunk-6-1.png
│   │   └── unnamed-chunk-8-1.png
│   └── gaps.csv
├── EM-pictures #All my images of Nasonia ovaries
│   ├── 0B_gridA3 #tsl-
│   ├── 3B        #egfp-
│   ├── 3B_gridB4 #egfp-
│   ├── 4B        #egfp-
│   ├── 5B        #egfp-
│   ├── 7B_gridB1 #tsl-
│   └── 9B        #tsl-
├── nr-ph-clos-knockdown-embryos #ALL my knockdown embryos- there is a lot of variation! 
│   ├── clos
│   ├── nr
│   ├── ph
│   └── wt
├── qpcr
│   ├── st_qPCR_1.30.18.csv #raw qPCR data
│   └── tsl-qpcr-analysis.R #scripts for analysis
</pre>

## References 

B. P. E. King and J. G. Richards, “Oögenesis in Nasonia vitripennis (Walker) (Hymepnoptera: Pteromalidae),” Proc. R. Entomol. Soc. London A, vol. 44, no. 10–12, pp. 143–157, 1969.

J. G. Richards, “The structure and formation of the egg membranes in Nasonia vitripennis (Walker) (Hymenoptera , Pteromalidaz),” J. Microsc., vol. 89, no. 1, pp. 43–53, 1965.
