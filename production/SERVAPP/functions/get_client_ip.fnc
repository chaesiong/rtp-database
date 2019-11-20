CREATE OR REPLACE EDITIONABLE FUNCTION "SERVAPP"."GET_CLIENT_IP" RETURN VARCHAR2 AS 
  l_ips varchar2(32000) := null;
    l_ips_cnt number := 0;
    l_r_ip varchar2(255) := null;
    l_f_ip varchar2(255) := null;
    l_ip varchar2(255) := null;
BEGIN
 l_r_ip := owa_util.get_cgi_env('x-real-ip');
    l_ips := owa_util.get_cgi_env('x-forwarded-for');
    
    begin
        select ips, ips_count
        into l_f_ip, l_ips_cnt
        from
        (
            select the_level, trim(ips) as ips, count(*) over (partition by null) as ips_count
            
            from
            (
                select level the_level, regexp_substr(l_ips,'[^,]+', 1, level) ips
                from dual
                connect by regexp_substr(l_ips, '[^,]+', 1, level) is not null
            )
            where trim(ips) is not null
        )
        where the_level = 1;
    exception 
        when others then
            l_f_ip := null;
            l_ips_cnt := 0;
    end;
    
    if l_ips_cnt > 1 and l_f_ip is not null then
        l_ip := l_f_ip;
    end if;
    
    if l_ip is null then
        l_ip := l_r_ip;
    end if;
    
    if l_ip is null then
        l_ip := owa_util.get_cgi_env('remote_addr');
    end if;
    
    return l_ip;
END GET_CLIENT_IP;
/
  GRANT EXECUTE ON "SERVAPP"."GET_CLIENT_IP" TO "BIOSAADM";
