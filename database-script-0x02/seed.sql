--- Some data to seed the database

INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('uuid1', 'Alice', 'Dupont', 'alice@example.com', 'hashed_password1', '0123456789', 'admin', CURRENT_TIMESTAMP),
('uuid2', 'Bob', 'Martin', 'bob@example.com', 'hashed_password2', '0987654321', 'host', CURRENT_TIMESTAMP),
('uuid3', 'Charlie', 'Durand', 'charlie@example.com', 'hashed_password3', NULL, 'guest', CURRENT_TIMESTAMP);

INSERT INTO properties (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('property1', 'uuid2', 'Maison en bord de mer', 'Belle maison avec vue sur la mer', 'Nice, France', 120.50, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('property2', 'uuid2', 'Chalet à la montagne', 'Chalet confortable pour ski et randonnées', 'Chamonix, France', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('property3', 'uuid2', 'Studio en ville', 'Studio moderne proche des commerces', 'Lyon, France', 75.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('booking1', 'property1', 'uuid3', '2024-12-01', '2024-12-07', 723.00, 'confirmed', CURRENT_TIMESTAMP),
('booking2', 'property2', 'uuid3', '2024-12-15', '2024-12-20', 1000.00, 'pending', CURRENT_TIMESTAMP),
('booking3', 'property3', 'uuid3', '2024-12-10', '2024-12-12', 150.00, 'canceled', CURRENT_TIMESTAMP);

INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('payment1', 'booking1', 723.00, CURRENT_TIMESTAMP, 'credit_card'),
('payment2', 'booking2', 1000.00, CURRENT_TIMESTAMP, 'paypal'),
('payment3', 'booking3', 150.00, CURRENT_TIMESTAMP, 'stripe');

INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at) VALUES
('review1', 'property1', 'uuid3', 5, 'Super séjour, très agréable et propre.', CURRENT_TIMESTAMP),
('review2', 'property2', 'uuid3', 4, 'Beau chalet, mais un peu cher.', CURRENT_TIMESTAMP),
('review3', 'property3', 'uuid3', 3, 'Studio bien situé, mais bruyant.', CURRENT_TIMESTAMP);

INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('message1', 'uuid3', 'uuid2', 'Bonjour, est-ce que votre propriété est disponible pour Noël ?', CURRENT_TIMESTAMP),
('message2', 'uuid2', 'uuid3', 'Bonjour, oui, elle est encore disponible !', CURRENT_TIMESTAMP),
('message3', 'uuid3', 'uuid2', 'Merci, je vais réserver dès que possible.', CURRENT_TIMESTAMP);