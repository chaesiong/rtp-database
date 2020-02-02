CREATE TABLE "SERVAPP"."MSCS_USER_SESSIONS" 
   (	"USER_NAME" VARCHAR2(50) NOT NULL ENABLE, 
	"IPADDRESS" VARCHAR2(200), 
	"CREATE_DATE" DATE, 
	"CREATE_BY" VARCHAR2(50), 
	"UPDATE_DATE" DATE, 
	"UPDATE_BY" VARCHAR2(50)
   ) ;
  ALTER TABLE "SERVAPP"."MSCS_USER_SESSIONS" ADD PRIMARY KEY ("USER_NAME")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."XPKMSCS_USER_SESSIONS_IDX" ON "SERVAPP"."MSCS_USER_SESSIONS" ("USER_NAME") 
  ;
