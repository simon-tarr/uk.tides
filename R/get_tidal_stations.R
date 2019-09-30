
#' Returns all UK tidal stations
#'
#' Returns a \code{tibble} containing a list of all UK tidal stations
#' The returned object contains the following: Station ID, Name, Country, Latitude & Longitude.
#'
#' @param api_key a valid Admirality API Key. The function will load in your API key.
#' @export

get_tidal_stations<-function(api_key){

  check_saved_api_key()
  api_key<-read_api_key()

  stations<-GET("https://admiraltyapi.azure-api.net/uktidalapi/api/V1/Stations/",
                add_headers("Ocp-Apim-Subscription-Key" = api_key)) %>%
    content(., as = "text") %>%
    fromJSON(.)

  x<-as_tibble(cbind(stations$features$properties, stations$features$geometry)) %>%
    select(-ContinuousHeightsAvailable,-Footnote, -type) %>%
    unnest(coordinates) %>%
    group_by(Name) %>%
    mutate(col=seq_along(Name)) %>%
    spread(key=col, value=coordinates) %>%
    select(1:3, 5,4) %>%
    rename(latitude = `2`) %>%
    rename(longitude = `1`)


  return(x)

}

