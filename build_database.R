# Load necessary libraries
library(DBI)
library(RSQLite)

# Connect to the existing database
con <- dbConnect(RSQLite::SQLite(), dbname = "Final-Project.db");

# SQL code to create tables
dbExecute(con, "
CREATE TABLE IF NOT EXISTS city (
  city_id varchar(20) NOT NULL PRIMARY KEY,
  state char(2),
  population_2017 varchar(10),
  population_2022 varchar(10)
);")

dbExecute(con, "
CREATE TABLE IF NOT EXISTS farms (
  farm_id varchar(20) NOT NULL PRIMARY KEY,
  address varchar(25),
  ownership_status varchar(4) CHECK (ownership_status IN ('owner', 'o/o', 'operator')),
  acres varchar(10),
  year char CHECK (year IN ('2017', '2022')),
  city_id varchar(20),
  FOREIGN KEY (city_id) REFERENCES city(city_id)
);")

dbExecute(con, "
CREATE TABLE IF NOT EXISTS Producers (
  Producer_ID varchar(15),
  first_name varchar(20),
  last_name varchar(20),
  farm_id varchar(20),
  FOREIGN KEY (farm_id) REFERENCES farms(farm_id)
);")

# Optional: Verify that tables were created (not required but useful for debugging)
tables <- dbListTables(con)
print(tables);

tables <- dbListTables(con)
print(tables);






