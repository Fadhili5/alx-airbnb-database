-- =================================================================================
-- SQL script to seed the Airbnb database with realistic sample data.
-- After execuring the schema.sql run this script.
-- =================================================================================
-- I used https://www.uuidgenerator.net/ to generate UUIDs for the IDs.Alternatively postgres can generate them automatically.
-- =================================================================================

-- =================================================================================
-- Insert sample users with different roles,eg, guest, host, admin

INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    ('f34b431c-e65e-46cd-8aa7-834070da296a', 'John', 'Doe', 'john.doe@example.com', 'hashpassword1', '5551234567', 'guest', DEFAULT),
    ('693b2550-ebac-4727-a193-e38cefc451ed', 'Jane', 'Smith', 'jane.smith@example.com', 'hashpassword2', '5552345678', 'host', DEFAULT),
    ('b040c6ca-ef12-4a69-8dc1-f2ef9018d786', 'Emily', 'Brown', 'emily.brown@example.com', 'hashpassword3', '5553456789', 'host', DEFAULT),
    ('57268afd-32fc-48b3-9c9f-6a6a735c5ae8', 'Bob', 'Johnson', 'bob.johnson@example.com', 'hashpassword4', '5554567890', 'admin', DEFAULT);

-- =================================================================================
-- Insert sample properties with different hosts.

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    ('d56ef919-f3b5-4ff3-97be-1aa465ab1e42', 'b040c6ca-ef12-4a69-8dc1-f2ef9018d786', 'Cozy Cottage', 'A quaint and cozy cottage in the countryside.', '123 Country Lane', 120.00, DEFAULT, DEFAULT),
    ('7e6e6831-9716-4361-b867-3014486f1cfc', 'b040c6ca-ef12-4a69-8dc1-f2ef9018d786', 'Modern Apartment', 'A stylish modern apartment in the city.', '456 City Street', 200.00, DEFAULT, DEFAULT),
    ('df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', '693b2550-ebac-4727-a193-e38cefc451ed', 'Beach House', 'A beautiful beach house with stunning ocean views.', '789 Beach Blvd', 250.00, DEFAULT, DEFAULT);

-- =================================================================================
-- Insert sample bookings with different properties and users.

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    ('0d25453f-a4af-4017-8d66-137d1bd8b37a', 'df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', 'f34b431c-e65e-46cd-8aa7-834070da296a', '2023-11-01', '2023-11-05', 600.00, 'confirmed', DEFAULT),
    ('20aae3a0-3738-4c22-ac98-b4792e8c2cc3', '7e6e6831-9716-4361-b867-3014486f1cfc', 'f34b431c-e65e-46cd-8aa7-834070da296a', '2023-12-15', '2023-12-20', 1000.00, 'pending', DEFAULT),
    ('ca12ee1b-d1af-4499-a9ee-18aea81751d1', 'df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', 'f34b431c-e65e-46cd-8aa7-834070da296a', '2024-01-10', '2024-01-15', 1250.00, 'canceled', DEFAULT);

-- =================================================================================
-- Insert sample payments for confirmed bookings.

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('15a4c4ac-2dd4-44a3-98e2-d2ba80512a77', '20aae3a0-3738-4c22-ac98-b4792e8c2cc3', 600.00, DEFAULT, 'credit_card'),
    ('63c9c81f-afad-428e-875c-c6592fab2edc', '0d25453f-a4af-4017-8d66-137d1bd8b37a', 1000.00, DEFAULT, 'paypal');

-- =================================================================================
-- Insert sample reviews for properties from guests.

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('4b3afc13-1409-4b06-891c-3b5da56dfe8c', '7e6e6831-9716-4361-b867-3014486f1cfc', 'f34b431c-e65e-46cd-8aa7-834070da296a', 5, 'Amazing place, highly recommend!', DEFAULT),
    ('a591a0c1-46b5-430b-8958-bd976b3870a8', 'df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', 'f34b431c-e65e-46cd-8aa7-834070da296a', 4, 'Great apartment, very clean and well located.', DEFAULT),
    ('21304ec0-fe35-4100-8456-5e3d5794966e', 'df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', 'f34b431c-e65e-46cd-8aa7-834070da296a', 3, 'The beach house was nice but a bit expensive.', DEFAULT);

-- =================================================================================
-- Insert sample messages between guests and the hosts.

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('70db55e3-937f-4188-8ff3-d78ef1529725', 'a55f9f33-5661-4341-bb64-f43fddee2f1a', 'ce59262d-c8b7-47dc-a7bc-0d48b8eabcd8', 'Hi, can you tell me more about the Cozy Cottage?', DEFAULT),
    ('b4541b43-ee8d-42be-baa2-3518281c4477b', 'e0f12aa8-c8ed-4859-9d1b-d3cd64cf19f8', '9403d60c-a4c3-4cfd-a17c-48b696e1c1dc', 'Is the Modern Apartment available for the dates I selected?', DEFAULT),
    ('3a3f77ab-d05a-4e44-922b-4e4ed0a1c70e', 'ff2d80e0-60d3-4da5-a26a-fb65e670a828', '03352a90-dde5-42d0-9882-8a221a67c0ec', 'Hello! The Cozy Cottage is a wonderful place for a weekend getaway.', DEFAULT),
    ('dd06134a-3a31-4f23-914c-c1b40d99613f', '41b039a6-ba7a-400f-956f-f147f8e02e29', '732b36dd-ee94-4433-92bd-a928ad26422d', 'Yes, the Modern Apartment is available for your selected dates.', DEFAULT);

-- =================================================================================