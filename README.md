[![DOI](https://zenodo.org/badge/512893660.svg)](https://zenodo.org/badge/latestdoi/512893660)
[![publication](https://img.shields.io/badge/status-published-green)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1002/ecs2.4316)

# Broad and fine scale range shifts of a species at risk across North America

Kelsey Freitag<sup>1*</sup>, Ann E. McKellar<sup>2</sup>, David Bradley<sup>3</sup>, Scott A, Flemming<sup>4</sup>, 
[Steffi LaZerte](https://steffilazerte.ca)<sup>5</sup>, Mateen Shaikh<sup>6</sup>, Matthew W. Reudink<sup>1</sup>

<sup>*</sup> Corresponding Author  
<sup>1</sup> Department of Biological Sciences, Thompson Rivers University, Kamloops, BC V2C 0C8, Canada  
<sup>2</sup> Wildlife Research Division, Environment and Climate Change Canada, Saskatoon, SK S7N 0X4, Canada  
<sup>3</sup> Bird Studies Canada, Delta, British Columbia, Canada  
<sup>4</sup> Canadian Wildlife Service, Environment and Climate Change Canada, Delta, British Columbia, Canada  
<sup>5</sup> Steffi LaZerte R Programming and Biological Consulting, Brandon, MB   
<sup>6</sup> Department of Mathematics & Statistics, Thompson Rivers University, Kamloops, British Columbia, Canada    

## Contents

This repository contains the code used to **summarize and transform eBird data** for this paper
exploring range shifts in the long-billed curlew (*Numenius americanus*) as well
as the final data sets: 

- `Data/Final/lobcur_final_10x_all_control_filtered_100.csv`  - All grids, all checklists
- `Data/Final/lobcur_final_10x_all_present_filtered_100.csv`  - All grids, curlew presence only
- `Data/Final/lobcur_final_10x_bcr_control_filtered_100.csv`  - BCR grids, all checklists
- `Data/Final/lobcur_final_10x_bcr_present_filtered_100.csv`  - BCR grids, curlew presence only

We are extremely grateful to Dr. Sarah Supp and colleagues for sharing their [well-annotated code](https://github.com/sarahsupp/hb-migration) from their publication [Supp et al. (2015)](https://esajournals.onlinelibrary.wiley.com/doi/full/10.1890/ES15-00239.1), 
parts of which we have used as a guide for our analyses. 


## Format

The scripts are provided as *.qmd files to combine code and annotation. These
have been locally compiled to html files stored in the `Results` folder and served as a [website](https://steffilazerte.ca/lb_curlew_distribution/Results/00_overview.html).

If running these scripts code, an html report of the script will be produced in the `Results` folder. 
Data produced will be saved to a `Data` folder. 
The final datasets are stored in the `Data/Final` folder.

We use renv to promote reproducibility, or if R packages advance too far for 
utility, to promote transparency. 
See [`renv` below](https://github.com/steffilazerte/lb_curlew_distribution#renv).

The following sections describe the various folders that are *produced* by the
scripts, ending with a description of the scripts themselves.


### `Data` folder

Subfolders contain the following:

- `Raw` - Location of eBird data
- `Intermediate` - Intermediate data files created in the process of summarizing
ebird data
- `Datasets` - Full rds datasets used by the scripts (such as maps, grids, etc.). 
Although not in the intermediate folder, these datasets are intermediate in nature.
- `Spatial` - Output Spatial files
- `Final` - Final datasets created by these scripts, intented for use in analysis.

> Note that the original, eBird data is not stored here, but can be obtained from
> eBird directly. See details in `00_setup.qmd` under 'Acquire raw data files'.

### `Results` folder

Compiled scripts will be saved to the `Results` folder and dated.


### QMD Scripts

All the scripts used to summarize the data and conduct the analyses are
contained in the root folder as Quarto documents. The scripts are numbered in the order that
they are meant to be compiled. For example, `03_ebird.qmd` creates filters and
compiles the eBird data and relies on grid files produced by `02_grid.qmd`.

#### `00_setup.qmd`
This script makes sure the folder structure is set up and that you have all the packages you need to run the analysis. It also guides you in acquiring the eBird data.

#### `01_maps.qmd`
This script prepares maps of BCRs and a subset of North America for plotting.

#### `02_grid.qmd`
This script creates the hex grid we use for summarizing the eBird data and
prepares grids by BCR.

#### `03_ebird.qmd`
This script takes the eBird data on checklists and sampling and filters it, and
summarizes it by hex.

#### `04_quality_control.qmd`
This script explores the data and omits grid cells that are poorly sampled. 

#### `05_data_outputs.qmd`
This script calculates the actual measurements for use in the final analyses.

#### `06_figures.qmd`
This script shows grid maps of each year showing the observed curlew grids against the non-observed grids (data exploration of the calculated measurements).

#### `09_citations.qmd`
This script tracks data citations.


### Extra notes
- Calculations of number of checklists removed during eBird filtering was recently
added to `03_ebird.qmd`, but this file was run interactively and not fully 
recompiled.


## renv

We use the [renv](https://rstudio.github.io/renv/index.html) package to
keep track of the R and R package versions in this project. While this *in theory*
can make our project reproducibly by allowing you to exactly install the package versions we used. In practice, this isn't always the case as the R ecosystem changes quite quickly.
However, we hope that this will enable you to *replicate* this study.. 

Use `renv::restore()` to download the package versions used in this study.
If this works without issue, hooray! You're good to go.


### In more detail...

Otherwise, you may need to selectively update some packages in order to continue
(if older versions are no longer compatible with newer versions of R or newer
operating system dependencies). 

In this case, use `renv::restore(transactional = FALSE)` to allow you to resume
the restoration as you go. 

You now have two options, depending on what you goal is. 

If your goal is to *replicate* this study (i.e. use the same methodology, but 
not worrying too much if there are small differences in the calculations), then
each time you run into a package that won't install, you can do the following:

- `renv::install(PKG_NAME)` (note the version it asks to install)
- `renv::record("PKG_NAME@X.X.XX)` (where X.X.XX is the version)
- `renv::restore(transactional = FALSE)` and repeat

On the other hand, if you goal is to *reproduce* this study as closely as possible,
then you'll want to spend a bit more time and ensure that you install packages
versions as close to the original as possible. 

- Look in the `renv.lock` file for the package version expected
- Find the package website online > Go to News/Changelog > Find the next version
- `renv::record("PKG_NAME@X.X.XX)` (where X.X.XX is the next version)
- `renv::restore(transactional = FALSE)` and see if it works, if not, try the *next* version and repeat.

This isn't the most elegant solution, but should allow repeatibility, and 
replicability, and possibly even reproducibility, without the need for more
extreme setups (like Docker containers, etc.). 


## Authorship CRediT Taxonomy

Kelsey Freitag  
Conceptualization-Equal, Formal analysis-Equal, Funding acquisition-Equal, Investigation-Lead, Methodology-Equal, Visualization-Lead, Writing - original draft-Lead, Writing - review & editing-Lead

Ann McKellar  
Conceptualization-Equal, Investigation-Equal, Methodology-Equal, Project administration-Equal, Supervision-Equal, Writing - review & editing-Equal

David Bradley  
Conceptualization-Equal, Writing - review & editing-Equal

Scott Flemming  
Conceptualization-Equal, Writing - review & editing-Equal

Steffi LaZerte  
Conceptualization-Equal, Data curation-Lead, Formal analysis-Equal, Methodology-Equal, Validation-Lead, Writing - review & editing-Equal

Mateen Shaikh  
Conceptualization-Equal, Formal analysis-Equal, Methodology-Equal, Writing - review & editing-Equal

Matthew Reudink  
Conceptualization-Equal, Formal analysis-Equal, Funding acquisition-Equal, Investigation-Equal, Methodology-Equal, Project administration-Equal, Resources-Equal, Supervision-Equal, Writing - review & editing-Equal
