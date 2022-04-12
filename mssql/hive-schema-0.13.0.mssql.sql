-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

------------------------------------------------------------------
-- DataNucleus SchemaTool (ran at 08/04/2014 15:10:15)
------------------------------------------------------------------
-- Complete schema required for the following classes:-
--     org.apache.hadoop.hive.metastore.model.MColumnDescriptor
--     org.apache.hadoop.hive.metastore.model.MDBPrivilege
--     org.apache.hadoop.hive.metastore.model.MDatabase
--     org.apache.hadoop.hive.metastore.model.MDelegationToken
--     org.apache.hadoop.hive.metastore.model.MFieldSchema
--     org.apache.hadoop.hive.metastore.model.MFunction
--     org.apache.hadoop.hive.metastore.model.MGlobalPrivilege
--     org.apache.hadoop.hive.metastore.model.MIndex
--     org.apache.hadoop.hive.metastore.model.MMasterKey
--     org.apache.hadoop.hive.metastore.model.MOrder
--     org.apache.hadoop.hive.metastore.model.MPartition
--     org.apache.hadoop.hive.metastore.model.MPartitionColumnPrivilege
--     org.apache.hadoop.hive.metastore.model.MPartitionColumnStatistics
--     org.apache.hadoop.hive.metastore.model.MPartitionEvent
--     org.apache.hadoop.hive.metastore.model.MPartitionPrivilege
--     org.apache.hadoop.hive.metastore.model.MResourceUri
--     org.apache.hadoop.hive.metastore.model.MRole
--     org.apache.hadoop.hive.metastore.model.MRoleMap
--     org.apache.hadoop.hive.metastore.model.MSerDeInfo
--     org.apache.hadoop.hive.metastore.model.MStorageDescriptor
--     org.apache.hadoop.hive.metastore.model.MStringList
--     org.apache.hadoop.hive.metastore.model.MTable
--     org.apache.hadoop.hive.metastore.model.MTableColumnPrivilege
--     org.apache.hadoop.hive.metastore.model.MTableColumnStatistics
--     org.apache.hadoop.hive.metastore.model.MTablePrivilege
--     org.apache.hadoop.hive.metastore.model.MType
--     org.apache.hadoop.hive.metastore.model.MVersionTable
--
-- Table MASTER_KEYS for classes [org.apache.hadoop.hive.metastore.model.MMasterKey]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='MASTER_KEYS' and xtype='U')
 CREATE TABLE MASTER_KEYS
(
    KEY_ID int NOT NULL,
    MASTER_KEY varchar(767) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'MASTER_KEYS_PK') and xtype='PK')
ALTER TABLE MASTER_KEYS ADD CONSTRAINT MASTER_KEYS_PK PRIMARY KEY  (KEY_ID);

-- Table IDXS for classes [org.apache.hadoop.hive.metastore.model.MIndex]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='IDXS' and xtype='U')
 CREATE TABLE IDXS
(
    INDEX_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    DEFERRED_REBUILD bit NOT NULL,
    INDEX_HANDLER_CLASS varchar(4000) NULL,
    INDEX_NAME varchar(128) NULL,
    INDEX_TBL_ID bigint NULL,
    LAST_ACCESS_TIME int NOT NULL,
    ORIG_TBL_ID bigint NULL,
    SD_ID bigint NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'IDXS_PK') and xtype='PK')
ALTER TABLE IDXS ADD CONSTRAINT IDXS_PK PRIMARY KEY  (INDEX_ID);

-- Table PART_COL_STATS for classes [org.apache.hadoop.hive.metastore.model.MPartitionColumnStatistics]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PART_COL_STATS' and xtype='U')
 CREATE TABLE PART_COL_STATS
(
    CS_ID bigint NOT NULL,
    AVG_COL_LEN float NULL,
    "COLUMN_NAME" varchar(128) NOT NULL,
    COLUMN_TYPE varchar(128) NOT NULL,
    DB_NAME varchar(128) NOT NULL,
    BIG_DECIMAL_HIGH_VALUE varchar(255) NULL,
    BIG_DECIMAL_LOW_VALUE varchar(255) NULL,
    DOUBLE_HIGH_VALUE float NULL,
    DOUBLE_LOW_VALUE float NULL,
    LAST_ANALYZED bigint NOT NULL,
    LONG_HIGH_VALUE bigint NULL,
    LONG_LOW_VALUE bigint NULL,
    MAX_COL_LEN bigint NULL,
    NUM_DISTINCTS bigint NULL,
    NUM_FALSES bigint NULL,
    NUM_NULLS bigint NOT NULL,
    NUM_TRUES bigint NULL,
    PART_ID bigint NULL,
    PARTITION_NAME varchar(767) NOT NULL,
    "TABLE_NAME" varchar(128) NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PART_COL_STATS_PK') and xtype='PK')
ALTER TABLE PART_COL_STATS ADD CONSTRAINT PART_COL_STATS_PK PRIMARY KEY  (CS_ID);

-- Table PART_PRIVS for classes [org.apache.hadoop.hive.metastore.model.MPartitionPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PART_PRIVS' and xtype='U')
 CREATE TABLE PART_PRIVS
(
    PART_GRANT_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PART_ID bigint NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    PART_PRIV varchar(128) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PART_PRIVS_PK') and xtype='PK')
ALTER TABLE PART_PRIVS ADD CONSTRAINT PART_PRIVS_PK PRIMARY KEY  (PART_GRANT_ID);

-- Table SKEWED_STRING_LIST for classes [org.apache.hadoop.hive.metastore.model.MStringList]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SKEWED_STRING_LIST' and xtype='U')
 CREATE TABLE SKEWED_STRING_LIST
(
    STRING_LIST_ID bigint NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_STRING_LIST_PK') and xtype='PK')
ALTER TABLE SKEWED_STRING_LIST ADD CONSTRAINT SKEWED_STRING_LIST_PK PRIMARY KEY  (STRING_LIST_ID);

-- Table ROLES for classes [org.apache.hadoop.hive.metastore.model.MRole]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ROLES' and xtype='U')
 CREATE TABLE ROLES
(
    ROLE_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    OWNER_NAME varchar(128) NULL,
    ROLE_NAME varchar(128) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'ROLES_PK') and xtype='PK')
ALTER TABLE ROLES ADD CONSTRAINT ROLES_PK PRIMARY KEY  (ROLE_ID);

-- Table PARTITIONS for classes [org.apache.hadoop.hive.metastore.model.MPartition]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PARTITIONS' and xtype='U')
 CREATE TABLE PARTITIONS
(
    PART_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    LAST_ACCESS_TIME int NOT NULL,
    PART_NAME varchar(767) NULL,
    SD_ID bigint NULL,
    TBL_ID bigint NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITIONS_PK') and xtype='PK')
ALTER TABLE PARTITIONS ADD CONSTRAINT PARTITIONS_PK PRIMARY KEY  (PART_ID);

-- Table CDS for classes [org.apache.hadoop.hive.metastore.model.MColumnDescriptor]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='CDS' and xtype='U')
 CREATE TABLE CDS
(
    CD_ID bigint NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'CDS_PK') and xtype='PK')
ALTER TABLE CDS ADD CONSTRAINT CDS_PK PRIMARY KEY  (CD_ID);

-- Table VERSION for classes [org.apache.hadoop.hive.metastore.model.MVersionTable]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='VERSION' and xtype='U')
 CREATE TABLE VERSION
(
    VER_ID bigint NOT NULL,
    SCHEMA_VERSION varchar(127) NOT NULL,
    VERSION_COMMENT varchar(255) NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'VERSION_PK') and xtype='PK')
