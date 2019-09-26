CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTTHREELEVELSEQNO" (P_DEPT_SEQNO NUMBER) RETURN str_array PIPELINED IS
BEGIN
  FOR REC IN (SELECT * FROM DEPARTMENT A WHERE (A.REL_CODE= P_DEPT_SEQNO OR A.DEPT_SEQNO= P_DEPT_SEQNO)  OR (A.REL_CODE IN (SELECT A.DEPT_SEQNO FROM DEPARTMENT A WHERE A.REL_CODE= P_DEPT_SEQNO))) LOOP
    PIPE ROW(REC.DEPT_SEQNO);
  END LOOP;
  RETURN;
END GET_DEPTTHREELEVELSEQNO;
/
