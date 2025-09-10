use sports ;
SELECT* FROM odi_data ;
SELECT* FROM t20 ;
SELECT* FROM test ;

-- ODI DATA
SELECT player FROM odi_data ;
SELECT count(player) FROM odi_data ;

select player ,mat FROM odi_data
where mat >= "100" ;

-- Top 10 run scorers
SELECT Player, Runs FROM odi_data
ORDER BY Runs 
DESC LIMIT 10;

SELECT Player, Runs 
FROM odi_data
ORDER BY Runs DESC
LIMIT 5;

SELECT Player, Ave, Runs
FROM odi_data
WHERE Ave > 50 AND Runs > 2000
ORDER BY Ave DESC;

SELECT Player, hundreds 
FROM odi_data
ORDER BY hundreds DESC
LIMIT 10;


-- top  10 Player with highest individual score
SELECT Player, HS
FROM odi_data
ORDER BY CAST(REPLACE(HS, '*', '') AS UNSIGNED) DESC
LIMIT 10;

SELECT Player, hundreds
FROM odi_data
ORDER BY hundreds DESC
LIMIT 5;

--  Top 5 players with the most fifties in ODI
SELECT Player, fiftys
FROM odi_data
ORDER BY fiftys DESC
LIMIT 5;

--  Players who scored more than 10,000 runs but with average less than 45
SELECT Player, Runs, Ave
FROM odi_data
WHERE Runs > 10000 AND Ave < 45
ORDER BY Runs DESC;

--  Top 10 players with the best strike rate (min 2000 balls faced)
SELECT Player, SR, BF
FROM odi_data
WHERE BF > 2000
ORDER BY SR DESC
LIMIT 10;

--  Players with the most ducks in ODI
SELECT Player, duck
FROM odi_data
ORDER BY duck DESC
LIMIT 10;
-- Players with average above 50 and 100+ innings
SELECT Player, Ave , inns FROM odi_data
WHERE Ave > 50 and inns > 100
order by ave desc;

--  Top 10 strike rates
SELECT Player, SR FROM odi_data
ORDER BY SR DESC LIMIT 10;

--  Players with 10,000+ runs
SELECT Player, Runs FROM odi_data 
WHERE Runs > 10000;

--  Player with most centuries
SELECT Player, hundreds FROM odi_data 
ORDER BY hundreds DESC 
LIMIT 1;

--  Player with most fifties
SELECT Player, fiftys FROM odi_data 
ORDER BY fiftys DESC 
LIMIT 10;

--  Player with most ducks
SELECT Player, duck FROM odi_data  
ORDER BY duck DESC 
LIMIT 1;

--  Players with zero ducks
SELECT Player FROM odi_data 
WHERE duck = 0;

--  Top 5 run scorers with averages
SELECT Player, Runs, Ave FROM odi_data ORDER BY Runs DESC LIMIT 5;

--  Players with 20+ hundreds and 50+ fifties
SELECT Player, hundreds, fiftys 
FROM odi_data 
WHERE hundreds >= 20 AND fiftys >= 50;

--  Rank ODI players by runs
SELECT Player, Runs,
       RANK() OVER (ORDER BY Runs DESC) AS run_rank
FROM odi_data;

--  Rank ODI players by batting average
SELECT Player, Ave,
       RANK() OVER (ORDER BY Ave DESC) AS avg_rank
FROM odi_data;

--  Rank ODI players by strike rate
SELECT Player, SR,
       RANK() OVER (ORDER BY SR DESC) AS sr_rank
FROM odi_data;

--  Rank ODI players by hundreds
SELECT Player, hundreds,
       RANK() OVER (ORDER BY hundreds DESC) AS hundred_rank
FROM odi_data;

--  Rank ODI players by fifties
SELECT Player, fiftys,
       RANK() OVER (ORDER BY fiftys DESC) AS fifty_rank
FROM odi_data;

