# cricket-sql-analysis
SQL-based analysis of cricket batting data across ODI, T20, and Test formats with insights, rankings, and comparisons.
# 🏏 Cricket SQL Analysis  

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)  
![Status](https://img.shields.io/badge/Status-Completed-green)  
![Sports](https://img.shields.io/badge/Domain-Cricket-orange)  

## 📌 Overview  
This project focuses on analyzing **cricket batting statistics** across three major formats – **ODI, T20, and Test** – using **SQL**.  
By running structured queries, the project uncovers meaningful insights into player performances, rankings, and comparisons.  

## 🔍 Key Insights & Queries  
- **Top performers** – runs, averages, strike rates, hundreds, fifties.  
- **Comparisons** – Virat Kohli vs Rohit Sharma, Kohli vs Steve Smith, and more.  
- **Unique stats** – players with 10,000+ runs, zero ducks, highest strike rates.  
- **Ranking queries** – ranking by runs, averages, hundreds, fifties, strike rates.  
- **Cross-format analysis** – comparing players across ODI, T20, and Test matches.  
- **Performance Index** – calculated impact scores to measure overall effectiveness.  

## ⚡ Example Queries  

```sql
-- Top 10 ODI Run Scorers
SELECT Player, Runs 
FROM odi_data
ORDER BY Runs DESC
LIMIT 10;

-- Compare ODI vs T20 Strike Rates
SELECT o.Player, o.SR AS ODI_SR, t.SR AS T20_SR
FROM odi_data o
JOIN t20 t ON o.Player = t.Player
ORDER BY (o.SR + t.SR) DESC;
