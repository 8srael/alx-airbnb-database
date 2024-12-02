## Monitor and Refine Database Performance


- Monitoring Query Performance : Use tools such as SHOW PROFILE or EXPLAIN ANALYZE to analyze the performance of frequently executed queries. These commands help to understand the resources consumed during query execution, identify bottlenecks, and pinpoint areas of improvement.

- Identifiying bottlenecks
    1. After analyzing the query execution plan, look for these potential issues:
    2. Full Table Scans: If a large portion of the table is being scanned, the query may benefit from an index on the filtered columns.
    3. High Execution Time: Identify whether there are slow stages in the execution process, such as joins or sorting.
    4. Inefficient Joins: If multiple tables are involved, consider optimizing the joins or breaking the query into smaller subqueries.