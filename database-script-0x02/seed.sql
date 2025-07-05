-- =================================================================================
-- SQL script to seed the Airbnb database with realistic sample data.
-- After executing the schema.sql run this script.
-- =================================================================================
-- I used https://www.uuidgenerator.net/ to generate UUIDs for the IDs. Alternatively postgres can generate them automatically.
-- =================================================================================

-- =================================================================================
-- Insert sample users with different roles, eg, guest, host, admin

INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
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
    ('0d25453f-a4af-4017-8d66-137d1bd8b37a', 'df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', 'f34b431c-e65e-46cd-8aa7-834070da296a', '2023-11-01', '2023-11-05', 1000.00, 'confirmed', DEFAULT),
    ('20aae3a0-3738-4c22-ac98-b4792e8c2cc3', '7e6e6831-9716-4361-b867-3014486f1cfc', 'f34b431c-e65e-46cd-8aa7-834070da296a', '2023-12-15', '2023-12-20', 1000.00, 'pending', DEFAULT),
    ('ca12ee1b-d1af-4499-a9ee-18aea81751d1', 'd56ef919-f3b5-4ff3-97be-1aa465ab1e42', 'f34b431c-e65e-46cd-8aa7-834070da296a', '2024-01-10', '2024-01-15', 600.00, 'canceled', DEFAULT);

-- =================================================================================
-- Insert sample payments for confirmed bookings.

INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    ('15a4c4ac-2dd4-44a3-98e2-d2ba80512a77', '0d25453f-a4af-4017-8d66-137d1bd8b37a', 1000.00, DEFAULT, 'credit_card'),
    ('63c9c81f-afad-428e-875c-c6592fab2edc', '20aae3a0-3738-4c22-ac98-b4792e8c2cc3', 1000.00, DEFAULT, 'paypal');

-- =================================================================================
-- Insert sample reviews for properties from guests.

INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    ('4b3afc13-1409-4b06-891c-3b5da56dfe8c', '7e6e6831-9716-4361-b867-3014486f1cfc', 'f34b431c-e65e-46cd-8aa7-834070da296a', 5, 'Amazing place, highly recommend!', DEFAULT),
    ('a591a0c1-46b5-430b-8958-bd976b3870a8', 'df7c7dfd-2d70-41cb-9a50-6d219da7b7a3', 'f34b431c-e65e-46cd-8aa7-834070da296a', 4, 'Great beach house, very clean and well located.', DEFAULT),
    ('21304ec0-fe35-4100-8456-5e3d5794966e', 'd56ef919-f3b5-4ff3-97be-1aa465ab1e42', 'f34b431c-e65e-46cd-8aa7-834070da296a', 3, 'The cottage was nice but a bit expensive.', DEFAULT);

-- =================================================================================
-- Insert sample messages between guests and hosts.

INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    ('70db55e3-937f-4188-8ff3-d78ef1529725', 'f34b431c-e65e-46cd-8aa7-834070da296a', 'b040c6ca-ef12-4a69-8dc1-f2ef9018d786', 'Hi, can you tell me more about the Cozy Cottage?', DEFAULT),
    ('b4541b43-ee8d-42be-baa2-3518281c4477', 'f34b431c-e65e-46cd-8aa7-834070da296a', '693b2550-ebac-4727-a193-e38cefc451ed', 'Is the Beach House available for the dates I selected?', DEFAULT),
    ('3a3f77ab-d05a-4e44-922b-4e4ed0a1c70e', 'b040c6ca-ef12-4a69-8dc1-f2ef9018d786', 'f34b431c-e65e-46cd-8aa7-834070da296a', 'Hello! The Cozy Cottage is a wonderful place for a weekend getaway.', DEFAULT),
    ('dd06134a-3a31-4f23-914c-c1b40d99613f', '693b2550-ebac-4727-a193-e38cefc451ed', 'f34b431c-e65e-46cd-8aa7-834070da296a', 'Yes, the Beach House is available for your selected dates.', DEFAULT);

-- =================================================================================