
# Fish Spiral Sluice Gate (FSSG) Assessment

Assessment of the Fish Spiral Sluice Gate (FSSG) developed by Vandezande, evaluated by the Research Institute for Nature and Forest (INBO).

---

## 📌 Research Questions

This project evaluates the passage efficiency and behavioral patterns of fish encountering the Fish Spiral Sluice Gate:

* **Efficiency Metrics**: What are the entrance, passage, and overall efficiency of the FSSG?
* **Passage Timing**: What are the typical entrance and passage times?
* **Movement Patterns**: How many times do fish move up and down the FSSG?
* **Gate Dynamics**: When do fish enter and leave the FSSG with respect to cycle duration and valve opening?
* **Morphological Effects on Passage**: How do species, length, and weight affect whether fish are able to move through the FSSG?
* **Morphological Effects on Valves**: How do species, length, and weight affect the opening of the valves through which fish pass?

---

## 📁 Repository Structure

```text
├── code/
│   ├── functions/
│   │   ├── function_clean_hervangst_and_uitzet.R # Cleans recapture and release data
│   │   ├── function_gate_cleaning.R              # Cleans valve opening data
│   │   ├── function_give_n.R                     # Helper function to compute sample sizes
│   │   ├── function_plot_network.R               # Network visualization based on igraph
│   │   └── function_plot_vdz.R                   # Plots valve opening vs. time with fish passage
│   └── not_functions/
│       └── libraries.R                           # Required R packages and dependencies
│
├── data/
│   ├── extern/
│   │   ├── hervangst/                            # Recapture files from 2024 experiments
│   │   ├── lengte_en_soort/                      # Fish length and weight metrics
│   │   │   ├── ruw/                              # Raw original data files
│   │   │   └── verwerkt/                         # Processed data (corrected fundamental errors)
│   │   ├── pit/                                  # PIT telemetry data per date and antenna
│   │   ├── uitzet/                               # Release files from 2024 experiments
│   │   ├── valves/                               # Valve opening measurements over time
│   │   ├── configuration.csv                     # Overview of network nodes
│   │   └── parent_child.csv                      # Node connections and directional flow
│   └── intern/                                   # Internally generated intermediate files
│
├── media/                                        # Images, diagrams, and project graphics
├── output/                                       # Generated reports and exports (PDF, Word)
│
├── index.Rmd                                     # Master R Markdown file to build the report
├── 000_abstract.Rmd                              # Abstract in English
├── 001_samenvatting.Rmd                          # Abstract in Dutch (Samenvatting)
├── 002_resume.Rmd                                # Abstract in French (Résumé)
├── 03_results.Rmd                                # Data analysis and results generation
├── 04_discussion.Rmd                             # Discussion of study findings
├── references.bib.Rmd                            # Bibliography and references cited
└── zzz_references_and_appendix.Rmd               # Appendix and supplementary material

```

---

## 🚀 Getting Started

### Prerequisites

Ensure you have **R** (>= 4.0.0) and **RStudio** installed.

### Installation & Setup

1. **Clone the repository:**

```bash
git clone [https://github.com/stijnbruneel/fssg.git](https://github.com/stijnbruneel/fssg.git)
cd fssg

```

2. **Download required data and media:**
Download the `data` and `media` folders from [Zenodo (DOI: 10.5281/zenodo.22298750)](https://doi.org/10.5281/zenodo.22298750) and place them directly in the root directory of the project repository.
3. **Install required packages:**
Open the R project in RStudio and load the dependency script:

```R
source("code/not_functions/libraries.R")

```

---

## 🛠 Usage & Building the Report

The overarching document is managed through `index.Rmd`. You can render the full report into PDF or Word format in RStudio by clicking **Knit**, or by running the following command in the R console:

```R
rmarkdown::render("index.Rmd")

```

---

## 📜 License

This project is licensed under the terms specified in the [LICENSE.md](LICENSE.md) file.

```

```
