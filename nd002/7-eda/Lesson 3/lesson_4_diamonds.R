install.packages('ggplot2')
library('ggplot2')

d <- diamonds
length(d) #gives 10, which is actually the number of variables

length(d)


diamonds$color  # will return the levels
levels(diamonds$color)# 
?diamonds


diamonds$price

qplot(x=price, data=d, binwidth=500) +
  scale_x_continuous(breaks = seq(0,16000,2000))


summary(diamonds$price)


#how many diamonds cost less than 500
sum(diamonds$price < 500)

# how many diamonds cost less than 250?
sum(diamonds$price < 250)

#how many diamonds cost $15K or more?
sum(diamonds$price >= 15000 )


#exploring the largest peak in the dataset

# the hgihest peak is the mode (most frequently occuring number)
# mode(diamonds$price), <- this is the wrong function, R doesn't even provide a function to find the mode
install.packages('modeest')
library(modeest)
mfv(diamonds$price)


# so 605 is the most common value

qplot(x=price, data=d) + scale_x_continuous(limits=c(580,1505))

#break the historgram by cut
qplot(x=price, data=d) + facet_wrap(~cut)

#which cut has the highest priced diamond?
by(diamonds$price, diamonds$cut, summary)


# Let's look in to this more.

# Look up the documentation for facet_wrap in R Studio.
# Then, scroll back up and add a parameter to facet_wrap so that
# the y-axis in the histograms is not fixed. You want the y-axis to
# be different for each histogram.

# If you want a hint, check out the Instructor Notes.


?facet_wrap

# so to ensure the scales are different for each you need to use scales=free

qplot(x=price, data=diamonds) + facet_wrap(~cut, scales="free")


# Create a histogram of price per carat
# and facet it by cut. You can make adjustments
# to the code from the previous exercise to get
# started.


#FIND THE INTERQUARTILE RANGE FOR
price_d <- subset(diamonds, color=='D')$price
IQR(price_d)


#investigation of price per carat
diamonds$price_per_carat = diamonds$price/diamonds$carat

qplot(x = price_per_carat, data=diamonds)
qplot(x=color, y=price_per_carat, data=diamonds, geom='boxplot') + coord_cartesian(ylim=c(1000,7500))


#Investigate the weight of the diamond using frequency polygon
#frequency polygon allows you to compare different attributes

qplot(x=carat, data=diamonds, binwidth=0.01) + scale_x_continuous(limits = c(0.1,1.1))
