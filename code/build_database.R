#load libraries ####
library(DBI)
library(RSQLite)

#connect to the existing database ####
con <- dbConnect(RSQLite::SQLite(), dbname = "Final-Project.db");

# run SQL code to create tables ####

dbExecute(con, "
CREATE TABLE IF NOT EXISTS county (
county_id varchar(20) NOT NULL PRIMARY KEY,
county varchar(15),
state char(2)
);
")

dbExecute (con, "
CREATE TABLE population (
population_id varchar(20) NOT NULL PRIMARY KEY,
county_id varchar(20),
population_size varchar(20),
year varchar(4),
FOREIGN KEY (county_id) REFERENCES county(county_id)
);
")
 
dbExecute(con, "
CREATE TABLE ownership (
ownership_id varchar(20) NOT NULL PRIMARY KEY,
owners varchar(10),
partial_owners varchar(10),
tenants varchar(10),
year varchar(4),
county_id varchar(20),
FOREIGN KEY (county_id) REFERENCES county(county_id)
);
")

dbExecute(con, "
CREATE TABLE farm_size (
  farmsize_id varchar(10) NOT NULL PRIMARY KEY,
  county_id varchar(20),
  under_100_acres varchar(5),
  acres_101_to_500 varchar(5),
  acres_500_to_1000 varchar(5),
  over_1000_acres varchar(5),
  year varchar(4),
  FOREIGN KEY (county_id) REFERENCES county(county_id)
);
")
          
# Optional: Verify tables were created. ####
tables <- dbListTables(con)
print(tables);

#Confirm that data was loaded properly ####

library(DBI)
con <- dbConnect(RSQLite::SQLite(), dbname = "Final-Project.db");
dbGetQuery(con, "SELECT * FROM population;")
