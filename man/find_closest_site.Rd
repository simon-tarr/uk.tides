% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_closest_tide_station.R
\name{find_closest_site}
\alias{find_closest_site}
\title{Find the closest tide station to an arbitrary latitude/longitude point within the UK.}
\usage{
find_closest_site(lat, long, site_count = 1, cached_sites = NULL)
}
\arguments{
\item{lat}{Decimal latitude}

\item{long}{Decimal longitude}

\item{site_count}{Number of sites to return. Defaults to 1. Sorted by distance (closest to furthest away).}

\item{cached_sites}{A \code{data.frame} containing a list of all UK tide stations. The list can be generated by calling \code{get_tidal_stations()}}
}
\description{
Calls either \code{forecast_list_sites()} or \code{observations_list_sites()} and returns the closest site to any lat long point.
}
\examples{
find_closest_site(lat = 53.8059821, long = -1.6057714, site_count = 1, cached_sites = NULL)

}
