-- Create

   CREATE USER "DL_DBA" IDENTIFIED BY VALUES 'S:0219B6D0E27E22AB96401C08C302B5ACEDA0083A71980372CC43E89979D2;T:5929CFAD9287050CF3F88FE56A629C2B4207C50C65C442FC66E476EAEFF3E9D4E33196D35305A44756D08F6D0E5DFBAC0D6EC9E72A885D3209403FF03395A8CEE02C50B98E1F8BE093F3791BA397A714;DB0E2DABDC5FD408'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE JOB TO "DL_DBA";
  GRANT CREATE DIMENSION TO "DL_DBA";
  GRANT CREATE INDEXTYPE TO "DL_DBA";
  GRANT CREATE OPERATOR TO "DL_DBA";
  GRANT CREATE TYPE TO "DL_DBA";
  GRANT CREATE MATERIALIZED VIEW TO "DL_DBA";
  GRANT CREATE TRIGGER TO "DL_DBA";
  GRANT CREATE PROCEDURE TO "DL_DBA";
  GRANT CREATE SEQUENCE TO "DL_DBA";
  GRANT CREATE VIEW TO "DL_DBA";
  GRANT CREATE SYNONYM TO "DL_DBA";
  GRANT CREATE CLUSTER TO "DL_DBA";
  GRANT CREATE TABLE TO "DL_DBA";
  GRANT UNLIMITED TABLESPACE TO "DL_DBA";
  GRANT CREATE SESSION TO "DL_DBA";

