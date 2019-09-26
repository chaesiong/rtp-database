CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTFN_SEQNO" (pflag_boi varchar,ppv_seqno NUMBER,ptmb_seqno number,pvisa_seqno Number) return number is
Vdept_seqno number;
begin
    begin   
    if pflag_boi = 'Y' then
      Vdept_seqno := 14;
    elsif ppv_seqno = 1 then
        if pvisa_seqno = 21 then
          Vdept_seqno := 13;
        else
          Vdept_seqno := 13;
        end if;
    else
      select dept_seqno into Vdept_seqno from department where dept_seqno = (select dept_seqno from tambon where tmb_seqno = ptmb_seqno);
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return Vdept_seqno;
end;
/
