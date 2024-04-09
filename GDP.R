library(tidyverse)
library(gapminder)
library(tidyfit)

my_file_object <- read.csv(file = "unicef_indicator_1.csv")
deprivation <- my_file_object %>% select(country, time_period, obsvalue, sex)
deprivation <- deprivation %>% filter(sex == "Total")
data("gapminder")
gapminder <- gapminder %>% select(country, gdpPercap, year)
gapminder_by_country <- group_by(gapminder, country)
joined_data <- deprivation %>% inner_join(gapminder_by_country, by = c("country" = "country")) %>% filter(year == "2007") %>% select(-c(sex, time_period))
ggplot(data = joined_data) + aes(x = gdpPercap, y = obsvalue, color = country) +
  geom_point() + theme(legend.key.size = unit(-5, 'cm')) + labs(x = "GDP per Capita", y = "% Children suffering exactly one deprivation", color = "Countries")
ggsave("point_chart.png")