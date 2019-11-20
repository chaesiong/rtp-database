CREATE TABLE "PIBICSDM2"."CHNG_CHANGEVISA" 
   (	"CHANGEVISA_SEQNO" NUMBER, 
	"CHANGEVISA_DOCNO" VARCHAR2(50 CHAR), 
	"EXTLIST_SEQNO" NUMBER, 
	"EXT_DOCNO" VARCHAR2(50 CHAR), 
	"VISATYPE_SEQNO" NUMBER, 
	"VISATYPESUB_SEQNO" NUMBER, 
	"VISA_DATE" TIMESTAMP (6), 
	"PERMIT_DATE" TIMESTAMP (6), 
	"CHANGEVISA_DATE" TIMESTAMP (6), 
	"CHANGEVISA_FOR" VARCHAR2(1000 CHAR), 
	"BUSINESS_TYPE" VARCHAR2(500 CHAR), 
	"COMPANY_SEQNO" NUMBER, 
	"COMPANYNM" VARCHAR2(500 CHAR), 
	"CAPITAL" NUMBER(30,2), 
	"CAPITALPAY" NUMBER(30,2), 
	"ASSET" NUMBER(30,2), 
	"SUMOFFICER" NUMBER, 
	"THAIOFFICER" NUMBER, 
	"PERMANANCE" NUMBER, 
	"ALIENOFFICER" NUMBER, 
	"ALIENINCOMEM" NUMBER(30,2), 
	"FACT1" CHAR(1 CHAR), 
	"DAILY" NUMBER, 
	"FACT2" CHAR(1 CHAR), 
	"FACT3" CHAR(1 CHAR), 
	"FACT4" CHAR(1 CHAR), 
	"FACT5" CHAR(1 CHAR), 
	"FACT6" CHAR(1 CHAR), 
	"FACT7" CHAR(1 CHAR), 
	"FACT8" CHAR(1 CHAR), 
	"FACT9" CHAR(1 CHAR), 
	"FACT10" CHAR(1 CHAR), 
	"FACT11" CHAR(1 CHAR), 
	"FACT12" CHAR(1 CHAR), 
	"FACT13" CHAR(1 CHAR), 
	"FACT14" CHAR(1 CHAR), 
	"FACT15" CHAR(1 CHAR), 
	"WPERMIT_DATE" TIMESTAMP (6), 
	"WEPERMIT_DATE" TIMESTAMP (6), 
	"REMARK1" VARCHAR2(1000 CHAR), 
	"REMARK2" VARCHAR2(1500 CHAR), 
	"REMARK4" VARCHAR2(1000 CHAR), 
	"PRESENT_ID" VARCHAR2(20 CHAR), 
	"PRESENTRANK_SEQNO" VARCHAR2(3 CHAR), 
	"APPROVE_ID" VARCHAR2(20 CHAR), 
	"APPROVERANK_SEQNO" VARCHAR2(3 CHAR), 
	"CHANGEVISA_STS" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER, 
	"DOC_TO" VARCHAR2(100 CHAR), 
	"UDEPT_SEQNO" NUMBER, 
	"ACTFLAG" CHAR(1 CHAR), 
	"REASON_SEQNO" NUMBER, 
	"REMARK2_1" VARCHAR2(1000 CHAR), 
	"VISABEF_SEQNO" NUMBER, 
	"VISABEFSUB_SEQNO" NUMBER, 
	"VISAAFT_SEQNO" NUMBER, 
	"VISAAFTSUB_SEQNO" NUMBER, 
	"NONIMM_CODE" NUMBER, 
	"CHGPERMITS_DATE" TIMESTAMP (6), 
	"CHGPERMITE_DATE" TIMESTAMP (6), 
	"STATUS" CHAR(1 CHAR), 
	"CHKLAW_SEQNO" VARCHAR2(250 CHAR), 
	"CHKDOC_SEQNO" VARCHAR2(250 CHAR), 
	"IPADDRESS" VARCHAR2(20 CHAR), 
	"CHANGVISA_TYPE" CHAR(1 CHAR), 
	"CONTROL_ID" VARCHAR2(20 CHAR), 
	"CHECK_ID" VARCHAR2(20 CHAR), 
	"CHECKRANK_SEQNO" VARCHAR2(3 CHAR), 
	"CONTROLRANK_SEQNO" VARCHAR2(3 CHAR), 
	"PRINTFLAG" CHAR(1 CHAR), 
	"ADDFORBUSINESS" VARCHAR2(300 CHAR)
   ) ;
  ALTER TABLE "PIBICSDM2"."CHNG_CHANGEVISA" ADD CONSTRAINT "CHNG_CHANGEVISA_R01" FOREIGN KEY ("EXTLIST_SEQNO")
	  REFERENCES "PIBICSDM2"."EXT_EXTENSIONLIST" ("EXTLIST_SEQNO") DISABLE;
  ALTER TABLE "PIBICSDM2"."CHNG_CHANGEVISA" ADD CONSTRAINT "CHNG_CHANGEVISA_R02" FOREIGN KEY ("VISATYPE_SEQNO")
	  REFERENCES "PIBICSDM2"."VISATYPE" ("VISATYPE_SEQNO") DISABLE;
  CREATE INDEX "PIBICSDM2"."CHANGEVISA_DATE_IDX" ON "PIBICSDM2"."CHNG_CHANGEVISA" (TO_CHAR("CHANGEVISA_DATE",'yyyymmdd')) 
  ;
CREATE INDEX "PIBICSDM2"."CHANGEVISA_DATE_IDX1" ON "PIBICSDM2"."CHNG_CHANGEVISA" (TO_CHAR("CHANGEVISA_DATE",'yyyymm')) 
  ;
CREATE INDEX "PIBICSDM2"."CHANGEVISA_DATE_Y_M_D_IDX" ON "PIBICSDM2"."CHNG_CHANGEVISA" (TO_CHAR("CHANGEVISA_DATE",'yyyy-mm-dd')) 
  ;
CREATE INDEX "PIBICSDM2"."CHGPERMITS_DATE_IDX" ON "PIBICSDM2"."CHNG_CHANGEVISA" (TO_CHAR("CHGPERMITS_DATE",'yyyymmdd')) 
  ;
CREATE UNIQUE INDEX "PIBICSDM2"."CHNG_CHANGEVISA_PK" ON "PIBICSDM2"."CHNG_CHANGEVISA" ("CHANGEVISA_SEQNO") 
  ;
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "DL_STAGING" WITH GRANT OPTION;
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."CHNG_CHANGEVISA" TO "BIOSAADM";
