-- Create

   CREATE USER "LOGGER" IDENTIFIED BY VALUES 'S:068F7635BB37B997DD65D636DAF73F2530D24433B7E7DE285838E36A975B;T:79740F20E0E143816A96497177DC911ACC671AC8DA4C8BBBA5C14AC356EC16EA218E9F59932608EDCCD9E399C002EF7059300A072C18498B379B35590BD564610A93451FAE74DA3378C177310A55EDDF;38AC63B8050F785A'
      DEFAULT TABLESPACE "DATASTORE"
      TEMPORARY TABLESPACE "TEMP";


-- SYSTEM_GRANT

  GRANT CREATE JOB TO "LOGGER";
  GRANT CREATE ANY CONTEXT TO "LOGGER";
  GRANT CREATE TRIGGER TO "LOGGER";
  GRANT CREATE PROCEDURE TO "LOGGER";
  GRANT CREATE SEQUENCE TO "LOGGER";
  GRANT CREATE VIEW TO "LOGGER";
  GRANT CREATE TABLE TO "LOGGER";

