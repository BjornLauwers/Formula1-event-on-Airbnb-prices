library(tidyverse)
library(fixest)
library(modelsummary)

filtered_australia <- read.csv("../../gen/data-preparation/output/filtered_australia.csv")


# make new dataframe to calculate average for australia
grp_avg_australia <-
  filtered_australia %>%
  group_by(event_city, date) %>%
  summarise(price = mean(price)) %>%
  arrange(date, event_city)


# check assumptions by plotting price over time
#plot australia
#pdf("plot_australia.pdf")
ggplot(grp_avg_australia, aes(x = date, y = price, color = factor(event_city), group = event_city )) + 
  geom_line() 

ggsave(filename = "../../gen/analysis/output/plot_australia.pdf", width = 10, height = 8, dpi = 150, units = "in") 



