# Get all table
discover:
	tap-mysql --config tap_mysql_config.json --discover > source_properties.json

# Open the file source_properties.json and select tables so sync as well as sync method. Hereby, I use INCREMENTAL method

# Extract all records
extract_no_state:
	tap-mysql --config tap_mysql_config.json --properties source_properties.json

# Get the bookmark message >> state.json

# Extract selected records based on state.json
extract_state:
	tap-mysql --config tap_mysql_config.json --properties source_properties.json --state state.json

# Sync from source to target
sync:
	tap-mysql --config tap_mysql_config.json --properties source_properties.json | target-postgres --config target_postgres_config.json
	
