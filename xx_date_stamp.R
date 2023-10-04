
x <- Sys.getenv("QUARTO_PROJECT_OUTPUT_FILES") |>
  stringr::str_split(pattern = "\n") |>
  unlist()

file.rename(x, stringr::str_replace(x, "\\.html", paste0("_", Sys.Date(), ".html")))