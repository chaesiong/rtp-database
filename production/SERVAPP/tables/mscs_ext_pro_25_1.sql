CREATE TABLE "SERVAPP"."MSCS_EXT_PRO_25_1" 
   (	"PRO_SEQNO" NUMBER, 
	"PROC_SEQNO" NUMBER, 
	"REF_REASON" VARCHAR2(300 CHAR), 
	"DOCITEM1" CHAR(1), 
	"IT1_BANKNM" VARCHAR2(100 CHAR), 
	"IT1_TRANSFER_DATE" DATE, 
	"IT1_SUMTOTAL" NUMBER(15,2), 
	"DOCITEM2" CHAR(1 CHAR), 
	"IT2_PROJECTNM" VARCHAR2(100 CHAR), 
	"IT2_OUTCOME" NUMBER(15,2), 
	"DOCITEM3" CHAR(1 CHAR), 
	"IT3_BANKNM" VARCHAR2(100 CHAR), 
	"IT3_SUMTOTAL" NUMBER(15,2), 
	"DOCITEM4" CHAR(1 CHAR), 
	"IT4_FROM" VARCHAR2(100 CHAR), 
	"IT4_SUMTOTAL" NUMBER(15,2), 
	"DOCITEM5" CHAR(1 CHAR), 
	"IT5_OTH" VARCHAR2(100 CHAR), 
	"IT5_SUMTOTAL" NUMBER(15,2), 
	"FACT1" CHAR(1 CHAR), 
	"FACT2" CHAR(1 CHAR), 
	"FACT3" CHAR(1 CHAR), 
	"FACT4" CHAR(1 CHAR), 
	"CREATE_BY" VARCHAR2(20 CHAR), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" VARCHAR2(20 CHAR), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"VERSION" NUMBER
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_EXT_PRO_25_1" ADD PRIMARY KEY ("PRO_SEQNO")
  USING INDEX  ENABLE;
  ;
