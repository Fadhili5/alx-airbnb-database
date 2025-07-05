-- Create extensions for UUID generation if not exists
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Drop existing Booking table if exists
DROP TABLE IF EXISTS Booking CASCADE;

DROP TABLE IF EXISTS Booking_2022 CASCADE;
DROP TABLE IF EXISTS Booking_2023 CASCADE;

-- Implementing table partition to optimize queries on large datasets

CREATE TABLE Booking (
    booking_id SERIAL ,
    user_id UUID NOT NULL,
    property_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (booking_id, start_date)
) PARTITION BY RANGE(start_date);


-- Create range partitioned booking table
-- CREATE TABLE Booking_range (
--     booking_id SERIAL NOT NULL,
--     user_id UUID NOT NULL,
--     property_id UUID NOT NULL,
--     start_date DATE NOT NULL,
--     end_date DATE NOT NULL,
--     status VARCHAR(50) NOT NULL,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- ) PARTITION BY RANGE(start_date);

-- Measuring query performance before partitioning
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2022-06-01' AND '2022-06-30';



-- Create Partitions
CREATE TABLE Booking_2022 PARTITION OF Booking FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 Partition of Booking FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

--  Generating large datasets for testing
DO $$ BEGIN FOR i IN 1..1000000 LOOP INSERT INTO Booking (user_id, property_id, start_date, end_date, status) VALUES ( uuid_generate_v4(), uuid_generate_v4(), DATE '2022-01-01' + (RANDOM() * 730)::INT, DATE '2022-01-01' + (RANDOM() * 730)::INT + 3, 'confirmed' ); END LOOP; END $$;

--  Ensuring indexes are created to optimize searching
CREATE INDEX idx_booking_user_id ON Booking USING btree(user_id);
CREATE INDEX idx_booking_property_id ON Booking USING btree(property_id);


-- -- Insert data into partitioned table
-- INSERT INTO Booking(booking_id, user_id, property_id, start_date, end_date, status, created_at )
-- SELECT booking_id, user_id, property_id, start_date, end_date, status, created_at
-- FROM Booking;

-- Measuring query performance after partitioning
EXPLAIN ANALYZE
SELECT * FROM Booking WHERE start_date BETWEEN '2022-06-01' AND '2022-06-30';