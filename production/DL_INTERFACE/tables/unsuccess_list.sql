CREATE TABLE "DL_INTERFACE"."UNSUCCESS_LIST" 
   (	"SENDER_OBJECT_ID" VARCHAR2(32) NOT NULL ENABLE, 
	"UNSUCCESS" NUMBER NOT NULL ENABLE, 
	"SENDER_OBJECT" VARCHAR2(50), 
	"BRDDOCID" VARCHAR2(32)
   ) ;
  ALTER TABLE "DL_INTERFACE"."UNSUCCESS_LIST" ADD CONSTRAINT "UNSUCCESS_LIST_PK" PRIMARY KEY ("SENDER_OBJECT_ID")
  USING INDEX  ENABLE;
   COMMENT ON COLUMN "DL_INTERFACE"."UNSUCCESS_LIST"."UNSUCCESS" IS '1 = Can not add data at Pibics, 2 = Invalid mrzData.gender format';
  CREATE UNIQUE INDEX "DL_INTERFACE"."UNSUCCESS_LIST_PK" ON "DL_INTERFACE"."UNSUCCESS_LIST" ("SENDER_OBJECT_ID") 
  ;
  GRANT SELECT ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOAPPREPORT";
  GRANT SELECT ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSUPPORT";
  GRANT ALTER ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT DELETE ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT INDEX ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT INSERT ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT SELECT ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT UPDATE ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT REFERENCES ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT READ ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT DEBUG ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
  GRANT FLASHBACK ON "DL_INTERFACE"."UNSUCCESS_LIST" TO "BIOSAADM";
