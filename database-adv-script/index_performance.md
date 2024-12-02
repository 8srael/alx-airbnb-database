## Task 3. Implement Indexes for Optimization

*Objective*: Identify and create indexes to improve query performance.


### Identify and create indexes to improve query performance.

Based on typical query patterns :

- User Table: email (often used for lookups or authentication).
- Booking Table: user_id, property_id, status (frequently used in WHERE, JOIN, or GROUP BY clauses).
- Property Table: location, pricepernight (used in filtering or sorting).