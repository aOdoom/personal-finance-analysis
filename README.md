# Finance Analysis

## Overview

This project analyzes simulated financial data to answer a practical question: how much does the avalanche debt payoff strategy save compared to minimum payments?

First, the project analyses expenses over four months to understand cash flow, then uses student loan pay off data to visualize payoff schedules under different strategies.

This project demonstrates skills in SQL (data modeling, aggregation, filtering, view creation), R (ggplot2, dplyr), and data-driven decision making.

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

Student loans (education category) make up the largest share of expenses. Using the avalanche method saves approximately $3,472 and 4 years compared to minimum payments. Surprisingly, utilities and groceries were nearly equal in spending. Visualizing the payoff trajectories made the advantage of the avalanche method concrete — the lines diverge quickly once the first loan is paid off.

## **Limitations**
-  Simulated data
-  Only 2 loans analyzed
-  Fixed payment assumptions



### **Tools Used**

SQL (SQLite), R (ggplot2)
