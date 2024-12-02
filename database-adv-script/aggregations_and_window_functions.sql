--- Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause.

SELECT user_id
       u.first_name,
       u.last_name,
       COUNT(b_booking_id) AS total_bookings 
FROM bookings b 
JOIN users on b.user_id = u.user_id
GROUP BY user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


--- Query with ROW_NUMBER
SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    rank;

--- Query with RANK
SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM 
    properties p
LEFT JOIN 
    bookings b ON p.property_id = b.property_id
GROUP BY 
    p.property_id, p.name
ORDER BY 
    rank;

