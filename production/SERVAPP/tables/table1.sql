CREATE TABLE "SERVAPP"."TABLE1" 
   (	"COLUMN1" VARCHAR2(20)
   ) ;
  GRANT SELECT ON "SERVAPP"."TABLE1" TO "PIBICSAPP";
  GRANT ALTER ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT DELETE ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT INDEX ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT INSERT ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT SELECT ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT UPDATE ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT REFERENCES ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT READ ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT DEBUG ON "SERVAPP"."TABLE1" TO "BIOSAADM";
  GRANT FLASHBACK ON "SERVAPP"."TABLE1" TO "BIOSAADM";
