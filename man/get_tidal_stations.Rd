% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_tidal_stations.R
\name{get_tidal_stations}
\alias{get_tidal_stations}
\title{Returns all UK tidal stations}
\usage{
get_tidal_stations(api_key)
}
\arguments{
\item{api_key}{a valid Admirality API Key. The function will load in your API key.}
}
\description{
Returns a \code{tibble} containing a list of all UK tidal stations
The returned object contains the following: Station ID, Name, Country, Latitude & Longitude.
}
