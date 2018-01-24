---
title: "README"
author: "Andrew"
date: "24 January 2018"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)

library(tidyverse)
library(RColorBrewer)

source("Scripts/Clean.r")

source("Scripts/Theme.r")








```

## R Markdown

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r cars}

# Test of Normalisation  --------------------------------------------------


NormCheck <- DivorceByReason %>%
  filter(PartyGranted == 'Both', Reason != 'All') %>% 
  ggplot(aes(x = Date, y = Value, colour = Reason)) +
  geom_line(size = 2) +
  theme_minimal(20)  +
  facet_wrap(~Analysis, scales = "free") +
  theme(legend.position = 'bottom') 

NormCheck
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}

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


ReasonRate
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
