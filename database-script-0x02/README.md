# SEEDING DATABASE WITH SAMPLE DATA

## Overview
This script creates and inserts sample database schema for a property booking system.

## Entities and Relationships

### Entities:
1. **User**
2. **Property**
3. **Booking**
4. **Payment**
5. **Review**
6. **Message**

### Relationships:
- User can host and have multiple properties.
- A property can have multiple bookings.
- A booking can have one payment.
- A user can write multiple reviews for properties.
- Users can exchange reviews.


## Setup
After executing the `schema.sql` script  we populate the database  by running the scripts againsts our PostgreSQL.

Eg, using 'psql'

```bash
psql -U username -d database_name -f seed.sql
