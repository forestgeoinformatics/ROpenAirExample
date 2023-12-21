install.packages("openair")

library(openair)
library(plyr)
library(dplyr)
library(ggplot2)
library(reshape)

########
# In this video we will take a look at an interesting R-Package used for air pollution analysis
# which is named as openair
# The project was led by the Environmental Research Group at King's College London
# visit www.openair-project.org
########

#
# One can also refer to the openair manual in which they have explained each and
# every function in detail
#

##
# We will take a look at various interesting visualization functions in openair package
# summaryPlot, scatterPlot, timeVariation, trendLevel, smoothTrend, calendarPlot
# windRose, polarPlot, pollutionRose, polarAnnulus
# importKCL and importTraj Function
# trajPlot
# selectByDate, timeAverage, splitByDate
## 


##
# Let us start, we will use mydata which is built-in dataframe in openair package
# summaryPlot
##

###########################################################
###########################################################

openair::summaryPlot(mydata,percentile = 0.99)
openair::summaryPlot(mydata,clip = FALSE)

openair::summaryPlot(mydata, col.hist = "BLUE")
openair::summaryPlot(mydata, cols = "greyscale")
openair::summaryPlot(mydata, col.hist = "BLUE",col.mis = "RED",col.data = "GREEN")
openair::summaryPlot(mydata, col.hist = "BLUE",col.mis = "RED",col.data = "GREEN",col.trend = "BLACK")
openair::summaryPlot(mydata, col.hist = "BLUE",col.mis = "RED",col.data = "GREEN",col.trend = "BLACK",period = "months")

openair::summaryPlot(selectByDate(mydata,year=2000,month = 1),
                     col.hist = "BLUE",
                     col.mis = "RED",
                     col.data = "GREEN",
                     col.trend = "BLACK",period = "months")

openair::summaryPlot(selectByDate(mydata[,-c(2,3,10)],year=2000),
                     col.hist = "BLUE",
                     col.mis = "RED",
                     col.data = "GREEN",
                     col.trend = "BLACK",period="months",type = "density")

openair::summaryPlot(selectByDate(mydata[,-c(2,3,10)],year=2000), col.hist = "BLUE",col.mis = "RED",col.data = "GREEN",col.trend = "BLACK",
                     period="months",
                     type = "density",
                     avg.time = "month")

###############################################################
###############################################################

openair::scatterPlot(mydata, x = "nox",y="no2")

openair::scatterPlot(mydata, x = "nox",y="no2",type = "season")

openair::scatterPlot(mydata, x = "nox",y="no2",z="wd",type = "weekday")

openair::scatterPlot(mydata, x = "nox",y="no2",z="wd",type = c("year","month"))
openair::scatterPlot(mydata, x = "nox",y="no2",z="wd",type = c("year","season"))

openair::scatterPlot(mydata, x = "nox",y="o3",type = "season")

openair::scatterPlot(mydata, x = "nox",y="co",type = "season")

openair::scatterPlot(mydata, x = "nox",y="co",type = "season")

#plot(mydata$nox,mydata$o3)
#abline(lm(mydata$nox~mydata$o3))

openair::scatterPlot(mydata, x = "nox",y="no2",z = "wd",
                     type = "season",
                     spline = TRUE)

openair::scatterPlot(mydata, x = "nox",y="o3",z = "wd",
                     type = "season",
                     spline = TRUE)

openair::scatterPlot(mydata, x = "nox",y="no2",z = "wd",
                     type = "season",
                     spline = TRUE,
                     percentile = "percentile")

openair::scatterPlot(mydata, x = "nox",y="no2",z = "wd",
                     type = "season",
                     spline = TRUE,
                     cols = "jet",
                     strip = TRUE,
                     log.x = TRUE,
                     log.y = TRUE)

openair::scatterPlot(mydata, x = "nox",y="no2")
openair::scatterPlot(mydata, x = "nox",y="no2",method="hexbin")
openair::scatterPlot(mydata, x = "nox",y="no2",method="density",col="jet")

