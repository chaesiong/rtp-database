CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_DEPTFN" (pflag_boi varchar,ppv_seqno NUMBER,ptmb_seqno number,pvisa_seqno Number) return varchar2 is
deptenm varchar2(500);
begin
    begin   
    if pflag_boi = 'Y' then
      select deptenm||decode(telno,null,'',' Tell : '||telno)||decode(email,null,'',' E-mail : '||email) into deptenm from department where dept_seqno = 14;
    elsif ppv_seqno = 1 then
        if pvisa_seqno = 21 then
          select (select deptenm||decode(telno,null,'',' Tell : '||telno)||decode(email,null,'',' E-mail : '||email) from department where dept_seqno = 308)||'/'||(select deptenm||decode(telno,null,'',' Tell : '||telno)||decode(email,null,'',' E-mail : '||email) from department where dept_seqno = 309) into deptenm from dual;
        else
          select deptenm||decode(telno,null,'',' Tell : '||telno)||decode(email,null,'',' E-mail : '||email) into deptenm from department where dept_seqno = 13;
        end if;
    else
      select deptenm||decode(telno,null,'',' Tell : '||telno)||decode(email,null,'',' E-mail : '||email) into deptenm from department where dept_seqno = (select dept_seqno from tambon where tmb_seqno = ptmb_seqno);
    end if;
    Exception When No_Data_Found Then Null ;
    end;
  return deptenm;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTFN" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_DEPTFN" TO "BIOSAADM";
