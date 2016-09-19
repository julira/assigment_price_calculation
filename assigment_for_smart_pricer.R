##assigment for Smart Pricer
setwd("C:/Users/Yulia/Desktop/bewerbungsunterlage/aufgaben")
#reading the data 
data1<-read.csv("tickets_sold.csv")
data2<-read.csv("row_capacity.csv")
data1$ticket<-1
##1
sold_tickets<-aggregate(data1$ticket, by=list(data1$auditorium_row,data1$movie,data1$calendarweek),FUN=sum)
library(plyr)
sold_tickets<-rename(sold_tickets,c("Group.1"="auditorium_row","Group.2"="movie","Group.3"="calendarweek","x"="tickets"))

##2

sold_tickets$capacity<-data2$max_seats_per_row
sold_tickets$seat_load_factor<-sold_tickets$x/sold_tickets$capacity
sold_tickets

##3
seat_sold_factor_per_week<-aggregate(sold_tickets$seat_load_factor, by=list(sold_tickets$calendarweek, sold_tickets$auditorium_row),FUN=mean)
seat_sold_factor_per_week