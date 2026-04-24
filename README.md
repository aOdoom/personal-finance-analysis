# Finance Analysis

## Overview

This project analyzes simulated financial data to answer a practical question: how much does the avalanche debt payoff strategy save compared to minimum payments?

First, the project analyses expenses over four months to understand cash flow, then uses student loan pay off data to visualize payoff schedules under different strategies.

This project demonstrates skills in SQL (data modeling, aggregation, filtering), R (ggplot2, dplyr), and data-driven decision making.

## **Business Question**

How much does the avalanche payoff strategy save compared to minimum payments?

## **Data**

-   `dummy_expenses` — simulated transaction-level records across 4 months (Jan–Apr 2026) and 9 spending categories

-   `dummy_payoff_schedule` — month-by-month simulation of loan balances under minimum and avalanche strategies

## **Key Findings**

-   Loan 105: 8 months vs 42 months, saves \$184 and \~3 years

-   Loan 101: 59 months vs 111 months, saves \$3,288 and \~4 years

-   Total interest saved: \~\$3,472

## **Figures**

![](images/Dummy%20Spending%20By%20Category.jpeg)

![](images/Dummy%20Payoff%20Strategy.jpeg)

![](images/Dummy%20Interest%20Calculation.jpeg)

## **Discussion**

Student loans evidently take up the most of expenses. Using the avalanche method for both loans saves a total of approximately \$3,472 and 4 years of payment. This frees up extra money to be spent on other things.

### **Tools Used**

SQL (SQLite), R (ggplot2)
