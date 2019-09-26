CREATE OR REPLACE EDITIONABLE PROCEDURE "PIBICSDM2"."CHK_TMWANTED" is
begin
declare
    foundwanted varchar(20);
cursor c1 is              
    select * from tmwanted where flagprocess is null and filetype = 'Sweden-77';
    rec_tm c1%rowtype;
begin
    open c1;
    loop
    fetch c1 into rec_tm; exit when c1%notfound;
    
    foundwanted := 'NOTFOUND';
   
    -- search inout
    if rec_tm.tdtno is not null and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then
        <<iitemtm_loop>> for itemtm in
            (
                select * from vw_tmonline where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd and sex = rec_tm.sex and birthdte = rec_tm.birthdte
                --select * from vw_tmonline where tdtno = rec_tm.tdtno
            )
        loop
            
            insert into winoutperson (seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, 
            tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, age, nationcd, deptcd, 
            convcd, convregno, tdtno, visatypecd, visaexpdte, credte, personid, imginout, wantedseqno) 
            values (investigate_seq.nextval, itemtm.tm6no, itemtm.inoutdate, itemtm.cardtype, itemtm.tfirstnm, itemtm.tmiddlenm, 
            itemtm.tfamilynm, itemtm.efirstnm, itemtm.emiddlenm, itemtm.efamilynm, itemtm.sex, itemtm.birthdte, 
             to_number(to_char(sysdate, 'YYYY')) - to_number(substr(itemtm.birthdte, 7)), itemtm.nationcd, itemtm.deptcd, itemtm.convcd, 
            itemtm.convregno, itemtm.tdtno, itemtm.visatypecd,  itemtm.visaexpdte, itemtm.credte, itemtm.personid, itemtm.imginout, rec_tm.seqno);

            update tmwanted set minoutpass = 'Y', minout = 'Y' where seqno = rec_tm.seqno;
            commit;
            
            foundwanted := 'FOUND';
        end loop;--Loop   
    end if;
    
    if foundwanted = 'NOTFOUND' then
        if (rec_tm.efamilynm is not null or rec_tm.efirstnm is not null or rec_tm.emiddlenm is not null) and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then    
            <<iitemtm2_loop>> for itemtm2 in
                (
                    select * from vw_tmonline 
                    where( 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efamilynm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efirstnm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efamilynm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.emiddlenm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efirstnm||'%', ' ')
                    or
                    nvl(efamilynm, ' ') like nvl(rec_tm.efirstnm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efamilynm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efirstnm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.emiddlenm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efamilynm||'%', ' ')   
                    or
                    nvl(efamilynm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efamilynm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efirstnm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efirstnm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efamilynm||'%', ' ')                                                                
                    )
                    and nationcd = rec_tm.nationcd                     
                    and birthdte = rec_tm.birthdte  and sex = rec_tm.sex
                )
            loop        
                insert into winoutperson (seqno, tm6no, inoutdte, cardtype, tfirstnm, tmiddlenm, 
                tfamilynm, efirstnm, emiddlenm, efamilynm, sex, birthdte, age, nationcd, deptcd, 
                convcd, convregno, tdtno, visatypecd, visaexpdte, credte, personid, imginout, wantedseqno) 
                values (investigate_seq.nextval, itemtm2.tm6no, itemtm2.inoutdate, itemtm2.cardtype, itemtm2.tfirstnm, 
                itemtm2.tmiddlenm, itemtm2.tfamilynm, itemtm2.efirstnm, itemtm2.emiddlenm, itemtm2.efamilynm, 
                itemtm2.sex, itemtm2.birthdte, to_number(to_char(sysdate, 'YYYY')) - to_number(substr(itemtm2.birthdte, 7)), 
                itemtm2.nationcd, itemtm2.deptcd, itemtm2.convcd, itemtm2.convregno, itemtm2.tdtno,itemtm2.visatypecd, 
                itemtm2.visaexpdte, itemtm2.credte, itemtm2.personid, itemtm2.imginout, rec_tm.seqno);

                update tmwanted set minoutname = 'Y', minout = 'Y' where seqno = rec_tm.seqno;
                commit;
                foundwanted := 'FOUND';
            end loop;--Loop  
        end if;   
    end if;
    
    
    if foundwanted = 'FOUND' then
        if rec_tm.tdtno is not null and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then
            <<iitemimm_loop>> for itemimm in
                (
                    select * from (
                        select * from immigration where tdtno = rec_tm.tdtno and nationcd = rec_tm.nationcd  and sex = rec_tm.sex and birthdte = rec_tm.birthdte and cardtype = '1' order by inoutdte desc
                        --select * from immigration where tdtno = rec_tm.tdtno and cardtype = '1' order by inoutdte desc
                    ) where rownum = 1
                )
            loop
                update tmwanted set minoutcardone = 'Y' where seqno = rec_tm.seqno;
                commit;
                foundwanted := 'FOUND';
            end loop;--Loop    
        end if; 
    end if;
    
    
    foundwanted := 'NOTFOUND';
    
    -- search ext
    if rec_tm.tdtno is not null  and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then
        <<iitemext_loop>> for itemext in
            (
                select * from ext_extensionlist where cpassportno = rec_tm.tdtno and nation_seqno = get_countseqno(rec_tm.nationcd)  and sex = rec_tm.sex and birth_date = rec_tm.birthdte and approve_sts = 'A'
                --select * from ext_extensionlist where cpassportno = rec_tm.tdtno and approve_sts = 'A'
            )
        loop
            
            insert into wextperson (extlist_seqno, ext_seqno, extperson_seqno, doc_no, reason_seqno, ext_day, passportno, 
            ext_date, tm6no, efirstnm, emiddlenm, efamilynm, sex, birth_date, birth_place, nation_seqno, in_date, 
            convregno, building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, actflag, udept_seqno, 
            cpassportno, create_by, create_date, suffix_seqno, extimg, passport_pic, wantedseqno, permit_date) 
            values (itemext.extlist_seqno, itemext.ext_seqno, itemext.extperson_seqno, itemext.doc_no, itemext.reason_seqno,
            itemext.ext_day, itemext.passportno, itemext.ext_date, itemext.tm6no, itemext.efirstnm, itemext.emiddlenm,
            itemext.efamilynm, itemext.sex, itemext.birth_date, itemext.birth_place, itemext.nation_seqno,
            itemext.in_date, itemext.convregno, itemext.building, itemext.addr, itemext.road, itemext.pv_seqno,
            itemext.amp_seqno, itemext.tmb_seqno, itemext.postcode, itemext.tel, itemext.actflag, itemext.udept_seqno,
            itemext.cpassportno, itemext.create_by, itemext.create_date, itemext.suffix_seqno, itemext.extimg,
            itemext.passport_pic, rec_tm.seqno, itemext.permit_date);

            update tmwanted set mextpass = 'Y', mext = 'Y' where seqno = rec_tm.seqno;
            commit;        
            foundwanted := 'FOUND';
        end loop;--Loop   
    end if;
    
    if foundwanted = 'NOTFOUND' then
        if (rec_tm.efamilynm is not null or rec_tm.efirstnm is not null or rec_tm.emiddlenm is not null) and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then    
            <<iitemext2_loop>> for itemext2 in
                (
                    select * from ext_extensionlist 
                    where( 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efamilynm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efirstnm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efamilynm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.emiddlenm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efirstnm||'%', ' ')
                    or
                    nvl(efamilynm, ' ') like nvl(rec_tm.efirstnm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efamilynm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efirstnm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.emiddlenm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efamilynm||'%', ' ')   
                    or
                    nvl(efamilynm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efamilynm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efirstnm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efirstnm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efamilynm||'%', ' ')                                                                
                    )
                    and nation_seqno = get_countseqno(rec_tm.nationcd) and birth_date = rec_tm.birthdte  and sex = rec_tm.sex
                )
            loop
            
                insert into wextperson (extlist_seqno, ext_seqno, extperson_seqno, doc_no, reason_seqno, ext_day, passportno, 
                ext_date, tm6no, efirstnm, emiddlenm, efamilynm, sex, birth_date, birth_place, nation_seqno, in_date, 
                convregno, building, addr, road, pv_seqno, amp_seqno, tmb_seqno, postcode, tel, actflag, udept_seqno, 
                cpassportno, create_by, create_date, suffix_seqno, extimg, passport_pic, wantedseqno) 
                values (itemext2.extlist_seqno, itemext2.ext_seqno, itemext2.extperson_seqno, itemext2.doc_no, itemext2.reason_seqno,
                itemext2.ext_day, itemext2.passportno, itemext2.ext_date, itemext2.tm6no, itemext2.efirstnm, itemext2.emiddlenm,
                itemext2.efamilynm, itemext2.sex, itemext2.birth_date, itemext2.birth_place, itemext2.nation_seqno,
                itemext2.in_date, itemext2.convregno, itemext2.building, itemext2.addr, itemext2.road, itemext2.pv_seqno,
                itemext2.amp_seqno, itemext2.tmb_seqno, itemext2.postcode, itemext2.tel, itemext2.actflag, itemext2.udept_seqno,
                itemext2.cpassportno, itemext2.create_by, itemext2.create_date, itemext2.suffix_seqno, itemext2.extimg,
                itemext2.passport_pic, rec_tm.seqno);

                update tmwanted set mextname = 'Y', mext = 'Y' where seqno = rec_tm.seqno;
                commit;
            end loop;--Loop     
        end if;
    end if;
        
    foundwanted := 'NOTFOUND';
    
    -- search fn24
    if rec_tm.tdtno is not null and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then
        <<iitemfn24_loop>> for itemfn24 in
            (
                select * from fn_alienlist where passportno = rec_tm.tdtno and count_seqno =  get_countseqno(rec_tm.nationcd)  and sex = rec_tm.sex and birthdate = rec_tm.birthdte
                --select * from fn_alienlist where passportno = rec_tm.tdtno 
            )
        loop
            
            insert into wfnalien (alien_seqno, addrn_seqno, checkindte, efirstnm, emiddlenm, 
            efamilynm, count_seqno, sex, passportno, indte, visatype_seqno, duedate, dept_seqno, 
            tm6no, pv_seqno, create_date, birthdate, addrnq_seqno, wantedseqno) 
            values (itemfn24.alien_seqno, itemfn24.addrn_seqno, itemfn24.checkindte, itemfn24.efirstnm, 
            itemfn24.emiddlenm, itemfn24.efamilynm, itemfn24.count_seqno, itemfn24.sex, itemfn24.passportno, 
            itemfn24.indte, itemfn24.visatype_seqno, itemfn24.duedate, itemfn24.dept_seqno, itemfn24.tm6no, 
            itemfn24.pv_seqno, itemfn24.create_date, itemfn24.birthdate, itemfn24.addrnq_seqno, rec_tm.seqno);

            update tmwanted set mfn24pass = 'Y', mfn24 = 'Y' where seqno = rec_tm.seqno;
            commit;        
            foundwanted := 'FOUND';
        end loop;--Loop   
    end if;
     
    if foundwanted = 'NOTFOUND' then
        if rec_tm.efamilynm is not null and rec_tm.efirstnm is not null and rec_tm.nationcd is not null and rec_tm.sex is not null and rec_tm.birthdte is not null then    
            <<iitemfn2_loop>> for itemfn2 in
                (
                    select * from fn_alienlist 
                    where( 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efamilynm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efirstnm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efamilynm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.emiddlenm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efirstnm||'%', ' ')
                    or
                    nvl(efamilynm, ' ') like nvl(rec_tm.efirstnm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efamilynm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.efirstnm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.emiddlenm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efamilynm||'%', ' ')   
                    or
                    nvl(efamilynm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efamilynm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efirstnm||'%', ' ')
                    or 
                    nvl(efamilynm, ' ') like nvl(rec_tm.emiddlenm||'%', ' ') and nvl(efirstnm, ' ')  like nvl(rec_tm.efirstnm||'%', ' ')  and nvl(emiddlenm, ' ') like nvl(rec_tm.efamilynm||'%', ' ')                                                                
                    )
                    and count_seqno = get_countseqno(rec_tm.nationcd) and birthdate = rec_tm.birthdte  and sex = rec_tm.sex                  
                )
            loop
            
                insert into wfnalien (alien_seqno, addrn_seqno, checkindte, efirstnm, emiddlenm, 
                efamilynm, count_seqno, sex, passportno, indte, visatype_seqno, duedate, dept_seqno, 
                tm6no, pv_seqno, create_date, birthdate, addrnq_seqno, wantedseqno) 
                values (itemfn2.alien_seqno, itemfn2.addrn_seqno, itemfn2.checkindte, itemfn2.efirstnm, 
                itemfn2.emiddlenm, itemfn2.efamilynm, itemfn2.count_seqno, itemfn2.sex, itemfn2.passportno, 
                itemfn2.indte, itemfn2.visatype_seqno, itemfn2.duedate, itemfn2.dept_seqno, itemfn2.tm6no, 
                itemfn2.pv_seqno, itemfn2.create_date, itemfn2.birthdate, itemfn2.addrnq_seqno, rec_tm.seqno);

                update tmwanted set mfn24name = 'Y', mfn24 = 'Y' where seqno = rec_tm.seqno;
                commit;
            end loop;--Loop     
        end if;
    end if;
           
    update tmwanted set update_date = sysdate, flagprocess  = 'Y' where seqno = rec_tm.seqno;
    
    commit;

    end loop;        
    close c1;
commit;

end;
end chk_tmwanted;
/
