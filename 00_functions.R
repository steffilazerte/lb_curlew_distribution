#' Adapted from naturecounts::make_grid
#' size is one grid dimension in meters (i.e. for 10x10 km grid want 10,000m)
make_grid <- function(sf, size) {
  sf |>
    sf::st_bbox() |>
    wk::as_rct() |>
    wk::grd(dx = size, dy = size) |>
    sf::st_as_sf()
}


#' Adapted from naturecounts::grid_filter
#' size is one grid dimension in meters (i.e. for 10x10 km grid want 10,000m
grid_filter <- function(grid, sf, size) {
  sf::st_filter(grid, sf) %>%
    dplyr::mutate(id = 1:dplyr::n()) %>%
    split(.$id) %>%
    purrr::map(~ make_grid(.x, size))
}


filter_dist <- function(sf, p) {
  centre <- sf |>
    st_set_agr("constant") |>
    st_union() |>
    st_convex_hull() |>
    st_centroid()
  
  sf |> 
    mutate(dist = st_distance(geometry, centre)[, 1]) |>
    filter(dist <= quantile(dist, p)) |>
    select(-dist) |>
    mutate(perc = p)
}

extent <- function(sf) {
  sf |>
    st_union() |>
    st_convex_hull() |>
    st_area()
}
    
  
  