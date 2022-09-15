# Postgres checkup

this repository contains some utility queries to perform a health check on a Postgres database.

## cache hit ratio

it gives the percentage of time your data is served from memory vs having to read the disk. Serving data from memory is usually orders of magnitude faster, so the more you can serve from memory the better.
For user facing services you should target > 99%.

If you want to increase the hit ratio one possible solution is to upgrade the memory of your database.


## index coverage

this query shows, for each table, how much indexes are used compared to scanning the entire table. The tables are sorted from the highest number of rows, so that we can focus on potential slow scans. A percentage lower than 90% can be the evidence that we are missing some useful index or we created the index on the wrong columns.


## unused indexes

since your application is constantly evolving, your database may have something that is now unnecessary. The first thing to look for are unused indexes. In Postgres this means you're getting slower writes with really no benefit from the presence of the index.


## function performance

this query returns some insights about functions, like the number of total calls and the time spent.
`total_time` includes the time spent in other functions called by it. `self_time` instead does not include other functions called by it.


## query performance

It records queries that are run in your database and a number of stats about them. It is useful to look up what queries are slowest on average as well as ones that consume the most total time.


## long running

This query returns the records of `pg_stat_activity`, which is a view of what's happening *right now* on your database. The query filter the results per duration, showing long running processes.