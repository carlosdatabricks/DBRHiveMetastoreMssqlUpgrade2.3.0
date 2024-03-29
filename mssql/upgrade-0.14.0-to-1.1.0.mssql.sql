SELECT 'Upgrading MetaStore schema from 0.14.0 to 1.1.0' AS MESSAGE;

CREATE TABLE NOTIFICATION_LOG
(
    NL_ID bigint NOT NULL,
    EVENT_ID bigint NOT NULL,
    EVENT_TIME int NOT NULL,
    EVENT_TYPE varchar(32) NOT NULL,
    DB_NAME varchar(128) NULL,
    TBL_NAME varchar(128) NULL,
    MESSAGE text NULL
);


ALTER TABLE NOTIFICATION_LOG ADD CONSTRAINT NOTIFICATION_LOG_PK PRIMARY KEY (NL_ID);

CREATE TABLE NOTIFICATION_SEQUENCE
(
    NNI_ID bigint NOT NULL,
    NEXT_EVENT_ID bigint NOT NULL
);


ALTER TABLE NOTIFICATION_SEQUENCE ADD CONSTRAINT NOTIFICATION_SEQUENCE_PK PRIMARY KEY (NNI_ID);




UPDATE VERSION SET SCHEMA_VERSION='1.1.0', VERSION_COMMENT='Hive release version 1.1.0' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 0.14.0 to 1.1.0' AS MESSAGE;
