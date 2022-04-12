SELECT 'Upgrading MetaStore schema from 0.13.0 to 0.14.0' AS MESSAGE;

CREATE INDEX PCS_STATS_IDX ON PART_COL_STATS (DB_NAME,TABLE_NAME,COLUMN_NAME,PARTITION_NAME);
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

-- Drop the primary key constraint on table COMPACTION_QUEUE
DECLARE @sqlcmd NVARCHAR(MAX)

SELECT @sqlcmd = 'ALTER TABLE COMPACTION_QUEUE DROP CONSTRAINT ' + name + ';'
  FROM sys.key_constraints
  WHERE [type] = 'PK'
    AND [parent_object_id] = OBJECT_ID('COMPACTION_QUEUE')

EXECUTE (@sqlcmd);

ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_ID bigint NOT NULL;

-- Restore the primary key constraint on table COMPACTION_QUEUE
ALTER TABLE COMPACTION_QUEUE ADD CONSTRAINT PK_COMPACTION_CQID PRIMARY KEY CLUSTERED (CQ_ID ASC);

ALTER TABLE COMPACTION_QUEUE ALTER COLUMN CQ_START bigint NULL;


ALTER TABLE COMPLETED_TXN_COMPONENTS ALTER COLUMN CTC_TXNID bigint NULL;


-- Drop the primary key constraint on table HIVE_LOCKS
DECLARE @sqlcmd NVARCHAR(MAX)

SELECT @sqlcmd = 'ALTER TABLE HIVE_LOCKS DROP CONSTRAINT ' + name + ';'
  FROM sys.key_constraints
  WHERE [type] = 'PK'
    AND [parent_object_id] = OBJECT_ID('HIVE_LOCKS')

EXECUTE (@sqlcmd);

ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_LOCK_EXT_ID bigint NOT NULL;

ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_LOCK_INT_ID bigint NOT NULL;

-- Restore the composite primary key constraint on table HIVE_LOCKS
ALTER TABLE HIVE_LOCKS ADD CONSTRAINT PK_HL_LOCKEXTID_LOCKINTID
  PRIMARY KEY CLUSTERED (HL_LOCK_EXT_ID ASC, HL_LOCK_INT_ID ASC);

ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_TXNID bigint NULL;

ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_LAST_HEARTBEAT bigint NOT NULL;

ALTER TABLE HIVE_LOCKS ALTER COLUMN HL_ACQUIRED_AT bigint NULL;


ALTER TABLE NEXT_COMPACTION_QUEUE_ID ALTER COLUMN NCQ_NEXT bigint NOT NULL;


ALTER TABLE NEXT_LOCK_ID ALTER COLUMN NL_NEXT bigint NOT NULL;


ALTER TABLE NEXT_TXN_ID ALTER COLUMN NTXN_NEXT bigint NOT NULL;


-- Drop the foreign key constraint on table TXN_COMPONENTS, this is required
-- before we drop the primary key constraint on table TXNS
DECLARE @sqlcmd NVARCHAR(MAX)

SELECT @sqlcmd = 'ALTER TABLE TXN_COMPONENTS DROP CONSTRAINT ' + name + ';'
  FROM sys.foreign_keys
  WHERE [parent_object_id] = OBJECT_ID('TXN_COMPONENTS')

EXECUTE (@sqlcmd);

-- Drop the primary key constraint on table TXNS
DECLARE @sqlcmd NVARCHAR(MAX)

SELECT @sqlcmd = 'ALTER TABLE TXNS DROP CONSTRAINT ' + name + ';'
  FROM sys.key_constraints
  WHERE [type] = 'PK'
    AND [parent_object_id] = OBJECT_ID('TXNS')

EXECUTE (@sqlcmd);

ALTER TABLE TXNS ALTER COLUMN TXN_ID bigint NOT NULL;

-- Restore the primary key constraint on table TXNS
ALTER TABLE TXNS ADD CONSTRAINT PK_TXNS_TXNID PRIMARY KEY CLUSTERED (TXN_ID ASC);

ALTER TABLE TXNS ALTER COLUMN TXN_STARTED bigint NOT NULL;

ALTER TABLE TXNS ALTER COLUMN TXN_LAST_HEARTBEAT bigint NOT NULL;

ALTER TABLE TXN_COMPONENTS ALTER COLUMN TC_TXNID bigint NULL;

-- Restore the foreign key constraint on table TXN_COMPONENTS
ALTER TABLE TXN_COMPONENTS WITH CHECK ADD FOREIGN KEY(TC_TXNID) REFERENCES TXNS (TXN_ID);
--ALTER PARTITIONS.PART_NAME from varchar to nvarchar
DROP INDEX PARTITIONS.UNIQUEPARTITION;
ALTER TABLE PARTITIONS ALTER COLUMN PART_NAME NVARCHAR(767) NULL;
CREATE UNIQUE INDEX UNIQUEPARTITION ON PARTITIONS (PART_NAME,TBL_ID);

--ALTER SDS.LOCATION from varchar to nvarchar
ALTER TABLE SDS ALTER COLUMN LOCATION NVARCHAR(4000) NULL;

--ALTER PARTITION_KEY_VALS.PART_KEY_VAL from varchar to nvarchar
ALTER TABLE PARTITION_KEY_VALS ALTER COLUMN PART_KEY_VAL NVARCHAR(255) NULL;

UPDATE VERSION SET SCHEMA_VERSION='0.14.0', VERSION_COMMENT='Hive release version 0.14.0' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 0.13.0 to 0.14.0' AS MESSAGE;
