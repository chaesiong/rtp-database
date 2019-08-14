CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_JSON_EXPORT_MANUAL" AS

function get_movements_jira(p_id in varchar2) return clob
        as
            l_mv_rec dl_bordercontrol.movements%rowtype;    -- Movement
            l_mv_json json;                                 -- Movement JSON
            l_mv_clob clob;                                 -- Movement JSON as clob for export
        begin
            begin
                select
                    mv.mvmntid,
                    mv.brddocid,
                    mv.landbarcd,
                    mv.exitflg,
                    mv.max_stay_dt,
                    mv.fingermatch,
                    mv.facematch,
                    mv.mvmntaddr,
                    mv.oridest,
                    mv.ins_at,
                    --translate(mv.ins_by, chr(13), ''),
                    'NUTTHAWUT.J',
                    mv.dml_at,
                    translate(mv.dml_by, chr(13), ''),
                    mv.dml_type,
                    mv.ins_terminal,
                    mv.ins_borderpost,
                    mv.refusedflg,
                    mv.observation,
                    mv.trnsprtunitid,
                    mv.person_type,
                    mv.scanned_flight,
                    mv.ps_1,
                    mv.ps_2,
                    mv.ps_3,
                    mv.ps_4,
                    mv.ps_5,
                    mv.ps_6,
                    mv.ps_7,
                    mv.ps_8,
                    mv.ps_9,
                    mv.ps_10,
                    mv.fingermatch_history,
                    mv.facematc_history,
                    mv.reason_offload,
                    mv.reason_deportee,
                    mv.visa_type,
                    mv.visa,
                    mv.is_finished,
                    mv.prior_movement,
                    mv.entry_form,
                    mv.form_no_approved,
                    mv.movement_dt,
                    mv.source_system,
                    mv.date_of_entry,
                    mv.mrzvisa
                into
                    l_mv_rec.mvmntid,
                    l_mv_rec.brddocid,
                    l_mv_rec.landbarcd,
                    l_mv_rec.exitflg,
                    l_mv_rec.max_stay_dt,
                    l_mv_rec.fingermatch,
                    l_mv_rec.facematch,
                    l_mv_rec.mvmntaddr,
                    l_mv_rec.oridest,
                    l_mv_rec.ins_at,
                    l_mv_rec.ins_by,
                    l_mv_rec.dml_at,
                    l_mv_rec.dml_by,
                    l_mv_rec.dml_type,
                    l_mv_rec.ins_terminal,
                    l_mv_rec.ins_borderpost,
                    l_mv_rec.refusedflg,
                    l_mv_rec.observation,
                    l_mv_rec.trnsprtunitid,
                    l_mv_rec.person_type,
                    l_mv_rec.scanned_flight,
                    l_mv_rec.ps_1,
                    l_mv_rec.ps_2,
                    l_mv_rec.ps_3,
                    l_mv_rec.ps_4,
                    l_mv_rec.ps_5,
                    l_mv_rec.ps_6,
                    l_mv_rec.ps_7,
                    l_mv_rec.ps_8,
                    l_mv_rec.ps_9,
                    l_mv_rec.ps_10,
                    l_mv_rec.fingermatch_history,
                    l_mv_rec.facematc_history,
                    l_mv_rec.reason_offload,
                    l_mv_rec.reason_deportee,
                    l_mv_rec.visa_type,
                    l_mv_rec.visa,
                    l_mv_rec.is_finished,
                    l_mv_rec.prior_movement,
                    l_mv_rec.entry_form,
                    l_mv_rec.form_no_approved,
                    l_mv_rec.movement_dt,
                    l_mv_rec.source_system,
                    l_mv_rec.date_of_entry,
                    l_mv_rec.mrzvisa
                from dl_bordercontrol.movements mv
                where mv.mvmntid = p_id;

            exception
              when no_data_found then
                return l_mv_clob;
            end;

            l_mv_json := json();
                l_mv_json.put( 'id'                  , l_mv_rec.mvmntid );
                l_mv_json.put( 'borderdocuments'     , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_borderdocuments( l_mv_rec.brddocid ) );
                l_mv_json.put( 'landbarCode'         , l_mv_rec.landbarcd );
                l_mv_json.put( 'exitFlag'            , l_mv_rec.exitflg );
                l_mv_json.put( 'maxStayDate'         , l_mv_rec.max_stay_dt );
                l_mv_json.put( 'fingermatch'         , l_mv_rec.fingermatch );
                l_mv_json.put( 'facematch'           , l_mv_rec.facematch );
                l_mv_json.put( 'movementAdress'      , l_mv_rec.mvmntaddr );
                l_mv_json.put( 'oriDest'             , l_mv_rec.oridest );
                l_mv_json.put( 'createdAt'           , to_char( l_mv_rec.ins_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'createdBy'           , l_mv_rec.ins_by );
                l_mv_json.put( 'lastModifiedAt'      , to_char( l_mv_rec.dml_at, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'lastModifiedBy'      , l_mv_rec.dml_by );
                l_mv_json.put( 'lastModifiedAction'  , l_mv_rec.dml_type );
                l_mv_json.put( 'terminal'            , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_terminals( l_mv_rec.ins_terminal ) );
                l_mv_json.put( 'borderpost'          , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_borderposts( l_mv_rec.ins_borderpost ) );
                l_mv_json.put( 'refusedFlag'         , l_mv_rec.refusedflg );
                l_mv_json.put( 'observation'         , l_mv_rec.observation );
                l_mv_json.put( 'transportUnitId'     , l_mv_rec.trnsprtunitid );
                l_mv_json.put( 'personType'          , l_mv_rec.person_type );
                l_mv_json.put( 'scannedFlight'       , l_mv_rec.scanned_flight );
                l_mv_json.put( 'ps1'                 , l_mv_rec.ps_1 );
                l_mv_json.put( 'ps2'                 , l_mv_rec.ps_2 );
                l_mv_json.put( 'ps3'                 , l_mv_rec.ps_3 );
                l_mv_json.put( 'ps4'                 , l_mv_rec.ps_4 );
                l_mv_json.put( 'ps5'                 , l_mv_rec.ps_5 );
                l_mv_json.put( 'ps6'                 , l_mv_rec.ps_6 );
                l_mv_json.put( 'ps7'                 , l_mv_rec.ps_7 );
                l_mv_json.put( 'ps8'                 , l_mv_rec.ps_8 );
                l_mv_json.put( 'ps9'                 , l_mv_rec.ps_9 );
                l_mv_json.put( 'ps10'                , l_mv_rec.ps_10 );
                l_mv_json.put( 'fingermatchHistory'  , l_mv_rec.fingermatch_history );
                l_mv_json.put( 'facematchHistory'    , l_mv_rec.facematc_history );
                l_mv_json.put( 'reasonOffload'       , l_mv_rec.reason_offload );
                l_mv_json.put( 'reasonDeportee'      , l_mv_rec.reason_deportee );
                l_mv_json.put( 'visaType'            , dl_common.pkg_json_export.get_visa_type( l_mv_rec.visa_type ) );
                l_mv_json.put( 'visa'                , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_visas( l_mv_rec.visa ) );
                l_mv_json.put( 'isFinishedFlag'      , l_mv_rec.is_finished );
                l_mv_json.put( 'priorMovementId'     , l_mv_rec.prior_movement );
                l_mv_json.put( 'entryForm'           , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_entry_forms( l_mv_rec.entry_form ) );
                l_mv_json.put( 'entryFormNoApproved' , l_mv_rec.form_no_approved );
                l_mv_json.put( 'movementDate'        , to_char( l_mv_rec.movement_dt, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'sourceSystem'        , l_mv_rec.source_system );
                l_mv_json.put( 'dateOfEntry'         , to_char( l_mv_rec.date_of_entry, 'dd.mm.yyyy hh24:mi:ss' ) );
                l_mv_json.put( 'mrzVisa'             , l_mv_rec.mrzvisa );
                l_mv_json.put( 'movementImages'      , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_movements_blob( l_mv_rec.mvmntid ) );
                l_mv_json.put( 'collectivePassports' , DL_BORDERCONTROL.PKG_JSON_EXPORT.get_movement_fellow_passenger( l_mv_rec.mvmntid ) );

            dbms_lob.createtemporary( l_mv_clob, true );
            l_mv_json.to_clob( l_mv_clob );

            return l_mv_clob;
        end;

END PKG_JSON_EXPORT_MANUAL;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_JSON_EXPORT_MANUAL" TO "DL_INTERFACE";
