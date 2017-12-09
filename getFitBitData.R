getFBdata <- function(ID,device,dateStart,dateEnd){

# Dates should be in YYYY-MM-DD format, such as "2017-06-25"
  

#getStepsData
url_stepActivity <- "https://api.fitbit.com/1/user/-/activities/tracker/steps/date/"
fb_url <- paste0(url_stepActivity,dateStart,"/", dateEnd,"/1d.json")

steps <- GET(url = fb_url,
             config(token = my_token))
content(steps)
fbSteps <- convert_content_to_r_object(steps)
fbSteps <- data.frame(fbSteps)
names(fbSteps) <- c("Date", "Steps")

#get distance
url_stepActivity <- "https://api.fitbit.com/1/user/-/activities/tracker/distance/date/"
fb_url <- paste0(url_stepActivity,dateStart,"/", dateEnd,"/1d.json")

distance <- GET(url = fb_url,
                config(token = my_token))
content(distance)
fbdistance <- convert_content_to_r_object(distance)
fbdistance <- data.frame(fbdistance)
names(fbdistance) <- c("Date", "Distance")

tempData <- merge(fbSteps, fbdistance)

#get activities/tracker/floors  
url_temp <- "https://api.fitbit.com/1/user/-/activities/tracker/floors/date/"
fb_url <- paste0(url_temp,dateStart,"/", dateEnd,"/1d.json")

tempfb <- GET(url = fb_url,
              config(token = my_token))
content(tempfb)
fb <- convert_content_to_r_object(tempfb)
fb <- data.frame(fb)
names(fb) <- c("Date", "Floors")

tempData <- merge(tempData, fb)


#activities/tracker/minutesSedentary 

url_temp <- "https://api.fitbit.com/1/user/-/activities/tracker/minutesSedentary/date/"
fb_url <- paste0(url_temp,dateStart,"/", dateEnd,"/1d.json")

tempfb <- GET(url = fb_url,
              config(token = my_token))
content(tempfb)
fb <- convert_content_to_r_object(tempfb)
fb <- data.frame(fb)
names(fb) <- c("Date", "minutesSedentary")

tempData <- merge(tempData, fb)


#activities/tracker/minutesLightlyActive  

url_temp <- "https://api.fitbit.com/1/user/-/activities/tracker/minutesLightlyActive/date/"
fb_url <- paste0(url_temp,dateStart,"/", dateEnd,"/1d.json")

tempfb <- GET(url = fb_url,
              config(token = my_token))
content(tempfb)
fb <- convert_content_to_r_object(tempfb)
fb <- data.frame(fb)
names(fb) <- c("Date", "minutesLightlyActive")

tempData <- merge(tempData, fb)


#activities/tracker/minutesFairlyActive  

url_temp <- "https://api.fitbit.com/1/user/-/activities/tracker/minutesFairlyActive/date/"
fb_url <- paste0(url_temp,dateStart,"/", dateEnd,"/1d.json")

tempfb <- GET(url = fb_url,
              config(token = my_token))
content(tempfb)
fb <- convert_content_to_r_object(tempfb)
fb <- data.frame(fb)
names(fb) <- c("Date", "minutesFairlyActive")

tempData <- merge(tempData, fb)


#activities/tracker/minutesVeryActive  
url_temp <- "https://api.fitbit.com/1/user/-/activities/tracker/minutesVeryActive/date/"
fb_url <- paste0(url_temp,dateStart,"/", dateEnd,"/1d.json")

tempfb <- GET(url = fb_url,
              config(token = my_token))
content(tempfb)
fb <- convert_content_to_r_object(tempfb)
fb <- data.frame(fb)
names(fb) <- c("Date", "minutesVeryActive")

tempData <- merge(tempData, fb)

fname <- paste0(ID,"_dev",device, "_",dateStart,"_",dateEnd, "_summary.csv")

write.csv(tempData,fname, row.names = FALSE)
}