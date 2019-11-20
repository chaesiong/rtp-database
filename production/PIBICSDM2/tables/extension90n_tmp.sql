CREATE TABLE "PIBICSDM2"."EXTENSION90N_TMP" 
   (	"T_ID" VARCHAR2(100 CHAR), 
	"CUSTOMER_ID" VARCHAR2(50 CHAR), 
	"TRANSACTIONTYPE" VARCHAR2(10 CHAR), 
	"CITIZENCOUNTRY" VARCHAR2(50 CHAR), 
	"LASTNAME" VARCHAR2(100 CHAR), 
	"FIRSTNAME" VARCHAR2(1000 CHAR), 
	"MIDDLENAME" VARCHAR2(100 CHAR), 
	"SUFFIXNAME" VARCHAR2(10 CHAR), 
	"DATEOFBIRTH" VARCHAR2(20 CHAR), 
	"RACE" VARCHAR2(50 CHAR), 
	"GENDER" VARCHAR2(100 CHAR), 
	"OCCUPATION" VARCHAR2(100 CHAR), 
	"PLACEOFBIRTH_CITY" VARCHAR2(100 CHAR), 
	"PLACEOFBIRTH_COUNTRY" VARCHAR2(100 CHAR), 
	"STATUS" VARCHAR2(20 CHAR), 
	"CREATE_DATE" VARCHAR2(50 CHAR), 
	"CREATE_OPERATOR" VARCHAR2(100 CHAR), 
	"TRANSACTION_DATE" VARCHAR2(50 CHAR), 
	"TRANSACTION_OPERATOR" VARCHAR2(100 CHAR), 
	"LAST_UPDATE_OPERATOR" VARCHAR2(100 CHAR), 
	"LAST_UPDATE_DATE" VARCHAR2(50 CHAR), 
	"PASSPORTNO" VARCHAR2(50 CHAR), 
	"PASSPORTDATE" VARCHAR2(50 CHAR), 
	"ISSUEAT" VARCHAR2(100 CHAR), 
	"VALIDUNITDATE" VARCHAR2(50 CHAR), 
	"ARRIVEBY" VARCHAR2(10 CHAR), 
	"FROMTXT" VARCHAR2(100 CHAR), 
	"KINDOFVISA" VARCHAR2(50 CHAR), 
	"PORTOFARRIVE" VARCHAR2(50 CHAR), 
	"ARRIVALDATE" VARCHAR2(50 CHAR), 
	"TM6NO" VARCHAR2(50 CHAR), 
	"REASONFOREXTENSION" VARCHAR2(50 CHAR), 
	"COMMENTTXT" VARCHAR2(100 CHAR), 
	"PERIOD" NUMBER, 
	"ADDRESSINTHAILAND" VARCHAR2(200 CHAR), 
	"TAMBOL" VARCHAR2(50 CHAR), 
	"AMPHOE" VARCHAR2(50 CHAR), 
	"RELATIONSHIP" VARCHAR2(50 CHAR), 
	"IRROGRATION" VARCHAR2(1000 CHAR), 
	"BLACKLIST" VARCHAR2(50 CHAR), 
	"BLACKLISTDATE" VARCHAR2(50 CHAR), 
	"PROCESSFEE" NUMBER, 
	"FINEDFEE" NUMBER, 
	"ISNONSTDFEE" VARCHAR2(50 CHAR), 
	"CASENO" VARCHAR2(50 CHAR), 
	"VISAEXPIREDATE" VARCHAR2(50 CHAR), 
	"PERIODOVEREXPIREDATE" NUMBER, 
	"APPROVENO" VARCHAR2(50 CHAR), 
	"DATEFORAPPROVE" VARCHAR2(50 CHAR), 
	"ASSIGNMENT" VARCHAR2(50 CHAR), 
	"DEPENDENT" VARCHAR2(50 CHAR), 
	"REMARKTXT" VARCHAR2(1000 CHAR), 
	"STAYOVER90DAYS" NUMBER, 
	"IMMIGRATIONOFFICE" VARCHAR2(5 CHAR), 
	"STICKERID" VARCHAR2(150 CHAR), 
	"FLAGIMP" CHAR(1 CHAR), 
	"NEXTREPORTDATE" VARCHAR2(150 CHAR), 
	"TEL" VARCHAR2(50 CHAR), 
	"STREET" VARCHAR2(150 CHAR), 
	"FORMDATE" VARCHAR2(50 CHAR), 
	"FLIGHTNO" VARCHAR2(50 CHAR), 
	"CONV_SEQNO" VARCHAR2(10 CHAR), 
	"PV_SEQNO" VARCHAR2(500 CHAR), 
	"PVSEQNO" NUMBER, 
	"OFFICER" VARCHAR2(1000 CHAR), 
	"VISATYPE" NUMBER, 
	"VISATYPETXT" VARCHAR2(200 CHAR), 
	"INPUTDATE" VARCHAR2(50 CHAR), 
	"IMPSTS" CHAR(2 CHAR)
   ) ;
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "ROLE_SERVAPP";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "ROLE_PIBICSDM2_RO";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "ROLE_DL_STAGING4PIBICS";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSUPPORT";
  GRANT ALTER ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT DELETE ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT INDEX ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."EXTENSION90N_TMP" TO "BIOSAADM";
