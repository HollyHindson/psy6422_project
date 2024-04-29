# install packages

install.packages("tidyverse")
install.packages("readr")
install.packages("ggplot2")
install.packages("here")


# load libraries

library(tidyverse)
library(readr)
library(ggplot2)
library(here)


# load data into R

data <- read_csv(here("data","sleeplatency_rawdata.csv"))


# Ensure data is present

head(data)

# stats

data_summary <- data %>%
  group_by(Intensity, Condition) %>%
  summarise(
    sleep_latency_mean = mean(sleeplatency, na.rm = TRUE),
    sleep_latency_se = sd(sleeplatency, na.rm = TRUE) / sqrt(n()),
    .groups = 'drop')
 # Create Plot
   
   p <- ggplot(data, aes(x = as.factor(Intensity), y = sleeplatency, color = Condition))+
       geom_jitter(width = 0.2, height = 0, alpha = 0.2) +
       scale_color_manual(values = c('orange', 'blue')) +
       labs(title = 'Sleep Latencies to Stage N2 in Minutes after Lights Off', x = 'Light Intensity', y = 'Sleep Latency [min]') +
       theme_minimal() +
     scale_x_discrete(labels = c(expression("27 cd/m"^2), 
                                 expression("62 cd/m"^2), 
                                 expression("134 cd/m"^2), 
                                 expression("284 cd/m"^2))) +
   geom_hline(yintercept = 0, color = "black") +
   geom_vline(xintercept = 0.5, color = "black") +     
   
   # add lines between means for each condition and intensity
     
     line_data <- data_summary %>%
     filter(Condition %in% c("HM", "LM")) %>%
     group_by(Intensity) %>%
     summarise(HM_mean = mean(sleep_latency_mean[Condition == "HM"]),
               LM_mean = mean(sleep_latency_mean[Condition == "LM"]))
   
     geom_segment(data = line_data, aes(x = as.numeric(as.factor(Intensity)) - 0.15, xend = as.numeric(as.factor(Intensity)) + 0.15, y = HM_mean, yend = LM_mean), color = "black") +
     
   
   # Calculate means and SEMs
     
      
       stat_summary(aes(color = Condition), fun.data = mean_se, geom = 'errorbar', width = 0.25, position = position_dodge(width = 0.5)) +
       stat_summary(aes(fill = Condition), fun.data = mean_se, geom = 'point', size = 3, shape = 16, position = position_dodge(width = 0.5)) +
       scale_fill_manual(values = c('orange', 'blue')) +
       
     geom_vline(xintercept = c(1.5, 2.5, 3.5), color = "gray90", linetype = "dashed", size = 0.5) +
     theme(legend.title = element_blank(),
            panel.grid = element_blank(), 
            panel.grid.major = element_blank(),
            panel.grid.minor = element_blank(),
            axis.text.x = element_text(size = 10),
           axis.title.x = element_text(margin = margin(t = 20)),
            axis.title.y = element_text(margin = margin(r = 20)),
           plot.title = element_text(size = 14,hjust = 0.35, margin = margin(b = 20)))

   
   # Print
   
   p
   
   # Save Plot
   
   ggsave(filename = "graphs/sleep_plot.png", plot = p, width = 8, height = 6, units = "in", dpi = 300, bg = "white")
   
   
   
   


  