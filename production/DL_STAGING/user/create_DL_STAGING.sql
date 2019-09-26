-- Create

   CREATE USER "DL_STAGING" IDENTIFIED BY VALUES 'S:47885AD44C8A6962631359D361C39C1C0B4F70EA9F2A15D3DA3B51B2FF95;T:7A70A70F13CFAF69EC20273E7679527C209D5E33D8076B3128AE19105F2FD06B629C11DE8930BE3979D5CBDF1A20A7976EF1F699D00489230506035CCAABB4EF811DC6CA8BBD5A5E3B79C8942580C722;9A96CD35B458ABFB'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE JOB TO "DL_STAGING";
  GRANT DEBUG ANY PROCEDURE TO "DL_STAGING";
  GRANT DEBUG CONNECT SESSION TO "DL_STAGING";
  GRANT CREATE MATERIALIZED VIEW TO "DL_STAGING";
  GRANT CREATE DATABASE LINK TO "DL_STAGING";
  GRANT CREATE SYNONYM TO "DL_STAGING";
  GRANT SELECT ANY TABLE TO "DL_STAGING";


