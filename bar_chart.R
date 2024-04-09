library(forcats)
library(tidyverse)
library(gapminder)

my_file_object <- read.csv(file = "unicef_metadata.csv")
data("gapminder")
gapminder_by_country <- group_by(gapminder, country)
lowest_data <- summarise(gapminder_by_country, mean_life = mean(lifeExp)) %>% 
  arrange(mean_life)


# Plot the data
ggplot(data = head(lowest_data, 10)) + 
  aes(x = fct_reorder(country, mean_life), y = mean_life, fill = country) + 
  geom_col() + 
  labs(x = "Countries", y = "Average Life Expectancy", title = "Lowest 10 life expectancy grouped by country") + 
  theme_classic(base_size = 9) + guides(fill = FALSE)
ggsave("bar_chart.png")
