# tsl-project-scripts

Supplementary scripts and raw data for Taylor, Tuffrey et al. 2019- available at __BIORXIV__. 

And some microsocopy images: *Nasrat*, *ph*, *clos*, *egfp* knockdowns! 

EM-analysis/ contains raw data (membrane widths- not images, though we could host those here) and R markdown file required to generate data for FIG2 of the paper. The ImageJ macro will also be included. 

qpcr/ contains raw data and scripts for qPCR analysis. 


## Folder structure 

├── EM-analysis

│   ├── 0b_transposed.csv #raw data

│   ├── 3b_transposed.csv #raw data

│   ├── 4b_transposed.csv #raw data

│   ├── 5b_transposed.csv #raw data

│   ├── 7b_transposed.csv #raw data

│   ├── 9b_transposed.csv #raw data
<pre>
│   ├── Distance_Between_Polylines.java #ImageJ script 
│   ├── EM-analysis-3.1.19.Rmd #Data analysis!
│   ├── EM_lengths.ods #gaps data
│   └── gaps.csv       #gaps data
│   └── Figs
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
<\pre>
