-- Initial query: performance.sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    py.payment_id,
    py.amount,
    py.payment_method,
    py.payment_date
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments py ON b.booking_id = py.booking_id
WHERE 
    b.status = 'confirmed'
    AND b.start_date >= '2024-01-01' 
    AND b.end_date <= '2024-12-31'
ORDER BY 
    b.start_date DESC;


-- Analyze the query’s performance using EXPLAIN and identify any inefficiencies.
EXPLAIN
    SELECT 
        b.booking_id,
        b.start_date,
        b.end_date,
        b.total_price,
        b.status,
        u.user_id,
        u.first_name,
        u.last_name,
        u.email,
        p.property_id,
        p.name AS property_name,
        p.location,
        py.payment_id,
        py.amount,
        py.payment_method,
        py.payment_date
    FROM 
        bookings b
    JOIN 
        users u ON b.user_id = u.user_id
    JOIN 
        properties p ON b.property_id = p.property_id
    LEFT JOIN 
        payments py ON b.booking_id = py.booking_id
    WHERE 
        b.status = 'confirmed' AND
        b.start_date >= '2024-01-01' AND
        b.end_date <= '2024-12-31'
    ORDER BY 
        b.start_date DESC;

-- Refactor the query to reduce execution time, such as reducing unnecessary joins or using indexing

-- Add indexes 
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

-- Refactored query: performance.sql
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    py.amount,
    py.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments py ON b.booking_id = py.booking_id
WHERE 
    b.status = 'confirmed'
ORDER BY 
    b.start_date DESC;
 --

-- reanalyze the refactored query to measure the performance improvements
EXPLAIN
SELECT 
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.first_name,
    u.last_name,
    p.name AS property_name,
    py.amount,
    py.payment_method
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.user_id
JOIN 
    properties p ON b.property_id = p.property_id
LEFT JOIN 
    payments py ON b.booking_id = py.booking_id
WHERE 
    b.status = 'confirmed' AND
    b.start_date >= '2024-01-01' AND
    b.end_date <= '2024-12-31'
ORDER BY 
    b.start_date DESC;
