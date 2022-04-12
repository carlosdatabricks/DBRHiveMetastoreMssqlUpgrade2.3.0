#!/usr/bin/env bash

# This scripts replaces SQL Statements in the hive-schema scripts for SQL Server (Azure SQL)
# It has been tested on version hive-schema-0.13.0.mssql.sql
# It receives 1 parameter and is the path to the file that needs to be converted
# It will output the result to stadout.
# convertHiveSchema-0.13.sh hive-schema-0.13.0.mssql.sql > my-new-hive-schema-0.13.0.mssql.sql
# It replaces the CREATE statemets with IF statements to only create those objects if they don't
# exists in the Database.
# It was tested using Azure SQL on April 2022
#########################################
if [ $# -eq 0 ]
  then
    echo -e "No arguments supplied\n"
    echo -e "  Usage: $0 /path/to/hive-schema-0.13.0.mssql.sql\n"
    echo -e "You should redirect the output to a file using > myNewFile.mssql.sql\n\n"
    exit 1
fi
sed -e "s/CREATE TABLE \(.*\)/IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='\1' and xtype='U')\n CREATE TABLE \1/g" -e "s/\(ALTER TABLE .* ADD CONSTRAINT\) \(.*\) PRIMARY KEY/IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'\2') and xtype='PK')\n\1 \2 PRIMARY KEY /g" -e "s/\(ALTER TABLE .* ADD CONSTRAINT\) \(.*\) FOREIGN KEY/IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'\2') and xtype='F')\n\1 \2 FOREIGN KEY /g" \
-e "s/CREATE INDEX \(.*\) ON/IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='\1')\nCREATE INDEX \1 ON/g" \
-e "s/CREATE UNIQUE INDEX \(.*\) ON/IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='\1')\nCREATE UNIQUE INDEX \1 ON/g" \
-e "s/INSERT INTO \(.*\) VALUES(1)/IF NOT EXISTS (SELECT * FROM \1)\nINSERT INTO \1 VALUES(1)/g" \
$1
