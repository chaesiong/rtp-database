CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_FINE" AS 

  PROCEDURE SP_FINE(
      P_DATA IN CLOB,
      P_SEQNO OUT varchar2);

END PKG_FINE;
/