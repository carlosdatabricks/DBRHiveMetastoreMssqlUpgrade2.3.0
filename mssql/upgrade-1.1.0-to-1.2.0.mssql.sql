SELECT 'Upgrading MetaStore schema from 1.1.0 to 1.2.0' AS MESSAGE;


--ALTER TABLE MASTER_KEYS
ALTER TABLE MASTER_KEYS ALTER COLUMN MASTER_KEY nvarchar(767) NULL;

--ALTER TABLE IDXS
ALTER TABLE IDXS ALTER COLUMN INDEX_HANDLER_CLASS nvarchar(4000) NULL;

DROP INDEX IDXS.UNIQUEINDEX;
ALTER TABLE IDXS ALTER COLUMN INDEX_NAME nvarchar(128) NULL;
CREATE UNIQUE INDEX UNIQUEINDEX ON IDXS (INDEX_NAME,ORIG_TBL_ID);

--ALTER TABLE PART_COL_STATS
DROP INDEX PART_COL_STATS.PCS_STATS_IDX;
ALTER TABLE PART_COL_STATS ALTER COLUMN "COLUMN_NAME" nvarchar(128) NOT NULL;
ALTER TABLE PART_COL_STATS ALTER COLUMN COLUMN_TYPE nvarchar(128) NOT NULL;
ALTER TABLE PART_COL_STATS ALTER COLUMN DB_NAME nvarchar(128) NOT NULL;
ALTER TABLE PART_COL_STATS ALTER COLUMN BIG_DECIMAL_HIGH_VALUE nvarchar(255) NULL;
ALTER TABLE PART_COL_STATS ALTER COLUMN BIG_DECIMAL_LOW_VALUE nvarchar(255) NULL;
ALTER TABLE PART_COL_STATS ALTER COLUMN PARTITION_NAME nvarchar(767) NOT NULL;
ALTER TABLE PART_COL_STATS ALTER COLUMN "TABLE_NAME" nvarchar(128) NOT NULL; 
CREATE INDEX PCS_STATS_IDX ON PART_COL_STATS (DB_NAME,TABLE_NAME,COLUMN_NAME,PARTITION_NAME);

--ALTER TABLE PART_PRIVS
DROP INDEX PART_PRIVS.PARTPRIVILEGEINDEX;
ALTER TABLE PART_PRIVS ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE PART_PRIVS ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE PART_PRIVS ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE PART_PRIVS ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
ALTER TABLE PART_PRIVS ALTER COLUMN PART_PRIV nvarchar(128) NULL;
CREATE INDEX PARTPRIVILEGEINDEX ON PART_PRIVS (PART_ID,PRINCIPAL_NAME,PRINCIPAL_TYPE,PART_PRIV,GRANTOR,GRANTOR_TYPE);


--ALTER TABLE ROLES
DROP INDEX ROLES.ROLEENTITYINDEX;
ALTER TABLE ROLES ALTER COLUMN OWNER_NAME nvarchar(128) NULL;
ALTER TABLE ROLES ALTER COLUMN ROLE_NAME nvarchar(128) NULL;
CREATE UNIQUE INDEX ROLEENTITYINDEX ON ROLES (ROLE_NAME);

--ALTER TABLE VERSION
ALTER TABLE VERSION ALTER COLUMN SCHEMA_VERSION nvarchar(127) NOT NULL;
ALTER TABLE VERSION ALTER COLUMN VERSION_COMMENT nvarchar(255) NOT NULL;

--ALTER TABLE GLOBAL_PRIVS
DROP INDEX GLOBAL_PRIVS.GLOBALPRIVILEGEINDEX;
ALTER TABLE GLOBAL_PRIVS ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE GLOBAL_PRIVS ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE GLOBAL_PRIVS ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE GLOBAL_PRIVS ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
ALTER TABLE GLOBAL_PRIVS ALTER COLUMN USER_PRIV nvarchar(128) NULL;
CREATE UNIQUE INDEX GLOBALPRIVILEGEINDEX ON GLOBAL_PRIVS (PRINCIPAL_NAME,PRINCIPAL_TYPE,USER_PRIV,GRANTOR,GRANTOR_TYPE);


