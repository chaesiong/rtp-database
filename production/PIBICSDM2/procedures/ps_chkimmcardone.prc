CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."PS_CHKIMMCARDONE" (v_sdate in varchar2, v_edate in varchar2, v_nation varchar2) is
--tmpvar number;
begin declare
    totalrownum number(20);
    commitrow number(20);
    totalrowins number(20);
    totalcount number(20);
    batchlogno_seq number(20);
    foundtmonline varchar(8);
    foundimm varchar(8);
    --file_ut UTL_FILE.FILE_TYPE;
    
    cursor c1 is
    
        select * from immigration where
        to_char(inoutdte, 'yyyymmdd') between v_sdate and v_edate   
        and cardtype like '1%'
        and nationcd like v_nation||'%';
    
    rec_imm c1%rowtype;    
    begin
    
        totalrownum := 0;
        commitrow := 0;
        totalcount := 0;
        totalrowins := 0;
                
        
        delete travelinvestigate;
        commit;
        
        select COUNT('X') into totalcount 
        from immigration 
        where to_char(inoutdte, 'yyyymmdd') between v_sdate and v_edate 
        and cardtype like '1%' 
        and nationcd like v_nation||'%';
        
        batchlogno_seq := batchlog_seq.nextval;
        
        insert into batchlog (batchlogno, batch_src, file_type, file_name, file_size, totalrow, prrow, errrow, 
        startprocess, endprocess, status, creusr, credte, tfstatus, totalins, totalupd, totaldel, transferdte) 
        values (
            batchlogno_seq, 'IMM', '99', 'PS_CHKIMMCARDONE', null, totalcount, 0, 0, sysdate, null, '1', 
            'PILL001', sysdate, 'N', 0, 0, 0, sysdate
        );
        commit;

        open c1;
        loop fetch c1 into rec_imm; exit when c1%notfound;
            
            foundtmonline := 'NOTFOUND';
            foundimm := 'NOTFOUND';
                  
            for rec_tmonline in (
                select * from (
                    select * from vw_tmonline 
                    where tdtno = rec_imm.tdtno and nationcd = rec_imm.nationcd 
                    and to_char(inoutdate, 'YYYYMMDD') between v_sdate and to_char(sysdate, 'YYYYMMDD')
                    and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI'))  >  to_number(to_char(rec_imm.inoutdte, 'YYYYMMDDHH24MI'))
                    order by inoutdate desc
                ) where rownum = 1
            ) 
            loop
                foundtmonline := 'FOUND';
                if rec_tmonline.cardtype = '1' then
                    insert into travelinvestigate (
                        investigateseq, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, 
                        nationenm, cardtype, inoutdte, convregno, depttnm, visa,  age, visaexp, inoutdatetime, 
                        nationcd, amount, addr, typedata, deptcd, inoutdate, cnt, wlcd, wlcd_docno, 
                        wlcd_nationcd, wlcd_credte, creusr, remark, credte, wlcd_reasoncd, visatype_seqno, 
                        action, lastinoutdte, chkuser, nation_seqno, visaexpdte, dept_seqno, flagprocess                
                    ) values (
                        matchtravel_seqno.nextval, null, rec_tmonline.tm6no, rec_tmonline.tdtno, rec_tmonline.efamilynm, 
                        rec_tmonline.efirstnm, rec_tmonline.emiddlenm, rec_tmonline.sex, rec_tmonline.birthdte, null, 
                        rec_tmonline.cardtype, null, rec_tmonline.convregno, null, null, get_cal_age(rec_tmonline.birthdte), 
                        null, null, rec_tmonline.nationcd, null, null, null, rec_tmonline.deptcd, rec_tmonline.inoutdate, null, 
                        null, null, null, null, rec_tmonline.creusr, rec_tmonline.remark, rec_tmonline.credte, null, 
                        rec_tmonline.visatype_seqno, null, null, null, rec_tmonline.count_seqno, rec_tmonline.visaexpdte, 
                        rec_tmonline.dept_seqno, 'PASSNATION'
                    );
                    foundimm := 'FOUND';
                    totalrowins := totalrowins + 1;
                else
                    foundimm := 'FOUND';                                  
                end if;
            end loop;
            
            if foundtmonline = 'NOTFOUND' then 
                for rec_tmonline in (
                    select * from (
                    select * from vw_tmonline 
                    where tm6no = rec_imm.tm6no 
                    and efamilynm||efirstnm||emiddlenm = rec_imm.efamilynm||rec_imm.efirstnm||rec_imm.emiddlenm
                    and birthdte = rec_imm.birthdte
                    and to_char(inoutdate, 'YYYYMMDD') between v_sdate and to_char(sysdate, 'YYYYMMDD')
                    and to_number(to_char(inoutdate, 'YYYYMMDDHH24MI'))  >  to_number(to_char(rec_imm.inoutdte, 'YYYYMMDDHH24MI'))
                    and nationcd <> 'T03' order by inoutdate desc
                    ) where rownum = 1
                ) 
                loop
                foundtmonline := 'FOUND';
                    if rec_tmonline.cardtype = '1' then
                        insert into travelinvestigate (
                            investigateseq, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, 
                            nationenm, cardtype, inoutdte, convregno, depttnm, visa,  age, visaexp, inoutdatetime, 
                            nationcd, amount, addr, typedata, deptcd, inoutdate, cnt, wlcd, wlcd_docno, 
                            wlcd_nationcd, wlcd_credte, creusr, remark, credte, wlcd_reasoncd, visatype_seqno, 
                            action, lastinoutdte, chkuser, nation_seqno, visaexpdte, dept_seqno, flagprocess                        
                        ) values (
                            matchtravel_seqno.nextval, null, rec_tmonline.tm6no, rec_tmonline.tdtno, rec_tmonline.efamilynm, 
                            rec_tmonline.efirstnm, rec_tmonline.emiddlenm, rec_tmonline.sex, rec_tmonline.birthdte, null, 
                            rec_tmonline.cardtype, null, rec_tmonline.convregno, null, null, get_cal_age(rec_tmonline.birthdte), 
                            null, null, rec_tmonline.nationcd, null, null, null, rec_tmonline.deptcd, rec_tmonline.inoutdate, null, 
                            null, null, null, null, rec_tmonline.creusr, rec_tmonline.remark, rec_tmonline.credte, null, 
                            rec_tmonline.visatype_seqno, null, null, null, rec_tmonline.count_seqno, rec_tmonline.visaexpdte, 
                            rec_tmonline.dept_seqno, 'TM6NAMEDOB'
                        );
                        foundimm := 'FOUND';
                        totalrowins := totalrowins + 1;
                    else                 
                        foundimm := 'FOUND';                                
                    end if;
                end loop;
            end if;
            
        if foundimm = 'NOTFOUND' then
            insert into travelinvestigate (
                investigateseq, seq, tm6no, tdtno, efamilynm, efirstnm, emiddlenm, sex, birthdte, 
                nationenm, cardtype, inoutdte, convregno, depttnm, visa,  age, visaexp, inoutdatetime, 
                nationcd, amount, addr, typedata, deptcd, inoutdate, cnt, wlcd, wlcd_docno, 
                wlcd_nationcd, wlcd_credte, creusr, remark, credte, wlcd_reasoncd, visatype_seqno, 
                action, lastinoutdte, chkuser, nation_seqno, visaexpdte, dept_seqno, flagprocess                        
            ) values (
                matchtravel_seqno.nextval, null, rec_imm.tm6no, rec_imm.tdtno, rec_imm.efamilynm, 
                rec_imm.efirstnm, rec_imm.emiddlenm, rec_imm.sex, rec_imm.birthdte, null, 
                rec_imm.cardtype, null, rec_imm.convregno, null, null, get_cal_age(rec_imm.birthdte), 
                null, null, rec_imm.nationcd, null, null, null, rec_imm.deptcd, rec_imm.inoutdte, null,   
                null, null, null, null, rec_imm.updusr, rec_imm.remark, rec_imm.upddte, null, 
                rec_imm.visatype_seqno, null, null, null, rec_imm.count_seqno, rec_imm.visaexpdte, 
                rec_imm.dept_seqno, 'IMMIGRATION'
            ); 
            totalrowins := totalrowins + 1;
        end if;
         
        totalrownum := totalrownum + 1;
        commitrow := commitrow + 1;
        if commitrow = 1000 then
            update batchlog set prrow = prrow + commitrow, totalins = totalrowins where batchlogno = batchlogno_seq;
            commit;
            commitrow := 0;
        end if;
        
        end loop;
        close c1;
        
        update batchlog set prrow = totalrownum, totalins= totalrowins, endprocess = sysdate, status = '0', tfstatus = 'Y' where batchlogno = batchlogno_seq;
        commit;
   
    end;
end ps_chkimmcardone;
/
