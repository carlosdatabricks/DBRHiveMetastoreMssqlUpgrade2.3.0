# DBRHiveMetastoreMssqlUpgrade2.3.0
- [DBRHiveMetastoreMssqlUpgrade2.3.0](#dbrhivemetastoremssqlupgrade230)
  - [Upgrading the Hive Metastore](#upgrading-the-hive-metastore)
    - [Configure a DBR cluster](#configure-a-dbr-cluster)
  - [Databricks Clussters](#databricks-clussters)
    - [10.x](#10x)
    - [9.x and 7.x](#9x-and-7x)
    - [Databriccks SQL](#databriccks-sql)

<!--Auxiliary Scripts to migrate a Databricks external Metastore from version 0.13 to 2.3.0 on Azure SQL-->

A few customers have configure an external Hive Metastore for their Databricks Workspaces and the schema used by default is from 0.13.0. Some customers would like to use Purview to scan the Metastore, and Purview doesn't support this version of the Hive Metastore.

The upgrade scripts that come with the official Apache Hive 2.3.9 distribution don't work, these are the following issues we found:
- Upgrade scripts failed due to some missing tables/objects in the database
- After fixing the above, the upgrade scripts have lines with ":r fileName", this syntax is not recognized by the schematool
- After fixing the above, we found other issues since the scripts modify some columns that are used by constraints, and this was preventing the ALTER TABLE statements to succeed.

Based on the above we generated 2 scripts and had to made some manual changes in the upgrade scripts.

The first script convertHiveSchema-0.13.sh is used to generate a new sql file based on the hive-schema-0.13.0.mssql.sql and adds statements to only create the objects if they don't exists. This is to add all the missing objects to the Hive Metastore and bring it to the official 0.13 version.

This scripts receives one parameter that is the sql file that needs conversion and outputs the results to stdout.

The result of this script was added at the begining of the pre-0-upgrade-0.13.0-to-0.14.0.mssql.sql.

The second script insertSQLFiles.sh replaces the ":r file" lines in the sql scripts with the content of those files. 

And finally the scripts that have manual changes are the following ones:
- upgrade-1.2.0-to-2.0.0.mssql.sql
- upgrade-2.1.0-to-2.2.0.mssql.sql

The folder mssql in this project has the generated files and the fixes.

## Upgrading the Hive Metastore

In order to upgrade the Metastore we have included a Databricks notebook (UpgradeMetastore013to239.html). Import the file into your workspace. This notebook will download the apache-hive distribution, get the SQL files in this repo and run the schematool in order to upgrade the schema.

**<font color="red">Please make sure to make a backup of your matastore, these scripts have not been fully tested, this worked for ourt test environment, but it did not go thry a full QA process</font>**

### Configure a DBR cluster
You can create a new single node cluster to run the notebook, please add the following envrionemnt variables before executing the notebook:

```
HIVE_URL=jdbc:sqlserver://{yourDatabaseServerName}:1433;database={yourDatabaseName};user={yourUser};password={YourPassword};encrypt=true;trustServerCertificate=false;hostNameInCertificate=*.database.windows.net;loginTimeout=30;
MSSQL_SERVER_NAME={yourDatabaseServerName}
HIVE_USER={databaseUser}
HIVE_PASSWORD={YourPassword}
TARGET_HIVE_VERSION=2.3.9
TARGET_HADOOP_VERSION=2.7.2
TARGET_HIVE_HOME=/opt/apache-hive-2.3.9-bin
TARGET_HADOOP_HOME=/opt/hadoop-2.7.2
SQLDB_DRIVER=com.microsoft.sqlserver.jdbc.SQLServerDriver
```

## Databricks Clussters
### 10.x
For DBR 10.x add the following Spark Configuration settings (besides the one to point to the external metastore)
```
spark.sql.hive.metastore.version 2.3.9
spark.sql.hive.metastore.jars builtin
```
### 9.x and 7.x
```
spark.sql.hive.metastore.version 2.3.7
spark.sql.hive.metastore.jars builtin
```
### Databriccks SQL
Databricks SQL also support 2.3.9, so on the SQL Endpoint Settings, in the Data Access Configuration add:
```
spark.sql.hive.metastore.version 2.3.9
spark.sql.hive.metastore.jars builtin
```