--  Rank ODI players by ducks
SELECT Player, duck,
       RANK() OVER (ORDER BY duck DESC) AS duck_rank
FROM odi_data;

--  Rank ODI players by balls faced
SELECT Player, BF,
       RANK() OVER (ORDER BY BF DESC) AS bf_rank
FROM odi_data;

--  Rank ODI players by runs per match
SELECT Player, Runs/Mat AS runs_per_match,
       RANK() OVER (ORDER BY Runs/Mat DESC) AS rpm_rank
FROM odi_data;

--  Rank ODI players by highest score
SELECT Player, HS,
       RANK() OVER (ORDER BY CAST(REPLACE(HS,'*','') AS UNSIGNED) DESC) AS hs_rank
FROM odi_data;


--  Runs-per-match ratio
SELECT Player, (Runs*1.0 / Mat) AS runs_per_match FROM odi_data;

--  Highest SR among 5000+ run players
SELECT Player, Runs, SR FROM odi_data 
WHERE Runs > 5000 
ORDER BY SR DESC LIMIT 1;

--  Players with more duck than hundreds
SELECT Player, hundreds, duck FROM odi_data 
WHERE duck > hundreds;

--  Player with best average
SELECT Player, Ave FROM odi_data 
ORDER BY Ave DESC 
LIMIT 1;

-- Compare Virat Kohli & Rohit Sharma in odis
SELECT * FROM odi_data 
WHERE Player IN ('V Kohli (INDIA)','RG Sharma (INDIA)');

-- Batting Performance index in odi
SELECT Player, (Runs + (hundreds*50) + (fiftys*25) - (duck*10)) AS performance_index 
FROM odi_data 
ORDER BY performance_index DESC;

-- t20

--  List all players
SELECT Player FROM t20;

--  Count total players
SELECT COUNT(DISTINCT Player) AS total_players FROM t20;

--  Find players with 50+ matches
SELECT Player, Mat FROM t20 
WHERE Mat > 50;

--  Top 10 run scorers
SELECT Player, Runs FROM t20 
ORDER BY Runs DESC 
LIMIT 10;

--  Player with highest HS
SELECT Player, HS FROM t20 
ORDER BY CAST(REPLACE(HS, '*', '') AS UNSIGNED)
DESC LIMIT 1;

--  Players with SR > 150
SELECT Player, SR FROM t20 
WHERE SR > 150;

--  Players with average > 40
SELECT Player, Ave FROM t20 
WHERE Ave > 40;

--  Player with most sixes
SELECT Player, sixes FROM t20 
ORDER BY sixes DESC 
LIMIT 1;

-- Player with most fours
SELECT Player, fours FROM t20 
ORDER BY fours
DESC LIMIT 1;

-- Top 10 strike rates
SELECT Player, SR FROM t20 
ORDER BY SR DESC 
LIMIT 10;

-- Players with 2000+ runs
SELECT Player, Runs FROM t20 
WHERE Runs > 2000;

--  Player with most hundreds
SELECT Player, hundreds FROM t20 
ORDER BY hundreds DESC 
LIMIT 1;

--  Player with most fifties
SELECT Player, fiftys FROM t20 
ORDER BY fiftys 
DESC LIMIT 1;

--  Top 10 run scorers in T20
SELECT Player, Runs
FROM t20
ORDER BY Runs DESC
LIMIT 10;

--  Players with batting average above 40 and more than 1500 runs
SELECT Player, Runs, Ave
FROM t20
WHERE Ave > 40 AND Runs > 1500
ORDER BY Ave DESC;

-- Highest individual score in T20
SELECT Player, HS
FROM t20
ORDER BY CAST(REPLACE(HS, '*', '') AS UNSIGNED) DESC
LIMIT 1;

--  Players with most hundreds in T20
SELECT Player, hundreds
FROM t20
ORDER BY hundreds DESC
LIMIT 10;

--  Players with most fifties in T20
SELECT Player, fiftys
FROM t20
ORDER BY fiftys DESC
LIMIT 10;

