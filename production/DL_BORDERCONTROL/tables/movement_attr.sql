CREATE TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" 
   (	"MVMNTID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"SEQNO" NUMBER NOT NULL ENABLE, 
	"ATTRVARCHAR" VARCHAR2(4000 CHAR), 
	"ATTRBLOB" BLOB, 
	"INS_AT" TIMESTAMP (6) DEFAULT sysdate
                                            --
                                           , 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE
   ) 
  PARTITION BY RANGE ("INS_AT") INTERVAL (NUMTOYMINTERVAL(1 ,'MONTH')) 
 (PARTITION "P_BEFORE_2018"  VALUES LESS THAN (TIMESTAMP' 2018-01-01 00:00:00') ) ;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" ADD CONSTRAINT "PK_MOVEMENT_ATTR" PRIMARY KEY ("MVMNTID", "SEQNO")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" ADD CONSTRAINT "MOVEMENT_ATTR$CHK00" CHECK (DML_TYPE in ('I'
                                                                                                ,'U')) ENABLE;
  ALTER TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR" ADD CONSTRAINT "MOVEMENT_ATTR$FK00" FOREIGN KEY ("MVMNTID")
	  REFERENCES "DL_BORDERCONTROL"."MOVEMENTS" ("MVMNTID") ON DELETE CASCADE ENABLE;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."MVMNTID" IS 'Foreign Key to Movements Table';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."SEQNO" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."ATTRVARCHAR" IS 'Name of Attributes';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."ATTRBLOB" IS 'Image';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_TERMINAL" IS 'On which terminal was this row created/inserted';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."MOVEMENT_ATTR"."INS_BORDERPOST" IS 'On which borderpost was this row created/inserted';
   COMMENT ON TABLE "DL_BORDERCONTROL"."MOVEMENT_ATTR"  IS 'Table for movement specific attributes';
  CREATE INDEX "DL_BORDERCONTROL"."MOVEMENT_ATTR$IX00" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENT_ATTR$IX01" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("INS_TERMINAL") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."MOVEMENT_ATTR$IX02" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("INS_AT") 
   LOCAL
 (PARTITION "P_BEFORE_2018" ) ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."PK_MOVEMENT_ATTR" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" ("MVMNTID", "SEQNO") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000311917C00004$$" ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" (
   LOCAL
 (PARTITION "SYS_IL_P7257" ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "SERVAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "PIBICSAPP";
  GRANT UPDATE ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "PIBICSAPP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "APPSUP";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."MOVEMENT_ATTR" TO "BIOSUPPORT";
