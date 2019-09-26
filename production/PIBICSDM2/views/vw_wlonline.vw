CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_WLONLINE" ("WLCD", "SEQNO", "WLTFIRSTNM", "WLTLASTNM", "WLTMIDDLENM", "SEX", "WLELASTNM", "WLEFIRSTNM", "WLEMIDDLENM", "BIRTHPLACE", "BIRTHDTE", "BIRTHDATE", "ORGNM", "AGCCONTCD", "AGCCONTNM", "AGCPHONE", "DOCREF", "PRECINCTTNM", "OPERREFNM", "BLAWSNO", "RLAWSNO", "PENALNO", "DOCREFER", "RMKAGCCONT", "EMGCONT", "SECRETNM", "WARRNO", "RMKARREST", "NATIONTNM", "WARRDTE", "WARREXPDTE", "TDTNM", "REASONTNM", "CUSERNM", "CREDTE", "REASONCD", "KEYDATE", "NATIONCD", "DEPT_SEQNO", "SEXCODE", "OTHERAGCCONT", "CREATE_DATE") AS 
  SELECT A.wlcd,
          b.seqno,
          wltfirstnm,
          wltlastnm,
          wltmiddlenm,
          DECODE (sex,  'M', 'ชาย',  'F', 'หญิง') sex,
          wlelastnm,
          wlefirstnm,
          wlemiddlenm,
          birthplace,
          A.birthdte,
          DECODE (
             A.birthdte,
             NULL, '',
             A.birthdte || ' ('
             || (DECODE (LENGTH (A.birthdte),
                         10, SUBSTR (A.birthdte, 7),
                         8, SUBSTR (A.birthdte, 5),
                         4, A.birthdte)
                 + 543)
             || ')')
             birthdate,
          orgnm,
          agccontcd,
          D.agccontnm,
          agcphone,
          docref,
          E.precincttnm,
          f.operref || ' '
          || DECODE (
                A.operref,
                '03', CASE
                         WHEN A.operref = '03' AND arrest = 'Y'
                         THEN
                            '- จับกุมได้'
                         ELSE
                            '- ยังจับกุมได้'
                      END,
                '-')
             AS operrefnm,
          blawsno,
          rlawsno,
          penalno,
          docrefer,
          rmkagccont,
          emgcont,
          G.secretnm,
          warrno,
          rmkarrest,
          K.nationtnm,
          TO_CHAR (A.warrdte, 'dd/mm/yyyy')
          || DECODE (
                warrdte,
                NULL, '',
                ' ('
                || TO_CHAR (
                      warrdte,
                      'YYYY',
                      'NLS_CALENDAR=''THAI BUDDHA'' NLS_DATE_LANGUAGE=THAI')
                || ')')
             warrdte,
          TO_CHAR (A.warrdte, 'dd/mm/yyyy')
          || DECODE (
                warrexpdte,
                NULL, '',
                ' ('
                || TO_CHAR (
                      warrexpdte,
                      'YYYY',
                      'NLS_CALENDAR=''THAI BUDDHA'' NLS_DATE_LANGUAGE=THAI')
                || ')')
             warrexpdte,
          H.tdtnm,
          j.reasontnm,
          get_nameimmpibics (A.creusr) cusernm,
          TRIM (
             TO_CHAR (A.credte, 'dd/mm/yyyy') || ' '
             || DECODE (TO_CHAR (A.credte, 'hh24:mi'),
                        '00:00', NULL,
                        TO_CHAR (A.credte, 'hh24:mi')))
             credte,
          DECODE (j.reasoncd, '', '', j.reasoncd) reasoncd,
                    TRIM (
             TO_CHAR (A.key_date, 'dd/mm/yyyy') || ' '
             || DECODE (TO_CHAR (A.key_date, 'hh24:mi'),
                        '00:00', NULL,
                        TO_CHAR (A.key_date, 'hh24:mi')))
             keydate,
             a.nationcd nationcd,
             dept_seqno,
             sex sexcode,
             otheragccont,
             credte create_date
     FROM watchlist A,
          watchlistnm b,
          policorganize c,
          agccontact D,
          precinct E,
          operationref f,
          secretlevel G,
          todolist H,
          blimpreason j,
          country K
    WHERE     A.wlcd = b.wlcd
          AND A.ownerage = c.orgcd(+)
          AND A.agccont = D.agccontcd(+)
          AND A.precinctcd = E.precinctcd(+)
          AND A.operref = f.opercd(+)
          AND A.seclev = G.secretcd(+)
          AND A.tdcd = H.tdcd(+)
          AND A.reasoncd = j.reasoncd(+)
          AND A.nationcd = K.countcd
          AND A.reasoncd <> '0076'
          AND flagcheckpoint IS NULL
   UNION ALL
   SELECT lppcd wlcd,
          0 seqno,
          tfirstnm wltfirstnm,
          tfamilynm wltlastnm,
          tmiddlenm wltmiddlenm,
          sex,
          efamilynm wlelastnm,
          efirstnm wlefirstnm,
          emiddlenm wlemiddlenm,
          '' birthplace,
          birthdate birthdte,
          DECODE (
             A.birthdate,
             NULL, '',
             A.birthdate || ' ('
             || (DECODE (LENGTH (A.birthdate),
                         10, SUBSTR (A.birthdate, 7),
                         8, SUBSTR (A.birthdate, 5),
                         4, A.birthdate)
                 + 543)
             || ')')
             birthdate,
          orgnm,
          '' agccontcd,
          agccont agccontnm,
          agcphone,
          docref,
          '' precincttnm,
          c.operref operrefnm,
          '' blawsno,
          '' rlawsno,
          '' penalno,
          '' docrefer,
          '' rmkagccont,
          emgcont,
          secretnm,
          '' warrno,
          '' rmkarrest,
          E.nationtnm,
          '' warrdte,
          '' Warrexpdte,
          f.tdtnm,
          G.reasontnm,
          get_nameimmpibics (A.creusr) cusernm,
          TRIM (
             TO_CHAR (A.credte, 'dd/mm/yyyy') || ' '
             || DECODE (TO_CHAR (A.credte, 'hh24:mi'),
                        '00:00', NULL,
                        TO_CHAR (A.credte, 'hh24:mi')))
             credte,
          DECODE (G.reasoncd, '', '', G.reasoncd) reasoncd,
                    '' keydate,
                    a.nationcd nationcd, 
                    dept_seqno,
                    sex sexcode,
                    '' otheragccont,
             credte create_date
     FROM lostpassport A,
          policorganize b,
          operationref c,
          secretlevel D,
          country E,
          todolist f,
          blimpreason G
    WHERE     A.ownerage = b.orgcd(+)
          AND A.operref = c.opercd(+)
          AND A.seclev = D.secretcd(+)
          AND A.nationcd = E.countcd
          AND A.tdcd = f.tdcd(+)
          AND A.reasoncd = G.reasoncd(+);
