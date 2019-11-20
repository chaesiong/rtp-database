CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_FLAGRPTMENU" (group_id_tmp number, node_tmp number, program_id_tmp varchar2) return varchar2 is
tmp varchar2(20);
nodeid varchar2(100);
proid varchar2(100);
flag varchar2(10);
begin
 begin
        select node_id into nodeid  from fw_menu_special a where group_id=group_id_tmp and node_id=node_tmp and rownum =1;
        --select node_id from fw_menu_special a where group_id=78 and node_id=214 and rownum =1;
        if nodeid = null then
            tmp:='SHOW';
        else
            begin
                 select decode(program_id, null, 'NOTSHOW', program_id ) into proid from fw_menu_special a where group_id = group_id_tmp and node_id=node_tmp and rownum =1;
                 --select decode(program_id, null, 'NOTSHOW', program_id )  from fw_menu_special a where group_id = 78 and node_id=214 and rownum =1;                 
                if proid = 'NOTSHOW' then                    
                    select status_show into flag from fw_menu_special a where group_id = group_id_tmp and node_id=node_tmp and rownum =1;
                    if flag='Y' then
                        tmp:='SHOW';
                    else
                        tmp:='NOTSHOW';
                    end if;
                else
                    begin
                        select program_id into proid from fw_menu_special a where group_id = group_id_tmp and node_id=node_tmp and program_id=program_id_tmp  and status_show ='N' ;
                            if  proid  = null then
                                tmp:='SHOW';
                            else
                                tmp:='NOTSHOW';
                            end if;   
                        Exception When No_Data_Found Then return 'SHOW' ;
                        end;
                end if;
            Exception When No_Data_Found Then return 'NOTSHOW' ;
            end;           
        end if;
 Exception When No_Data_Found Then return 'SHOW' ;
 end;
  return tmp;
end;
/
  GRANT EXECUTE ON "PIBICSDM2"."GET_FLAGRPTMENU" TO "APPSUP";
  GRANT EXECUTE ON "PIBICSDM2"."GET_FLAGRPTMENU" TO "BIOSAADM";
