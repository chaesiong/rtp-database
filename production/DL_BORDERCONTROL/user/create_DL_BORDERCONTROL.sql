-- Create

   CREATE USER "DL_BORDERCONTROL" IDENTIFIED BY VALUES 'S:3EC192AA1D07B4D1AFBD8534C5F3519F8506FE3C15410CE6339A4F490D23;T:42C3F3C20C36A09F27EBDEA8C9CBFB8EB36FEBB52EBBF04223B37D2B3F348B1D0AB88922C75BC5EC4E153165D151B098E55F1578FFB9B565B5CA2189913504DF91EDE302CA3DE112C2B6933A29F3ADEC;B1D1039CAEF5460D'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE JOB TO "DL_BORDERCONTROL";
  GRANT CREATE DIMENSION TO "DL_BORDERCONTROL";
  GRANT CREATE INDEXTYPE TO "DL_BORDERCONTROL";
  GRANT CREATE OPERATOR TO "DL_BORDERCONTROL";
  GRANT CREATE TYPE TO "DL_BORDERCONTROL";
  GRANT CREATE MATERIALIZED VIEW TO "DL_BORDERCONTROL";
  GRANT CREATE TRIGGER TO "DL_BORDERCONTROL";
  GRANT CREATE PROCEDURE TO "DL_BORDERCONTROL";
  GRANT CREATE SEQUENCE TO "DL_BORDERCONTROL";
  GRANT CREATE VIEW TO "DL_BORDERCONTROL";
  GRANT CREATE SYNONYM TO "DL_BORDERCONTROL";
  GRANT CREATE CLUSTER TO "DL_BORDERCONTROL";
  GRANT CREATE TABLE TO "DL_BORDERCONTROL";
  GRANT UNLIMITED TABLESPACE TO "DL_BORDERCONTROL";
  GRANT CREATE SESSION TO "DL_BORDERCONTROL";


