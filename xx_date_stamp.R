
nm <- Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES")

if(nm != "Results/00_overview.html") {
  x <- nm |>
    stringr::str_split(pattern = "\n") |>
    unlist()
  
  file.rename(x, stringr::str_replace(x, "\\.html", paste0("_", Sys.Date(), ".html")))
}