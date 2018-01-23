library(ggplot2)

theme_Warb <- function(base_size = 15 ,...) {
  theme_minimal(base_size) +
    theme(
      text = element_text( color = "#22211d"),
      panel.grid.major.y = element_line(color = "#c7778e", size = 0.7, linetype = 1),
      panel.grid.minor.y = element_line(color = "#D8A0B0", size = 0.9, linetype = 3),
      panel.grid.major.x = element_blank(),
      panel.grid.minor.x = element_blank(),
      axis.line.x        = element_line(color = '#c7778e', size = 0.3),
      axis.text.x        = element_text(colour = 'grey40', angle = 60),
      axis.text.y        = element_text(colour = 'grey40'),
      axis.title.y       = element_text(colour = 'grey40'),
      axis.title.x       = element_blank(),
      axis.ticks.x       = element_line(color = '#c7778e', size = 0.3),
      plot.background    = element_rect(fill = "white", color = NA), 
      panel.background   = element_rect(fill = 'white', color = NA), 
      legend.background  = element_rect(fill = "white", color = NA),
      plot.title         = element_text(color = '#c7778e'),
      plot.subtitle      = element_text(colour = 'grey60'),
      plot.caption       = element_text(size   = 10, 
                                        hjust  = 0.92, 
                                        margin = margin(t    = 0.4, 
                                                        b    = 0, 
                                                        unit = "cm"), 
                                        color  = "#939184"),
      ...
    )
}
