-- Create

   CREATE USER "DL_STAGING4PIBICS" IDENTIFIED BY VALUES 'S:ADF7B8BA181D1AF5C0E91276343FE5EC46D98452C6BAB6D8710168C715F6;T:0B1A3BE4F8721C3A6201FD615535B31257A255202D5432A1A4719A83216327667C1DE8C25212115EC1E043A86DC6FEEEF81992CADC3F5E71E8DB739FED2087A99FA676CD775843BA10461539FA605B4A;F5E34902CFC9E9DF'
      DEFAULT TABLESPACE "BIOSTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE JOB TO "DL_STAGING4PIBICS";
  GRANT CREATE DIMENSION TO "DL_STAGING4PIBICS";
  GRANT CREATE INDEXTYPE TO "DL_STAGING4PIBICS";
  GRANT CREATE OPERATOR TO "DL_STAGING4PIBICS";
  GRANT CREATE TYPE TO "DL_STAGING4PIBICS";
  GRANT CREATE MATERIALIZED VIEW TO "DL_STAGING4PIBICS";
  GRANT CREATE TRIGGER TO "DL_STAGING4PIBICS";
  GRANT CREATE PROCEDURE TO "DL_STAGING4PIBICS";
  GRANT CREATE SEQUENCE TO "DL_STAGING4PIBICS";
  GRANT CREATE VIEW TO "DL_STAGING4PIBICS";
  GRANT CREATE SYNONYM TO "DL_STAGING4PIBICS";
  GRANT CREATE CLUSTER TO "DL_STAGING4PIBICS";
  GRANT CREATE TABLE TO "DL_STAGING4PIBICS";
  GRANT CREATE SESSION TO "DL_STAGING4PIBICS";


