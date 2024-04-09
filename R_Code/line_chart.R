options(scipen = 999)
library(tidyverse)
library(gapminder)

my_file_object <- read.csv(file = "unicef_metadata.csv")
data("gapminder")
# Already got the 10 lowest countries in the bar_chart.R file so now I'm jsut filtering manually
gapminder <-
  gapminder %>%
  filter((country == "Sierra Leone" | country == "Afghanistan" | country == "Angola" | country == "Guinea-Bissau" | country == "Mozambique" | country == "Somalia" | country == "Rwanda"  | country == "Liberia" | country == "Equatorial Guinea" | country == "Guinea"))
gapminder <- gapminder %>% select(country, year, pop)
ggplot(gapminder, aes(x = year, y = pop, color = country)) +
  geom_line() + theme_light() + labs(x = "Year", y = "Population", title = "Population Increase", color = "Country")
ggsave("line_chart.png")