# Changes in long-billed curlew breeding distributions

## Contents

This repository contains the code used to summarize, transform, and analyze eBird data for these analyses.

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

