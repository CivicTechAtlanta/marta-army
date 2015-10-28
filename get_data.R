### get_data.R: read data from GTFS file components as txt files in working directory

temp <- tempfile()
download.file("http://www.itsmarta.com/google_transit_feed/google_transit.zip",temp)

# Read data from Atlanta google transit file, each time, unzipping from temp connection
agency <- read.csv(unz(temp, "agency.txt"))
calendar <- read.csv(unz(temp, "calendar.txt"))
calendar_dates <- read.csv(unz(temp,"calendar_dates.txt"))
routes <- read.csv(unz(temp,"routes.txt"))
shapes <- read.csv(unz(temp,"shapes.txt"))
stop_times <- read.csv(unz(temp,"stop_times.txt"))
stops <- read.csv(unz(temp,"stops.txt"))
trips <- read.csv(unz(temp,"trips.txt"))

# Unlink temp variable & remove from environment
unlink(temp)
rm(temp)