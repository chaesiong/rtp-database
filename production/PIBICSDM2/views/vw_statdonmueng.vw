CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_STATDONMUENG" ("DURATION", "IN_THAI", "IN_ALIEN", "IN_FP_THAI", "IN_FP_ALIEN", "IN_VOA", "OUT_THAI", "OUT_ALIEN", "OUT_CIQ_THAI", "OUT_CIQ_ALIEN", "INOUTDATE") AS 
  select duration,	
(case when cardtype=1 and nationcd='T03' and credterm not in('172.16.6.180','172.16.6.181','172.16.6.182','172.16.6.183') then 1 end) in_thai,	
(case when cardtype=1 and nationcd<>'T03' and credterm not in('172.16.6.180','172.16.6.181','172.16.6.182','172.16.6.183') then 1 end) in_alien,	
(case when cardtype=1 and nationcd='T03' and credterm in('172.16.6.180','172.16.6.181','172.16.6.182','172.16.6.183') then 1 end) in_fp_thai,	
(case when cardtype=1 and nationcd<>'T03' and credterm in('172.16.6.180','172.16.6.181','172.16.6.182','172.16.6.183') then 1 end) in_fp_alien,	
(case when visatype_seqno = 23 and nationcd <> 'T03' and cardtype = '1' then 1 end) in_voa,	
(case when cardtype=2 and nationcd='T03' and credterm not in('172.16.6.184','172.16.6.185','172.16.6.186','172.16.6.187') then 1 end) out_thai,	
(case when cardtype=2 and nationcd<>'T03' and credterm not in('172.16.6.184','172.16.6.185','172.16.6.186','172.16.6.187') then 1 end) out_alien,	
(case when cardtype=2 and nationcd='T03' and credterm in('172.16.6.184','172.16.6.185','172.16.6.186','172.16.6.187') then 1 end) out_ciq_thai,	
(case when cardtype=2 and nationcd<>'T03' and credterm in('172.16.6.184','172.16.6.185','172.16.6.186','172.16.6.187') then 1 end) out_ciq_alien,
inoutdate	
from( 	
select 	
	case 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 101 	
	then '00:01 - 01:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 201 	
	then '01:01 - 02:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 301 	
	then '02:01 - 03:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 401 	
	then '03:01 - 04:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 501 	
	then '04:01 - 05:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 601 	
	then '05:01 - 06:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 701 	
	then '06:01 - 07:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 801 	
	then '07:01 - 08:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 901 	
	then '08:01 - 09:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1001 	
	then '09:01 - 10:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1101 	
	then '10:01 - 11:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1201 	
	then '11:01 - 12:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1301 	
	then '12:01 - 13:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1401 	
	then '13:01 - 14:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1501 	
	then '14:01 - 15:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1601 	
	then '15:01 - 16:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1701 	
	then '16:01 - 17:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1801 	
	then '17:01 - 18:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 1901 	
	then '18:01 - 19:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 2001 	
	then '19:01 - 20:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 2101 	
	then '20:01 - 21:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 2201 	
	then '21:01 - 22:00' 	
	when to_number(to_char(inoutdate,'hh24mi'))  < 2301 	
	then '22:01 - 23:00' 	
	else '23:01 - 00:00' 	
	end as duration,cardtype,nationcd,credterm,visatype_seqno,to_char(inoutdate,'yyyymmdd') inoutdate 	
	from vw_tmonline 	
	where deptcd ='00S08' 	
 )  	
 union all 	
select duration,0 in_thai, 0 in_alien, 0 in_fp_thai, 0 in_fp_alien, 0 in_voa, 0 out_thai, 0 out_alien, 0 out_ciq_thai, 0 out_ciq_alien,'' inoutdate	
from    ( 	
select 	
case 	
	when rownum  = 1 	
	then '00:01 - 01:00' 	
	when rownum = 2 	
	then '01:01 - 02:00' 	
	when rownum = 3 	
	then '02:01 - 03:00' 	
	when rownum = 4 	
	then '03:01 - 04:00' 	
	when rownum = 5 	
	then '04:01 - 05:00' 	
	when rownum = 6 	
	then '05:01 - 06:00' 	
	when rownum = 7 	
	then '06:01 - 07:00' 	
	when rownum = 8 	
	then '07:01 - 08:00' 	
	when rownum = 9 	
	then '08:01 - 09:00' 	
	when rownum = 10 	
	then '09:01 - 10:00' 	
	when rownum = 11 	
	then '10:01 - 11:00' 	
	when rownum = 12 	
	then '11:01 - 12:00' 	
	when rownum = 13 	
	then '12:01 - 13:00' 	
	when rownum = 14 	
	then '13:01 - 14:00' 	
	when rownum = 15 	
	then '14:01 - 15:00' 	
	when rownum = 16 	
	then '15:01 - 16:00' 	
	when rownum = 17 	
	then '16:01 - 17:00' 	
	when rownum = 18 	
	then '17:01 - 18:00' 	
	when rownum = 19 	
	then '18:01 - 19:00' 	
	when rownum = 20 	
	then '19:01 - 20:00' 	
	when rownum = 22 	
	then '20:01 - 21:00' 	
	when rownum = 23 	
	then '21:01 - 22:00' 	
	when rownum = 24 	
	then '22:01 - 23:00' 	
	else '23:01 - 00:00' 	
	end as duration    	
	from vw_tmonline 	
	where rownum <=25 	
);
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."VW_STATDONMUENG" TO "BIOSAADM";
