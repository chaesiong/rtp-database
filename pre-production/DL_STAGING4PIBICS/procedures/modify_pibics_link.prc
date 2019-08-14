CREATE OR REPLACE EDITIONABLE PROCEDURE "DL_STAGING4PIBICS"."MODIFY_PIBICS_LINK" (pibics_user           IN VARCHAR2
                                                                ,pibics_password       IN VARCHAR2
                                                                ,connectstr_or_tnsname IN VARCHAR2
                                                                ,replace_existing      IN BOOLEAN DEFAULT FALSE) AUTHID DEFINER IS
    /*  This Procedure works only , when SYSTEM grants the Privilege:

     grant create database link to DL_STAGING4PIBICS;

    */
    e_db_link_does_not_exist EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_db_link_does_not_exist
                         ,-2024);
    l_stmt VARCHAR2(400);
BEGIN
    IF replace_existing THEN
        BEGIN
            EXECUTE IMMEDIATE 'DROP DATABASE LINK PIBICS';
        EXCEPTION
            WHEN e_db_link_does_not_exist THEN
                NULL;
        END;
    END IF;
    l_stmt := 'CREATE DATABASE LINK PIBICS CONNECT TO ' || pibics_user || ' IDENTIFIED BY ' || pibics_password ||
              ' USING ''' || connectstr_or_tnsname || '''';
    EXECUTE IMMEDIATE l_stmt;
    FOR r IN (SELECT 'DB-Link ' || db_link || ' -> ' || username || ' @ ' || host AS dblinks
              FROM user_db_links)
    LOOP
        dbms_output.put_line(r.dblinks);
    END LOOP;

END modify_pibics_link;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."MODIFY_PIBICS_LINK" TO "DERMALOG_PROXY";
