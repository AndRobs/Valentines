  library(tidyverse)
  # Read in data ------------------------------------------------------------
  
  DivorceByReason <- read_csv("Data/DivorceByReason.csv")
  
  
  # Wide to long and renaming -----------------------------------------------
  
  
  
  

# Collecting count data and creating new variables ------------------------

  Counts <- DivorceByReason                                     %>% 
    gather(Reason, Divorces, 3:9)                               %>% 
      mutate(Reason = ifelse(Reason == 'Total', 'All', Reason))
  
  
  Totals <- Counts                                              %>%
    group_by(Date, Reason)                                      %>%
    summarise(Divorces = sum(Divorces))                         %>%
    ungroup()                                                   %>%
    mutate(`Party to whom granted` = 'Both')                    %>%
    select(Date, `Party to whom granted`, Reason, Divorces)
  
  
  Counts <- bind_rows(Counts, Totals)                           %>%
    rename(PartyGranted = `Party to whom granted`)              %>%
    arrange(Date, Reason, PartyGranted)                         %>%
    select(Date, PartyGranted, Reason, Value = Divorces)        %>%
    mutate(Analysis = 'Count')
  
  

# Calculating rate data and creating new variables ------------------------

  
  WithTotals <- DivorceByReason                                 %>% 
    gather(Reason, Divorces, 4:9)                               %>% 
    mutate(Reason = ifelse(Reason == 'Total', 'All', Reason))   
  
  
  Totals <- WithTotals                                          %>%
    group_by(Date, Reason)                                      %>%
    summarise(Divorces = sum(Divorces), Total = sum(Total))     %>%
    ungroup()                                                   %>%
    mutate(`Party to whom granted` = 'Both')                    %>%
    select(Date, `Party to whom granted`, Reason, Divorces, Total)
  
  
  Rates <- bind_rows(WithTotals, Totals)                        %>%
    rename(PartyGranted = `Party to whom granted`)              %>%
    arrange(Date, Reason, PartyGranted)                         %>%
    mutate(Rate = round(Divorces/Total, 4))                     %>%
    select(Date, PartyGranted, Reason, Value = Rate)            %>%
    mutate(Analysis = 'Rate')
  

# Join the datasets -------------------------------------------------------

  
  DivorceByReason <- bind_rows(Counts, Rates)
  

# Clean up ----------------------------------------------------------------


  rm(Totals)
  rm(WithTotals)
  rm(Rates)
  rm(Counts)