#' Title
#'
#' @param lastname
#'
#' @return
#' @export

create_sp = function(lastname) {

  folders = c(
    "doc",
    "code",
    "ref"
  )

  for(i in folders) {
    dir.create(path = i)
  }

  file.create("code/01_cleaning.R")
  file.create("code/02_createRmd.R")
  file.copy(
    "~/template-proj/doc/sp_lastname.Rmd",
    paste0("doc/sp_", lastname, ".Rmd")
  )
  file.copy(
    "~/template-proj/README.md",
    "README.md"
  )

}
