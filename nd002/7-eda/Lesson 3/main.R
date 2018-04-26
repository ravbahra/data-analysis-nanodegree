#ggplot(aes(x = friend_count, y=..density..),data = subset(fb_data, !is.na(gender))) +
#  geom_freqpoly(aes(color = gender), binwidth=10) +
#  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50))


#qplot(x=friend_count, y=..count../sum(..count..), data=subset(fb_data,!is.na(gender)),binwidth=10, geom='freqpoly', color=gender) +
#  scale_x_continuous(lim=c(0,1000), breaks=seq(0,1000,50))



qplot(x=www_likes, y=..count../sum(..count..), data=subset(fb_data, !is.na(gender)), geom='freqpoly', color=gender) + 
  scale_x_continuous() + 
  scale_x_log10()



m_data <- subset(fb_data, gender=='male')
sum(m_data$www_likes)


by(fb_data$www_likes, fb_data$gender, sum)



boxplot(x=fb_data$www_likes, data=subset(fb_data, !is.na(gender)))


# y is actually the friend_count and the x is the grouping

qplot(x=gender,
      y=friend_count,
      data=subset(fb_data, !is.na(gender)),
      geom='boxplot') +
  coord_cartesian(ylim=c(0,250))

#first variable is what you want a summary of
# second is what you want to split it over, what you're gorowuping it by
# 3rd is the function you pass to this

by(fb_data$friend_count, fb_data$gender, summary)

by(fb_data$friendships_initiated, fb_data$gender, summary)

fb_data$mobile_check_in <- factor(fb_data$mobile_check_in)
avg(fb_data$mobile_check_in)
