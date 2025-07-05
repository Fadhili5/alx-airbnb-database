-- USING SQL AGGREGATION AND WINDOW FUNCTIONS TO ANALYZE DATA


-- Query to find the total number of bookings made by each user, using the COUNT function and GROUP BY clause
SELECT user_id, COUNT(booking_id) AS total_booking
FROM Booking
GROUP BY user_id;


-- Use a window function (ROW_NUMBER, RANK) to rank properties based on the total number of bookings they have received.
SELECT property_id, total_bookings, ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS row_number_rank, RANK() OVER (ORDER BY total_bookings DESC) AS rank_position
FROM(
    SELECT property_id, COUNT(booking_id) AS total_bookings
    FROM Booking
    GROUP BY property_id
) AS property_bookings;