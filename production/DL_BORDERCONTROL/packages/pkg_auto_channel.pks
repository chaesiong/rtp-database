CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_AUTO_CHANNEL" AS 

   PROCEDURE SP_CALLFNSERVICESBYLIST (
        p_request     IN blob,
        p_response   OUT CLOB
    );

 PROCEDURE SP_CALLSERVICESWATCHLISTPIC (
        p_request     IN blob,
        p_response   OUT clob,
        p_response_img   OUT clob
    );
    
   PROCEDURE SP_RESENDFNIMG (
        p_request     IN blob,
        p_response   OUT CLOB
    );
    
   PROCEDURE SP_BORDERDOCUMENT (
        p_request     IN blob,
        p_response   OUT CLOB
    );
  PROCEDURE SP_MOVEMENT (
        p_request     IN blob,
        p_response   OUT CLOB
    );
END PKG_AUTO_CHANNEL;
/