--ALTER TABLE PART_COL_PRIVS
DROP INDEX PART_COL_PRIVS.PARTITIONCOLUMNPRIVILEGEINDEX;
ALTER TABLE PART_COL_PRIVS ALTER COLUMN "COLUMN_NAME" nvarchar(128) NULL;
ALTER TABLE PART_COL_PRIVS ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE PART_COL_PRIVS ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE PART_COL_PRIVS ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE PART_COL_PRIVS ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
ALTER TABLE PART_COL_PRIVS ALTER COLUMN PART_COL_PRIV nvarchar(128) NULL;
CREATE INDEX PARTITIONCOLUMNPRIVILEGEINDEX ON PART_COL_PRIVS (PART_ID,"COLUMN_NAME",PRINCIPAL_NAME,PRINCIPAL_TYPE,PART_COL_PRIV,GRANTOR,GRANTOR_TYPE);

--ALTER TABLE DB_PRIVS
DROP INDEX DB_PRIVS.DBPRIVILEGEINDEX;
ALTER TABLE DB_PRIVS ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE DB_PRIVS ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE DB_PRIVS ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE DB_PRIVS ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
ALTER TABLE DB_PRIVS ALTER COLUMN DB_PRIV nvarchar(128) NULL;
CREATE UNIQUE INDEX DBPRIVILEGEINDEX ON DB_PRIVS (DB_ID,PRINCIPAL_NAME,PRINCIPAL_TYPE,DB_PRIV,GRANTOR,GRANTOR_TYPE);


--ALTER TABLE TAB_COL_STATS
ALTER TABLE TAB_COL_STATS ALTER COLUMN "COLUMN_NAME" nvarchar(128) NOT NULL;
ALTER TABLE TAB_COL_STATS ALTER COLUMN COLUMN_TYPE nvarchar(128) NOT NULL;
ALTER TABLE TAB_COL_STATS ALTER COLUMN DB_NAME nvarchar(128) NOT NULL;
ALTER TABLE TAB_COL_STATS ALTER COLUMN BIG_DECIMAL_HIGH_VALUE nvarchar(255) NULL;
ALTER TABLE TAB_COL_STATS ALTER COLUMN BIG_DECIMAL_LOW_VALUE nvarchar(255) NULL;
ALTER TABLE TAB_COL_STATS ALTER COLUMN "TABLE_NAME" nvarchar(128) NOT NULL;


--ALTER TABLE TYPES
DROP INDEX TYPES.UNIQUETYPE;
ALTER TABLE TYPES ALTER COLUMN TYPE_NAME nvarchar(128) NULL;
ALTER TABLE TYPES ALTER COLUMN TYPE1 nvarchar(767) NULL;
ALTER TABLE TYPES ALTER COLUMN TYPE2 nvarchar(767) NULL;
CREATE UNIQUE INDEX UNIQUETYPE ON TYPES (TYPE_NAME);


--ALTER TABLE TBL_PRIVS
DROP INDEX TBL_PRIVS.TABLEPRIVILEGEINDEX;
ALTER TABLE TBL_PRIVS ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE TBL_PRIVS ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE TBL_PRIVS ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE TBL_PRIVS ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
ALTER TABLE TBL_PRIVS ALTER COLUMN TBL_PRIV nvarchar(128) NULL;
CREATE INDEX TABLEPRIVILEGEINDEX ON TBL_PRIVS (TBL_ID,PRINCIPAL_NAME,PRINCIPAL_TYPE,TBL_PRIV,GRANTOR,GRANTOR_TYPE);


--ALTER TABLE DBS
DROP INDEX DBS.UNIQUEDATABASE;
ALTER TABLE DBS ALTER COLUMN "DESC" nvarchar(4000) NULL;
ALTER TABLE DBS ALTER COLUMN DB_LOCATION_URI nvarchar(4000) NOT NULL;
ALTER TABLE DBS ALTER COLUMN "NAME" nvarchar(128) NULL;
ALTER TABLE DBS ALTER COLUMN OWNER_NAME nvarchar(128) NULL;
ALTER TABLE DBS ALTER COLUMN OWNER_TYPE nvarchar(10) NULL;
CREATE UNIQUE INDEX UNIQUEDATABASE ON DBS ("NAME");

    
--ALTER TABLE TBL_COL_PRIVS
DROP INDEX TBL_COL_PRIVS.TABLECOLUMNPRIVILEGEINDEX;
ALTER TABLE TBL_COL_PRIVS ALTER COLUMN "COLUMN_NAME" nvarchar(128) NULL;
ALTER TABLE TBL_COL_PRIVS ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE TBL_COL_PRIVS ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE TBL_COL_PRIVS ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE TBL_COL_PRIVS ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
ALTER TABLE TBL_COL_PRIVS ALTER COLUMN TBL_COL_PRIV nvarchar(128) NULL;
CREATE INDEX TABLECOLUMNPRIVILEGEINDEX ON TBL_COL_PRIVS (TBL_ID,"COLUMN_NAME",PRINCIPAL_NAME,PRINCIPAL_TYPE,TBL_COL_PRIV,GRANTOR,GRANTOR_TYPE);

