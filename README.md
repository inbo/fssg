# Rapport_Vandezande_PIT_INBO_2024
Assessment of the Fish Spiral Sluice Gate (FSSG) by Vandezande. Following questions were answered:
* What are the entrance, passage and overall efficiency of the FSSG?
* What is the entrance and passage time?
* How many times do fish move up and down the FSSG?
* When do fish enter and leave the FSSG with respect to the cycle duration and valve opening?
* How do species, length and weight affect whether fish are able to move through the FSSG?
* How do species, length and weight affect the opening of the valves through which fish pass?

The directory of the R project is divided as follows:

* code
  * functions:
    * function_clean_hervangst_and_uitzet.R: clean the recapture and release data
    * function_gate_cleaning.R: clean the valve opening data
    * function_give_n.R: 
    * function_plot_network.R: plot network based on igraph
    * function_plot_vdz.R: plot valve opening in function of time with depiction of fish passing respective valves
  * not_functions:
    * libraries.R 
* data
  * extern
    * hervangst: "hervangst" or recapture files of the three experiments of 2024
    * lengte_en_soort: two folders: "ruw" or raw files are the original files, while "verwerkt" or processed are the files with corrections made in the files themselves (only fundamental mistakes were corrected).
      * Data proefvis Vandeput.xlsx: length and weight per unique fish for 2024
      * Proefvis_5_5.xlsx: length and weight per unique fish for 2023
      * Proefvis_8_05.xlsx: length and weight per unique fish for 2023
      * Proefvis_23_05.xlsx: length and weight per unique fish for 2023
    * pit: pit data per date and per antenna
    * uitzet: "uitzet" or release files of the three experiments of 2024
    * valves: opening of the different valves for every moment in time
    * configuration.csv: overview of the nodes
    * parent_child.csv: how the nodes are connected + direction
  * intern: internally created files
* media: pictures and drawings
* output: output file as pdf or word are stored here
* .gitignore: which files are never pushed
* 000_abstract.Rmd: English abstract
* 001_samenvatting.Rmd: Dutch abstract
* 002_resume.Rmd: French abstract
* 03_results.Rmd: calculation of the results
* 04_discussion.Rmd: discussion of the results
* index.Rmd: overarching file with direction on how to build
* references.bib.Rmd: references cited
* zzz_references_and_appendix.Rmd: biblio + supplementary information