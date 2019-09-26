CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_USEREJB2" (useridtmp varchar2,flag char) return varchar2 is
tmp varchar2(400);
begin
    begin
    if flag = 'A' then
       select  GET_NAMEALLHR(get_HrfromUserId(user_id,'B'),'A') into tmp  from fw_user  where user_id=useridtmp;--fullname
    elsif flag = 'B' then
       select GET_DEPTNAME(GET_NAMEALLHR(get_HrfromUserId(user_id,'B'),'E'),'T') into tmp  from fw_user  where user_id=useridtmp;--dept
    end if;
    Exception When No_Data_Found Then Null ;
     if flag = 'A' then
       select get_rankfromrankid(rankid,'A')||firstnm||'  '||familynm into tmp  from sysuser where userid=useridtmp;
    elsif flag = 'B' then
       select get_Departments(deptcd,'T') into tmp from sysuser  where userid=useridtmp;
    end if;
    end;
  return tmp;
end;
/
