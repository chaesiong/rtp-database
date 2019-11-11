CREATE TABLE "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" 
   (	"BRDDOCID" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"SEQNO" NUMBER(2,0) NOT NULL ENABLE, 
	"IMAGE" BLOB NOT NULL ENABLE, 
	"INS_AT" DATE DEFAULT ON NULL sysdate NOT NULL ENABLE, 
	"INS_TERMINAL" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"INS_BORDERPOST" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"DML_AT" TIMESTAMP (6) DEFAULT ON NULL systimestamp NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) DEFAULT ON NULL 'I' NOT NULL ENABLE, 
	"INS_BY" VARCHAR2(255 CHAR) DEFAULT ON NULL user NOT NULL ENABLE
   ) 
  PARTITION BY HASH ("BRDDOCID") 
 (PARTITION "SYS_P17917" , 
 PARTITION "SYS_P17918" , 
 PARTITION "SYS_P17919" , 
 PARTITION "SYS_P17920" , 
 PARTITION "SYS_P17921" , 
 PARTITION "SYS_P17922" , 
 PARTITION "SYS_P17923" , 
 PARTITION "SYS_P17924" , 
 PARTITION "SYS_P17925" ) ;
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."BRDDOCID" IS 'Foreign Key to Borderdocuments';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."SEQNO" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."IMAGE" IS 'Column for Image';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."INS_TERMINAL" IS 'Terminal, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."INS_BORDERPOST" IS 'Borderpost, where data was inserted (Foreign Key)';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON COLUMN "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"."INS_BY" IS 'User who insert the data';
   COMMENT ON TABLE "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW"  IS 'Is used for BmBS';
  CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW$IX01" ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" ("INS_BORDERPOST") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW$IX02" ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" ("INS_TERMINAL") 
  ;
CREATE INDEX "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW_CREATED_IDX" ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" ("INS_AT") 
  ;
CREATE UNIQUE INDEX "DL_BORDERCONTROL"."SYS_IL0000591517C00003$$" ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" (
   LOCAL
 (PARTITION "SYS_IL_P17935" , 
 PARTITION "SYS_IL_P17936" , 
 PARTITION "SYS_IL_P17937" , 
 PARTITION "SYS_IL_P17938" , 
 PARTITION "SYS_IL_P17939" , 
 PARTITION "SYS_IL_P17940" , 
 PARTITION "SYS_IL_P17941" , 
 PARTITION "SYS_IL_P17942" , 
 PARTITION "SYS_IL_P17943" ) ;
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT DELETE ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT INDEX ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT INSERT ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT SELECT ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT UPDATE ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT READ ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT DEBUG ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_BORDERCONTROL"."BORDERDOCIMAGES_NEW" TO "BIOSAADM";