openair::scatterPlot(mydata, x = "nox",y="no2",z="wd")
openair::scatterPlot(mydata, x = "pm25",y="nox",z="wd")
#colnames(mydata)
openair::scatterPlot(mydata, x = "nox",y="no2",z="o3",type="season")
openair::scatterPlot(mydata, x = "nox",y="no2",z="o3",type=c("weekday","month"))

##############################################################
##############################################################

openair::timeVariation(mydata,pollutant = "nox",local.tz = "America/New_York")
openair::timeVariation(mydata,pollutant = "nox",local.tz = "GMT")
openair::timeVariation(mydata,pollutant = "nox",local.tz = "Europe/London")
openair::timeVariation(mydata,pollutant = "nox",local.tz = "Europe/Madrid")
openair::timeVariation(mydata,pollutant = "nox",local.tz = "Asia/Kolkata")

openair::timeVariation(mydata, pollutant = "o3",normalise = TRUE)

openair::timeVariation(mydata, pollutant = "o3",type="season")
openair::timeVariation(mydata, pollutant = "o3")

##############################################################
##############################################################
openair::trendLevel(mydata,pollutant = "nox")

openair::trendLevel(mydata, pollutant = "o3")

openair::trendLevel(mydata,pollutant = "nox",x = "month",y="hour")
openair::trendLevel(mydata,pollutant = "nox",x = "month",y="hour",border="Black")
openair::trendLevel(mydata,pollutant = "nox",x = "month",y="hour",border="White")

openair::trendLevel(mydata,pollutant = "nox",x = "month",y="hour",rotate.axis = c(180,90))
openair::trendLevel(mydata,pollutant = "nox",x = "month",y="hour",rotate.axis = c(45,0))
openair::trendLevel(mydata,pollutant = "nox",
                    x = "month",y="hour",
                    rotate.axis = c(45,0),
                    key.header = "High",key.footer = "Low")


openair::trendLevel(mydata,pollutant = "pm25",
                    x = "month",y="hour",
                    rotate.axis = c(45,0),
                    col.na = "BLACK")


#####################################################################
#####################################################################

openair::smoothTrend(mydata, pollutant = "nox")

openair::smoothTrend(mydata, pollutant = "pm25")
openair::smoothTrend(mydata, pollutant = "pm10")
openair::smoothTrend(mydata, pollutant = "o3")


openair::smoothTrend(mydata, pollutant = "nox",avg.time = "month")

openair::smoothTrend(mydata, pollutant = "nox",type = "weekday")



#####################################################################
#####################################################################

#openair::binData(mydata,uncer = "nox")
#openair::aqStats(mydata)

#calendarPlot(mydata, pollutant = "nox",annotate = "ws")
#calendarPlot(mydata, pollutant = "nox")
calendarPlot(selectByDate(mydata), pollutant = "nox",year=2001,
             cols = "greyscale",annotate = "wd")


calendarPlot(selectByDate(mydata), pollutant = "nox",year=2001)


#x <- timeAverage(mydata)

#timeAverage()

#xx <- openair::aqStats(mydata,pollutant = c("nox","no2"))
#xx <- openair::aqStats(mydata,pollutant = c("nox","no2"))

#openair::calcFno2(mydata)
#openair::kernelExceed(mydata,x = "ws",y="wd",pollutant = "nox")

#openair::timePlot(selectByDate(mydata,year=2000),pollutant = c("nox"))


#openair::TheilSen(mydata,pollutant = "nox")
#openair::TheilSen(selectByDate(mydata,year=2000),pollutant = "nox",deseason = TRUE,type = "wd")


#openair::smoothTrend(mydata, pollutant = "nox",type = "season")
#openair::smoothTrend(mydata, pollutant = "nox",deseason = TRUE)

#openair::TaylorDiagram(mydata,obs = "obs",mod="mod")

