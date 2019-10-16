CREATE TABLE "SERVAPP"."MBDEPARTMENT" 
   (	"DEPARTMENT_CODE" VARCHAR2(18) NOT NULL ENABLE, 
	"DEPARTMENT_DESC" VARCHAR2(500), 
	"DEPARTMENT_DESC_EN" VARCHAR2(500), 
	"STATUS" NUMBER(*,0), 
	"CREATE_DATE" DATE, 
	"CREATE_USER" VARCHAR2(50), 
	"UPDATE_DATE" DATE, 
	"UPDATE_USER" VARCHAR2(50)
   ) ;
  ALTER TABLE "SERVAPP"."MBDEPARTMENT" ADD PRIMARY KEY ("DEPARTMENT_CODE")
  USING INDEX  ENABLE;
  CREATE UNIQUE INDEX "SERVAPP"."XPKMBDEPARTMENT" ON "SERVAPP"."MBDEPARTMENT" ("DEPARTMENT_CODE") 
  ;