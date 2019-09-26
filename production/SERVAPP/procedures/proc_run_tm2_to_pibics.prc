CREATE OR REPLACE EDITIONABLE PROCEDURE "SERVAPP"."PROC_RUN_TM2_TO_PIBICS" AS 
cur_data SYS_REFCURSOR;
i_tm2_seqno int;
c_msg clob;
BEGIN
  open cur_data for select tm2_seqno
                    from mscs_tm2
                    where FLIGHTNO <> 'PVT00' and create_by <> 'UM_ADMIN' and  PIBICSPK is null;
  LOOP
            FETCH cur_data
            INTO i_tm2_seqno;
            EXIT WHEN cur_data%NOTFOUND;
            PKG_ISDS.TM2_TO_PIBICS(i_tm2_seqno,'A',c_msg);
     end loop ;
    CLOSE cur_data; 
END PROC_RUN_TM2_TO_PIBICS;
/
