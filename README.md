# Data Replication using Singer

[Singer](https://www.singer.io/) is an open-source standard for writing scripts that move data.

## Mysql to Postgresql
Replicate data from a table in MySQL to a table in Postgresql.

Libraries:
- [tap-mysql](https://github.com/singer-io/tap-mysql#replication-methods-and-state-file)
- [target-postgres](https://github.com/datamill-co/target-postgres)

## Setup
1. Create 2 mock databases for source and target
2. Update the credential to `tap_mysql_config.json` and `target_postgres_config.json`
3. Run the discover scrip to list all the available tables in the source
```
make discover
```
4. The discover script write the result into the file `source_properties.json`. All the tables is listed there. Remove the one you don't want to sync.

5. Setup the sync methods. Refer from the official [doc](https://github.com/singer-io/tap-mysql#replication-methods-and-state-file)

6. Update `state.json` file. This is like a checkpoint for your sync job. It records the state of the previous sync

7. Sync the data with `make sync`