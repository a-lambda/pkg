## code to prepare `pkg_example` dataset goes here

dplyr::starwars |>
  dplyr::filter(skin_color == "light") |>
  dplyr::select(c(name, sex, gender)) |>
  readr::write_csv2("data-raw/pkg_example.csv")

pkg_example <- readr::read_csv2("data-raw/pkg_example.csv") |>
  dplyr::slice_sample(n = 8)

usethis::use_data(pkg_example, overwrite = TRUE)
