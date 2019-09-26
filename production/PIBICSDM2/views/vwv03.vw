CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VWV03" ("TDTNO") AS 
  select tdtno  from immoverstay a, visatype b  where a.visatypecd = b.visatypecd and 
to_number(to_char("INOUTDTE",'YYYYMMDD'))  between  '20130101' and '20150209'
and cardtype = '1' and  nationcd  = 'V03' and tdtno in (select tdtno  from immoverstay a, visatype b  where a.visatypecd = b.visatypecd and 
to_number(to_char("INOUTDTE",'YYYYMMDD'))  between  '20130101' and '20150209'
and cardtype = '1' and  nationcd  = 'V03' 
and tdtno in (select tdtno from immigration where nationcd = 'V03' 
and cardtype = '2' and to_char(inoutdte, 'YYYYMM') between '201401' and '201503'));
