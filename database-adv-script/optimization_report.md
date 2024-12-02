## Task 4. Optimize Complex Queries


1. Initial Query in `database-adv-script/performance.sql`
```sql
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
    ORDER BY 
        b.start_date DESC;
```

2. Query analysis with `EXPLAIN`
```sql
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
        b.status = 'confirmed'
    ORDER BY 
        b.start_date DESC;
```

After `EXPLAIN`, some problems may be identified:

- Sequential scans on large tables instead of index scans.
- Unnecessary joins that pull redundant or unused data.
- Sorting bottlenecks if the ORDER BY clause lacks proper indexing.


3. Refactor the Query : steps to optimize 

    1. Ensure Indexing
        - Add indexes on high-used columns (eg. status, user_id, property_id, ...). 
        ```sql
            CREATE INDEX idx_bookings_status ON bookings(status);
            CREATE INDEX idx_bookings_user_id ON bookings(user_id);
            CREATE INDEX idx_bookings_property_id ON bookings(property_id);
            CREATE INDEX idx_payments_booking_id ON payments(booking_id);'
        ```

    2. Reduce columns
        - Fetch only the required columns instead of all columns( ```SELECT *```).
    
    3. Optimize Joins
        - Use joins only when necessary and avoid fetching unused data.

    4. Refactory Query
    ```sql
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
            b.status = 'confirmed'
        ORDER BY 
            b.start_date DESC;
    ```

    5. Comments after Refactoring
        - Faster response time due to index usage.
        - Reduced number of rows scanned because of fewer columns fetched.
        - Better sorting efficiency in ORDER BY.
