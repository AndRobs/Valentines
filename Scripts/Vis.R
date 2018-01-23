library(tidyverse)
library(RColorBrewer)

source("Scripts/Clean.r")

source("Scripts/Theme.r")



# Test of Normalisation  --------------------------------------------------


NormCheck <- DivorceByReason %>%
  filter(PartyGranted == 'Both', Reason != 'All') %>% 
  ggplot(aes(x = Date, y = Value, colour = Reason)) +
  geom_line(size = 2) +
  theme_minimal(20)  +
  facet_wrap(~Analysis, scales = "free") +
  theme(legend.position = 'bottom') 





# Plot of Proportions -----------------------------------------------------



ReasonRate <- DivorceByReason %>%
  filter(PartyGranted == 'Both', Reason != 'All', Analysis == 'Rate') %>% 
  ggplot(aes(x = Date, y = Value, colour = Reason)) +
  geom_line(size = 2) +
  theme_Warb(20) +
  scale_y_continuous(labels  = scales::percent) +
  scale_x_continuous( breaks = seq(1979, 2016, 3)) +
  labs(y = 'Percentage of all divorces',
       colour = "",
       caption = "Data source: ONS - Births, deaths, and marriages",
       title = "Reason for divorce",
       subtitle = "Trends in divorce for England and Wales over time") +
  scale_colour_brewer(palette = "Dark2")+
  theme(legend.position = 'bottom') 



# Output ------------------------------------------------------------------


  ggsave("Output/Normalisation.png", NormCheck, height = 6, width = 14, dpi = 200)

  ggsave("Output/ReasonsforDivorce.png", ReasonRate, height = 6, width = 8, dpi = 200)



