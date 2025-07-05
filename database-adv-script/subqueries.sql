--Non-correlated subquery is one that can be executed independently of the outer query

-- Non-correlated subquery to find all properties where the average rating is greater than 4.0
SELECT property_id, name, description, location, price_per_night
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);


-- Correlated subquery is one that uses values from the outer query ;it is executed repeatedly for each row processed by the outer query.

-- Correlated subquery to find users who made more than 3 bookings
SELECT user_id, first_name, last_name, email
FROM "User" AS u 
WHERE (
    SELECT COUNT(*)
    FROM Booking AS b
    WHERE b.user_id = u.user_id
) > 3;
