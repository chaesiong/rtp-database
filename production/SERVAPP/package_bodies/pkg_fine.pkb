CREATE OR REPLACE EDITIONABLE PACKAGE BODY "SERVAPP"."PKG_FINE" AS

  PROCEDURE SP_FINE(
      P_DATA IN CLOB,
      P_SEQNO OUT varchar2 ) AS
  json_obj json := json ();
  l_obj json_object_t;
  l_obj_recordinfo json_object_t;
  l_obj_headerinfo json_object_t;
  l_temp_obj1 json_object_t;
  l_temp_obj2 json_object_t;
  l_temp_arr json_array_t;
  c_data clob;
  

  v_system_code varchar2(200);
  v_module varchar2(20);
  v_error_code varchar2(200);
  v_error_message varchar2(200);
  
  l_fines_rec    servapp.mscs_fs_fines%ROWTYPE;
  l_finesdetail_rec    servapp.mscs_fs_finesdetail%ROWTYPE;
  v_check_finedetail varchar2(5000);
  BEGIN
   c_data := P_DATA;
   l_obj := JSON_OBJECT_T(c_data);
   l_obj_recordinfo :=l_obj.get_object('recordInfo'); 
   l_obj_headerinfo :=l_obj.get_object('headerInfo'); 
   l_fines_rec.sliptype := l_obj_recordinfo.get_string('SLIPTYPE');
   l_fines_rec.update_ip := l_obj_headerinfo.get_string('ipClient');
   l_fines_rec.dept_seqno := l_obj_recordinfo.get_string('DEPT_SEQNO');
   l_fines_rec.update_by := l_obj_headerinfo.get_string('userId');
   l_fines_rec.fines_seqno :=l_obj_recordinfo.get_string('FINES_SEQNO');
   
   if l_fines_rec.fines_seqno is null  then
       begin
         
         if l_fines_rec.sliptype ='A' then
            SELECT MAXSLIPNO,MAXSLIPBOOKNO  
            INTO l_fines_rec.fineslipno,l_fines_rec.fineslipbookno 
            FROM MSCS_FS_SETTINGFINESLIP
            WHERE DEPT_SEQNO=l_fines_rec.dept_seqno AND IPADDRESS=l_fines_rec.update_ip AND ROWNUM=1;
         else
         l_fines_rec.fineslipno :=l_obj_recordinfo.get_string('FINESLIPNO');
         l_fines_rec.fineslipbookno :=l_obj_recordinfo.get_string('FINESLIPBOOKNO');
         end if;
         
         l_fines_rec.fines_seqno := FINES_SEQNO.NEXTVAL;
        exception   
        when no_data_found then
            v_error_code := 'E0006';
            RAISE_APPLICATION_ERROR(-20000, 'SYSERROR-E0006');
        end;
  else
     SELECT FINESLIPNO,FINESLIPBOOKNO  
            INTO l_fines_rec.fineslipno,l_fines_rec.fineslipbookno 
            FROM MSCS_FS_FINES
            WHERE FINES_SEQNO=l_fines_rec.fines_seqno; 
  end if;   
  
  --///////////////////////////Get Data////////////////////////////////////////////////
