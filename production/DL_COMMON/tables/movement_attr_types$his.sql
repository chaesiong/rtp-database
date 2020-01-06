CREATE TABLE "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" 
   (	"KEY_VALUE" VARCHAR2(32 CHAR) NOT NULL ENABLE, 
	"LOCALE" VARCHAR2(5 CHAR), 
	"DISPLAY_VALUE" VARCHAR2(128 CHAR), 
	"DISPLAY_ORDER" NUMBER(*,0), 
	"IS_ACTIVE" VARCHAR2(1 CHAR), 
	"NOTICE" VARCHAR2(4000 CHAR), 
	"NUM_VALUE" NUMBER(32,0), 
	"ROW_FLAG_MASK" NUMBER(6,0), 
	"INS_AT" DATE, 
	"INS_BY" VARCHAR2(255 CHAR), 
	"DML_AT" TIMESTAMP (6) NOT NULL ENABLE, 
	"DML_BY" VARCHAR2(255 CHAR) NOT NULL ENABLE, 
	"DML_TYPE" VARCHAR2(1 CHAR) NOT NULL ENABLE
   ) ;
  ALTER TABLE "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" ADD CONSTRAINT "MOVEMENT_ATTR_TYPES$HIS$CHK$C00" CHECK (DML_TYPE in ('I', 'U', 'D')) ENABLE;
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."KEY_VALUE" IS 'Unique Identifier';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."LOCALE" IS 'Language definition of display_value column';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."DISPLAY_VALUE" IS 'Name of the movement attribute Types';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."DISPLAY_ORDER" IS 'Numeric value that provides the correct sorting';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."IS_ACTIVE" IS 'Value is active and will be shown in frontend (Y.es, N.o)';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."NOTICE" IS 'Column to add some notes/additional Info';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."NUM_VALUE" IS 'Numeric version of primary key';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."ROW_FLAG_MASK" IS 'Bitmask: 1 => delivered by Dermalog, 2 => reserved, 4 => reserved, 8 .. 524288 => reserved !';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."INS_AT" IS 'Date of Insert';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."INS_BY" IS 'User who insert the data';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."DML_AT" IS 'Date of last update';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."DML_BY" IS 'User who did the last update';
   COMMENT ON COLUMN "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"."DML_TYPE" IS 'DML Type: I = Insert, U = Update';
   COMMENT ON TABLE "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS"  IS 'History of movement attribute Types';
  GRANT ALTER ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT DELETE ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT INDEX ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT INSERT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT UPDATE ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT READ ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT DEBUG ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "BIOSAADM";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "SOMPORN_K";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "KIATTIPAT_S";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "WORAGON_T";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "PISAN_S";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "PRAMUALSOOK_P";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "CHAYA_W";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "CHAYAWEE_O";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "THANASET_N";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "THASAYA_M";
  GRANT SELECT ON "DL_COMMON"."MOVEMENT_ATTR_TYPES$HIS" TO "PORNRUKSA_S";
