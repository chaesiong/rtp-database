CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTFROMPROFILESEQ" (hrseqno_tmp Number, flag varchar2) return varchar2 is
tmp varchar2(200);
begin
 begin
    if flag = 'A' then
        SELECT DEPTTNM INTO TMP FROM DEPARTMENT WHERE DEPT_SEQNO=(SELECT DEPT_SEQNO FROM HR_PROFILE WHERE PROFILE_SEQNO=hrseqno_tmp);
     elsif flag = 'B' then
        SELECT DEPTENM INTO TMP FROM DEPARTMENT WHERE DEPT_SEQNO=(SELECT DEPT_SEQNO FROM HR_PROFILE WHERE PROFILE_SEQNO=hrseqno_tmp);
      elsif flag = 'C' then
        SELECT SUBSTR(DEPTCD,3) INTO TMP FROM DEPARTMENT WHERE DEPT_SEQNO=(SELECT DEPT_SEQNO FROM HR_PROFILE WHERE PROFILE_SEQNO=hrseqno_tmp);
       elsif flag = 'E' then
        SELECT SUBSTR(DEPTCD,3)||'-'||DEPTTNM  INTO TMP FROM DEPARTMENT WHERE DEPT_SEQNO=(SELECT DEPT_SEQNO FROM HR_PROFILE WHERE PROFILE_SEQNO=hrseqno_tmp);
     else tmp := '';
    end if;   
Exception When No_Data_Found Then Null ;
end;
    return tmp;
end;
/
