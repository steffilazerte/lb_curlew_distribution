# Final data sets

These data are (at least partially) derived from eBird data.
Please see the `ebird_terms_of_use.txt` for the licensing of such data.

## File names

lobcur_final_GRIDSIZE_REGION_TREATMENT_FILTERCUTOFF

e.g., lobcur_final_10x_bc_present_filtered_100.csv
Contains data with 
- 10,000 ha grid cells (10x)
- for the region of BC (bc)
- for only grid cells with a curlew presence (present)
- filtered to include 100% of grid cells (filtered_100)

e.g., lobcur_final_10x_bcr_control_filtered_99.csv
Contains data with
- 10,000 ha grid cells (10x)
- for the BCR regions (will have BCRs in 'region' column)
- for all grid cells that have the quality control cutoff (at least 5/10 years), regardless of whether a curlew was detected (control)
- filtered to include 99% of grid cells (distance cutoff from the centroid) (filtered_99)

## Columns - Descriptive

- **area_ha** - Grid Area in hectares
- **region** - All, BC, or BCR
- **dist_perc** - % distance cutoff used (dist_100 = keep 100%, dist_99 = keep 99%, etc.) i.e. did we only keep the inner 99% of of grid points before calculating our metrics?
- **year** - Year of interest

## Columns - Measurements
Note that these are specific to the type of treatment (ie. curlew present OR control - all checklists)

- **extent_m2** - Convex hull of our selected grid cells, and then the area of this polygon (extent() function) in m^2
- **grid_n** - the total number of grid cells in this group (i.e. overall if this is a "control" data file, or those with a curlew observation if this is a "present" file)
- **grid_area_m2** - the total area occupied by these grid cells (in m^2)
- **cent_lat / cent_lon** - the decimal degrees lat/lon of the centroid of the area defined by these grid cells
- **min_lat/max_lat/min_lon/max_lon** - the decimal degrees max/min of lat/lon around the area defined by these grid cells

## Columns - Sample sizes
In all cases, these reflect "in that region in the grid cells we used for that year (within the dates we specified)"
 
- **samples_total_checklists** - the total number of checklists …  [For control, this is all checklists in all grid cells; for present, this is only checklists in grid cells with a curlew]
- **samples_median_checklists** - the median number of checklists …
- **samples_total_obs** - the total number of observations of a curlew … [Actual numbers observed, not just number of checklists]
- **samples_median_obs** - the median number of observation of a curlew …
- **samples_date_min** - the earliest date of a checklist …
- **samples_date_max** - the latest date of a checklist …
- **samples_n_years_min** - the minimum number of years for which we have at least one checklist for any grid cell …
- **samples_n_years_max** - the maximum number of years for which we have at least one checklist for any grid cell …
- **samples_n_years_median** - the median number of years for which we have at least one checklist for any grid cell …

