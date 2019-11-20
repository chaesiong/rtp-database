CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_EVOA" AS 



PROCEDURE SP_CHECK_BALCKLIST (
        p_request     IN blob,
        p_response   OUT CLOB
    );

END PKG_EVOA;
/
