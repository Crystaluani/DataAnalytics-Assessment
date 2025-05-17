# DataAnalytics-Assessment

# Overview 
This document explains the steps and logic used to answer the four SQL questions in the assessment. The queries were written and tested on the adashi_staging database using MySQL Server Studio.

# Question 1: User Savings and Investment Summary
The goal was to find customers who have at least one confirmed savings account and one active investment fund, and show their total confirmed savings amount.

I solved this by joining the users_customuser table to savings_savingsaccount and plans_plan tables to get user, savings, and investment info.

Filtered savings accounts with positive deposits (confirmed_amount > 0).

Filtered investment plans that are marked as funds and active.

Counted distinct savings accounts and investments per user.

Summed the total confirmed savings amounts, converting kobo to the base currency by dividing by 100.

Grouped results by user and sorted by total deposits.

# Challenges
Initial error: used HAVING savings_count, but the alias wasn’t defined correctly.

Fixed by aligning the alias name (savings_savingsaccount) with the HAVING clause or adjusting logic.

# Question 2: Customer Transaction Frequency Categorization
The goal was to classify customers based on how often they make transactions in their savings accounts.

How i solved this question:

Calculated total transactions and the span of months between first and last transaction for each user.

Computed average transactions per month by dividing total transactions by active months.

Categorized customers into ‘high’, ‘medium’, or ‘low’ frequency based on average transactions per month.

Grouped the results by category, counting customers and averaging their transaction rates.

# Challenges
A typo (timstampdiff instead of timestampdiff) caused errors — fixed quickly.

Also had to ensure correct grouping and alias use.

# Question 3: Account Inactivity Alert
The goal was to list accounts (savings or investment) that have had no deposit or activity for over one year.

How I solved it:

For savings accounts, checked the most recent deposit date where confirmed_amount > 0.

For investments, looked at active funds and their last activity date.

Calculated inactivity days by comparing the last transaction date to the current date.

Selected accounts where inactivity is more than 365 days.

Combined savings and investment results into a single list and sorted by inactivity.

# Challenges
Faced "No database selected" and “Lost connection” errors in MySQL Server Studio.

Resolved by selecting the default database and re-running.


# Question 4: Customer Lifetime Value (CLV) Estimation
The goal was to estimate each customer’s lifetime value based on how long they've had an account and their transaction volume.

How I solved it:

Calculated each user’s account tenure in months by finding the difference between signup date and today.

Counted total transactions for each customer.

Used a simplified CLV formula: (total_transactions / tenure) * 12 * avg_profit_per_transaction, assuming profit per transaction is 0.1% of transaction value.

Joined relevant tables and computed the estimated CLV for each customer.

Ordered customers by highest to lowest estimated CLV.

# Notes on Errors Encountered
Some queries required minor adjustments for compatibility with MySQL Server Studio.

Errors encountered during execution (e.g., lost connection).

Tables and column names were carefully checked to match the schema.

# Final Thoughts
This assessment gave me the opportunity to practice SQL queries involving joins, aggregates, filtering, and window functions. I believe the solutions provided meet the requirements and clearly demonstrate my thought process.
While I’m still growing my SQL and data analysis skills, I worked through the challenges independently and gained valuable hands-on experience. I'm comfortable working with real-world data, and I'm committed to continuous learning and improvement.
