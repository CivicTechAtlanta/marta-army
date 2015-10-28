### get_data.R: read data from GTFS file components as txt files in working directory

# download site: http://www.itsmarta.com/developers/data-sources/general-transit-feed-specification-gtfs.aspx

# Read data from Atlanta google transit file
agency <- read.csv("agency.txt")
calendar <- read.csv("calendar.txt")
calendar_dates <- read.csv("calendar_dates.txt")
routes <- read.csv("routes.txt")
shapes <- read.csv("shapes.txt")
stop_times <- read.csv("stop_times.txt")
stops <- read.csv("stops.txt")
trips <- read.csv("trips.txt")

# Create data frame "df" to hold 2 variables: col1 = name of file, col2 = fields in the file
df <- data.frame(col1 = as.character(), col2 = as.character())
df <- rbind(df, data.frame(col1 = rep("agency",times=length(names(agency))), col2 = names(agency)))
df <- rbind(df, data.frame(col1 = rep("calendar",times=length(names(calendar))), col2 = names(calendar)))
df <- rbind(df, data.frame(col1 = rep("calendar_dates",times=length(names(calendar_dates))), col2 = names(calendar_dates)))
df <- rbind(df, data.frame(col1 = rep("routes",times=length(names(routes))), col2 = names(routes)))
df <- rbind(df, data.frame(col1 = rep("shapes",times=length(names(shapes))), col2 = names(shapes)))
df <- rbind(df, data.frame(col1 = rep("stop_times",times=length(names(stop_times))), col2 = names(stop_times)))
df <- rbind(df, data.frame(col1 = rep("stops",times=length(names(stops))), col2 = names(stops)))
df <- rbind(df, data.frame(col1 = rep("trips",times=length(names(trips))), col2 = names(trips)))

# Cross-Reference of files with fields used in more than one file:

#         calendar service_id
#   calendar_dates service_id
#            trips service_id
#           routes   route_id
#            trips   route_id
#           shapes   shape_id
#            trips   shape_id
#       stop_times    stop_id
#            stops    stop_id
#       stop_times    trip_id
#            trips    trip_id
