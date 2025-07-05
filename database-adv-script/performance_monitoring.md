## Continuously monitoring and refining database performance by analyzing query execution plans and making schema adjustments


#### Using SQL commands (SHOW PROFILE or EXPLAIN ANALYZE) to monitor performance of a few of frequently used queries.
```json
EXPLAIN ANALYZE SELECT * FROM airbnb WHERE some_column = 'some_value';
```

----
<!-- ```json
SET profiling = 1;
SELECT * FROM airbnb WHERE some_column = 'some_value';
SHOW PROFILES;
SHOW PROFILE FOR QUERY 1;
``` -->
#### Bottlenecks and changes I'd suggest
There are certain `WHERE` clauses `JOIN` conditions causing slow performance; creating an index will help in this


#### Implementation of the changes and reports the improvement

```json
CREATE INDEX idx_customer_id ON orders(customer_id);
```