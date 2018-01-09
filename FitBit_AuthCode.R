#devtools::install_github("teramonagi/fitbitr")

library(fitbitr)

convert_content_to_r_object <- function(response)
{
  jsonlite::fromJSON(httr::content(response, as = "text"))
}

key <-       #Your Key, as a string in " "
secret <-    # your Secret, as a string in " "
theAppName <-  " "   #Your app name. This isn't used for anything in OAuth, but see httr documentation for more details.

request = "https://api.fitbit.com/oauth2/token"
authorize = "https://www.fitbit.com/oauth2/authorize"
access = "https://api.fitbit.com/oauth2/token"


fb_endpoint <- httr::oauth_endpoint(request, authorize, access)
fb_endpoint

myapp <- httr::oauth_app(theAppName, key, secret)
scope <- c("activity")
my_token <- httr::oauth2.0_token(fb_endpoint, myapp, scope=scope, use_basic_auth=TRUE, cache = FALSE)
