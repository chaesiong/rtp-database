CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_AUTHCHECKPOINT" (userid varchar, deptip Number) return varchar is
tmp number;
deptuser varchar2(20);
spotip number;
spotdeptuser number;
begin
    begin 
        
        select b.dept_seqno into deptuser from fw_user a, hr_profile b where (a.person_id=b.profile_seqno and user_id=userid);
        if deptuser=deptip then
              return 'AUTNDEPT';
        else
            --select count('X') into tmp from department a, departmentspot b where a.spotseqno=b.spotseqno and a.dept_seqno=deptuser;
            select SPOTSEQNO into spotip from departmentspot where dept_seqno=deptip;
            select SPOTSEQNO into spotdeptuser from department  where dept_seqno=deptuser;
            --if tmp > 0 then            
            if spotip = spotdeptuser then
                return 'AUTNDEPT';
            end if;
        end if;
    Exception When No_Data_Found Then Null ;
        return 'NONAUTNDEPT';
    end;
    return 'NONAUTNDEPT';
end;
/