--  Top 10 players with best strike rate (min 500 balls faced)
SELECT Player, SR, BF
FROM t20
WHERE BF > 500
ORDER BY SR DESC
LIMIT 10;

--  Players with most sixes in T20
SELECT Player, sixes
FROM t20
ORDER BY sixes DESC
LIMIT 10;

--  Players with most fours in T20
SELECT Player, fours
FROM t20
ORDER BY fours DESC
LIMIT 10;

--  Players with the most ducks in T20
SELECT Player, duck
FROM t20
ORDER BY duck DESC
LIMIT 10;

--  Player with most ducks
SELECT Player, duck FROM t20
ORDER BY duck DESC 
LIMIT 1;

--  Rank T20 players by runs
SELECT Player, Runs,
       RANK() OVER (ORDER BY Runs DESC) AS run_rank
FROM t20;

--  Rank T20 players by batting average
SELECT Player, Ave,
       RANK() OVER (ORDER BY Ave DESC) AS avg_rank
FROM t20;

--  Rank T20 players by strike rate
SELECT Player, SR,
       RANK() OVER (ORDER BY SR DESC) AS sr_rank
FROM t20;

-- Rank T20 players by hundreds
SELECT Player, hundreds,
       RANK() OVER (ORDER BY hundreds DESC) AS hundred_rank
FROM t20;

--  Rank T20 players by fifties
SELECT Player, fiftys,
       RANK() OVER (ORDER BY fiftys DESC) AS fifty_rank
FROM t20;

--  Rank T20 players by ducks
SELECT Player, duck,
       RANK() OVER (ORDER BY duck DESC) AS duck_rank
FROM t20;

--  Rank T20 players by sixes
SELECT Player, sixes,
       RANK() OVER (ORDER BY sixes DESC) AS six_rank
FROM t20;

--  Rank T20 players by fours
SELECT Player, fours,
       RANK() OVER (ORDER BY fours DESC) AS four_rank
FROM t20;

--  Rank T20 players by runs per match
SELECT Player, Runs/Mat AS runs_per_match,
       RANK() OVER (ORDER BY Runs/Mat DESC) AS rpm_rank
FROM t20;

--  Runs-per-match ratio
SELECT Player, (Runs*1.0 / Mat) AS runs_per_match FROM t20;

--  Sixes-per-match ratio
SELECT Player, (sixes*1.0 / Mat) AS sixes_per_match FROM t20
ORDER BY sixes_per_match desc;

--  Boundary percentage
SELECT Player, round(((fours + sixes)*1.0 / Inns),2)AS boundary_per_innings FROM t20 
WHERE Inns > 0
order by boundary_per_innings desc;

--  Highest SR among 1000+ run players
SELECT Player, SR, Runs FROM t20 
WHERE Runs > 1000 
ORDER BY SR DESC 
LIMIT 1;

--  Compare Rohit Sharma & David Warner in t20
SELECT * FROM t20 
WHERE Player IN ('RG Sharma (INDIA)','DA Warner (AUS)');

-- Performance index
SELECT Player, (Runs + (sixes*10) + (fours*5) + (hundreds*50) +(fiftys*25) - (duck*10)) AS performance_index 
FROM t20 
ORDER BY performance_index DESC;

-- Test 

--  List all players
SELECT Player FROM test;

--  Count total players
SELECT COUNT(DISTINCT Player) AS total_players FROM test;

--  Find players with 100+ matches
SELECT Player, Mat FROM test
 WHERE Mat > 100;
 
-- Top 10 run scorers
SELECT Player, Runs FROM test 
ORDER BY Runs DESC 
LIMIT 10;

--  Player with highest HS
SELECT Player, HS FROM test 
ORDER BY HS DESC 
LIMIT 1;

--  Players with average > 50
SELECT Player, Ave FROM test 
WHERE Ave > 50;