openair::selectByDate()

x <- openair::splitByDate(mydata, dates = "2003-01-01",labels = c("XYZ","ABC"))

#####################################
#openair::percentileRose(mydata,pollutant = "nox",wd = "wd")
#openair::percentileRose(mydata,pollutant = "nox",wd = "wd",smooth = TRUE,type = "month")



openair::polarPlot(mydata,pollutant = "nox",resolution = "fine")

#openair::polarPlot(mydata,pollutant = "nox",uncertainty = TRUE)
#openair::polarPlot(mydata,pollutant = "nox",alpha = 0.5)
openair::polarPlot(mydata,pollutant = "nox",alpha = 0.5)


openair::polarPlot(mydata,pollutant = "nox",type="season")
openair::polarPlot(mydata,pollutant = "nox",type="season",resolution = "fine")

openair::polarPlot(mydata,pollutant = "nox",type="weekday")

#openair::polarPlot(mydata,pollutant = "nox",alpha = 0.5)


openair::polarAnnulus(mydata, pollutant = "nox")
openair::polarAnnulus(mydata, pollutant = "nox",period = "season")
openair::polarAnnulus(mydata, pollutant = "nox",period = "trend")



windRose(mydata,ws = "ws", wd="wd",paddle = FALSE,type = "season")

pollutionRose(mydata,pollutant = "nox")
pollutionRose(mydata,pollutant = "nox",paddle = TRUE)


data <- openair::importKCL(site="kc1",year=2005,pollutant = "all",met=TRUE)



mytraj <- importTraj(site = "london", year = 2005, local = NA)


trajPlot(selectByDate(mytraj,year=2005),type="season")
trajPlot(ndata)
trajPlot(selectByDate(mytraj,year=2005),type="season",map = FALSE)
trajPlot(selectByDate(mytraj,year=2005),type="season")

trajPlot(selectByDate(mytraj,year=2005),type="season",group = "day")


#trajCluster(traj = mytraj,method = "Angle")
#trajCluster(traj = mytraj,method = "Euclid")


ndata <- merge(x = mytraj, y=data)

trajPlot(selectByDate(mytraj,start = "1/1/2005",end = "10/1/2005"),group="day")
#trajLevel(selectByDate(mytraj,start = "1/1/2005",end = "10/1/2005"),group="day")

trajPlot(selectByDate(ndata,start = "1/8/2005",end = "15/8/2005"),pollutant = "so2")

trajLevel(selectByDate(ndata,start = "1/8/2005",end = "15/8/2005"),statistic = "frequency")
trajLevel(selectByDate(ndata,start = "1/8/2005",end = "15/8/2005"),statistic = "difference")

trajPlot(selectByDate(mytraj,start = "1/1/2005",end = "10/1/2005"),group="day")

#corPlot(mydata)
#corPlot(data1, dendrogram = TRUE)

library(xlsx)

d <- read.xlsx("12- Dec 2017 IMD R.xlsx",sheetIndex=1)

cnames <- colnames(d)
cnames[1] <- "date"
cnames[2] <- "PM10"
cnames[3] <- "PM25"
cnames[4] <- "PM1"
cnames[5] <- "SO2"
cnames[6] <- "NO2"
cnames[7] <- "HCT"
cnames[8] <- "HCM"
cnames[9] <- "HCNM"
cnames[10] <- "UV"
cnames[11] <- "UVTEMP"
colnames(d) <- cnames
d <- d[,-c(12:17)]
colnames(d)
class(d$AQ_IITMDelhi.CPM_10)

d$Sec <- as.numeric(strftime(d$date,format="%S"))

d$date[d$Sec==59] <- d$date[d$Sec==59]+1
d$Sec <- NULL
write.xlsx(d,"Delhi.xlsx",sheetName = "Air Quality",row.names = FALSE)

summaryPlot(d)
summaryPlot(d,period = "months")
summaryPlot(d,period = "months",avg.time = "hour")
