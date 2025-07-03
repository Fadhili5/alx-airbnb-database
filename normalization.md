## Normalizing the Database Design
Normalization eliminates redundancy and dependency by organizing fields and table relationships.

- Through this exercise , i'll review the schema and identify any potential redundancies or violations of normalization principles.

- Adjust the database design to achieve 3NF.

## FIRST NORMAL FORM
To verify if schema is in 1NF:
- I ensured all columns contain atomic values.
- Ensured there were no repeating groups or arrays.

**Results:** Since all the values were atomic and there were no repeating groups ,the schema is in 1NF

---

## SECOND NORMAL FORM
To verify if table is in 1NF:
- I ensured it was in 1NF
- I ensured all non-key attributes are fully functional dependent on the primary key.

**Results:** Since all non-key attributes depended on the primary key ,the schema is in 2NF
ie, the table `Message`:
 had a primary key: `message_id`
 with attributes : `sender_id` ,`recipient_id` ,`message_body` ,`sent_at` are dependent on `message_id`

---

### THIRD NORMAL FORM
To check if a table is in 3NF:
- I ensured it is in 2NF
- I ensured there were no transitive dependencies,ie, non-key attributes were not dependent on other non-key attributes.

**Results:** All tables in our schema satisfied conditions to be in 3NF since there were no transitive dependencies