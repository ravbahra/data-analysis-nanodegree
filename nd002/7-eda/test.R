fb_data <- read.csv('D:/fb_data/pseudo_facebook.tsv',sep='\t')
head(fb_data)


ggplot(aes(x = friend_count),data = subset(fb_data, !is.na(gender))) +
  geom_freqpoly(aes(color = gender), binwidth=10) +
  scale_x_continuous(limits = c(0, 1000), breaks = seq(0, 1000, 50)) +
