CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_ISDS_RETRY" AS 

  PROCEDURE ISDS_RETRY (
        p_sender     IN varchar2,
        p_start_date     IN varchar2,
        p_end_date    IN varchar2
    );
END PKG_ISDS_RETRY;
/
