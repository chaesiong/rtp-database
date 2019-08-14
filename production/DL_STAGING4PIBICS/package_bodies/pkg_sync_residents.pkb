CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_STAGING4PIBICS"."PKG_SYNC_RESIDENTS" as

  -- START: prc_sync_resident_data_bc  - procedure transfers the resident information to table dl_bordercontrol.table residence ************************************************
    procedure prc_sync_resident_data_bc is

      /*******************************************************************************
      * Author    Date        Description
      * --------  ----------  -------------------------------------------------------*
      * MLanger   20.11.2018  Initial
      *
      * Description:
      * this procedure transfers the resident information to table dl_bordercontrol.table residence
      *
      * Important Info:
      * Unfortunately, at the time of development, I did not have accurate information on how to correctly join the tables. But i tried my best. :-)
      * The identifier are 3 columns: document_no, nationality, expire_date
      *
      *******************************************************************************/

      -- Varaibales
        l_cnt number;

      -- Logger
        l_scope logger_logs.scope%TYPE := g_pkg_name || '.prc_sync_resident_data_bc';
        l_params logger.tab_param;
        -- logger.append_param(l_params, '', null);
    begin

        -- preparation
        logger.log('START', l_scope, null, l_params);


        -- Start Data transfer to dl_bordercontrol.residence
          merge into dl_bordercontrol.residence t1
            using (
                    select  *
                    from    (
                                select  nvl(a.passportno, b.passportno) as document_no
                                        , c.abbcount as nationality
                                        , nvl(a.passportexp_date, b.passportexp_date) as expire_date
                                        , a.rescerttype_seqno || '' as resident_type
                                        , a.ednqperson_seqno || '' as resident_no
                                        , nvl(a.tfirstnm, b.tfirstnm) as first_name_thai
                                        , nvl(a.tmiddlenm, b.tmiddlenm) as middle_name_thai
                                        , nvl(a.tfamilynm, b.tfamilynm) as last_name_thai
                                        , b.addr as resident_addr_l1
                                        , b.road as resident_addr_l2
                                        , null as resident_addr_l3
                                        , nvl(a.rcno_runningno, b.rcno_runnungno) || '' as endorsement_no
                                        , a.edmissue_date as endorsement_from
                                        , nvl(a.edmexp_date, b.edmexp_date) as endorsement_until
                                        , a.edmissue_by as endorsement_by
                                        , a.ednqperson_seqno || '' as residentbook_no
                                        , nvl(a.create_by, b.create_by) as created_by
                                        , nvl(a.create_date, b.create_date) as created_at
                                        , row_number() over (partition by nvl(a.passportno, b.passportno), c.abbcount, nvl(a.passportexp_date, b.passportexp_date) order by b.addr nulls last, b.road nulls last) as rn
                                from    pibicsdm2.ednq_person a
                                        left join pibicsdm2.ednq_tm13 b on a.ednqperson_seqno = b.ednqperson_seqno
                                        left join pibicsdm2.country c on a.nation_seqno = c.count_seqno
                                where   a.ednqperson_seqno is not null
                                        and nvl(a.passportno, b.passportno) is not null
                                        and c.abbcount is not null
                                        and nvl(a.passportexp_date, b.passportexp_date) is not null
                            )
                    where   rn = 1
                  )t2 on ( t1.document_no = t2.document_no and t1.nationality = t2.nationality and t1.expire_date = t2.expire_date )
            when not matched then
                insert  ( t1.document_no, t1.nationality, t1.expire_date, t1.resident_type, t1.resident_no
                          , t1.first_name_thai, t1.middle_name_thai, t1.last_name_thai, t1.resident_addr_l1, t1.resident_addr_l2
                          , t1.resident_addr_l3, t1.endorsement_no, t1.endorsement_from, t1.endorsement_until, t1.endorsement_by
                          , t1.residentbook_no, t1.created_at, t1.created_by
                        )
                values  (
                          t2.document_no, t2.nationality, t2.expire_date, t2.resident_type, t2.resident_no
                          , t2.first_name_thai, t2.middle_name_thai, t2.last_name_thai, t2.resident_addr_l1, t2.resident_addr_l2
                          , t2.resident_addr_l3, t2.endorsement_no, t2.endorsement_from, t2.endorsement_until, t2.endorsement_by
                          , t2.residentbook_no, t2.created_at, t2.created_by
                        )
            when matched then
                update set  t1.resident_type = case when nvl( t1.resident_type, '-') != nvl( t2.resident_type, '-') then t2.resident_type else t1.resident_type end
                            , t1.resident_no = case when nvl( t1.resident_no, '-') != nvl( t2.resident_no, '-') then t2.resident_no else t1.resident_no end
                            , t1.first_name_thai = case when nvl( t1.first_name_thai, '-') != nvl( t2.first_name_thai, '-') then t2.first_name_thai else t1.first_name_thai end
                            , t1.middle_name_thai = case when nvl( t1.middle_name_thai, '-') != nvl( t2.middle_name_thai, '-') then t2.middle_name_thai else t1.middle_name_thai end
                            , t1.last_name_thai = case when nvl( t1.last_name_thai, '-') != nvl( t2.last_name_thai, '-') then t2.last_name_thai else t1.last_name_thai end

                            , t1.resident_addr_l1 = case when nvl( t1.resident_addr_l1, '-') != nvl( t2.resident_addr_l1, '-') then t2.resident_addr_l1 else t1.resident_addr_l1 end
                            , t1.resident_addr_l2 = case when nvl( t1.resident_addr_l2, '-') != nvl( t2.resident_addr_l2, '-') then t2.resident_addr_l2 else t1.resident_addr_l2 end
                            , t1.resident_addr_l3 = case when nvl( t1.resident_addr_l3, '-') != nvl( t2.resident_addr_l3, '-') then t2.resident_addr_l3 else t1.resident_addr_l3 end
                            , t1.endorsement_no = case when nvl( t1.endorsement_no, '-') != nvl( t2.endorsement_no, '-') then t2.endorsement_no else t1.endorsement_no end
                            , t1.endorsement_from = case when nvl( t1.endorsement_from, sysdate) != nvl( t2.endorsement_from, sysdate) then t2.endorsement_from else t1.endorsement_from end

                            , t1.endorsement_until = case when nvl( t1.endorsement_until, sysdate) != nvl( t2.endorsement_until, sysdate) then t2.endorsement_until else t1.endorsement_until end
                            , t1.endorsement_by = case when nvl( t1.endorsement_by, '-') != nvl( t2.endorsement_by, '-') then t2.endorsement_by else t1.endorsement_by end
                            , t1.residentbook_no = case when nvl( t1.residentbook_no, '-') != nvl( t2.residentbook_no, '-') then t2.residentbook_no else t1.residentbook_no end
                            , t1.created_at = case when nvl( t1.created_at, sysdate) != nvl( t2.created_at, sysdate) then t2.created_at else t1.created_at end
                            , t1.created_by = case when nvl( t1.created_by, '-') != nvl( t2.created_by, '-') then t2.created_by else t1.created_by end
              ;
            l_cnt := sql%rowcount;
            commit;

            logger.log('INFO: ' || l_cnt || ' records in tables dl_bordercontrol.residence successfully updated. (merged)', l_scope, null, l_params);


      -- End of procedure
        logger.log('END', l_scope, null, l_params);




      -- Exception handler ******************************************************************************************************
        exception when others then
          logger.log_error('ERROR', l_scope, null, l_params);
          rollback;
          raise;


    end;
  -- END: prc_sync_resident_data_bc - procedure transfers the resident information to table dl_bordercontrol.table residence **************************************************

end;
/
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_SYNC_RESIDENTS" TO "DL_STAGING4PIBICS_INTF";
  GRANT EXECUTE ON "DL_STAGING4PIBICS"."PKG_SYNC_RESIDENTS" TO "DERMALOG_PROXY";
