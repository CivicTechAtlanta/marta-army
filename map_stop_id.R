# map_sop_id.R: Get a single shape id lat/lon, and plot it on a map of Atlanta

library(dplyr)
library(ggmap)

# Run script to grab GTFS data and load into R environment
source("get_ATL_GTFS_data.R")

# Enter a test stop ID
stop.id.test <- 101080

# Find all outgoing routes
# Get vector (distinct values) of trip_id, associated with stop.id.test
trip.id.test <- stop_times %>% 
     filter(stop_id == stop.id.test) %>% 
     select(trip_id) %>% 
     distinct()

# Join trip.id.test vector with trips table, linked by trip_id, then
# Get distinct set of route_id/shape_id, and select shape_id
# Results in a vector of shape_id
shapes.at.stop <- inner_join(trip.id.test,trips,by="trip_id") %>%
     select(route_id,shape_id) %>% 
     distinct() %>% select(shape_id)

# Create data frame from shapes table, using shape_id from vector shapes.at.stop
shape.data.at.stop <- shapes %>% filter(shape_id == shapes.at.stop$shape_id)

# Generate base map
myMap <- get_map(location=c(lon=-84.39,lat=33.76), 
                 zoom=11, source="google", maptype="roadmap", 
                 crop=FALSE)

# Create Map of points, using data from shape.data.at.stop
ggmap(myMap) + geom_point(data=shape.data.at.stop, 
                          aes(x=shape_pt_lon,y=shape_pt_lat), 
                          color="red", size=2) +
     ggtitle(paste("All routes connecting to \nStop ID ",
                   stop.id.test,
                   ": ",
                   stops$stop_name[stops$stop_id==stop.id.test],
                   sep=""))