# DESIGN DATABASE SCHEMA (DDL)
The directory contains SQL queries that define the database schema . These queries are used to create the tables, indexes, and relationships between tables in the database.

## File
The ``schema.sql:`` is the SQL Data Definition Language scripts that:
- Creates tables such as ``User`` ,``Property`` ,``Booking`` ,``Payment`` ,``Review`` ,``Message``.
- Defines constraints such as ``PRIMARY KEY`` ,``FOREIGN KEY`` ,``UNIQUE`` ,``NOT NULL`` to ensure efficient and consistent data management.
- Creates indexes to optimize query performance.


## Setup
Execute the `schema.sql` script againsts a PostgreSQL database to set up the database.

Eg, using 'psql' command line tool

```bash
psql -U username -d database_name -f schema.sql