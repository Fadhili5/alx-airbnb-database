## Implementing Indexes for optimization

Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql

Measure the query performance before and after adding indexes using EXPLAIN or ANALYZE.

#### The high usage columns include:
1. **User table**
    - `user_id` : Which is used in the JOIN clauses connect bookings and properties.
    - `email` : Used in JOIN clauses with the property table.
    - `start_date` and `end_date` : Used in the WHERE clauses to filter bookings by date range.


2. **Booking table**
    - `booking_id` : Used in retrieving and updating bookings.
    - `user_id` : Used in JOIN clauses with the User table.
    - `property_id` : Used in JOIN clauses with the property table.
    - `start_date` and `end_date` : Used in WHERE clauses to filter bookings by date range.


3. **Property table**
    - `property_id` : Used in JOIN clauses to retrieve property details.
    - `host_id` : Used in JOIN clauses with the User table.
    - `location` : Used in WHERE clauses for location-based filtering.