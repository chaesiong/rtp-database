CREATE TABLE "SERVAPP"."MSCS_EXT_PRO_213" 
   (	"PRO_SEQNO" NUMBER NOT NULL ENABLE, 
	"PROC_SEQNO" NUMBER, 
	"DOCDATE" DATE, 
	"EXPEXT_DATE" DATE, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"AGENCY" VARCHAR2(50 CHAR), 
	"FACT_BOOK1" CHAR(1 CHAR), 
	"FACT_BOOK2" CHAR(1 CHAR), 
	"FACT_BOOK3" CHAR(1 CHAR), 
	"FACT_BOOK4" CHAR(1 CHAR), 
	"FACT_BOOK5" CHAR(1 CHAR), 
	"FACT_BOOK6" CHAR(1 CHAR), 
	"OTHER" VARCHAR2(1000 CHAR), 
	"SUPPORT_BOOK" VARCHAR2(2000 CHAR), 
	"FACT1" CHAR(1 CHAR), 
	"COMMAND_FROM" VARCHAR2(150 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_PRO_213" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."MSCS_EXT_PRO_213" TO "BIOSAADM";