--  Top 10 run scorers in Test cricket
SELECT Player, Runs
FROM test
ORDER BY Runs DESC
LIMIT 10;

--  Players with batting average above 50 and more than 5000 runs
SELECT Player, Runs, Ave
FROM test
WHERE Ave > 50 AND Runs > 5000
ORDER BY Ave DESC;

--  Highest individual score in Test cricket
SELECT Player, HS
FROM test
ORDER BY CAST(REPLACE(HS, '*', '') AS UNSIGNED) DESC
LIMIT 1;

--  Players with the most hundreds in Tests
SELECT Player, hundreds
FROM test
ORDER BY hundreds DESC
LIMIT 10;

--  Players with the most fifties in Tests
SELECT Player, fiftys
FROM test
ORDER BY fiftys DESC
LIMIT 10;

--  Players with most ducks in Test cricket
SELECT Player, duck
FROM test
ORDER BY duck DESC
LIMIT 10;

--  Players with the highest runs per innings ratio
SELECT Player, Runs/Inns AS runs_per_innings
FROM test
WHERE Inns > 50
ORDER BY runs_per_innings DESC
LIMIT 10;

-- Players with 7000+ runs
SELECT Player, Runs FROM test 
WHERE Runs > 7000;

--   Rank Test players by runs
SELECT Player, Runs,
       RANK() OVER (ORDER BY Runs DESC) AS run_rank
FROM test;

--  Rank Test players by batting average
SELECT Player, Ave,
       RANK() OVER (ORDER BY Ave DESC) AS avg_rank
FROM test;

--  Rank Test players by hundreds
SELECT Player, hundreds,
       RANK() OVER (ORDER BY hundreds DESC) AS hundred_rank
FROM test;

--  Rank Test players by fifties
SELECT Player, fiftys,
       RANK() OVER (ORDER BY fiftys DESC) AS fifty_rank
FROM test;

--  Rank Test players by ducks
SELECT Player, duck,
       RANK() OVER (ORDER BY duck DESC) AS duck_rank
FROM test;

--  Rank Test players by runs per innings
SELECT Player, Runs/Inns AS runs_per_innings,
       RANK() OVER (ORDER BY Runs/Inns DESC) AS rpi_rank
FROM test
WHERE Inns > 20;

--  Rank Test players by highest score
SELECT Player, HS,
       RANK() OVER (ORDER BY CAST(REPLACE(HS,'*','') AS UNSIGNED) DESC) AS hs_rank
FROM test;

--  Rank Test players by career span
SELECT Player, Span,
       RANK() OVER (ORDER BY (CAST(RIGHT(Span,4) AS UNSIGNED) - CAST(LEFT(Span,4) AS UNSIGNED)) DESC) AS span_rank
FROM test;

--  Rank Test players with more than 3000 runs by average
SELECT Player, Ave,
       RANK() OVER (ORDER BY Ave DESC) AS avg_rank
FROM test
WHERE Runs > 3000;

--  Rank Test players by matches played
SELECT Player, Mat,
       RANK() OVER (ORDER BY Mat DESC) AS mat_rank
FROM test;

--  Player with most centuries
SELECT Player, hundreds FROM test 
ORDER BY hundreds DESC 
LIMIT 1;

--  Player with most fifties
SELECT Player, fiftys FROM test 
ORDER BY fiftys 
DESC LIMIT 1;

--  Player with most ducks
SELECT Player, duck FROM test 
ORDER BY duck 
DESC LIMIT 1;

--  Players with zero ducks
SELECT Player FROM test 
WHERE duck = 0;

--  Top 10 Player with most 50+ scores
SELECT Player, (hundreds + fiftys) AS fifty_plus FROM test 
ORDER BY fifty_plus DESC 
LIMIT 10;

-- Player with highest runs-per-match ratio
SELECT Player, (Runs*1.0 / Mat) AS runs_per_match FROM test 
ORDER BY runs_per_match DESC 
LIMIT 1;

