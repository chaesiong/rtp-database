CREATE OR REPLACE EDITIONABLE FUNCTION "PIBICSDM2"."GET_RFCTMRUNNO" (v_cardtype varchar2, v_convregno varchar2, v_inoutdte varchar2, v_dept_seqno varchar2, 
                                                                                    v_efamilynm varchar2, v_efirstnm varchar2, v_emiddlenm varchar2, v_tdtno varchar2, v_countseq number) return varchar2 is 
tmp varchar2(200);
begin
   begin   
   if v_cardtype = 1 then
        if v_efamilynm is not null and v_efirstnm is not null and v_emiddlenm is not null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm = v_emiddlenm
                    union all
                    select tmrunno from tmmain
                    where to_char(indte, 'yyyymmdd') = v_inoutdte 
                    and indept_seqno = v_dept_seqno
                    and inconvregno = v_convregno
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm = v_emiddlenm       
                ) where rownum = 1;               
            elsif v_efamilynm is not null and v_efirstnm is not null and v_emiddlenm is null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm is null
                    union all
                    select tmrunno from tmmain
                    where to_char(indte, 'yyyymmdd') = v_inoutdte 
                    and indept_seqno = v_dept_seqno
                    and inconvregno = v_convregno
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm is null    
                ) where rownum = 1;                 
            elsif  v_efamilynm is not null and v_efirstnm is null and v_emiddlenm is null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm = v_efamilynm and efirstnm is null and emiddlenm is null
                    union all
                    select tmrunno from tmmain
                    where to_char(indte, 'yyyymmdd') = v_inoutdte 
                    and indept_seqno = v_dept_seqno
                    and inconvregno = v_convregno
                    and efamilynm = v_efamilynm and efirstnm is null and emiddlenm is null    
                ) where rownum = 1;            
            elsif  v_efamilynm is null and v_efirstnm is not null and v_emiddlenm is null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm is null and efirstnm = v_efirstnm and emiddlenm is null
                    union all
                    select tmrunno from tmmain
                    where to_char(indte, 'yyyymmdd') = v_inoutdte 
                    and indept_seqno = v_dept_seqno
                    and inconvregno = v_convregno
                    and efamilynm is null and efirstnm = v_efirstnm and emiddlenm is null    
                ) where rownum = 1;          
        end if;
    end if;     
    
   if v_cardtype = 2 then
        if v_efamilynm is not null and v_efirstnm is not null and v_emiddlenm is not null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm = v_emiddlenm
                    union all
                    select tmrunno from tmmain
                    where to_char(outdte, 'yyyymmdd') = v_inoutdte 
                    and outdept_seqno = v_dept_seqno
                    and outconvregno = v_convregno
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm = v_emiddlenm       
                ) where rownum = 1;               
            elsif v_efamilynm is not null and v_efirstnm is not null and v_emiddlenm is null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm is null
                    union all
                    select tmrunno from tmmain
                    where to_char(outdte, 'yyyymmdd') = v_inoutdte 
                    and outdept_seqno = v_dept_seqno
                    and outconvregno = v_convregno
                    and efamilynm = v_efamilynm and efirstnm = v_efirstnm and emiddlenm is null    
                ) where rownum = 1;                 
            elsif  v_efamilynm is not null and v_efirstnm is null and v_emiddlenm is null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm = v_efamilynm and efirstnm is null and emiddlenm is null
                    union all
                    select tmrunno from tmmain
                    where to_char(outdte, 'yyyymmdd') = v_inoutdte 
                    and outdept_seqno = v_dept_seqno
                    and outconvregno = v_convregno
                    and efamilynm = v_efamilynm and efirstnm is null and emiddlenm is null    
                ) where rownum = 1;            
            elsif  v_efamilynm is null and v_efirstnm is not null and v_emiddlenm is null then
                select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno and cardtype = v_cardtype 
                    and efamilynm is null and efirstnm = v_efirstnm and emiddlenm is null
                    union all
                    select tmrunno from tmmain
                    where to_char(outdte, 'yyyymmdd') = v_inoutdte 
                    and outdept_seqno = v_dept_seqno
                    and outconvregno = v_convregno
                    and efamilynm is null and efirstnm = v_efirstnm and emiddlenm is null    
                ) where rownum = 1;          
        end if;
    end if;     
    exception when no_data_found then 
   begin
        if v_cardtype = 1 then
            select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where tdtno = v_tdtno
                    and count_seqno = v_countseq 
                    and cardtype = v_cardtype 
                    and to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno  
                    union all
                    select tmrunno from tmmain
                    where intdtno = v_tdtno
                    and count_seqno = v_countseq 
                    and to_char(indte, 'yyyymmdd') = v_inoutdte 
                    and indept_seqno = v_dept_seqno
                    and inconvregno = v_convregno
                ) where rownum = 1;            
        end if;
        
        if v_cardtype = 2 then
            select  tmrunno into tmp from (
                    select seqno tmrunno from tminout 
                    where tdtno = v_tdtno
                    and count_seqno = v_countseq 
                    and cardtype = v_cardtype 
                    and to_char(inoutdte, 'yyyymmdd') = v_inoutdte
                    and dept_seqno = v_dept_seqno 
                    and convregno = v_convregno  
                    union all
                    select tmrunno from tmmain
                    where outtdtno = v_tdtno
                    and count_seqno = v_countseq 
                    and to_char(outdte, 'yyyymmdd') = v_inoutdte 
                    and outdept_seqno = v_dept_seqno
                    and outconvregno = v_convregno
                ) where rownum = 1;         
        end if;
    exception when others then return null;
    end;
    end;
 return tmp;
end;
/
