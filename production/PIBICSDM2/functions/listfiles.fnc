CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."LISTFILES" (PATH VARCHAR2) RETURN FILE_LIST IS
LANGUAGE JAVA
NAME 'ListVirtualDirectory.getList(java.lang.String) return oracle.sql.ARRAY';
/
