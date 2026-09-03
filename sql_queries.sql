-- Q1: Top 5 hours with highest average bike demand
SELECT hour, ROUND(AVG(rented_bike_count), 2) AS avg_bike_demand
FROM bike_data
GROUP BY hour
ORDER BY avg_bike_demand DESC
LIMIT 5;


-- Q2: Season with the highest total bike rentals
SELECT seasons, SUM(rented_bike_count) AS highest_bike_rentals
FROM bike_data
GROUP BY seasons
ORDER BY highest_bike_rentals DESC;


-- Q3: Compare average rentals on holidays and non-holidays
SELECT holiday, ROUND(AVG(rented_bike_count), 2) AS avg_bike_rented
FROM bike_data
GROUP BY holiday
ORDER BY avg_bike_rented DESC;


-- Q4: Analyze average rentals based on rainfall
SELECT
    CASE
        WHEN rainfall_mm = 0 THEN 'No Rain'
        WHEN rainfall_mm <= 5 THEN 'Light Rain'
        ELSE 'Heavy Rain'
    END AS rain_category,
    ROUND(AVG(rented_bike_count), 2) AS average_bike_rentals
FROM bike_data
GROUP BY rain_category
ORDER BY average_bike_rentals DESC;


-- Q5: Highest-demand combination of season and time category
SELECT
    seasons AS season,
    time_category,
    ROUND(AVG(rented_bike_count), 2) AS average_rentals
FROM bike_data
GROUP BY seasons, time_category
ORDER BY average_rentals DESC
LIMIT 1;