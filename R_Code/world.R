library(tidyverse)
library(gapminder)

# Read the data
map_world <- map_data("world")
data("gapminder")
my_file_object <- read.csv(file = "unicef_indicator_1.csv")

# Preprocess the data
deprivation <- my_file_object %>% 
  select(country, obsvalue, sex) %>%
  filter(sex == "Total") %>%
  select(-sex)

# Join data
joined_data <- deprivation %>% 
  full_join(map_world, by = c("country" = "region"))

# Plot
ggplot(data = joined_data) +
  aes(x = long, y = lat, group = group, fill = obsvalue) +
  geom_polygon() +
  coord_cartesian(xlim = c(-180, 180), ylim = c(-90, 90)) +
  theme_classic() + labs(x = "Latitude", y = "Longitude", fill = "% Children suffering exactly one deprivation") +
  theme(legend.title = element_text(size=5))
ggsave("world.png")
