-- write your queries here
-- Q1
SELECT owners.id AS owner_id, owners.first_name, owners.last_name, 
vehicles.id AS vehicle_id, vehicles.make, vehicles.model, 
vehicles.year, vehicles.price, vehicles.owner_id
FROM owners
FULL OUTER JOIN vehicles
ON owners.id = vehicles.owner_id;

--Q2 
SELECT owners.first_name, owners.last_name, 
COUNT(vehicles.id) AS vehicle_count
FROM owners
LEFT JOIN vehicles
ON owners.id = vehicles.owner_id
GROUP BY owners.id
ORDER BY owners.first_name ASC;

--Q3 
SELECT owners.first_name, owners.last_name, 
COUNT(vehicles.id) AS vehicle_count, 
FLOOR(AVG(vehicles.price)) AS average_price
FROM owners
JOIN vehicles ON owners.id = vehicles.owner_id
GROUP BY owners.id
HAVING COUNT(vehicles.id) > 1 
AND AVG(vehicles.price) > 10000
ORDER BY owners.first_name DESC;