CREATE TABLE "DL_COMMON"."MESSAGES$I18N" 
   (	"MESSAGE_KEY" VARCHAR2(512 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR) NOT NULL ENABLE, 
	"MESSAGE_VALUE" VARCHAR2(4000 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"ROW_FLAG_MASK" NUMBER(6,0) DEFAULT 0 NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."MESSAGES$I18N" ADD CONSTRAINT "MESSAGES$I18N$PK" PRIMARY KEY ("MESSAGE_KEY", "LOCALE")
  USING INDEX  ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES$I18N" ADD CONSTRAINT "MESSAGES$I18N$CHK00" CHECK (LOCALE != 'en_US') ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES$I18N" ADD CONSTRAINT "MESSAGES$I18N$CHK01" CHECK (DML_TYPE in ('I'
                                                                                         ,'U')) ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES$I18N" ADD CONSTRAINT "MESSAGES$I18N$FK00" FOREIGN KEY ("MESSAGE_KEY")
	  REFERENCES "DL_COMMON"."MESSAGES" ("MESSAGE_KEY") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DL_COMMON"."MESSAGES$I18N" ADD CONSTRAINT "MESSAGES$I18N$FK01" FOREIGN KEY ("LOCALE")
	  REFERENCES "DL_COMMON"."LOCALES" ("KEY_VALUE") ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."MESSAGE_KEY" IS 'The key is treated case sensitive and it could be a path like the example "[Owner]\[App-Domain]\[App-Name]\[App-Page]\[%]..."!';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."MESSAGE_VALUE" IS 'Message text';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."MESSAGES$I18N"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON TABLE "DL_COMMON"."MESSAGES$I18N"  IS 'Translation of Messages';
  CREATE INDEX "DL_COMMON"."MESSAGES$I18N$IX00" ON "DL_COMMON"."MESSAGES$I18N" ("MESSAGE_KEY") 
  ;
CREATE INDEX "DL_COMMON"."MESSAGES$I18N$IX01" ON "DL_COMMON"."MESSAGES$I18N" ("LOCALE") 
  ;
CREATE INDEX "DL_COMMON"."MESSAGES$I18N$IX02" ON "DL_COMMON"."MESSAGES$I18N" ("MESSAGE_VALUE") 
  ;
CREATE UNIQUE INDEX "DL_COMMON"."MESSAGES$I18N$PK" ON "DL_COMMON"."MESSAGES$I18N" ("MESSAGE_KEY", "LOCALE") 
  ;
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "SERVAPP";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO PUBLIC;
  GRANT REFERENCES ON "DL_COMMON"."MESSAGES$I18N" TO PUBLIC;
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "BIO_BD";
  GRANT DELETE ON "DL_COMMON"."MESSAGES$I18N" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_COMMON"."MESSAGES$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES$I18N" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "APPSUP";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."MESSAGES$I18N" TO "BIOSAADM";
