-- Query that retrieves all bookings along with user details, property details and payment details.

SELECT
    b.booking_id,
    b.property_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.price_per_night AS property_price_per_night,
    pay.amount AS payment_amount,
    pay.payment_date AS payment_date,
    pay.payment_method AS payment_method
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
JOIN Payment pay ON b.booking_id = pay.booking_id;


--Analyzing query's performance using EXPLAIN and identify any inefficiencies
EXPLAIN SELECT
    b.booking_id,
    b.property_id,
    b.user_id,
    b.start_date,
    b.end_date,
    b.total_price AS booking_total_price,
    b.status AS booking_status,
    u.first_name AS user_first_name,
    u.last_name AS user_last_name,
    u.email AS user_email,
    p.name AS property_name,
    p.description AS property_description,
    p.location AS property_location,
    p.price_per_night AS property_price_per_night,
    pay.amount AS payment_amount,
    pay.payment_date AS payment_date,
    pay.payment_method AS payment_method
FROM Booking b
JOIN "User" u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
LEFT JOIN Payment pay ON b.booking_id = pay.booking_id; -- includes bookings that might not have payment details yet


-- Refactor query to reduce execution time and improve performance

-- Checking if necessary indexes are created
CREATE INDEX IF NOT EXISTS idx_booking_user_id ON Booking(user_id);
CREATE INDEX IF NOT EXISTS idx_booking_property_id ON Booking(property_id);
CREATE INDEX IF NOT EXISTS idx_payment_booking_id ON Payment(booking_id);