--ALTER TABLE DELEGATION_TOKENS
ALTER TABLE DELEGATION_TOKENS DROP CONSTRAINT DELEGATION_TOKENS_PK;
ALTER TABLE DELEGATION_TOKENS ALTER COLUMN TOKEN_IDENT nvarchar(767) NOT NULL;
ALTER TABLE DELEGATION_TOKENS ALTER COLUMN TOKEN nvarchar(767) NULL;
ALTER TABLE DELEGATION_TOKENS ADD CONSTRAINT DELEGATION_TOKENS_PK PRIMARY KEY (TOKEN_IDENT);

--ALTER TABLE SERDES    
ALTER TABLE SERDES ALTER COLUMN "NAME" nvarchar(128) NULL;
ALTER TABLE SERDES ALTER COLUMN SLIB nvarchar(4000) NULL;


--ALTER TABLE FUNCS    
DROP INDEX FUNCS.UNIQUEFUNCTION;
ALTER TABLE FUNCS ALTER COLUMN CLASS_NAME nvarchar(4000) NULL;
ALTER TABLE FUNCS ALTER COLUMN FUNC_NAME nvarchar(128) NULL;
ALTER TABLE FUNCS ALTER COLUMN OWNER_NAME nvarchar(128) NULL;
ALTER TABLE FUNCS ALTER COLUMN OWNER_TYPE nvarchar(10) NULL;
CREATE UNIQUE INDEX UNIQUEFUNCTION ON FUNCS (FUNC_NAME,DB_ID);


--ALTER TABLE ROLE_MAP    
DROP INDEX ROLE_MAP.USERROLEMAPINDEX;
ALTER TABLE ROLE_MAP ALTER COLUMN GRANTOR nvarchar(128) NULL;
ALTER TABLE ROLE_MAP ALTER COLUMN GRANTOR_TYPE nvarchar(128) NULL;
ALTER TABLE ROLE_MAP ALTER COLUMN PRINCIPAL_NAME nvarchar(128) NULL;
ALTER TABLE ROLE_MAP ALTER COLUMN PRINCIPAL_TYPE nvarchar(128) NULL;
CREATE UNIQUE INDEX USERROLEMAPINDEX ON ROLE_MAP (PRINCIPAL_NAME,ROLE_ID,GRANTOR,GRANTOR_TYPE);


--ALTER TABLE TBLS  
DROP INDEX TBLS.UNIQUETABLE;
ALTER TABLE TBLS ALTER COLUMN OWNER nvarchar(767) NULL;
ALTER TABLE TBLS ALTER COLUMN TBL_NAME nvarchar(128) NULL;
ALTER TABLE TBLS ALTER COLUMN TBL_TYPE nvarchar(128) NULL;
CREATE UNIQUE INDEX UNIQUETABLE ON TBLS (TBL_NAME,DB_ID);

--ALTER TABLE SDS    
ALTER TABLE SDS ALTER COLUMN INPUT_FORMAT nvarchar(4000) NULL;
ALTER TABLE SDS ALTER COLUMN OUTPUT_FORMAT nvarchar(4000) NULL;

--ALTER TABLE PARTITION_EVENTS    
DROP INDEX PARTITION_EVENTS.PARTITIONEVENTINDEX;
ALTER TABLE PARTITION_EVENTS ALTER COLUMN DB_NAME nvarchar(128) NULL;
ALTER TABLE PARTITION_EVENTS ALTER COLUMN PARTITION_NAME nvarchar(767) NULL;
ALTER TABLE PARTITION_EVENTS ALTER COLUMN TBL_NAME nvarchar(128) NULL;
CREATE INDEX PARTITIONEVENTINDEX ON PARTITION_EVENTS (PARTITION_NAME);

--ALTER TABLE SORT_COLS
ALTER TABLE SORT_COLS ALTER COLUMN "COLUMN_NAME" nvarchar(128) NULL;

--ALTER TABLE SKEWED_COL_NAMES
ALTER TABLE SKEWED_COL_NAMES ALTER COLUMN SKEWED_COL_NAME nvarchar(255) NULL;    


--ALTER TABLE SKEWED_COL_VALUE_LOC_MAP
ALTER TABLE SKEWED_COL_VALUE_LOC_MAP ALTER COLUMN LOCATION nvarchar(4000) NULL;    

