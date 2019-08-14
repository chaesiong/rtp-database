-- Create

   CREATE USER "DL_STAGING4PIBICS_INTF" IDENTIFIED BY VALUES 'S:D3FEE17205F416D378770621E04FF435F0C28917550A3DDF76959C972C00;T:2FF20CB572EACE3D0EC6B30E117311FDEA40E26B83573A2A88AB2B8AEE5AFB4655305EEA1991B488109D746C685E1DAB14BCEC2EA2AEAC799771E4CC8F6C908B8BAC0F5AB3C90772C4C02EFDD9968C87;DC2F5B346F4E9CBA'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT MANAGE SCHEDULER TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE JOB TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE DIMENSION TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE INDEXTYPE TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE OPERATOR TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE TYPE TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE MATERIALIZED VIEW TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE TRIGGER TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE PROCEDURE TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE SEQUENCE TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE VIEW TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE SYNONYM TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE CLUSTER TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE TABLE TO "DL_STAGING4PIBICS_INTF";
  GRANT CREATE SESSION TO "DL_STAGING4PIBICS_INTF";