l_fines_rec.finesno   :=  l_obj_recordinfo.get_string('FINESNO');
l_fines_rec.fineslipdate   :=  to_date(l_obj_recordinfo.get_string('FINESLIPDATE'),'dd/mm/yyyy');
l_fines_rec.printflag   :=  l_obj_recordinfo.get_string('PRINTFLAG');
l_fines_rec.fineslipamount   :=  l_obj_recordinfo.get_string('FINESLIPAMOUNT');
l_fines_rec.chargedof   :=  l_obj_recordinfo.get_string('CHARGEDOF');
l_fines_rec.chargeno   :=  l_obj_recordinfo.get_string('CHARGENO');
l_fines_rec.passportno   :=  l_obj_recordinfo.get_string('PASSPORTNO');
l_fines_rec.tm6no   :=  l_obj_recordinfo.get_string('TM6NO');
l_fines_rec.efirstnm   :=  l_obj_recordinfo.get_string('EFIRSTNM');
l_fines_rec.emiddlenm   :=  l_obj_recordinfo.get_string('EMIDDLENM');
l_fines_rec.efamilynm   :=  l_obj_recordinfo.get_string('EFAMILYNM');
l_fines_rec.sex   :=  l_obj_recordinfo.get_string('SEX');
l_fines_rec.birthdte   :=  l_obj_recordinfo.get_string('BIRTHDTE');
l_fines_rec.nation_seqno   :=  l_obj_recordinfo.get_string('NATION_SEQNO');
l_fines_rec.conv_seqno   :=  l_obj_recordinfo.get_string('CONV_SEQNO');
l_fines_rec.convregno   :=  l_obj_recordinfo.get_string('CONVREGNO');
l_fines_rec.indte   := to_date(l_obj_recordinfo.get_string('INDTE'),'dd/mm/yyyy');
l_fines_rec.visatype_seqno   :=  l_obj_recordinfo.get_string('VISATYPE_SEQNO');
l_fines_rec.visaexpdte   :=  to_date(l_obj_recordinfo.get_string('VISAEXPDTE'),'dd/mm/yyyy');
l_fines_rec.outdte   :=  to_date(l_obj_recordinfo.get_string('OUTDTE'),'dd/mm/yyyy');
l_fines_rec.finestatus   :=  l_obj_recordinfo.get_string('FINESTATUS');
l_fines_rec.finesremark   :=  l_obj_recordinfo.get_string('FINESREMARK');
l_fines_rec.flag_system   :=  l_obj_recordinfo.get_string('FLAG_SYSTEM');
l_fines_rec.create_by   :=  l_obj_headerinfo.get_string('userId');
l_fines_rec.create_date   :=  sysdate;
l_fines_rec.create_ip   :=  l_obj_headerinfo.get_string('ipClient');
l_fines_rec.update_by   :=  l_obj_headerinfo.get_string('userId');
l_fines_rec.update_date   :=  sysdate;
l_fines_rec.update_ip   :=  l_obj_headerinfo.get_string('ipClient');
l_fines_rec.version   :=  l_obj_recordinfo.get_string('VERSION');
l_fines_rec.permit_seqno   :=  l_obj_recordinfo.get_string('PERMIT_SEQNO');
l_fines_rec.permit_date   :=  to_date(l_obj_recordinfo.get_string('PERMIT_DATE'),'dd/mm/yyyy');
l_fines_rec.sliptype   :=  l_obj_recordinfo.get_string('SLIPTYPE');
l_fines_rec.suffix_seqno   :=  l_obj_recordinfo.get_string('SUFFIX_SEQNO');
l_fines_rec.tfamilynm   :=  l_obj_recordinfo.get_string('TFAMILYNM');
l_fines_rec.tfirstnm   :=  l_obj_recordinfo.get_string('TFIRSTNM');
l_fines_rec.staff_seqno   :=  l_obj_recordinfo.get_string('STAFF_SEQNO');

  --///////////////////////////////////////////////////////////////////////////////////
  merge into MSCS_FS_FINES t
  using (
         select l_fines_rec.fines_seqno as fines_seqno from dual
  ) s
  on (t.fines_seqno =s.fines_seqno)
  when matched then update set
     t.finesno   =   l_fines_rec.finesno
    ,t.fineslipno   =   l_fines_rec.fineslipno
    ,t.fineslipbookno   =   l_fines_rec.fineslipbookno
    ,t.fineslipdate   =   l_fines_rec.fineslipdate
    ,t.printflag   =   l_fines_rec.printflag
    ,t.fineslipamount   =   l_fines_rec.fineslipamount
    ,t.chargedof   =   l_fines_rec.chargedof
    ,t.chargeno   =   l_fines_rec.chargeno
    ,t.dept_seqno   =   l_fines_rec.dept_seqno
    ,t.passportno   =   l_fines_rec.passportno
    ,t.tm6no   =   l_fines_rec.tm6no
    ,t.efirstnm   =   l_fines_rec.efirstnm
    ,t.emiddlenm   =   l_fines_rec.emiddlenm
    ,t.efamilynm   =   l_fines_rec.efamilynm
    ,t.sex   =   l_fines_rec.sex
    ,t.birthdte   =   l_fines_rec.birthdte
    ,t.nation_seqno   =   l_fines_rec.nation_seqno
    ,t.conv_seqno   =   l_fines_rec.conv_seqno
    ,t.convregno   =   l_fines_rec.convregno
    ,t.indte   =   l_fines_rec.indte
    ,t.visatype_seqno   =   l_fines_rec.visatype_seqno
    ,t.visaexpdte   =   l_fines_rec.visaexpdte
    ,t.outdte   =   l_fines_rec.outdte
    ,t.finestatus   =   l_fines_rec.finestatus
    ,t.finesremark   =   l_fines_rec.finesremark
    ,t.flag_system   =   l_fines_rec.flag_system
    ,t.update_by   =   l_fines_rec.update_by
    ,t.update_date   =   l_fines_rec.update_date
    ,t.update_ip   =   l_fines_rec.update_ip
    ,t.version   =   l_fines_rec.version
    ,t.permit_seqno   =   l_fines_rec.permit_seqno
    ,t.permit_date   =   l_fines_rec.permit_date
    ,t.sliptype   =   l_fines_rec.sliptype
    ,t.suffix_seqno   =   l_fines_rec.suffix_seqno
    ,t.tfamilynm   =   l_fines_rec.tfamilynm
    ,t.tfirstnm   =   l_fines_rec.tfirstnm
    ,t.staff_seqno   =   l_fines_rec.staff_seqno
    when not matched then insert
    ( t.fines_seqno
    ,t.finesno
    ,t.fineslipno
    ,t.fineslipbookno
    ,t.fineslipdate
    ,t.printflag
    ,t.fineslipamount
    ,t.chargedof
    ,t.chargeno
    ,t.dept_seqno
    ,t.passportno
    ,t.tm6no
    ,t.efirstnm
    ,t.emiddlenm
    ,t.efamilynm
    ,t.sex
    ,t.birthdte
    ,t.nation_seqno
    ,t.conv_seqno
    ,t.convregno
    ,t.indte
    ,t.visatype_seqno
    ,t.visaexpdte
    ,t.outdte
    ,t.finestatus
    ,t.finesremark
    ,t.flag_system
    ,t.create_by
    ,t.create_date
    ,t.create_ip
    ,t.update_by
    ,t.update_date
    ,t.update_ip
    ,t.version
    ,t.permit_seqno
    ,t.permit_date
    ,t.sliptype
    ,t.suffix_seqno
    ,t.tfamilynm
    ,t.tfirstnm
    ,t.staff_seqno)
    values(
     l_fines_rec.fines_seqno
        ,l_fines_rec.finesno
        ,l_fines_rec.fineslipno
        ,l_fines_rec.fineslipbookno
        ,l_fines_rec.fineslipdate
        ,l_fines_rec.printflag
        ,l_fines_rec.fineslipamount
        ,l_fines_rec.chargedof
        ,l_fines_rec.chargeno
        ,l_fines_rec.dept_seqno
        ,l_fines_rec.passportno
        ,l_fines_rec.tm6no
        ,l_fines_rec.efirstnm
        ,l_fines_rec.emiddlenm
        ,l_fines_rec.efamilynm
        ,l_fines_rec.sex
        ,l_fines_rec.birthdte
        ,l_fines_rec.nation_seqno
        ,l_fines_rec.conv_seqno
        ,l_fines_rec.convregno
        ,l_fines_rec.indte
        ,l_fines_rec.visatype_seqno
        ,l_fines_rec.visaexpdte
        ,l_fines_rec.outdte
        ,l_fines_rec.finestatus
        ,l_fines_rec.finesremark
        ,l_fines_rec.flag_system
        ,l_fines_rec.create_by
        ,l_fines_rec.create_date
        ,l_fines_rec.create_ip
        ,l_fines_rec.update_by
        ,l_fines_rec.update_date
        ,l_fines_rec.update_ip
        ,l_fines_rec.version
        ,l_fines_rec.permit_seqno
        ,l_fines_rec.permit_date
        ,l_fines_rec.sliptype
        ,l_fines_rec.suffix_seqno
        ,l_fines_rec.tfamilynm
        ,l_fines_rec.tfirstnm
        ,l_fines_rec.staff_seqno
    );

   l_temp_arr := l_obj.get_array('finesDetail');
    FOR i IN 0 .. l_temp_arr.get_size - 1 LOOP
    
         l_temp_obj1 := TREAT(l_temp_arr.get(i) AS JSON_OBJECT_T);
         l_finesdetail_rec.finesdetail_seqno  :=  l_temp_obj1.get_string('FINESDETAIL_SEQNO');
        if l_finesdetail_rec.finesdetail_seqno is null then
            l_finesdetail_rec.finesdetail_seqno := FINESDETAIL_SEQNO.NEXTVAL;
        end if;
        
        l_finesdetail_rec.fines_seqno  :=  l_fines_rec.fines_seqno;
        l_finesdetail_rec.prate_seqno  :=  l_temp_obj1.get_string('PRATE_SEQNO');
        l_finesdetail_rec.fineslipamount  :=  l_temp_obj1.get_string('FINESLIPAMOUNT');
        l_finesdetail_rec.overstayday  :=  l_temp_obj1.get_string('OVERSTAYDAY');
        l_finesdetail_rec.create_by  := l_fines_rec.create_by;
        l_finesdetail_rec.create_date  := sysdate;
        l_finesdetail_rec.create_ip  :=  l_fines_rec.update_ip;
        l_finesdetail_rec.update_by  :=  l_fines_rec.update_by;
        l_finesdetail_rec.update_date  := sysdate;
        l_finesdetail_rec.update_ip  :=  l_fines_rec.update_ip;
        l_finesdetail_rec.VERSION  :=  l_temp_obj1.get_string('VERSION');
       
        if v_check_finedetail is null then 
          v_check_finedetail := v_check_finedetail || ''||l_finesdetail_rec.finesdetail_seqno||'';
          else
          v_check_finedetail := v_check_finedetail || ','||l_finesdetail_rec.finesdetail_seqno||'';
        end if;
     
     merge into  MSCS_FS_FINESDETAIL t
     using (
         select l_finesdetail_rec.finesdetail_seqno as finesdetail_seqno
         ,l_finesdetail_rec.fines_seqno as fines_seqno
         from dual
     ) s
     on (t.finesdetail_seqno =s.finesdetail_seqno and t.fines_seqno =s.fines_seqno)
     when matched then update set
     t.prate_seqno =l_finesdetail_rec.prate_seqno
     ,t.fineslipamount =l_finesdetail_rec.fineslipamount
     ,t.overstayday =l_finesdetail_rec.overstayday
     ,t.update_by =l_finesdetail_rec.update_by
     ,t.update_date =l_finesdetail_rec.update_date
     ,t.update_ip =l_finesdetail_rec.update_ip
     ,t.version =l_finesdetail_rec.version
     when not matched then insert
     (
        t.finesdetail_seqno
        ,t.fines_seqno
        ,t.prate_seqno
        ,t.fineslipamount
        ,t.overstayday
        ,t.create_by
        ,t.create_date
        ,t.create_ip
        ,t.update_by
        ,t.update_date
        ,t.update_ip
        ,t.version
     )
     values
     (
         l_finesdetail_rec.finesdetail_seqno
        ,l_finesdetail_rec.fines_seqno
        ,l_finesdetail_rec.prate_seqno
        ,l_finesdetail_rec.fineslipamount
        ,l_finesdetail_rec.overstayday
        ,l_finesdetail_rec.create_by
        ,l_finesdetail_rec.create_date
        ,l_finesdetail_rec.create_ip
        ,l_finesdetail_rec.update_by
        ,l_finesdetail_rec.update_date
        ,l_finesdetail_rec.update_ip
        ,l_finesdetail_rec.version
     );
   END LOOP;
   
   delete from MSCS_FS_FINESDETAIL a
   where a.fines_seqno =l_fines_rec.fines_seqno and not EXISTS(
   select *
    from ( SELECT regexp_substr(v_check_finedetail, '[^,]+', 1, LEVEL) as req_id
     FROM   dual
     CONNECT BY regexp_substr(v_check_finedetail, '[^,]+', 1, LEVEL) IS NOT NULL
     ) b where a.finesdetail_seqno =b.req_id
   );
   
   -- UPDATE FINESLIPTOTAL
    UPDATE MSCS_FS_FINESDETAIL 
    SET FINESLIPAMOUNT =(case when PRATE_SEQNO =15 then (case when FINESLIPAMOUNT >20000 then 20000 else FINESLIPAMOUNT end)
                         else  FINESLIPAMOUNT end)
    WHERE FINES_SEQNO=l_fines_rec.fines_seqno;
    