--ALTER TABLE SKEWED_STRING_LIST_VALUES
ALTER TABLE SKEWED_STRING_LIST_VALUES ALTER COLUMN STRING_LIST_VALUE nvarchar(255) NULL;

--ALTER TABLE PARTITION_KEYS 
ALTER TABLE PARTITION_KEYS DROP CONSTRAINT PARTITION_KEY_PK;
ALTER TABLE PARTITION_KEYS ALTER COLUMN PKEY_COMMENT nvarchar(4000) NULL;
ALTER TABLE PARTITION_KEYS ALTER COLUMN PKEY_NAME nvarchar(128) NOT NULL;
ALTER TABLE PARTITION_KEYS ALTER COLUMN PKEY_TYPE nvarchar(767) NOT NULL;
ALTER TABLE PARTITION_KEYS ADD CONSTRAINT PARTITION_KEY_PK PRIMARY KEY (TBL_ID,PKEY_NAME);

--ALTER TABLE SD_PARAMS
ALTER TABLE SD_PARAMS DROP CONSTRAINT SD_PARAMS_PK;
ALTER TABLE SD_PARAMS ALTER COLUMN PARAM_KEY nvarchar(256) NOT NULL;
ALTER TABLE SD_PARAMS ALTER COLUMN PARAM_VALUE nvarchar(4000) NULL;
ALTER TABLE SD_PARAMS ADD CONSTRAINT SD_PARAMS_PK PRIMARY KEY (SD_ID,PARAM_KEY);


--ALTER TABLE FUNC_RU
ALTER TABLE FUNC_RU ALTER COLUMN RESOURCE_URI nvarchar(4000) NULL;    


--ALTER TABLE TYPE_FIELDS
ALTER TABLE TYPE_FIELDS DROP CONSTRAINT TYPE_FIELDS_PK;
ALTER TABLE TYPE_FIELDS ALTER COLUMN COMMENT nvarchar(256) NULL;
ALTER TABLE TYPE_FIELDS ALTER COLUMN FIELD_NAME nvarchar(128) NOT NULL;
ALTER TABLE TYPE_FIELDS ALTER COLUMN FIELD_TYPE nvarchar(767) NOT NULL;
ALTER TABLE TYPE_FIELDS ADD CONSTRAINT TYPE_FIELDS_PK PRIMARY KEY (TYPE_NAME,FIELD_NAME);

--ALTER TABLE BUCKETING_COLS
ALTER TABLE BUCKETING_COLS ALTER COLUMN BUCKET_COL_NAME nvarchar(255) NULL;

--ALTER TABLE DATABASE_PARAMS
ALTER TABLE DATABASE_PARAMS DROP CONSTRAINT DATABASE_PARAMS_PK;
ALTER TABLE DATABASE_PARAMS ALTER COLUMN PARAM_KEY nvarchar(180) NOT NULL;
ALTER TABLE DATABASE_PARAMS ALTER COLUMN PARAM_VALUE nvarchar(4000) NULL;
ALTER TABLE DATABASE_PARAMS ADD CONSTRAINT DATABASE_PARAMS_PK PRIMARY KEY (DB_ID,PARAM_KEY);


--ALTER TABLE INDEX_PARAMS
ALTER TABLE INDEX_PARAMS DROP CONSTRAINT INDEX_PARAMS_PK;
ALTER TABLE INDEX_PARAMS ALTER COLUMN PARAM_KEY nvarchar(256) NOT NULL;
ALTER TABLE INDEX_PARAMS ALTER COLUMN PARAM_VALUE nvarchar(4000) NULL;
ALTER TABLE INDEX_PARAMS ADD CONSTRAINT INDEX_PARAMS_PK PRIMARY KEY (INDEX_ID,PARAM_KEY);

--ALTER TABLE COLUMNS_V2
ALTER TABLE COLUMNS_V2 DROP CONSTRAINT COLUMNS_PK;
ALTER TABLE COLUMNS_V2 ALTER COLUMN COMMENT nvarchar(256) NULL;
ALTER TABLE COLUMNS_V2 ALTER COLUMN "COLUMN_NAME" nvarchar(128) NOT NULL;
ALTER TABLE COLUMNS_V2 ALTER COLUMN TYPE_NAME nvarchar(4000) NOT NULL;
ALTER TABLE COLUMNS_V2 ADD CONSTRAINT COLUMNS_PK PRIMARY KEY (CD_ID,"COLUMN_NAME");

