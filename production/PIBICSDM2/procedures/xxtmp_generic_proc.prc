CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."XXTMP_GENERIC_PROC" 
AS

BEGIN 

    /*
    -- gather table stats
	dbms_stats.gather_table_stats (
		ownname				=>	USER,
		tabname				=>	'SIREN_STATEMENT_DETAILS',
		estimate_percent	=>	DBMS_STATS.AUTO_SAMPLE_SIZE,
		method_opt			=>	'FOR ALL COLUMNS SIZE AUTO',
		degree				=>	DBMS_STATS.DEFAULT_DEGREE,
		cascade				=>	TRUE
	);
	*/

	EXECUTE IMMEDIATE
	'
	CREATE INDEX PIBICSDM2.TMINOUT_COMPOSITE_IDX2 ON PIBICSDM2.TMINOUT
(NATIONCD, BIRTHDTE, SEX, TDTNO, EFAMILYNM, EFIRSTNM, EMIDDLENM)
TABLESPACE TS_PIBICSDM_IDX
COMPUTE STATISTICS
	';

    COMMIT;

--EXCEPTION
--	WHEN OTHERS THEN
--		l_err_code := SQLCODE;
--		l_err_msg := SUBSTR(SQLERRM, 1, 4000);
--		DBMS_OUTPUT.PUT_LINE('Error: ' || l_err_code || ' - ' || l_err_msg);

END XXTMP_GENERIC_PROC;
/
