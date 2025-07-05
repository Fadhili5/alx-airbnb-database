-- SQL `CREATE INDEX` commands to create appropriate indexes for columns.

-- Measuring query performance before indexing
EXPLAIN ANALYZE SELECT user_id, COUNT(booking_id) AS total_bookings FROM Booking GROUP BY user_id;
EXPLAIN ANALYZE SELECT property_id, total_bookings, RANK() OVER (ORDER BY total_bookings DESC) AS rank FROM (SELECT property_id, COUNT(booking_id) AS total_bookings FROM Booking GROUP BY property_id) AS property_bookings;

-- User table
CREATE INDEX idx_user_user_id ON "User"(user_id);
CREATE INDEX idx_user_email ON "User"(email);

-- Booking table
CREATE INDEX idx_booking_booking_id ON Booking(booking_id);
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_start_date ON Booking(start_date);
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Property table
CREATE INDEX idx_property_property_id ON Property(property_id);
CREATE INDEX idx_property_host_id ON Property(host_id);
CREATE INDEX idx_property_location ON Property(location);


-- Measuring Query Performance after indexing
EXPLAIN ANALYZE SELECT user_id, COUNT(booking_id) AS total_bookings FROM Booking GROUP BY user_id;
EXPLAIN ANALYZE SELECT property_id, total_bookings, RANK() OVER (ORDER BY total_bookings DESC) AS rank FROM (SELECT property_id, COUNT(booking_id) AS total_bookings FROM Booking GROUP BY property_id) AS property_bookings;

