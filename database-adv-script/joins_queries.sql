
--- Query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT * FROM bookings INNER JOIN users on bookings.user_id == users.user_id

--- Query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT * FROM properties LEFT JOIN reviews on properties.property_id == reviews.property_id

--- Query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT * FROM users FULL OUTER JOIN bookings on users.user_id == bookings.user_id