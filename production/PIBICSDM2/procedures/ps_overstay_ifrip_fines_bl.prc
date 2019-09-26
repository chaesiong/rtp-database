CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_OVERSTAY_IFRIP_FINES_BL" IS
tmpVar NUMBER;

BEGIN
   DECLARE
    sysdateTxt varchar2(25);
    sysdateFile varchar2(8);
    sysdateCurrent varchar2(8);
    totalrownum number(20);
    commitrow number(20);
    totalupdate number(20);
    totaldelete number(20);
    totalinsert number(20);
    batchlogno_seq number(20);
    postfix varchar2(20);
    TMOVSSEQNO number(20);
    flagfound varchar2(200);
    file_ut UTL_FILE.FILE_TYPE;
      
    BEGIN
        sysdateTxt := to_char(sysdate, 'dd/mm/yyyy hh24:mi:ss');
        sysdateFile := to_char(sysdate, 'yyyymmdd');
        sysdateCurrent := to_char(sysdate, 'yyyymmdd');
        totalrownum := 0;
        commitrow := 0;
        totalupdate := 0;
        totaldelete := 0;
        totalinsert := 0;
        
        batchlogno_seq := batchlog_seq.nextval;
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (batchlogno_seq, 'OVS', '18', 'OVERSTAY IFRIP FINES BL ' || to_char(sysdate -1, 'YYYYMMDD'), null, 0, 0, 0, sysdate, null, '1', 'OVS001', sysdate, 'N', 0, 0, 0, sysdate);
        commit;
        
       postfix := '';
       TMOVSSEQNO := null;
       
    <<itemIFRIP_loop>> FOR itemIfrip IN
        (
            select * from tminformdead where to_char(credte, 'YYYYMMDD') = to_char(sysdate -1, 'YYYYMMDD')
            --select * from tminformdead where to_char(credte, 'YYYYMMDD') between '20180201' and '20180206'
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1;
        
        FOR rec_tm IN (select * from processfines where tdtno = itemIfrip.tdtno 
            and (case when itemIfrip.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
            when itemIfrip.nationcd not in ('C10', 'M24', 'H04') and nationcd = itemIfrip.nationcd then 1 else 0 end = 1))
        LOOP
            flagfound := 'FOUND TMINFORMDEAD tdtno =' || itemIfrip.tdtno || ' and nationcd = '|| itemIfrip.nationcd;
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = rec_tm.tmovsseqno;
                            
           delete processfines where tmovsseqno = rec_tm.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
        END LOOP;        
    END LOOP;--Loop For itemIfrip
    
    <<itemFINES_loop>> FOR itemFines IN
        (
            select * from fs_fines where to_char(create_date, 'YYYYMMDD') = to_char(sysdate -1, 'YYYYMMDD') and finestatus = 'ACTIVE' and fineslipno is not null
            --select * from fs_fines where to_char(create_date, 'YYYYMMDD') between '20180201' and '20180206' and finestatus = 'ACTIVE' and fineslipno is not null            
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
        FOR rec_tm IN (select * from processfines where tdtno = itemFines.passportno 
            and (case when itemFines.nation_seqno in (45, 94, 143) and count_seqno in (45, 94, 143) then 1 
            when itemFines.nation_seqno not in (45, 94, 143) and count_seqno = itemFines.nation_seqno then 1 else 0 end = 1))
        LOOP
            flagfound := 'FOUND FS_FINES passportno = ' || itemFines.passportno  || ' nation_seqno = '|| itemFines.nation_seqno;
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = rec_tm.tmovsseqno;
                            
           delete processfines where tmovsseqno = rec_tm.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
        END LOOP;        
    END LOOP;--Loop For itemFines
    
    <<itemBL_loop>> FOR itemBL IN
        (
            select nationcd, b.docno from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and to_char(credte, 'YYYYMMDD') = to_char(sysdate -1, 'YYYYMMDD') and flagcheckpoint is null 
            union all
            select nationcd, b.docno from watchlist a, wlindicatecard b where a.wlcd = b.wlcd and operref in ('04', '05') and to_char(upddte, 'YYYYMMDD') = to_char(sysdate -1, 'YYYYMMDD') and flagcheckpoint is null
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
        FOR rec_tm IN (select * from processfines where tdtno = itemBL.docno
            and (case when itemBL.nationcd in ('C10', 'M24', 'H04') and nationcd in ('C10', 'M24', 'H04') then 1 
            when itemBL.nationcd not in ('C10', 'M24', 'H04') and nationcd = itemBL.nationcd then 1 else 0 end = 1))
        LOOP
            flagfound := 'FOUND WL Overstay docno = ' || itemBL.docno || ' nationcd = ' || itemBL.nationcd;
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = rec_tm.tmovsseqno;
                            
           delete processfines where tmovsseqno = rec_tm.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
        END LOOP;        
    END LOOP;--Loop For itemBL
    
    <<itemDOB_loop>> FOR itemDOB IN
        (
            select * from processfines where (birthdte like '%//%' or yearofdob like '0%' or get_age(birthdte) < 15 or dept_seqno is null or nationcd is null or visaexpdte is null or sex not in ('M','F') or sex is null or to_char(lastpermitdte, 'YYYY') < 2015 or length(tdtno) = 1 or yearofdob is null)            
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
            flagfound := 'FOUND DOB ERROR = ' || itemDOB.tdtno  || ' birthdte = '|| itemDOB.birthdte;
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = itemDOB.tmovsseqno;
                            
           delete processfines where tmovsseqno = itemDOB.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
    END LOOP;--Loop For itemFines
    
    <<itemVISAIGNORE_loop>> FOR itemVISAIGNORE IN
        (
            select * from processfines where visatype_seqno in (3, 7, 9, 10, 12, 19, 21, 28, 35, 37, 50, 4, 5, 11, 26, 29, 30, 31, 40)        
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
            flagfound := 'FOUND VISA IGNORE';
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = itemVISAIGNORE.tmovsseqno;
                            
           delete processfines where tmovsseqno = itemVISAIGNORE.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
    END LOOP;--Loop For itemFines
    
    <<itemM034_loop>> FOR itemM034 IN
        (
            select * from processfines where nationcd = 'M03' and trim(tdtcd) = 4           
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
            flagfound := 'FOUND M04 tdtcd 4';
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = itemM034.tmovsseqno;
                            
           delete processfines where tmovsseqno = itemM034.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
    END LOOP;--Loop For itemFines
        
    
    <<itemVISAEXP_loop>> FOR itemVISAEXP IN
        (
            select * from processfines where to_char(visaexpdte, 'YYYY') < 1900
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
            flagfound := 'FOUND VISEXPDTE ERROR = ' || itemVISAEXP.tdtno  || ' birthdte = '|| to_char(itemVISAEXP.visaexpdte, 'dd/MM/yyyy');
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = itemVISAEXP.tmovsseqno;
                            
           delete processfines where tmovsseqno = itemVISAEXP.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
    END LOOP;--Loop For itemFines    
    
    <<itemEXTOVS_loop>> FOR itemEXTOVS IN
        (
            select * from processot
        )
    LOOP
        flagfound := null;
        totalrownum := totalrownum + 1; 
        
        FOR rec_tm IN (select * from processfines where tdtno = itemEXTOVS.cpassportno and count_seqno = itemEXTOVS.nation_seqno)
        LOOP
            flagfound := 'FOUND EXT OVERSTAY = ' || itemEXTOVS.cpassportno || ' nationcd = ' || itemEXTOVS.nation_seqno;
            
           insert into delprocessfines (dtmovsseqno, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, 
           nationcd, tdtcd, tdtno, visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, 
           convregno, seqno, create_by, create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, 
           flightnumber, deptcd, extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, 
           alien_seqno, processdte, processdeldte, flagdel, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte)
           select deltmoverstay_seqno.nextval, personid, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, nationcd, tdtcd, tdtno, 
           visatypecd, visaexpdte, passportdte, passportexpdte, updusr, upddte, updterm, remark, status, tm5_seqno, tm2inout_seqno, convcd, convregno, seqno, create_by, 
           create_date, update_by, update_date, version, conv_seqno, visatype_seqno, dept_seqno, count_seqno, permit_seqno, flightprefix, flightnumber, deptcd, 
           extperson_seqno, extpermitdte, extflag, chngperson_seqno, chngpermitdte, chngflag, rqsperson_seqno, rqspermitdte, rqsflag, fnperson_seqno, alien_seqno, 
           processdte, sysdate, flagfound, ovsdte, yearofdob, sexdesc, deptlevel1, deptlevel2, building, addr, road, pv_seqno, amp_seqno, 
           tmb_seqno, tel, typeaddr, lastpermitdte from processfines where tmovsseqno = rec_tm.tmovsseqno;
                            
           delete processfines where tmovsseqno = rec_tm.tmovsseqno;  
           totaldelete := totaldelete + 1;
           totalinsert := totalinsert + 1;
           commit;
        END LOOP;        
    END LOOP;--Loop For itemFines        
            
    totalrownum := totalrownum + 1;
        
    update batchlog set totalrow = totalrownum, prrow = totalrownum, totalins = totalinsert, totaldel = totaldelete, totalupd = totalupdate, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
    commit;
    
    
    DELDUP_PROCESSFINES;
    
    EXCEPTION
        WHEN others THEN
            DBMS_OUTPUT.PUT_LINE(sqlerrm||'[Re-Gen Error]');
            null;
            --prompt(sqlerrm||'[Re-Gen Error]');     
    END;
END PS_OVERSTAY_IFRIP_FINES_BL;
/