--  Players with more centuries than ducks
SELECT Player, hundreds, duck FROM test 
WHERE hundreds > duck;

--  Top 5 averages among 50+ match players
SELECT Player, Ave FROM test 
WHERE Mat > 50 
ORDER BY Ave DESC 
LIMIT 5;

--  Players with career span > 15 years
SELECT Player, Span
FROM test
WHERE (CAST(SUBSTRING(Span, 6, 4) AS UNSIGNED) - CAST(LEFT(Span, 4) AS UNSIGNED)) > 15 
ORDER BY (CAST(SUBSTRING(Span, 6, 4) AS UNSIGNED) - CAST(LEFT(Span, 4) AS UNSIGNED)) DESC;


--  Compare averages of Virat Kohli & Steve Smith
SELECT Player, Ave FROM test 
WHERE Player IN ('V kohli (INDIA)','SPD Smith (AUS)');

--  Player with best average overall
SELECT Player, Ave FROM test 
ORDER BY Ave DESC 
LIMIT 1;

--  Player with  200+ scores 
SELECT Player, HS FROM test 
WHERE HS >= 200 
ORDER BY HS DESC;

--  Performance index
SELECT Player, (Runs + (hundreds*50) + (fiftys*25) - (duck*10)) AS performance_index 
FROM test 
ORDER BY performance_index DESC;

-- players in all three formats
SELECT o.Player
FROM odi_data o
JOIN t20 t ON o.Player = t.Player
JOIN test te ON o.Player = te.Player;

-- Players in ODI + T20 but NOT Test
select distinct o.player
from odi_data o
join t20 t on o.player = t.player
left join test te on o.player = te.player 
where te.player IS NULL ;

-- PLAYERS IN TEST only
SELECT te.player 
FROM test te
LEFT JOIN t20 t on te.player = t.player
LEFT JOIN odi_data o on te.player = o.player
WHERE o.player IS NULL 
AND t.player IS NULL;

-- Compare ODI vs Test runs for players who appear in both

SELECT o.Player, o.Runs AS odi_runs, te.Runs AS test_runs
FROM odi_data o
JOIN test te ON o.Player = te.Player
ORDER BY (o.Runs + te.Runs) DESC;

-- Compare ODI vs T20 SR for players in both

SELECT o.player ,o.SR as ODI_SR ,t.SR AS T20_SR ,(o.sr + t.sr) as Combine_sr
FROM odi_data o
JOIN t20 t ON o.player = t.player
ORDER BY (o.sr + t.sr ) DESC ;

-- Players with Ave > 50 in both ODI and Test

SELECT o.Player, o.Ave AS odi_ave, te.Ave AS test_ave ,t.ave AS T20_ave
FROM odi_data o
JOIN test te ON o.Player = te.Player
JOIN t20 t ON o.player = t.player
WHERE o.Ave > 50 AND te.Ave > 50 AND t.ave > 50;

-- Players with 100+ sixes in T20  and 5000+ ODI runs
SELECT t.Player, t.sixes, o.Runs as ODI_runs
FROM t20 t
JOIN odi_data o ON t.Player = o.Player
WHERE t.sixes > 100 AND o.Runs >= 5000;


-- Rohit Sharma’s runs across formats
SELECT 'ODI' AS fmt, Runs FROM odi_data WHERE Player = 'RG Sharma (INDIA)'
UNION ALL
SELECT 'T20', Runs FROM t20 WHERE Player = 'RG Sharma (INDIA)'
UNION ALL
SELECT 'TEST', Runs FROM test WHERE Player = 'RG Sharma (INDIA)';

-- Rank players by sum of averages across formats
SELECT Player, 
       (COALESCE(odi_ave,0) + COALESCE(t20_ave,0) + COALESCE(test_ave,0)) AS sum_aves
