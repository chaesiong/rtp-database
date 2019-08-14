CREATE TABLE "DL_STAGING4PIBICS"."WLINDICATECARD" 
   (	"WLCD" VARCHAR2(7 CHAR) NOT NULL ENABLE, 
	"SEQNO" NUMBER NOT NULL ENABLE, 
	"IDCCD" CHAR(4 CHAR), 
	"DOCNO" VARCHAR2(20 CHAR), 
	"ISUDTE" DATE, 
	"ISUPLACE" VARCHAR2(60 CHAR), 
	"CREDTE" DATE
   ) ;
  GRANT DELETE ON "DL_STAGING4PIBICS"."WLINDICATECARD" TO "DL_STAGING4PIBICS_INTF";
  GRANT INSERT ON "DL_STAGING4PIBICS"."WLINDICATECARD" TO "DL_STAGING4PIBICS_INTF";
  GRANT SELECT ON "DL_STAGING4PIBICS"."WLINDICATECARD" TO "DL_STAGING4PIBICS_INTF";
  GRANT UPDATE ON "DL_STAGING4PIBICS"."WLINDICATECARD" TO "DL_STAGING4PIBICS_INTF";