-- Create

   CREATE USER "USER_MANAGEMENT" IDENTIFIED BY VALUES 'S:3280AEFAE4B7BB2C036A48EA99E73EBFAC1636E423969B47CE12B411A49B;T:86601B212CA4513FC7105D9E2A89A0DD860E119660672881E8D621B3A3E491F9D0805AF50D1FC911EF5A6FF8FDDC4C7A106AA41A925ACC67DFB272B0AE7067675C5E3E734FE126538F1EE803F7F52618;7CCE127CF3EF7992'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE JOB TO "USER_MANAGEMENT";
  GRANT CREATE DIMENSION TO "USER_MANAGEMENT";
  GRANT CREATE INDEXTYPE TO "USER_MANAGEMENT";
  GRANT CREATE OPERATOR TO "USER_MANAGEMENT";
  GRANT CREATE TYPE TO "USER_MANAGEMENT";
  GRANT CREATE MATERIALIZED VIEW TO "USER_MANAGEMENT";
  GRANT CREATE TRIGGER TO "USER_MANAGEMENT";
  GRANT CREATE PROCEDURE TO "USER_MANAGEMENT";
  GRANT CREATE SEQUENCE TO "USER_MANAGEMENT";
  GRANT CREATE VIEW TO "USER_MANAGEMENT";
  GRANT CREATE SYNONYM TO "USER_MANAGEMENT";
  GRANT CREATE CLUSTER TO "USER_MANAGEMENT";
  GRANT CREATE TABLE TO "USER_MANAGEMENT";
  GRANT CREATE SESSION TO "USER_MANAGEMENT";

