CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."SPLITSTRINGPISCES" (P_LIST VARCHAR2, P_DEL VARCHAR2 := ',', AMOUNT NUMBER := 3) RETURN STR_ARRAY PIPELINED IS
   L_IDX PLS_INTEGER;
   L_LIST VARCHAR2 (32767) := P_LIST;
   L_VALUE VARCHAR2 (32767);
   RECORD_INDEX NUMBER;
BEGIN
    LOOP
        L_IDX := INSTR (L_LIST, P_DEL);
        RECORD_INDEX := 1 + NVL(RECORD_INDEX, 0);
        IF L_IDX > 0 AND RECORD_INDEX!= AMOUNT THEN
            PIPE ROW (SUBSTR (L_LIST, 1, L_IDX - 1));
            L_LIST := SUBSTR (L_LIST, L_IDX + LENGTH (P_DEL));
        ELSE
            PIPE ROW (L_LIST);            
            IF RECORD_INDEX+1 <= AMOUNT THEN
                FOR I IN RECORD_INDEX..AMOUNT-1 LOOP
                    PIPE ROW (NULL);
                END LOOP;
                EXIT;
            END IF;
            EXIT;
        END IF;
    END LOOP;
   RETURN;
END SPLITSTRINGPISCES;
/