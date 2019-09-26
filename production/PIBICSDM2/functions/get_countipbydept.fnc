CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_COUNTIPBYDEPT" (v_dept_seqno varchar) return number is
tmp number(8);
begin
    begin
        tmp := 0;    
        
        select count('X') into tmp 
        from mappingip where dept_seqno=v_dept_seqno 
        and (ipaddress not like '192.169.1.%' 
    and ipaddress not like '192.169.254.%' 
    and ipaddress not like '192.169.111.%' 
    and ipaddress not like '192.168.100.%'
    and ipaddress not like '192.168.100.%'
    and ipaddress not like '157.179.19.%'
    and ipaddress not like '127.0.0.1%'
    and ipaddress not like '172.31.%'
    and ipaddress not like '202.183.129.%'
    and ipaddress not like '202.122.131.%'
    and ipaddress not like '202.183.129.%'
    and ipaddress not like '172.17.10.%'
    and ipaddress not like '157.179.132.252%'
    and ipaddress not like '172.17.61.4%'
    and ipaddress not like '172.17.61.5%'
    and ipaddress not like '172.20.1.12%'
    and ipaddress not like '172.16.4.237%'
    and ipaddress not like '172.16.41.67%'
    and ipaddress not like '157.179.132.185%'
    and ipaddress not like '157.179.134.0%'
    and ipaddress not like '172.16.40.20%'
    and ipaddress not like '157.179.134.%'
    and ipaddress not like '172.16.5.243%'
        ) and dept_seqno in (select dept_seqno from department where actflag = 'Y');
        
    exception when no_data_found then null ;
    end;
  return tmp;
end;
/