UPDATE MSCS_FS_FINES SET FINESLIPAMOUNT =(SELECT SUM(FINESLIPAMOUNT) FROM MSCS_FS_FINESDETAIL 
                                          WHERE FINES_SEQNO=l_fines_rec.fines_seqno) 
WHERE FINES_SEQNO=l_fines_rec.fines_seqno;

-- IN CASE AUTO SLIP
IF l_fines_rec.sliptype='A' THEN
-- UPDATE SLIPNUM & RUNNING
UPDATE MSCS_FS_SETTINGFINESLIP f 
SET f.SLIPNUM = to_number(f.SLIPNUM)-1 
,f.MAXSLIPNO =to_number(f.MAXSLIPNO)+1
,update_date =l_fines_rec.update_date
,update_by =l_fines_rec.update_by
WHERE DEPT_SEQNO=l_fines_rec.dept_seqno AND IPADDRESS=l_fines_rec.update_ip;
END IF;

  P_SEQNO := l_fines_rec.fines_seqno;
  EXCEPTION 
    WHEN OTHERS THEN ROLLBACK;
  v_error_message:=SQLERRM;
  if v_error_code is not null then
  SELECT FN_GET_ERROR_MESSAGE(v_error_code,v_error_message) INTO v_error_message FROM DUAL;
  end if;
  RAISE_APPLICATION_ERROR(-20000, v_error_message);
  END SP_FINE;

END PKG_FINE;
/
  GRANT EXECUTE ON "SERVAPP"."PKG_FINE" TO "BIOSAADM";