ALTER TABLE VERSION ADD CONSTRAINT VERSION_PK PRIMARY KEY  (VER_ID);

-- Table GLOBAL_PRIVS for classes [org.apache.hadoop.hive.metastore.model.MGlobalPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='GLOBAL_PRIVS' and xtype='U')
 CREATE TABLE GLOBAL_PRIVS
(
    USER_GRANT_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    USER_PRIV varchar(128) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'GLOBAL_PRIVS_PK') and xtype='PK')
ALTER TABLE GLOBAL_PRIVS ADD CONSTRAINT GLOBAL_PRIVS_PK PRIMARY KEY  (USER_GRANT_ID);

-- Table PART_COL_PRIVS for classes [org.apache.hadoop.hive.metastore.model.MPartitionColumnPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PART_COL_PRIVS' and xtype='U')
 CREATE TABLE PART_COL_PRIVS
(
    PART_COLUMN_GRANT_ID bigint NOT NULL,
    "COLUMN_NAME" varchar(128) NULL,
    CREATE_TIME int NOT NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PART_ID bigint NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    PART_COL_PRIV varchar(128) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PART_COL_PRIVS_PK') and xtype='PK')
ALTER TABLE PART_COL_PRIVS ADD CONSTRAINT PART_COL_PRIVS_PK PRIMARY KEY  (PART_COLUMN_GRANT_ID);

-- Table DB_PRIVS for classes [org.apache.hadoop.hive.metastore.model.MDBPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DB_PRIVS' and xtype='U')
 CREATE TABLE DB_PRIVS
(
    DB_GRANT_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    DB_ID bigint NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    DB_PRIV varchar(128) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'DB_PRIVS_PK') and xtype='PK')
ALTER TABLE DB_PRIVS ADD CONSTRAINT DB_PRIVS_PK PRIMARY KEY  (DB_GRANT_ID);

-- Table TAB_COL_STATS for classes [org.apache.hadoop.hive.metastore.model.MTableColumnStatistics]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TAB_COL_STATS' and xtype='U')
 CREATE TABLE TAB_COL_STATS
(
    CS_ID bigint NOT NULL,
    AVG_COL_LEN float NULL,
    "COLUMN_NAME" varchar(128) NOT NULL,
    COLUMN_TYPE varchar(128) NOT NULL,
    DB_NAME varchar(128) NOT NULL,
    BIG_DECIMAL_HIGH_VALUE varchar(255) NULL,
    BIG_DECIMAL_LOW_VALUE varchar(255) NULL,
    DOUBLE_HIGH_VALUE float NULL,
    DOUBLE_LOW_VALUE float NULL,
    LAST_ANALYZED bigint NOT NULL,
    LONG_HIGH_VALUE bigint NULL,
    LONG_LOW_VALUE bigint NULL,
    MAX_COL_LEN bigint NULL,
    NUM_DISTINCTS bigint NULL,
    NUM_FALSES bigint NULL,
    NUM_NULLS bigint NOT NULL,
    NUM_TRUES bigint NULL,
    TBL_ID bigint NULL,
    "TABLE_NAME" varchar(128) NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TAB_COL_STATS_PK') and xtype='PK')
ALTER TABLE TAB_COL_STATS ADD CONSTRAINT TAB_COL_STATS_PK PRIMARY KEY  (CS_ID);

-- Table TYPES for classes [org.apache.hadoop.hive.metastore.model.MType]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TYPES' and xtype='U')
 CREATE TABLE TYPES
(
    TYPES_ID bigint NOT NULL,
    TYPE_NAME varchar(128) NULL,
    TYPE1 varchar(767) NULL,
    TYPE2 varchar(767) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TYPES_PK') and xtype='PK')
ALTER TABLE TYPES ADD CONSTRAINT TYPES_PK PRIMARY KEY  (TYPES_ID);

-- Table TBL_PRIVS for classes [org.apache.hadoop.hive.metastore.model.MTablePrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TBL_PRIVS' and xtype='U')
 CREATE TABLE TBL_PRIVS
(
    TBL_GRANT_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    TBL_PRIV varchar(128) NULL,
    TBL_ID bigint NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBL_PRIVS_PK') and xtype='PK')
ALTER TABLE TBL_PRIVS ADD CONSTRAINT TBL_PRIVS_PK PRIMARY KEY  (TBL_GRANT_ID);

-- Table DBS for classes [org.apache.hadoop.hive.metastore.model.MDatabase]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DBS' and xtype='U')
 CREATE TABLE DBS
(
    DB_ID bigint NOT NULL,
    "DESC" varchar(4000) NULL,
    DB_LOCATION_URI varchar(4000) NOT NULL,
    "NAME" varchar(128) NULL,
    OWNER_NAME varchar(128) NULL,
    OWNER_TYPE varchar(10) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'DBS_PK') and xtype='PK')
ALTER TABLE DBS ADD CONSTRAINT DBS_PK PRIMARY KEY  (DB_ID);

-- Table TBL_COL_PRIVS for classes [org.apache.hadoop.hive.metastore.model.MTableColumnPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TBL_COL_PRIVS' and xtype='U')
 CREATE TABLE TBL_COL_PRIVS
(
    TBL_COLUMN_GRANT_ID bigint NOT NULL,
    "COLUMN_NAME" varchar(128) NULL,
    CREATE_TIME int NOT NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    TBL_COL_PRIV varchar(128) NULL,
    TBL_ID bigint NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBL_COL_PRIVS_PK') and xtype='PK')
ALTER TABLE TBL_COL_PRIVS ADD CONSTRAINT TBL_COL_PRIVS_PK PRIMARY KEY  (TBL_COLUMN_GRANT_ID);

-- Table DELEGATION_TOKENS for classes [org.apache.hadoop.hive.metastore.model.MDelegationToken]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DELEGATION_TOKENS' and xtype='U')
 CREATE TABLE DELEGATION_TOKENS
(
    TOKEN_IDENT varchar(767) NOT NULL,
    TOKEN varchar(767) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'DELEGATION_TOKENS_PK') and xtype='PK')
ALTER TABLE DELEGATION_TOKENS ADD CONSTRAINT DELEGATION_TOKENS_PK PRIMARY KEY  (TOKEN_IDENT);

-- Table SERDES for classes [org.apache.hadoop.hive.metastore.model.MSerDeInfo]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SERDES' and xtype='U')
 CREATE TABLE SERDES
(
    SERDE_ID bigint NOT NULL,
    "NAME" varchar(128) NULL,
    SLIB varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SERDES_PK') and xtype='PK')
ALTER TABLE SERDES ADD CONSTRAINT SERDES_PK PRIMARY KEY  (SERDE_ID);

-- Table FUNCS for classes [org.apache.hadoop.hive.metastore.model.MFunction]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='FUNCS' and xtype='U')
 CREATE TABLE FUNCS
(
    FUNC_ID bigint NOT NULL,
    CLASS_NAME varchar(4000) NULL,
    CREATE_TIME int NOT NULL,
    DB_ID bigint NULL,
    FUNC_NAME varchar(128) NULL,
    FUNC_TYPE int NOT NULL,
    OWNER_NAME varchar(128) NULL,
    OWNER_TYPE varchar(10) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'FUNCS_PK') and xtype='PK')
ALTER TABLE FUNCS ADD CONSTRAINT FUNCS_PK PRIMARY KEY  (FUNC_ID);

-- Table ROLE_MAP for classes [org.apache.hadoop.hive.metastore.model.MRoleMap]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='ROLE_MAP' and xtype='U')
 CREATE TABLE ROLE_MAP
(
    ROLE_GRANT_ID bigint NOT NULL,
    ADD_TIME int NOT NULL,
    GRANT_OPTION smallint NOT NULL CHECK (GRANT_OPTION IN (0,1)),
    GRANTOR varchar(128) NULL,
    GRANTOR_TYPE varchar(128) NULL,
    PRINCIPAL_NAME varchar(128) NULL,
    PRINCIPAL_TYPE varchar(128) NULL,
    ROLE_ID bigint NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'ROLE_MAP_PK') and xtype='PK')
ALTER TABLE ROLE_MAP ADD CONSTRAINT ROLE_MAP_PK PRIMARY KEY  (ROLE_GRANT_ID);

-- Table TBLS for classes [org.apache.hadoop.hive.metastore.model.MTable]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TBLS' and xtype='U')
 CREATE TABLE TBLS
(
    TBL_ID bigint NOT NULL,
    CREATE_TIME int NOT NULL,
    DB_ID bigint NULL,
    LAST_ACCESS_TIME int NOT NULL,
    OWNER varchar(767) NULL,
    RETENTION int NOT NULL,
    SD_ID bigint NULL,
    TBL_NAME varchar(128) NULL,
    TBL_TYPE varchar(128) NULL,
    VIEW_EXPANDED_TEXT text NULL,
    VIEW_ORIGINAL_TEXT text NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBLS_PK') and xtype='PK')
ALTER TABLE TBLS ADD CONSTRAINT TBLS_PK PRIMARY KEY  (TBL_ID);

-- Table SDS for classes [org.apache.hadoop.hive.metastore.model.MStorageDescriptor]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SDS' and xtype='U')
 CREATE TABLE SDS
(
    SD_ID bigint NOT NULL,
    CD_ID bigint NULL,
    INPUT_FORMAT varchar(4000) NULL,
    IS_COMPRESSED bit NOT NULL,
    IS_STOREDASSUBDIRECTORIES bit NOT NULL,
    LOCATION varchar(4000) NULL,
    NUM_BUCKETS int NOT NULL,
    OUTPUT_FORMAT varchar(4000) NULL,
    SERDE_ID bigint NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SDS_PK') and xtype='PK')
ALTER TABLE SDS ADD CONSTRAINT SDS_PK PRIMARY KEY  (SD_ID);

-- Table PARTITION_EVENTS for classes [org.apache.hadoop.hive.metastore.model.MPartitionEvent]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PARTITION_EVENTS' and xtype='U')
 CREATE TABLE PARTITION_EVENTS
(
    PART_NAME_ID bigint NOT NULL,
    DB_NAME varchar(128) NULL,
    EVENT_TIME bigint NOT NULL,
    EVENT_TYPE int NOT NULL,
    PARTITION_NAME varchar(767) NULL,
    TBL_NAME varchar(128) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_EVENTS_PK') and xtype='PK')
ALTER TABLE PARTITION_EVENTS ADD CONSTRAINT PARTITION_EVENTS_PK PRIMARY KEY  (PART_NAME_ID);

-- Table SORT_COLS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SORT_COLS' and xtype='U')
 CREATE TABLE SORT_COLS
(
    SD_ID bigint NOT NULL,
    "COLUMN_NAME" varchar(128) NULL,
    "ORDER" int NOT NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SORT_COLS_PK') and xtype='PK')
ALTER TABLE SORT_COLS ADD CONSTRAINT SORT_COLS_PK PRIMARY KEY  (SD_ID,INTEGER_IDX);

-- Table SKEWED_COL_NAMES for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SKEWED_COL_NAMES' and xtype='U')
 CREATE TABLE SKEWED_COL_NAMES
(
    SD_ID bigint NOT NULL,
    SKEWED_COL_NAME varchar(255) NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_COL_NAMES_PK') and xtype='PK')
ALTER TABLE SKEWED_COL_NAMES ADD CONSTRAINT SKEWED_COL_NAMES_PK PRIMARY KEY  (SD_ID,INTEGER_IDX);

-- Table SKEWED_COL_VALUE_LOC_MAP for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SKEWED_COL_VALUE_LOC_MAP' and xtype='U')
 CREATE TABLE SKEWED_COL_VALUE_LOC_MAP
(
    SD_ID bigint NOT NULL,
    STRING_LIST_ID_KID bigint NOT NULL,
    LOCATION varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_COL_VALUE_LOC_MAP_PK') and xtype='PK')
ALTER TABLE SKEWED_COL_VALUE_LOC_MAP ADD CONSTRAINT SKEWED_COL_VALUE_LOC_MAP_PK PRIMARY KEY  (SD_ID,STRING_LIST_ID_KID);

-- Table SKEWED_STRING_LIST_VALUES for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SKEWED_STRING_LIST_VALUES' and xtype='U')
 CREATE TABLE SKEWED_STRING_LIST_VALUES
(
    STRING_LIST_ID bigint NOT NULL,
    STRING_LIST_VALUE varchar(255) NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_STRING_LIST_VALUES_PK') and xtype='PK')
ALTER TABLE SKEWED_STRING_LIST_VALUES ADD CONSTRAINT SKEWED_STRING_LIST_VALUES_PK PRIMARY KEY  (STRING_LIST_ID,INTEGER_IDX);

-- Table PARTITION_KEY_VALS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PARTITION_KEY_VALS' and xtype='U')
 CREATE TABLE PARTITION_KEY_VALS
(
    PART_ID bigint NOT NULL,
    PART_KEY_VAL varchar(255) NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_KEY_VALS_PK') and xtype='PK')
ALTER TABLE PARTITION_KEY_VALS ADD CONSTRAINT PARTITION_KEY_VALS_PK PRIMARY KEY  (PART_ID,INTEGER_IDX);

-- Table PARTITION_KEYS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PARTITION_KEYS' and xtype='U')
 CREATE TABLE PARTITION_KEYS
(
    TBL_ID bigint NOT NULL,
    PKEY_COMMENT varchar(4000) NULL,
    PKEY_NAME varchar(128) NOT NULL,
    PKEY_TYPE varchar(767) NOT NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_KEY_PK') and xtype='PK')
ALTER TABLE PARTITION_KEYS ADD CONSTRAINT PARTITION_KEY_PK PRIMARY KEY  (TBL_ID,PKEY_NAME);

-- Table SKEWED_VALUES for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SKEWED_VALUES' and xtype='U')
 CREATE TABLE SKEWED_VALUES
(
    SD_ID_OID bigint NOT NULL,
    STRING_LIST_ID_EID bigint NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_VALUES_PK') and xtype='PK')
ALTER TABLE SKEWED_VALUES ADD CONSTRAINT SKEWED_VALUES_PK PRIMARY KEY  (SD_ID_OID,INTEGER_IDX);

-- Table SD_PARAMS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SD_PARAMS' and xtype='U')
 CREATE TABLE SD_PARAMS
(
    SD_ID bigint NOT NULL,
    PARAM_KEY varchar(256) NOT NULL,
    PARAM_VALUE varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SD_PARAMS_PK') and xtype='PK')
ALTER TABLE SD_PARAMS ADD CONSTRAINT SD_PARAMS_PK PRIMARY KEY  (SD_ID,PARAM_KEY);

-- Table FUNC_RU for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='FUNC_RU' and xtype='U')
 CREATE TABLE FUNC_RU
(
    FUNC_ID bigint NOT NULL,
    RESOURCE_TYPE int NOT NULL,
    RESOURCE_URI varchar(4000) NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'FUNC_RU_PK') and xtype='PK')
ALTER TABLE FUNC_RU ADD CONSTRAINT FUNC_RU_PK PRIMARY KEY  (FUNC_ID,INTEGER_IDX);

-- Table TYPE_FIELDS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TYPE_FIELDS' and xtype='U')
 CREATE TABLE TYPE_FIELDS
(
    TYPE_NAME bigint NOT NULL,
    COMMENT varchar(256) NULL,
    FIELD_NAME varchar(128) NOT NULL,
    FIELD_TYPE varchar(767) NOT NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TYPE_FIELDS_PK') and xtype='PK')
ALTER TABLE TYPE_FIELDS ADD CONSTRAINT TYPE_FIELDS_PK PRIMARY KEY  (TYPE_NAME,FIELD_NAME);

-- Table BUCKETING_COLS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='BUCKETING_COLS' and xtype='U')
 CREATE TABLE BUCKETING_COLS
(
    SD_ID bigint NOT NULL,
    BUCKET_COL_NAME varchar(255) NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'BUCKETING_COLS_PK') and xtype='PK')
ALTER TABLE BUCKETING_COLS ADD CONSTRAINT BUCKETING_COLS_PK PRIMARY KEY  (SD_ID,INTEGER_IDX);

-- Table DATABASE_PARAMS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='DATABASE_PARAMS' and xtype='U')
 CREATE TABLE DATABASE_PARAMS
(
    DB_ID bigint NOT NULL,
    PARAM_KEY varchar(180) NOT NULL,
    PARAM_VALUE varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'DATABASE_PARAMS_PK') and xtype='PK')
ALTER TABLE DATABASE_PARAMS ADD CONSTRAINT DATABASE_PARAMS_PK PRIMARY KEY  (DB_ID,PARAM_KEY);

-- Table INDEX_PARAMS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='INDEX_PARAMS' and xtype='U')
 CREATE TABLE INDEX_PARAMS
(
    INDEX_ID bigint NOT NULL,
    PARAM_KEY varchar(256) NOT NULL,
    PARAM_VALUE varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'INDEX_PARAMS_PK') and xtype='PK')
ALTER TABLE INDEX_PARAMS ADD CONSTRAINT INDEX_PARAMS_PK PRIMARY KEY  (INDEX_ID,PARAM_KEY);

-- Table COLUMNS_V2 for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='COLUMNS_V2' and xtype='U')
 CREATE TABLE COLUMNS_V2
(
    CD_ID bigint NOT NULL,
    COMMENT varchar(256) NULL,
    "COLUMN_NAME" varchar(128) NOT NULL,
    TYPE_NAME varchar(4000) NOT NULL,
    INTEGER_IDX int NOT NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'COLUMNS_PK') and xtype='PK')
ALTER TABLE COLUMNS_V2 ADD CONSTRAINT COLUMNS_PK PRIMARY KEY  (CD_ID,"COLUMN_NAME");

-- Table SERDE_PARAMS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='SERDE_PARAMS' and xtype='U')
 CREATE TABLE SERDE_PARAMS
(
    SERDE_ID bigint NOT NULL,
    PARAM_KEY varchar(256) NOT NULL,
    PARAM_VALUE varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SERDE_PARAMS_PK') and xtype='PK')
ALTER TABLE SERDE_PARAMS ADD CONSTRAINT SERDE_PARAMS_PK PRIMARY KEY  (SERDE_ID,PARAM_KEY);

-- Table PARTITION_PARAMS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='PARTITION_PARAMS' and xtype='U')
 CREATE TABLE PARTITION_PARAMS
(
    PART_ID bigint NOT NULL,
    PARAM_KEY varchar(256) NOT NULL,
    PARAM_VALUE varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_PARAMS_PK') and xtype='PK')
ALTER TABLE PARTITION_PARAMS ADD CONSTRAINT PARTITION_PARAMS_PK PRIMARY KEY  (PART_ID,PARAM_KEY);

-- Table TABLE_PARAMS for join relationship
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TABLE_PARAMS' and xtype='U')
 CREATE TABLE TABLE_PARAMS
(
    TBL_ID bigint NOT NULL,
    PARAM_KEY varchar(256) NOT NULL,
    PARAM_VALUE varchar(4000) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TABLE_PARAMS_PK') and xtype='PK')
ALTER TABLE TABLE_PARAMS ADD CONSTRAINT TABLE_PARAMS_PK PRIMARY KEY  (TBL_ID,PARAM_KEY);

-- Constraints for table MASTER_KEYS for class(es) [org.apache.hadoop.hive.metastore.model.MMasterKey]

-- Constraints for table IDXS for class(es) [org.apache.hadoop.hive.metastore.model.MIndex]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'IDXS_FK1') and xtype='F')
ALTER TABLE IDXS ADD CONSTRAINT IDXS_FK1 FOREIGN KEY  (INDEX_TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'IDXS_FK2') and xtype='F')
ALTER TABLE IDXS ADD CONSTRAINT IDXS_FK2 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'IDXS_FK3') and xtype='F')
ALTER TABLE IDXS ADD CONSTRAINT IDXS_FK3 FOREIGN KEY  (ORIG_TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='UNIQUEINDEX')
CREATE UNIQUE INDEX UNIQUEINDEX ON IDXS (INDEX_NAME,ORIG_TBL_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='IDXS_N51')
CREATE INDEX IDXS_N51 ON IDXS (SD_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='IDXS_N50')
CREATE INDEX IDXS_N50 ON IDXS (ORIG_TBL_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='IDXS_N49')
CREATE INDEX IDXS_N49 ON IDXS (INDEX_TBL_ID);


-- Constraints for table PART_COL_STATS for class(es) [org.apache.hadoop.hive.metastore.model.MPartitionColumnStatistics]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PART_COL_STATS_FK1') and xtype='F')
ALTER TABLE PART_COL_STATS ADD CONSTRAINT PART_COL_STATS_FK1 FOREIGN KEY  (PART_ID) REFERENCES PARTITIONS (PART_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PART_COL_STATS_N49')
CREATE INDEX PART_COL_STATS_N49 ON PART_COL_STATS (PART_ID);


-- Constraints for table PART_PRIVS for class(es) [org.apache.hadoop.hive.metastore.model.MPartitionPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PART_PRIVS_FK1') and xtype='F')
ALTER TABLE PART_PRIVS ADD CONSTRAINT PART_PRIVS_FK1 FOREIGN KEY  (PART_ID) REFERENCES PARTITIONS (PART_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTPRIVILEGEINDEX')
CREATE INDEX PARTPRIVILEGEINDEX ON PART_PRIVS (PART_ID,PRINCIPAL_NAME,PRINCIPAL_TYPE,PART_PRIV,GRANTOR,GRANTOR_TYPE);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PART_PRIVS_N49')
CREATE INDEX PART_PRIVS_N49 ON PART_PRIVS (PART_ID);


-- Constraints for table SKEWED_STRING_LIST for class(es) [org.apache.hadoop.hive.metastore.model.MStringList]

-- Constraints for table ROLES for class(es) [org.apache.hadoop.hive.metastore.model.MRole]
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='ROLEENTITYINDEX')
CREATE UNIQUE INDEX ROLEENTITYINDEX ON ROLES (ROLE_NAME);


-- Constraints for table PARTITIONS for class(es) [org.apache.hadoop.hive.metastore.model.MPartition]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITIONS_FK1') and xtype='F')
ALTER TABLE PARTITIONS ADD CONSTRAINT PARTITIONS_FK1 FOREIGN KEY  (TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITIONS_FK2') and xtype='F')
ALTER TABLE PARTITIONS ADD CONSTRAINT PARTITIONS_FK2 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITIONS_N49')
CREATE INDEX PARTITIONS_N49 ON PARTITIONS (SD_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITIONS_N50')
CREATE INDEX PARTITIONS_N50 ON PARTITIONS (TBL_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='UNIQUEPARTITION')
CREATE UNIQUE INDEX UNIQUEPARTITION ON PARTITIONS (PART_NAME,TBL_ID);


-- Constraints for table CDS for class(es) [org.apache.hadoop.hive.metastore.model.MColumnDescriptor]

-- Constraints for table VERSION for class(es) [org.apache.hadoop.hive.metastore.model.MVersionTable]

-- Constraints for table GLOBAL_PRIVS for class(es) [org.apache.hadoop.hive.metastore.model.MGlobalPrivilege]
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='GLOBALPRIVILEGEINDEX')
CREATE UNIQUE INDEX GLOBALPRIVILEGEINDEX ON GLOBAL_PRIVS (PRINCIPAL_NAME,PRINCIPAL_TYPE,USER_PRIV,GRANTOR,GRANTOR_TYPE);


-- Constraints for table PART_COL_PRIVS for class(es) [org.apache.hadoop.hive.metastore.model.MPartitionColumnPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PART_COL_PRIVS_FK1') and xtype='F')
ALTER TABLE PART_COL_PRIVS ADD CONSTRAINT PART_COL_PRIVS_FK1 FOREIGN KEY  (PART_ID) REFERENCES PARTITIONS (PART_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PART_COL_PRIVS_N49')
CREATE INDEX PART_COL_PRIVS_N49 ON PART_COL_PRIVS (PART_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITIONCOLUMNPRIVILEGEINDEX')
CREATE INDEX PARTITIONCOLUMNPRIVILEGEINDEX ON PART_COL_PRIVS (PART_ID,"COLUMN_NAME",PRINCIPAL_NAME,PRINCIPAL_TYPE,PART_COL_PRIV,GRANTOR,GRANTOR_TYPE);


-- Constraints for table DB_PRIVS for class(es) [org.apache.hadoop.hive.metastore.model.MDBPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'DB_PRIVS_FK1') and xtype='F')
ALTER TABLE DB_PRIVS ADD CONSTRAINT DB_PRIVS_FK1 FOREIGN KEY  (DB_ID) REFERENCES DBS (DB_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='DBPRIVILEGEINDEX')
CREATE UNIQUE INDEX DBPRIVILEGEINDEX ON DB_PRIVS (DB_ID,PRINCIPAL_NAME,PRINCIPAL_TYPE,DB_PRIV,GRANTOR,GRANTOR_TYPE);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='DB_PRIVS_N49')
CREATE INDEX DB_PRIVS_N49 ON DB_PRIVS (DB_ID);


-- Constraints for table TAB_COL_STATS for class(es) [org.apache.hadoop.hive.metastore.model.MTableColumnStatistics]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TAB_COL_STATS_FK1') and xtype='F')
ALTER TABLE TAB_COL_STATS ADD CONSTRAINT TAB_COL_STATS_FK1 FOREIGN KEY  (TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TAB_COL_STATS_N49')
CREATE INDEX TAB_COL_STATS_N49 ON TAB_COL_STATS (TBL_ID);


-- Constraints for table TYPES for class(es) [org.apache.hadoop.hive.metastore.model.MType]
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='UNIQUETYPE')
CREATE UNIQUE INDEX UNIQUETYPE ON TYPES (TYPE_NAME);


-- Constraints for table TBL_PRIVS for class(es) [org.apache.hadoop.hive.metastore.model.MTablePrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBL_PRIVS_FK1') and xtype='F')
ALTER TABLE TBL_PRIVS ADD CONSTRAINT TBL_PRIVS_FK1 FOREIGN KEY  (TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TBL_PRIVS_N49')
CREATE INDEX TBL_PRIVS_N49 ON TBL_PRIVS (TBL_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TABLEPRIVILEGEINDEX')
CREATE INDEX TABLEPRIVILEGEINDEX ON TBL_PRIVS (TBL_ID,PRINCIPAL_NAME,PRINCIPAL_TYPE,TBL_PRIV,GRANTOR,GRANTOR_TYPE);


-- Constraints for table DBS for class(es) [org.apache.hadoop.hive.metastore.model.MDatabase]
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='UNIQUEDATABASE')
CREATE UNIQUE INDEX UNIQUEDATABASE ON DBS ("NAME");


-- Constraints for table TBL_COL_PRIVS for class(es) [org.apache.hadoop.hive.metastore.model.MTableColumnPrivilege]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBL_COL_PRIVS_FK1') and xtype='F')
ALTER TABLE TBL_COL_PRIVS ADD CONSTRAINT TBL_COL_PRIVS_FK1 FOREIGN KEY  (TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TABLECOLUMNPRIVILEGEINDEX')
CREATE INDEX TABLECOLUMNPRIVILEGEINDEX ON TBL_COL_PRIVS (TBL_ID,"COLUMN_NAME",PRINCIPAL_NAME,PRINCIPAL_TYPE,TBL_COL_PRIV,GRANTOR,GRANTOR_TYPE);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TBL_COL_PRIVS_N49')
CREATE INDEX TBL_COL_PRIVS_N49 ON TBL_COL_PRIVS (TBL_ID);


-- Constraints for table DELEGATION_TOKENS for class(es) [org.apache.hadoop.hive.metastore.model.MDelegationToken]

-- Constraints for table SERDES for class(es) [org.apache.hadoop.hive.metastore.model.MSerDeInfo]

-- Constraints for table FUNCS for class(es) [org.apache.hadoop.hive.metastore.model.MFunction]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'FUNCS_FK1') and xtype='F')
ALTER TABLE FUNCS ADD CONSTRAINT FUNCS_FK1 FOREIGN KEY  (DB_ID) REFERENCES DBS (DB_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='UNIQUEFUNCTION')
CREATE UNIQUE INDEX UNIQUEFUNCTION ON FUNCS (FUNC_NAME,DB_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='FUNCS_N49')
CREATE INDEX FUNCS_N49 ON FUNCS (DB_ID);


-- Constraints for table ROLE_MAP for class(es) [org.apache.hadoop.hive.metastore.model.MRoleMap]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'ROLE_MAP_FK1') and xtype='F')
ALTER TABLE ROLE_MAP ADD CONSTRAINT ROLE_MAP_FK1 FOREIGN KEY  (ROLE_ID) REFERENCES ROLES (ROLE_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='ROLE_MAP_N49')
CREATE INDEX ROLE_MAP_N49 ON ROLE_MAP (ROLE_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='USERROLEMAPINDEX')
CREATE UNIQUE INDEX USERROLEMAPINDEX ON ROLE_MAP (PRINCIPAL_NAME,ROLE_ID,GRANTOR,GRANTOR_TYPE);


-- Constraints for table TBLS for class(es) [org.apache.hadoop.hive.metastore.model.MTable]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBLS_FK2') and xtype='F')
ALTER TABLE TBLS ADD CONSTRAINT TBLS_FK2 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TBLS_FK1') and xtype='F')
ALTER TABLE TBLS ADD CONSTRAINT TBLS_FK1 FOREIGN KEY  (DB_ID) REFERENCES DBS (DB_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TBLS_N50')
CREATE INDEX TBLS_N50 ON TBLS (SD_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='UNIQUETABLE')
CREATE UNIQUE INDEX UNIQUETABLE ON TBLS (TBL_NAME,DB_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TBLS_N49')
CREATE INDEX TBLS_N49 ON TBLS (DB_ID);


-- Constraints for table SDS for class(es) [org.apache.hadoop.hive.metastore.model.MStorageDescriptor]
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SDS_FK1') and xtype='F')
ALTER TABLE SDS ADD CONSTRAINT SDS_FK1 FOREIGN KEY  (SERDE_ID) REFERENCES SERDES (SERDE_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SDS_FK2') and xtype='F')
ALTER TABLE SDS ADD CONSTRAINT SDS_FK2 FOREIGN KEY  (CD_ID) REFERENCES CDS (CD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SDS_N50')
CREATE INDEX SDS_N50 ON SDS (CD_ID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SDS_N49')
CREATE INDEX SDS_N49 ON SDS (SERDE_ID);


-- Constraints for table PARTITION_EVENTS for class(es) [org.apache.hadoop.hive.metastore.model.MPartitionEvent]
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITIONEVENTINDEX')
CREATE INDEX PARTITIONEVENTINDEX ON PARTITION_EVENTS (PARTITION_NAME);


-- Constraints for table SORT_COLS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SORT_COLS_FK1') and xtype='F')
ALTER TABLE SORT_COLS ADD CONSTRAINT SORT_COLS_FK1 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SORT_COLS_N49')
CREATE INDEX SORT_COLS_N49 ON SORT_COLS (SD_ID);


-- Constraints for table SKEWED_COL_NAMES
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_COL_NAMES_FK1') and xtype='F')
ALTER TABLE SKEWED_COL_NAMES ADD CONSTRAINT SKEWED_COL_NAMES_FK1 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SKEWED_COL_NAMES_N49')
CREATE INDEX SKEWED_COL_NAMES_N49 ON SKEWED_COL_NAMES (SD_ID);


-- Constraints for table SKEWED_COL_VALUE_LOC_MAP
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_COL_VALUE_LOC_MAP_FK1') and xtype='F')
ALTER TABLE SKEWED_COL_VALUE_LOC_MAP ADD CONSTRAINT SKEWED_COL_VALUE_LOC_MAP_FK1 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_COL_VALUE_LOC_MAP_FK2') and xtype='F')
ALTER TABLE SKEWED_COL_VALUE_LOC_MAP ADD CONSTRAINT SKEWED_COL_VALUE_LOC_MAP_FK2 FOREIGN KEY  (STRING_LIST_ID_KID) REFERENCES SKEWED_STRING_LIST (STRING_LIST_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SKEWED_COL_VALUE_LOC_MAP_N50')
CREATE INDEX SKEWED_COL_VALUE_LOC_MAP_N50 ON SKEWED_COL_VALUE_LOC_MAP (STRING_LIST_ID_KID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SKEWED_COL_VALUE_LOC_MAP_N49')
CREATE INDEX SKEWED_COL_VALUE_LOC_MAP_N49 ON SKEWED_COL_VALUE_LOC_MAP (SD_ID);


-- Constraints for table SKEWED_STRING_LIST_VALUES
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_STRING_LIST_VALUES_FK1') and xtype='F')
ALTER TABLE SKEWED_STRING_LIST_VALUES ADD CONSTRAINT SKEWED_STRING_LIST_VALUES_FK1 FOREIGN KEY  (STRING_LIST_ID) REFERENCES SKEWED_STRING_LIST (STRING_LIST_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SKEWED_STRING_LIST_VALUES_N49')
CREATE INDEX SKEWED_STRING_LIST_VALUES_N49 ON SKEWED_STRING_LIST_VALUES (STRING_LIST_ID);


-- Constraints for table PARTITION_KEY_VALS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_KEY_VALS_FK1') and xtype='F')
ALTER TABLE PARTITION_KEY_VALS ADD CONSTRAINT PARTITION_KEY_VALS_FK1 FOREIGN KEY  (PART_ID) REFERENCES PARTITIONS (PART_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITION_KEY_VALS_N49')
CREATE INDEX PARTITION_KEY_VALS_N49 ON PARTITION_KEY_VALS (PART_ID);


-- Constraints for table PARTITION_KEYS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_KEYS_FK1') and xtype='F')
ALTER TABLE PARTITION_KEYS ADD CONSTRAINT PARTITION_KEYS_FK1 FOREIGN KEY  (TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITION_KEYS_N49')
CREATE INDEX PARTITION_KEYS_N49 ON PARTITION_KEYS (TBL_ID);


-- Constraints for table SKEWED_VALUES
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_VALUES_FK1') and xtype='F')
ALTER TABLE SKEWED_VALUES ADD CONSTRAINT SKEWED_VALUES_FK1 FOREIGN KEY  (SD_ID_OID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SKEWED_VALUES_FK2') and xtype='F')
ALTER TABLE SKEWED_VALUES ADD CONSTRAINT SKEWED_VALUES_FK2 FOREIGN KEY  (STRING_LIST_ID_EID) REFERENCES SKEWED_STRING_LIST (STRING_LIST_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SKEWED_VALUES_N50')
CREATE INDEX SKEWED_VALUES_N50 ON SKEWED_VALUES (SD_ID_OID);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SKEWED_VALUES_N49')
CREATE INDEX SKEWED_VALUES_N49 ON SKEWED_VALUES (STRING_LIST_ID_EID);


-- Constraints for table SD_PARAMS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SD_PARAMS_FK1') and xtype='F')
ALTER TABLE SD_PARAMS ADD CONSTRAINT SD_PARAMS_FK1 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SD_PARAMS_N49')
CREATE INDEX SD_PARAMS_N49 ON SD_PARAMS (SD_ID);


-- Constraints for table FUNC_RU
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'FUNC_RU_FK1') and xtype='F')
ALTER TABLE FUNC_RU ADD CONSTRAINT FUNC_RU_FK1 FOREIGN KEY  (FUNC_ID) REFERENCES FUNCS (FUNC_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='FUNC_RU_N49')
CREATE INDEX FUNC_RU_N49 ON FUNC_RU (FUNC_ID);


-- Constraints for table TYPE_FIELDS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TYPE_FIELDS_FK1') and xtype='F')
ALTER TABLE TYPE_FIELDS ADD CONSTRAINT TYPE_FIELDS_FK1 FOREIGN KEY  (TYPE_NAME) REFERENCES TYPES (TYPES_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TYPE_FIELDS_N49')
CREATE INDEX TYPE_FIELDS_N49 ON TYPE_FIELDS (TYPE_NAME);


-- Constraints for table BUCKETING_COLS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'BUCKETING_COLS_FK1') and xtype='F')
ALTER TABLE BUCKETING_COLS ADD CONSTRAINT BUCKETING_COLS_FK1 FOREIGN KEY  (SD_ID) REFERENCES SDS (SD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='BUCKETING_COLS_N49')
CREATE INDEX BUCKETING_COLS_N49 ON BUCKETING_COLS (SD_ID);


-- Constraints for table DATABASE_PARAMS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'DATABASE_PARAMS_FK1') and xtype='F')
ALTER TABLE DATABASE_PARAMS ADD CONSTRAINT DATABASE_PARAMS_FK1 FOREIGN KEY  (DB_ID) REFERENCES DBS (DB_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='DATABASE_PARAMS_N49')
CREATE INDEX DATABASE_PARAMS_N49 ON DATABASE_PARAMS (DB_ID);


-- Constraints for table INDEX_PARAMS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'INDEX_PARAMS_FK1') and xtype='F')
ALTER TABLE INDEX_PARAMS ADD CONSTRAINT INDEX_PARAMS_FK1 FOREIGN KEY  (INDEX_ID) REFERENCES IDXS (INDEX_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='INDEX_PARAMS_N49')
CREATE INDEX INDEX_PARAMS_N49 ON INDEX_PARAMS (INDEX_ID);


-- Constraints for table COLUMNS_V2
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'COLUMNS_V2_FK1') and xtype='F')
ALTER TABLE COLUMNS_V2 ADD CONSTRAINT COLUMNS_V2_FK1 FOREIGN KEY  (CD_ID) REFERENCES CDS (CD_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='COLUMNS_V2_N49')
CREATE INDEX COLUMNS_V2_N49 ON COLUMNS_V2 (CD_ID);


-- Constraints for table SERDE_PARAMS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'SERDE_PARAMS_FK1') and xtype='F')
ALTER TABLE SERDE_PARAMS ADD CONSTRAINT SERDE_PARAMS_FK1 FOREIGN KEY  (SERDE_ID) REFERENCES SERDES (SERDE_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='SERDE_PARAMS_N49')
CREATE INDEX SERDE_PARAMS_N49 ON SERDE_PARAMS (SERDE_ID);


-- Constraints for table PARTITION_PARAMS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'PARTITION_PARAMS_FK1') and xtype='F')
ALTER TABLE PARTITION_PARAMS ADD CONSTRAINT PARTITION_PARAMS_FK1 FOREIGN KEY  (PART_ID) REFERENCES PARTITIONS (PART_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='PARTITION_PARAMS_N49')
CREATE INDEX PARTITION_PARAMS_N49 ON PARTITION_PARAMS (PART_ID);


-- Constraints for table TABLE_PARAMS
IF NOT EXISTS (SELECT * FROM sysobjects WHERE id=object_id(N'TABLE_PARAMS_FK1') and xtype='F')
ALTER TABLE TABLE_PARAMS ADD CONSTRAINT TABLE_PARAMS_FK1 FOREIGN KEY  (TBL_ID) REFERENCES TBLS (TBL_ID) ;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name='TABLE_PARAMS_N49')
CREATE INDEX TABLE_PARAMS_N49 ON TABLE_PARAMS (TBL_ID);



-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Transaction and Lock Tables
-- These are not part of package jdo, so if you are going to regenerate this file you need to manually add the following section back to the file.
-- -----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='COMPACTION_QUEUE(' and xtype='U')
 CREATE TABLE COMPACTION_QUEUE(
	CQ_ID int NOT NULL,
	CQ_DATABASE varchar(128) NOT NULL,
	CQ_TABLE varchar(128) NOT NULL,
	CQ_PARTITION varchar(767) NULL,
	CQ_STATE char(1) NOT NULL,
	CQ_TYPE char(1) NOT NULL,
	CQ_WORKER_ID varchar(128) NULL,
	CQ_START int NULL,
	CQ_RUN_AS varchar(128) NULL,
PRIMARY KEY CLUSTERED 
(
	CQ_ID ASC
)
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='COMPLETED_TXN_COMPONENTS(' and xtype='U')
 CREATE TABLE COMPLETED_TXN_COMPONENTS(
	CTC_TXNID int NULL,
	CTC_DATABASE varchar(128) NOT NULL,
	CTC_TABLE varchar(128) NULL,
	CTC_PARTITION varchar(767) NULL
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='HIVE_LOCKS(' and xtype='U')
 CREATE TABLE HIVE_LOCKS(
	HL_LOCK_EXT_ID int NOT NULL,
	HL_LOCK_INT_ID int NOT NULL,
	HL_TXNID int NULL,
	HL_DB varchar(128) NOT NULL,
	HL_TABLE varchar(128) NULL,
	HL_PARTITION varchar(767) NULL,
	HL_LOCK_STATE char(1) NOT NULL,
	HL_LOCK_TYPE char(1) NOT NULL,
	HL_LAST_HEARTBEAT int NOT NULL,
	HL_ACQUIRED_AT int NULL,
	HL_USER varchar(128) NOT NULL,
	HL_HOST varchar(128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	HL_LOCK_EXT_ID ASC,
	HL_LOCK_INT_ID ASC
)
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='NEXT_COMPACTION_QUEUE_ID(' and xtype='U')
 CREATE TABLE NEXT_COMPACTION_QUEUE_ID(
	NCQ_NEXT int NOT NULL
);

IF NOT EXISTS (SELECT * FROM NEXT_COMPACTION_QUEUE_ID)
INSERT INTO NEXT_COMPACTION_QUEUE_ID VALUES(1);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='NEXT_LOCK_ID(' and xtype='U')
 CREATE TABLE NEXT_LOCK_ID(
	NL_NEXT int NOT NULL
);

