CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."COUNTRYVISA" ("VCOUNTCD", "VISATYPE_SEQNO", "COUNT_SEQNO", "VISATYPECD", "COUNTCD", "VISATYPETNM", "PERMITTDAYS", "VPERMITDAY", "FIXDEPTLINE") AS 
  select a.visatypecd || b.countcd vcountcd,
            a.visatype_seqno,
            b.count_seqno,
            a.visatypecd,
            b.countcd,
            a.visatypetnm,
            (a.permittdays - 1) permittdays,
            a.visatypecd || '/' || a.permittdays as vpermitday,
            b.fixdeptline
       from visatype a, visabynation b
      where a.visatype_seqno = b.visa_seqno and b.defaultvisa = 'Y'
   order by a.visatypecd;