--ALTER TABLE SERDE_PARAMS
ALTER TABLE SERDE_PARAMS DROP CONSTRAINT SERDE_PARAMS_PK;
ALTER TABLE SERDE_PARAMS ALTER COLUMN PARAM_KEY nvarchar(256) NOT NULL;
ALTER TABLE SERDE_PARAMS ALTER COLUMN PARAM_VALUE nvarchar(4000) NULL;
ALTER TABLE SERDE_PARAMS ADD CONSTRAINT SERDE_PARAMS_PK PRIMARY KEY (SERDE_ID,PARAM_KEY);

--ALTER TABLE PARTITION_PARAMS
ALTER TABLE PARTITION_PARAMS DROP CONSTRAINT PARTITION_PARAMS_PK;
ALTER TABLE PARTITION_PARAMS ALTER COLUMN PARAM_KEY nvarchar(256) NOT NULL;
ALTER TABLE PARTITION_PARAMS ALTER COLUMN PARAM_VALUE nvarchar(4000) NULL;
ALTER TABLE PARTITION_PARAMS ADD CONSTRAINT PARTITION_PARAMS_PK PRIMARY KEY (PART_ID,PARAM_KEY);

--ALTER TABLE TABLE_PARAMS
ALTER TABLE TABLE_PARAMS DROP CONSTRAINT TABLE_PARAMS_PK;
ALTER TABLE TABLE_PARAMS ALTER COLUMN PARAM_KEY nvarchar(256) NOT NULL;
ALTER TABLE TABLE_PARAMS ALTER COLUMN PARAM_VALUE nvarchar(4000) NULL;
ALTER TABLE TABLE_PARAMS ADD CONSTRAINT TABLE_PARAMS_PK PRIMARY KEY (TBL_ID,PARAM_KEY);

--ALTER TABLE NOTIFICATION_LOG
ALTER TABLE NOTIFICATION_LOG DROP CONSTRAINT NOTIFICATION_LOG_PK;
ALTER TABLE NOTIFICATION_LOG ALTER COLUMN EVENT_TYPE nvarchar(32) NOT NULL;
ALTER TABLE NOTIFICATION_LOG ALTER COLUMN DB_NAME nvarchar(128) NOT NULL;
ALTER TABLE NOTIFICATION_LOG ALTER COLUMN TBL_NAME nvarchar(128) NOT NULL;
ALTER TABLE NOTIFICATION_LOG ADD CONSTRAINT NOTIFICATION_LOG_PK PRIMARY KEY (NL_ID);

--ALTER TABLE COMPACTION_QUEUE
ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_DATABASE nvarchar(128) NOT NULL;
ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_TABLE nvarchar(128) NOT NULL;
ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_PARTITION nvarchar(767) NULL;
ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_WORKER_ID nvarchar(128) NULL;
ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_RUN_AS nvarchar(128) NULL;

--ALTER TABLE COMPLETED_TXN_COMPONENTS
ALTER TABLE COMPLETED_TXN_COMPONENTS ALTER COLUMN CTC_DATABASE nvarchar(128) NOT NULL;
ALTER TABLE COMPLETED_TXN_COMPONENTS ALTER COLUMN CTC_TABLE nvarchar(128) NULL;
ALTER TABLE COMPLETED_TXN_COMPONENTS ALTER COLUMN CTC_PARTITION nvarchar(767) NULL;

--ALTER TABLE HIVE_LOCKS
ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_DB nvarchar(128) NOT NULL;
ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_TABLE nvarchar(128) NULL;
ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_PARTITION nvarchar(767) NULL;
ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_USER nvarchar(128) NOT NULL;
ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_HOST nvarchar(128) NOT NULL;


--ALTER TABLE TXNS
ALTER TABLE TXNS ALTER COLUMN TXN_USER nvarchar(128) NOT NULL;
ALTER TABLE TXNS ALTER COLUMN TXN_HOST nvarchar(128) NOT NULL;

--ALTER TABLE TXN_COMPONENTS
ALTER TABLE TXN_COMPONENTS ALTER COLUMN TC_DATABASE nvarchar(128) NOT NULL;
ALTER TABLE TXN_COMPONENTS ALTER COLUMN	TC_TABLE nvarchar(128) NULL;
ALTER TABLE TXN_COMPONENTS ALTER COLUMN TC_PARTITION nvarchar(767) NULL;


UPDATE VERSION SET SCHEMA_VERSION='1.2.0', VERSION_COMMENT='Hive release version 1.2.0' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 1.1.0 to 1.2.0' AS MESSAGE;