IF NOT EXISTS (SELECT * FROM NEXT_LOCK_ID)
INSERT INTO NEXT_LOCK_ID VALUES(1);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='NEXT_TXN_ID(' and xtype='U')
 CREATE TABLE NEXT_TXN_ID(
	NTXN_NEXT int NOT NULL
);

IF NOT EXISTS (SELECT * FROM NEXT_TXN_ID)
INSERT INTO NEXT_TXN_ID VALUES(1);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TXNS(' and xtype='U')
 CREATE TABLE TXNS(
	TXN_ID int NOT NULL,
	TXN_STATE char(1) NOT NULL,
	TXN_STARTED int NOT NULL,
	TXN_LAST_HEARTBEAT int NOT NULL,
	TXN_USER varchar(128) NOT NULL,
	TXN_HOST varchar(128) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	TXN_ID ASC
)
);

IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='TXN_COMPONENTS(' and xtype='U')
 CREATE TABLE TXN_COMPONENTS(
	TC_TXNID int NULL,
	TC_DATABASE varchar(128) NOT NULL,
	TC_TABLE varchar(128) NULL,
	TC_PARTITION varchar(767) NULL
);

ALTER TABLE TXN_COMPONENTS  WITH CHECK ADD FOREIGN KEY(TC_TXNID) REFERENCES TXNS (TXN_ID);



-- -----------------------------------------------------------------
-- Record schema version. Should be the last step in the init script
-- -----------------------------------------------------------------
INSERT INTO VERSION (VER_ID, SCHEMA_VERSION, VERSION_COMMENT) VALUES (1, '0.13.0', 'Hive release version 0.13.0');
