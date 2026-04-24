## ----setup, include=FALSE--------------------------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

# clear console
cat("\014")

# install packages
if (!require("pacman")) install.packages("pacman")

# install additional packages
pacman::p_load(
  rio,
  here,
  tidyverse,
  ggplot2,
  dplyr,
  ggthemes,
  gtsummary,
  flextable,
  skimr
)

# set root directory and make into object
root_dir <- "/Users/adwoaodoom/Desktop/Ad-Hoc Projects"


## --------------------------------------------------------------------------------------------
# import datasets
# interest <- rio::import(here::here(root_dir, "interest_by_strategy.csv"))
# payoff <- rio::import(here::here(root_dir, "payoff_schedule.csv"))
# spending <- rio::import(here::here(root_dir, "spending_by_category.csv"))

payoff <- rio::import(here::here(root_dir, "dummy_payoff_schedule.csv"))
spending <- rio::import(here::here(root_dir, "dummy_spending_by_category.csv"))
interest <- rio::import(here::here(root_dir, "dummy_interest_by_strategy.csv"))


## --------------------------------------------------------------------------------------------
# observe structure of interest dataset
str(interest)

# payoff dataset
str(payoff)

# spending dataset
str(spending)


## --------------------------------------------------------------------------------------------
# create bar chart for spending categories
ggplot(spending, aes(x=reorder(`category`, total), y = total)) +
  geom_bar(stat="identity", width=0.7, fill = "steelblue") +
  labs(title = "Spending by Category",
       x = "Category",
       y = "Total") +
  theme_minimal() + coord_flip() + theme(legend.position = "none")


# save 
ggsave("Dummy Spending By Category.jpeg", width = 8, height = 6) 


## --------------------------------------------------------------------------------------------
# column names
names(payoff)

# chart for payoff strategy
ggplot(payoff, aes(x = month_num, y = closing_bal, color = factor(loan_id), linetype = strategy, group = interaction(strategy,loan_id))) + geom_line(linewidth = 1.2) +
  scale_y_continuous(labels = scales::dollar) + 
  labs(title = "Payoff Strategy",
       x = "Month",
       y = "Closing Balance",
       color = "Loan ID",
       linetype ="Strategy") +
  theme_minimal()

# save
ggsave("Dummy Payoff Strategy.jpeg", width = 8, height = 6)


## --------------------------------------------------------------------------------------------
# column names
names(interest)

# rename column
interest <- interest %>%
  rename(total_interest = `SUM(interest)`)

# build chart
ggplot(interest, aes(x=factor(loan_id), y = total_interest, fill = strategy)) +
  geom_col(stat="identity", width=0.7, position = "dodge") +
  scale_y_continuous(labels = scales::dollar) +
  labs(title = "Interest Calculation",
       x = "Loan ID",
       y = "Total Interest",
       fill = "Strategy") +
  scale_fill_manual(values = c("minimum" = "#F87660", "avalanche" = "#00BFC4")) + 
  theme_minimal() + coord_flip()

# save
ggsave("Dummy Interest Calculation.jpeg", width = 8, height = 6)

