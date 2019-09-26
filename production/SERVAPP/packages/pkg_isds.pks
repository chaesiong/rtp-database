CREATE OR REPLACE EDITIONABLE PACKAGE "SERVAPP"."PKG_ISDS" AS 

   PROCEDURE VOA_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );

  PROCEDURE PROHIBIT_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_inout     IN number,
        p_message   OUT CLOB
    );
    
  PROCEDURE FEES_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );
    
 PROCEDURE FINES_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );
    
 PROCEDURE DEPORTEE_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );
    
 PROCEDURE REPS_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );
 PROCEDURE TM2_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );
    
 PROCEDURE EXT_TO_PIBICS (
        p_id     IN number,
        p_mode     IN varchar2,
        p_message   OUT CLOB
    );


END PKG_ISDS;
/
