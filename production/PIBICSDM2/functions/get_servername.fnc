CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_SERVERNAME" (v_ipserver varchar2) return varchar2 is
tmp varchar2(200);
servernm varchar2(50);
begin
    begin
        tmp := substr(v_ipserver, 1, 12);
        if tmp = '192.169.1.14' then
            servernm := 'Appcluster1';    
        elsif tmp = '192.169.1.15' then
            servernm := 'Appcluster2';        
        elsif tmp = '192.169.1.20' then
            servernm := 'Appserv1';
        elsif tmp = '192.169.1.21' then
            servernm := 'Appserv2';  
         elsif tmp = '192.169.1.22' then
            servernm := 'Appserv3';  
        elsif tmp = '192.169.1.23' then
            servernm := 'Appserv4';           
        elsif tmp = '192.169.1.24' then
            servernm := 'Appserv5';  
         elsif tmp = '192.169.1.25' then
            servernm := 'Appserv6';  
        elsif tmp = '192.169.1.26' then
            servernm := 'Appserv7';      
        elsif tmp = '192.169.1.27' then
            servernm := 'Appserv8';                                                           
        end if;        
    Exception When No_Data_Found Then Null ;
    end;
  return servernm;
end;
/
