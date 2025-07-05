-- INNER JOIN to retrieve all bookings and the respective users who made the bookings

SELECT Booking.booking_id, Booking.property_id, Booking.start_date, Booking.end_date, Booking.total_price, Booking.status, "User".user_id, "User".last_name, "User".email
FROM Booking
INNER JOIN "User" ON Booking.user_id = "User".user_id;

-- LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.
SELECT Property.property_id, Property.name, Property.description, Property.location, Property.price_per_night, Review.review_id, Review.rating, Review.comment
FROM Property
LEFT JOIN Review ON Property.property_id = Review.property_id;

-- FULL OUTER JOIN to retrieve all users and all bookings ,even if user has no booking or a booking is not linked to a user. - Returns all rows when there is a match in either table, Returns NULL for unmatched rows in either table.
SELECT "User".user_id, "User".first_name, "User".last_name, "User".email, Booking.booking_id, Booking.property_id, Booking.start_date, Booking.end_date, Booking.total_price, Booking.status
FROM "User"
FULL OUTER JOIN Booking ON "User".user_id = Booking.user_id;