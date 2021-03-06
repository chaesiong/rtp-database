-- Create

   CREATE USER "PIBICS" IDENTIFIED BY VALUES 'S:36E4A0265F0D7DC9925E91F5C54B54B41B2E0056212451348FB7C456A801;T:088C1FDECFEB66E6BB7BFA1B056A640D6F88A21F0CE3F4002450D7DDADFC4230EFB3DE1B2BBF53345E5170541EAB186E8EFE28CE5749706B8DB8B46437E149E9A49E1E6D97C6B829E517495C76CA5590'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE SESSION TO "PIBICS";
  GRANT CREATE JOB TO "PIBICS";
  GRANT DEBUG ANY PROCEDURE TO "PIBICS";
  GRANT DEBUG CONNECT SESSION TO "PIBICS";
  GRANT CREATE MATERIALIZED VIEW TO "PIBICS";
  GRANT CREATE DATABASE LINK TO "PIBICS";
  GRANT CREATE SYNONYM TO "PIBICS";
  GRANT SELECT ANY TABLE TO "PIBICS";


