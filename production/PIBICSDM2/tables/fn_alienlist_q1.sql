CREATE TABLE "PIBICSDM2"."FN_ALIENLIST_Q1" 
   (	"ALIEN_SEQNO" NUMBER(10,0), 
	"ADDRN_SEQNO" NUMBER(10,0), 
	"CHECKINDTE" TIMESTAMP (6), 
	"EFIRSTNM" CLOB, 
	"EMIDDLENM" CLOB, 
	"EFAMILYNM" CLOB, 
	"NATION_SEQNO" NUMBER(10,0), 
	"SEX" INTERVAL DAY (2) TO SECOND (6), 
	"PASSPORTNO" CLOB, 
	"INDTE" TIMESTAMP (6), 
	"VISATYPE_SEQNO" NUMBER(10,0), 
	"DUEDATE" TIMESTAMP (6), 
	"DEPT_SEQNO" NUMBER(10,0), 
	"TM6NO" INTERVAL DAY (2) TO SECOND (6), 
	"RELATIONSHIP" CLOB, 
	"CREATE_BY" INTERVAL DAY (2) TO SECOND (6), 
	"CREATE_DATE" TIMESTAMP (6), 
	"UPDATE_BY" INTERVAL DAY (2) TO SECOND (6), 
	"UPDATE_DATE" TIMESTAMP (6), 
	"FLAGWATCHLIST" INTERVAL YEAR (2) TO MONTH
   ) ;
  ;
  ;
  ;
  ;
  ;