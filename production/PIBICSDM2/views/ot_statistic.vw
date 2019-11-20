CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."OT_STATISTIC" ("DEPT_SEQNO", "DEPTNAMELEVEL1", "DEPTNAMELEVEL2", "DEPTNAMELEVEL3", "RLC", "DEPTLEVEL", "TOTALDAY", "IND01", "OUTD01", "TOTALD01", "IND02", "OUTD02", "TOTALD02", "IND03", "OUTD03", "TOTALD03", "IND04", "OUTD04", "TOTALD04", "IND05", "OUTD05", "TOTALD05", "IND06", "OUTD06", "TOTALD06", "IND07", "OUTD07", "TOTALD07", "IND08", "OUTD08", "TOTALD08", "IND09", "OUTD09", "TOTALD09", "IND10", "OUTD10", "TOTALD10", "IND11", "OUTD11", "TOTALD11", "IND12", "OUTD12", "TOTALD12", "IND13", "OUTD13", "TOTALD13", "IND14", "OUTD14", "TOTALD14", "IND15", "OUTD15", "TOTALD15", "IND16", "OUTD16", "TOTALD16", "IND17", "OUTD17", "TOTALD17", "IND18", "OUTD18", "TOTALD18", "IND19", "OUTD19", "TOTALD19", "IND20", "OUTD20", "TOTALD20", "IND21", "OUTD21", "TOTALD21", "IND22", "OUTD22", "TOTALD22", "IND23", "OUTD23", "TOTALD23", "IND24", "OUTD24", "TOTALD24", "IND25", "OUTD25", "TOTALD25", "IND26", "OUTD26", "TOTALD26", "IND27", "OUTD27", "TOTALD27", "IND28", "OUTD28", "TOTALD28", "IND29", "OUTD29", "TOTALD29", "IND30", "OUTD30", "TOTALD30", "IND31", "OUTD31", "TOTALD31") AS 
  select dept_seqno, deptnamelevel1, deptnamelevel2, deptnamelevel3, rlc, deptlevel, 
(decode(totald01, null, 0, totald01)  + decode(totald02, null, 0, totald02) + decode(totald03, null, 0, totald03) + decode(totald04, null, 0, totald04) 
+ decode(totald05, null, 0, totald05) + decode(totald06, null, 0, totald06) + decode(totald07, null, 0, totald07) + decode(totald08, null, 0, totald08) 
+ decode(totald09, null, 0, totald09) + decode(totald10, null, 0, totald10) 
+ decode(totald11, null, 0, totald11)  + decode(totald12, null, 0, totald12) + decode(totald13, null, 0, totald13) + decode(totald14, null, 0, totald14) 
+ decode(totald15, null, 0, totald15) + decode(totald16, null, 0, totald16) + decode(totald17, null, 0, totald17) + decode(totald18, null, 0, totald18) 
+ decode(totald19, null, 0, totald19) + decode(totald20, null, 0, totald20)
+ decode(totald21, null, 0, totald21)  + decode(totald22, null, 0, totald22) + decode(totald23, null, 0, totald23) + decode(totald24, null, 0, totald24) 
+ decode(totald25, null, 0, totald25) + decode(totald26, null, 0, totald26) + decode(totald27, null, 0, totald27) + decode(totald28, null, 0, totald28) 
+ decode(totald29, null, 0, totald29) + decode(totald30, null, 0, totald30)+ decode(totald31, null, 0, totald31)
) totalday
, ind01, outd01, totald01, ind02, outd02, totald02, ind03, outd03, totald03, ind04, outd04, totald04, ind05, outd05, totald05, ind06, outd06, totald06, ind07, 
outd07, totald07, ind08, outd08, totald08, ind09, outd09, totald09, ind10, outd10, totald10, ind11, outd11, totald11, ind12, 
outd12, totald12, ind13, outd13, totald13, ind14, outd14, totald14, ind15, outd15, totald15, ind16, outd16, totald16, ind17, 
outd17, totald17, ind18, outd18, totald18, ind19, outd19, totald19, ind20, outd20, totald20, ind21, outd21, totald21, ind22, 
outd22, totald22, ind23, outd23, totald23, ind24, outd24, totald24, ind25, outd25, totald25, ind26, outd26, totald26, ind27, 
outd27, totald27, ind28, outd28, totald28, ind29, outd29, totald29, ind30, outd30, totald30, ind31, outd31, totald31
from (
select a.dept_seqno, deptnamelevel1, deptnamelevel2, 
deptnamelevel3, rlc, a.deptlevel, dld, ind01, outd01, ind01 + outd01 totald01,
ind02, outd02, ind02 + outd02 totald02, ind03, outd03, ind03 + outd03 totald03, 
ind04, outd04, ind04 + outd04 totald04, ind05, outd05, ind05 + outd05 totald05,
ind06, outd06, ind06 + outd06 totald06, ind07, outd07, ind07 + outd07 totald07, 
ind08, outd08, ind08 + outd08 totald08, ind09, outd09, ind09 + outd09 totald09, 
ind10, outd10, ind10 + outd10 totald10, ind11, outd11, ind11 + outd11 totald11, 
ind12, outd12, ind12 + outd12 totald12, ind13, outd13, ind13 + outd13 totald13,
ind14, outd14, ind14 + outd14 totald14, ind15, outd15, ind15 + outd15 totald15, 
ind16, outd16, ind16 + outd16 totald16, ind17, outd17, ind17 + outd17 totald17, 
ind18, outd18, ind18 + outd18 totald18, ind19, outd19, ind19 + outd19 totald19,
ind20, outd20, ind20 + outd20 totald20, ind21, outd21, ind21 + outd21 totald21, 
ind22, outd22, ind22 + outd22 totald22, ind23, outd23, ind21 + outd23 totald23, 
ind24, outd24, ind24 + outd24 totald24, ind25, outd25, ind25 + outd25 totald25, 
ind26, outd26, ind26 + outd26 totald26, ind27, outd27, ind27 + outd27 totald27,
ind28, outd28, ind28 + outd28 totald28, ind29, outd29, ind29 + outd29 totald29, 
ind30, outd30, ind30 + outd30 totald30, ind31, outd31, ind31 + outd31 totald31
from statisticdaypibics a, department b where a.dept_seqno = b.dept_seqno and a.dept_seqno not in (91)
and b.checkpoint = 'Y' order by a.rlc, a.deptlevel);
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "ROLE_PIBICSAPP";
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "BIO_BD";
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "APPSUP";
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "BIOAPPREPORT";
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSUPPORT";
  GRANT DELETE ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT INSERT ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT SELECT ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT UPDATE ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT REFERENCES ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT READ ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT ON COMMIT REFRESH ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT QUERY REWRITE ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT DEBUG ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT FLASHBACK ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
  GRANT MERGE VIEW ON "PIBICSDM2"."OT_STATISTIC" TO "BIOSAADM";
