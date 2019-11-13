#install.packages("dslabs")
library("dslabs")
library("dplyr")
data(package="dslabs")


data("murders")
murders_table <- murders %>%
  mutate(murders_perc_pop = total/population) %>%
  mutate_at(vars(population, total), funs(format(round(.,0), big.mark = ",", scientific = FALSE))) %>%
  mutate(murders_perc_pop = scales::percent(murders_perc_pop, accuracy =0.0001, scale = 100))

data("brexit_polls")
polls_data <- brexit_polls %>%
  group_by(poll_type, pollster) %>%
  summarise(avg_remain = mean(remain), avg_leave = mean(leave), avg_undecided = mean(undecided)) %>%
  mutate_at(vars(avg_remain, avg_leave, avg_undecided), 
            funs(scales::percent(., accuracy =0.1, scale = 100)))