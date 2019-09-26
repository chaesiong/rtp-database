CREATE OR REPLACE FORCE EDITIONABLE VIEW "PIBICSDM2"."VW_LASTUSERLOGIN" ("DEPT_SEQNO", "DEPARTNAME", "USER_ID", "USERNAME", "IPADDRESS", "PROGRAM_ID", "PROGRAM_NAME", "SYSTEM_NAME", "APPSERV", "LOGINDATE") AS 
  WITH lastuser_action
        AS (  SELECT a.user_id,
                     TO_CHAR (MAX (logindate), 'YYYYMMDDHH24MISS') maxlogindate
                FROM fw_log a, fw_user b  where a.user_id = b.user_id and b.person_id is not null and a.action = 'call'--where to_char(logindate, 'YYYY') = to_char(sysdate, 'YYYY')
            GROUP BY a.user_id)
   SELECT get_hrfromuserid (b.user_id, 'C') dept_seqno,
          get_deptabbnm (get_hrfromuserid (b.user_id, 'C'), 'T') departname,
          b.user_id,
          get_hrprofilefull (b.user_id) username,
          ipaddress,
          d.program_id,
          d.program_name,
          e.system_name,
          DECODE (ipserver,
                  '192.169.1.14:7778:/pibics', 'appcluster1',
                  '192.169.1.15:7778:/pibics', 'appcluster2',
                  '192.169.1.20:7778:/pibics', 'appserv',
                  '192.169.1.21:7778:/pibics', 'appserv2',
                  '192.169.1.22:7778:/pibics', 'appserv3',
                  '192.169.1.23:7778:/pibics', 'appserv4',
                  '192.169.1.24:7778:/pibics', 'appserv5',
                  '192.169.1.25:7778:/pibics', 'appserv6',
                  '192.169.1.26:7778:/pibics', 'appserv7',
                  '192.169.1.27:7778:/pibics', 'appserv8')
             appserv,
          logindate
     FROM lastuser_action a,
          fw_log b,
          fw_user c,
          fw_programlist d,
          fw_system e
    WHERE     a.user_id = b.user_id
          AND a.maxlogindate = TO_CHAR (b.logindate, 'YYYYMMDDHH24MISS')
          AND a.user_id = c.user_id
          AND c.person_id IS NOT NULL
          AND b.action = 'call'
          AND b.program_id = d.program_id
          AND d.system_code = e.system_code;
