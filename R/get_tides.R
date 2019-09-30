
#' Returns high and low tide information for a specified Station ID
#'
#' Returns a \code{tibble} containing data on high and low tides for the specified duration (1 - 7 days)
#'
#' @param api_key a valid Admirality API Key. The function will load in your API key.
#' @param station_id a valid station ID. Can be found by using \code{get_tidal_stations()} or \code{find_closest_tide_station()}
#' @param duration duration in days over which to return tide data. Must be >=1 or <=7.
#' @export

get_tides<-function(api_key, station_id, duration = 1){

  check_saved_api_key()
  api_key<-read_api_key()

  tides<-httr::GET(url = paste0("https://admiraltyapi.azure-api.net/uktidalapi/api/V1/Stations/", station_id, paste0("/TidalEvents?duration="), duration), add_headers("Ocp-Apim-Subscription-Key" = api_key)) %>%
    jsonlite::content(., as="text") %>%
    jsonlite::fromJSON(.)

  return(tides)

}

