# 2.1 load libraries and packages ####
library(DBI)
library(RSQLite)
library(dplyr)
install.packages("tidyverse")



#2.2 connect to the existing database ####
finalproject_db <- dbConnect(RSQLite::SQLite(), dbname = "Final-Project.db");

#verify that all the tables are loaded 

dbListTables(finalproject_db)

#### import the data ####

#### 3.1 add the county table 

county <- read.csv("data_processed/county.csv",
                    stringsAsFactors = FALSE)

#check that the names align 
names(county)

# enter the csv into the sql table

dbWriteTable(finalproject_db, "county", county, append = TRUE)

####3.2 add the farm size table ####

farm_size <- read.csv("data_processed/farm_size.csv",
                     stringsAsFactors = FALSE)

#check that the names align 
names(farm_size)

# enter the csv into the sql table

dbWriteTable(finalproject_db, "farm_size", farm_size, append = TRUE)

#### 3.3 add the population table ####

population <- read.csv("data_processed/population.csv",
                      stringsAsFactors = FALSE)

#check that the names align

names(population)

#enter the csv into the sql table 
dbWriteTable(finalproject_db, "population", population, append = TRUE)

#### 3.4 enter the ownership table 

ownership <- read.csv("data_processed/ownership.csv",
                       stringsAsFactors = FALSE)

#check that the names align 
names(ownership)

#enter the csv into the sql table
dbWriteTable(finalproject_db, "ownership", ownership, append = TRUE)

#### 3.5 confirm that the data was loaded correctly ####
library(DBI)
finalproject_db <-dbConnect(SQLite::SQLite(),dbname = "Final-Project.db")

##county table

dbGetQuery(finalproject_db, "SELECT * FROM county")

##population table
dbGetQuery(finalproject_db, "SELECT * FROM population")

##farm size table
dbGetQuery(finalproject_db, "SELECT * FROM farm_size")

##onwership table 
dbGetQuery(finalproject_db, "SELECT * FROM ownership")

#### 4 data manipulation ####

#### Which area has the smallest population? ####

population <-DBI::dbReadTable(finalproject_db, "population")



