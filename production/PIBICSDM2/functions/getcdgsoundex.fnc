CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GETCDGSOUNDEX" (PATH VARCHAR2) RETURN VARCHAR2 IS
LANGUAGE JAVA
NAME 'CDGSoundex.getSoundexF(java.lang.String) return java.lang.String';
/
  GRANT EXECUTE ON "PIBICSDM2"."GETCDGSOUNDEX" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GETCDGSOUNDEX" TO "BIOSAADM";
