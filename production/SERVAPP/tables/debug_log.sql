CREATE TABLE "SERVAPP"."DEBUG_LOG" 
   (	"LOG" VARCHAR2(1000), 
	"DATA" BLOB
   ) ;
  CREATE UNIQUE INDEX "SERVAPP"."SYS_IL0000377709C00002$$" ON "SERVAPP"."DEBUG_LOG" (
  ;
  GRANT SELECT ON "SERVAPP"."DEBUG_LOG" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."DEBUG_LOG" TO "BIOSAADM";