FROM (
    SELECT Player,
           (SELECT AVG(Ave) FROM odi_data WHERE odi_data.Player = p.Player) AS odi_ave,
           (SELECT AVG(Ave) FROM t20 WHERE t20.Player = p.Player) AS t20_ave,
           (SELECT AVG(Ave) FROM test WHERE test.Player = p.Player) AS test_ave
    FROM (
        SELECT Player FROM odi_data
        UNION 
        SELECT Player FROM t20
        UNION 
        SELECT Player FROM test
    ) p
) s
ORDER BY sum_aves DESC
LIMIT 50;

-- Top 10 in ODI SR but with runs above ODI average
SELECT Player, Runs, SR
FROM odi_data
WHERE Runs > (SELECT AVG(Runs) FROM odi_data)
ORDER BY SR DESC
LIMIT 10;

-- Top 5 Players with Highest Batting Average Across All Formats
SELECT Player, 
       AVG(Ave) AS overall_avg
FROM (
   SELECT Player, Ave FROM odi_data
   UNION ALL
   SELECT Player, Ave FROM t20
   UNION ALL
   SELECT Player, Ave FROM test
) stats
GROUP BY Player
ORDER BY overall_avg DESC
LIMIT 5;

-- Players Who Scored More Than 10,000 Runs in Total (Across Formats)
SELECT Player, SUM(Runs) AS total_runs
FROM (
   SELECT Player, Runs FROM odi_data
   UNION ALL
   SELECT Player, Runs FROM t20
   UNION ALL
   SELECT Player, Runs FROM test
) all_stats
GROUP BY Player
HAVING total_runs > 10000
ORDER BY total_runs DESC;

-- Players with Highest Hundreds-to-Matches Ratio (All Formats)
SELECT Player, 
       SUM(Centuries) / SUM(Mat) AS hundred_ratio
FROM (
   SELECT Player, hundreds AS Centuries, Mat FROM odi_data
   UNION ALL
   SELECT Player, hundreds, Mat FROM t20
   UNION ALL
   SELECT Player, hundreds, Mat FROM test
) s
GROUP BY Player
ORDER BY hundred_ratio DESC ;

-- Compare Sachin Tendulkar’s Runs Across All Formats
SELECT 'ODI' AS format, Runs FROM odi_data WHERE Player = 'SR Tendulkar (INDIA)'
UNION
SELECT 'T20', Runs FROM t20 WHERE Player = 'SR Tendulkar (INDIA)'
UNION
SELECT 'Test', Runs FROM test WHERE Player = 'SR Tendulkar (INDIA)';

-- Rank players by total runs within each format
SELECT Player, Runs, 'ODI' AS Format,
       RANK() OVER (PARTITION BY 'ODI' ORDER BY Runs DESC) AS run_rank
FROM odi_data
UNION
SELECT Player, Runs, 'T20' AS Format,
       RANK() OVER (PARTITION BY 'T20' ORDER BY Runs DESC)
FROM t20
UNION
SELECT Player, Runs, 'Test' AS Format,
       RANK() OVER (PARTITION BY 'Test' ORDER BY Runs DESC)
FROM test;
-- Find top 3 run scorers for each format
SELECT Player, Runs, Format, run_rank
FROM (
    SELECT Player, Runs, 'ODI' AS Format,
           RANK() OVER (ORDER BY Runs DESC) AS run_rank
    FROM odi_data
    UNION ALL
    SELECT Player, Runs, 'T20',
           RANK() OVER (ORDER BY Runs DESC)
    FROM t20
    UNION ALL
    SELECT Player, Runs, 'Test',
           RANK() OVER (ORDER BY Runs DESC)
    FROM test
) ranked
WHERE run_rank <= 3;

-- 	Rank Test players by batting average (min 3000 runs)
SELECT Player, Ave, Runs,
       RANK() OVER (ORDER BY Ave DESC) AS avg_rank
FROM test
WHERE Runs > 3000;

-- Within ODI, rank players by hundreds
SELECT Player, hundreds,
       DENSE_RANK() OVER (ORDER BY hundreds DESC) AS hundred_rank
FROM odi_data;