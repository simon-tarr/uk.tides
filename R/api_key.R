#' Register an API key to make requests
#'
#' Saves a .rds format file in the current working directory to store API credentials.
#' All API functions will fail until you have done this!
#' Register for a new key here: https://admiraltyapi.portal.azure-api.net/
#'
#' @param api_key a valid Admirality API Key
#' @export


save_api_key <- function(api_key) {
  readr::write_rds(api_key, "api_key")
}

read_api_key <- function(){
  readr::read_rds("api_key")
}

check_saved_api_key <- function(){

  if(!file.exists("api_key")){

    stop("No saved API key found. Before requesting data use save_api_key()")

  }

}

