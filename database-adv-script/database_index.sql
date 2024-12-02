-- User Table: Index on email for quick lookups
CREATE UNIQUE INDEX idx_user_email ON users(email);

-- Booking Table: Index on user_id and property_id for JOIN operations
CREATE INDEX idx_booking_user_id ON bookings(user_id);
CREATE INDEX idx_booking_property_id ON bookings(property_id);

-- Booking Table: Index on status for filtering
CREATE INDEX idx_booking_status ON bookings(status);

-- Property Table: Index on location for filtering by location
CREATE INDEX idx_property_location ON properties(location);

-- Property Table: Index on pricepernight for sorting
CREATE INDEX idx_property_price ON properties(pricepernight);

-- Performance Measurement: Explain and Analyze

-- Example Query 1: Filter bookings by user_id
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 'some-user-id';

-- Example Query 2: Join bookings and properties
EXPLAIN ANALYZE
SELECT b.booking_id, p.name
FROM bookings b
JOIN properties p ON b.property_id = p.property_id
WHERE b.status = 'confirmed';
