-- partitioning.sql

-- 1. Create the main table as a partitioned table.

-- 2. Create the table with RANGE partitioning on start_date.
-- partitioning.sql

-- 1. Créer la table principale partitionnée.
CREATE TABLE bookings (
    booking_id CHAR(36) NOT NULL,
    property_id CHAR(36) NOT NULL,
    user_id CHAR(36) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION p2025 VALUES LESS THAN (2026),
);

-- 2. performance test with EXPALIN
EXPLAIN SELECT * 
    FROM bookings
        WHERE start_date BETWEEN '2024-06-01' AND '2024-06-30';

