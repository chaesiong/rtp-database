CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_REPS" AS 

   PROCEDURE SP_TM8(
      P_DATA IN BLOB,
      P_RESPONSE OUT CLOB );

END PKG_REPS;

/