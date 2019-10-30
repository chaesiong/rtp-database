CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BLACKLIST"."PKG_DL_PLUGIN_AJAX" AS

  FUNCTION process_ajax_item_request(p_item IN apex_plugin.T_PAGE_ITEM, p_plugin IN apex_plugin.T_PLUGIN)
    RETURN apex_plugin.T_PAGE_ITEM_AJAX_RESULT IS

    v_Result       apex_plugin.T_PAGE_ITEM_AJAX_RESULT;

    v_APP_AJAX_X01 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X02 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X03 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X04 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X05 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X10 VARCHAR2(32767 CHAR);
    vc_VALUE       VARCHAR2(32767 CHAR);

    l_offset       PLS_INTEGER := 1;
    l_chunk_sz     PLS_INTEGER := 8000;

    cl_JSON        CLOB;
    cl_JSON_DATA   CLOB;
    cl_IMAGE_DATA  CLOB;
    cl_IMAGE_BIN   BLOB;

    ot_JSON        JSON;
    ot_JSON_LIST   JSON_LIST;

    v_SEQ_ID       INTEGER;
    v_Count        INTEGER;
    v_is_send      BOOLEAN := FALSE;
    --
    --
    PROCEDURE L_Finally IS
      BEGIN
        IF (DBMS_LOB.istemporary(cl_JSON) != 0) THEN DBMS_LOB.freetemporary(cl_JSON); END IF;
        cl_JSON := NULL;
        IF (DBMS_LOB.istemporary(cl_JSON_DATA) != 0) THEN DBMS_LOB.freetemporary(cl_JSON_DATA); END IF;
        cl_JSON_DATA := NULL;
        IF (DBMS_LOB.istemporary(cl_IMAGE_DATA) != 0) THEN DBMS_LOB.freetemporary(cl_IMAGE_DATA); END IF;
        cl_IMAGE_DATA := NULL;
        ot_JSON := NULL;
        ot_JSON_LIST := NULL;
      END L_Finally;
    --
    --
    BEGIN
      --
      v_APP_AJAX_X01 := v('APP_AJAX_X01'); -- 'FINGERPRINTS';
      v_APP_AJAX_X02 := v('APP_AJAX_X02'); -- 'POST';
      v_APP_AJAX_X03 := v('APP_AJAX_X03'); -- '{id}';
      v_APP_AJAX_X04 := v('APP_AJAX_X04'); -- '';
      v_APP_AJAX_X05 := v('APP_AJAX_X05'); -- '';
      v_APP_AJAX_X10 := v('APP_AJAX_X10'); -- '';
      --
      /*
      -- Cluedke Test wg Bug Collections Unique Constraint violated, 24.10.2017
      IF NOT APEX_COLLECTION.collection_exists(p_collection_name => v_APP_AJAX_X01)
      THEN
        APEX_COLLECTION.create_or_truncate_collection(p_collection_name => v_APP_AJAX_X01);
      END IF;
      */
      --
      BEGIN
        --
        IF v_APP_AJAX_X02 = 'GET'
        THEN
          IF v_APP_AJAX_X03 IS NOT NULL AND v_APP_AJAX_X04 IS NULL AND v_APP_AJAX_X05 IS NULL
          THEN -- Load Single Object
            FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = v_APP_AJAX_X01 AND seq_id = v_APP_AJAX_X03)
            LOOP
              cl_JSON := '{ "CLOB001": ' || R0.clob001 || '}';

              ot_JSON := json(cl_JSON);

              ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
              ot_JSON.put('SEQ_ID', R0.seq_id);

              ot_JSON.put('C001', R0.c001);
              ot_JSON.put('C002', R0.c002);
              ot_JSON.put('C003', R0.c003);
              ot_JSON.put('C004', R0.c004);
              ot_JSON.put('C005', R0.c005);
              ot_JSON.put('C006', R0.c006);
              ot_JSON.put('C007', R0.c007);
              ot_JSON.put('C008', R0.c008);
              ot_JSON.put('C009', R0.c009);
              ot_JSON.put('C010', R0.c010);

              ot_JSON.put('C011', R0.c011);
              ot_JSON.put('C012', R0.c012);
              ot_JSON.put('C013', R0.c013);
              ot_JSON.put('C014', R0.c014);
              ot_JSON.put('C015', R0.c015);
              ot_JSON.put('C016', R0.c016);
              ot_JSON.put('C017', R0.c017);
              ot_JSON.put('C018', R0.c018);
              ot_JSON.put('C019', R0.c019);
              ot_JSON.put('C020', R0.c020);

              ot_JSON.put('C021', R0.c021);
              ot_JSON.put('C022', R0.c022);
              ot_JSON.put('C023', R0.c023);
              ot_JSON.put('C024', R0.c024);
              ot_JSON.put('C025', R0.c025);
              ot_JSON.put('C026', R0.c026);
              ot_JSON.put('C027', R0.c027);
              ot_JSON.put('C028', R0.c028);
              ot_JSON.put('C029', R0.c029);
              ot_JSON.put('C030', R0.c030);

              ot_JSON.put('C031', R0.c031);
              ot_JSON.put('C032', R0.c032);
              ot_JSON.put('C033', R0.c033);
              ot_JSON.put('C034', R0.c034);
              ot_JSON.put('C035', R0.c035);
              ot_JSON.put('C036', R0.c036);
              ot_JSON.put('C037', R0.c037);
              ot_JSON.put('C038', R0.c038);
              ot_JSON.put('C039', R0.c039);

              ot_JSON.put('C040', R0.c040);
              ot_JSON.put('C041', R0.c041);
              ot_JSON.put('C042', R0.c042);
              ot_JSON.put('C043', R0.c043);
              ot_JSON.put('C044', R0.c044);
              ot_JSON.put('C045', R0.c045);
              ot_JSON.put('C046', R0.c046);
              ot_JSON.put('C047', R0.c047);
              ot_JSON.put('C048', R0.c048);
              ot_JSON.put('C049', R0.c049);
              ot_JSON.put('C050', R0.c050);

              ot_JSON.put('N001', R0.n001);
              ot_JSON.put('N002', R0.n002);
              ot_JSON.put('N003', R0.n003);
              ot_JSON.put('N004', R0.n004);
              ot_JSON.put('N005', R0.n005);

              IF v_APP_AJAX_X10 IS NOT NULL AND R0.blob001 is not null THEN
                ot_JSON.put('BLOB001', json_ext.encode(R0.blob001));
              END IF;

                sys.OWA_UTIL.mime_header('application/json');
                ot_JSON.htp();

                v_is_send := TRUE;
            END LOOP;

            IF not v_is_send THEN
              sys.OWA_UTIL.status_line(204, 'NO CONTENT', true);
              null;
            END IF;

          ELSIF v_APP_AJAX_X04 IS NOT NULL AND v_APP_AJAX_X05 IS NOT NULL
            THEN -- Filter Single Object
              FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = v_APP_AJAX_X01 AND N001 = v_APP_AJAX_X04 AND N002 = v_APP_AJAX_X05 AND ROWNUM = 1)
              LOOP
                cl_JSON := '{ "CLOB001": ' || R0.clob001 || '}';

                ot_JSON := json(cl_JSON);

                ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
                ot_JSON.put('SEQ_ID', R0.seq_id);

                ot_JSON.put('C001', R0.c001);
                ot_JSON.put('C002', R0.c002);
                ot_JSON.put('C003', R0.c003);
                ot_JSON.put('C004', R0.c004);
                ot_JSON.put('C005', R0.c005);
                ot_JSON.put('C006', R0.c006);
                ot_JSON.put('C007', R0.c007);
                ot_JSON.put('C008', R0.c008);
                ot_JSON.put('C009', R0.c009);
                ot_JSON.put('C010', R0.c010);

                ot_JSON.put('C011', R0.c011);
                ot_JSON.put('C012', R0.c012);
                ot_JSON.put('C013', R0.c013);
                ot_JSON.put('C014', R0.c014);
                ot_JSON.put('C015', R0.c015);
                ot_JSON.put('C016', R0.c016);
                ot_JSON.put('C017', R0.c017);
                ot_JSON.put('C018', R0.c018);
                ot_JSON.put('C019', R0.c019);
                ot_JSON.put('C020', R0.c020);

                ot_JSON.put('C021', R0.c021);
                ot_JSON.put('C022', R0.c022);
                ot_JSON.put('C023', R0.c023);
                ot_JSON.put('C024', R0.c024);
                ot_JSON.put('C025', R0.c025);
                ot_JSON.put('C026', R0.c026);
                ot_JSON.put('C027', R0.c027);
                ot_JSON.put('C028', R0.c028);
                ot_JSON.put('C029', R0.c029);
                ot_JSON.put('C030', R0.c030);

                ot_JSON.put('C031', R0.c031);
                ot_JSON.put('C032', R0.c032);
                ot_JSON.put('C033', R0.c033);
                ot_JSON.put('C034', R0.c034);
                ot_JSON.put('C035', R0.c035);
                ot_JSON.put('C036', R0.c036);
                ot_JSON.put('C037', R0.c037);
                ot_JSON.put('C038', R0.c038);
                ot_JSON.put('C039', R0.c039);

                ot_JSON.put('C040', R0.c040);
                ot_JSON.put('C041', R0.c041);
                ot_JSON.put('C042', R0.c042);
                ot_JSON.put('C043', R0.c043);
                ot_JSON.put('C044', R0.c044);
                ot_JSON.put('C045', R0.c045);
                ot_JSON.put('C046', R0.c046);
                ot_JSON.put('C047', R0.c047);
                ot_JSON.put('C048', R0.c048);
                ot_JSON.put('C049', R0.c049);
                ot_JSON.put('C050', R0.c050);

                ot_JSON.put('N001', R0.n001);
                ot_JSON.put('N002', R0.n002);
                ot_JSON.put('N003', R0.n003);
                ot_JSON.put('N004', R0.n004);
                ot_JSON.put('N005', R0.n005);

                IF v_APP_AJAX_X10 IS NOT NULL AND R0.blob001 is not null THEN
                  ot_JSON.put('BLOB001', json_ext.encode(R0.blob001));
                END IF;

                sys.OWA_UTIL.mime_header('application/json', true);
                ot_JSON.htp();

                v_is_send := TRUE;
              END LOOP;

              IF not v_is_send THEN
                sys.OWA_UTIL.status_line(204, 'NO CONTENT', true);
                null;
              END IF;
          ELSE
            -- Load Complete Collection
            ot_JSON_LIST := json_list();

            FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = v_APP_AJAX_X01)
            LOOP
              cl_JSON := '{ "CLOB001": ' || R0.clob001 || '}';

              ot_JSON := json(cl_JSON);

              ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
              ot_JSON.put('SEQ_ID', R0.seq_id);

              ot_JSON.put('C001', R0.c001);
              ot_JSON.put('C002', R0.c002);
              ot_JSON.put('C003', R0.c003);
              ot_JSON.put('C004', R0.c004);
              ot_JSON.put('C005', R0.c005);
              ot_JSON.put('C006', R0.c006);
              ot_JSON.put('C007', R0.c007);
              ot_JSON.put('C008', R0.c008);
              ot_JSON.put('C009', R0.c009);
              ot_JSON.put('C010', R0.c010);

              ot_JSON.put('C011', R0.c011);
              ot_JSON.put('C012', R0.c012);
              ot_JSON.put('C013', R0.c013);
              ot_JSON.put('C014', R0.c014);
              ot_JSON.put('C015', R0.c015);
              ot_JSON.put('C016', R0.c016);
              ot_JSON.put('C017', R0.c017);
              ot_JSON.put('C018', R0.c018);
              ot_JSON.put('C019', R0.c019);
              ot_JSON.put('C020', R0.c020);

              ot_JSON.put('C021', R0.c021);
              ot_JSON.put('C022', R0.c022);
              ot_JSON.put('C023', R0.c023);
              ot_JSON.put('C024', R0.c024);
              ot_JSON.put('C025', R0.c025);
              ot_JSON.put('C026', R0.c026);
              ot_JSON.put('C027', R0.c027);
              ot_JSON.put('C028', R0.c028);
              ot_JSON.put('C029', R0.c029);
              ot_JSON.put('C030', R0.c030);

              ot_JSON.put('C031', R0.c031);
              ot_JSON.put('C032', R0.c032);
              ot_JSON.put('C033', R0.c033);
              ot_JSON.put('C034', R0.c034);
              ot_JSON.put('C035', R0.c035);
              ot_JSON.put('C036', R0.c036);
              ot_JSON.put('C037', R0.c037);
              ot_JSON.put('C038', R0.c038);
              ot_JSON.put('C039', R0.c039);

              ot_JSON.put('C040', R0.c040);
              ot_JSON.put('C041', R0.c041);
              ot_JSON.put('C042', R0.c042);
              ot_JSON.put('C043', R0.c043);
              ot_JSON.put('C044', R0.c044);
              ot_JSON.put('C045', R0.c045);
              ot_JSON.put('C046', R0.c046);
              ot_JSON.put('C047', R0.c047);
              ot_JSON.put('C048', R0.c048);
              ot_JSON.put('C049', R0.c049);
              ot_JSON.put('C050', R0.c050);

              ot_JSON.put('N001', R0.n001);
              ot_JSON.put('N002', R0.n002);
              ot_JSON.put('N003', R0.n003);
              ot_JSON.put('N004', R0.n004);
              ot_JSON.put('N005', R0.n005);

              IF v_APP_AJAX_X10 IS NOT NULL AND R0.blob001 is not null THEN
                ot_JSON.put('BLOB001', json_ext.encode(R0.blob001));
              END IF;

              sys.OWA_UTIL.mime_header('application/json');
              ot_JSON.htp();

              v_is_send := TRUE;
            END LOOP;

            IF not v_is_send THEN
              sys.OWA_UTIL.status_line(204, 'NO CONTENT', true);
              null;
            END IF;

          END IF;

        END IF; -- v_APP_AJAX_X02 = 'GET'

        IF v_APP_AJAX_X02 = 'PUT'
        THEN

          IF v_APP_AJAX_X03 IS NOT NULL
          THEN
            --
            DBMS_LOB.createtemporary(cl_JSON, TRUE, DBMS_LOB.call);
            DBMS_LOB.createtemporary(cl_JSON_DATA, TRUE, DBMS_LOB.call);
            DBMS_LOB.createtemporary(cl_IMAGE_DATA, TRUE, DBMS_LOB.call);
            --
            -- APEX Collection Model
            FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT LOOP
              vc_VALUE := APEX_APPLICATION.G_F01(i);
              DBMS_LOB.writeappend(cl_JSON, length(vc_VALUE), vc_VALUE);
            END LOOP;

            ot_JSON := json(cl_JSON);

            -- Backbone Model
            FOR i IN 1 .. APEX_APPLICATION.G_F02.COUNT LOOP
              vc_VALUE := APEX_APPLICATION.G_F02(i);
              DBMS_LOB.writeappend(cl_JSON_DATA, length(vc_VALUE), vc_VALUE);
            END LOOP;

            -- Image
            FOR i IN 1 .. APEX_APPLICATION.G_F03.COUNT LOOP
              vc_VALUE := APEX_APPLICATION.G_F03(i);
              DBMS_LOB.writeappend(cl_IMAGE_DATA, length(vc_VALUE), vc_VALUE);
            END LOOP;

            cl_IMAGE_BIN := APEX_WEB_SERVICE.clobbase642blob(cl_IMAGE_DATA);

            APEX_COLLECTION.UPDATE_MEMBER(
              p_collection_name   => v_APP_AJAX_X01
              , p_seq             => v_APP_AJAX_X03

              , p_n001            => ot_JSON.get('N001').get_number() --
              , p_n002            => ot_JSON.get('N002').get_number() --
              , p_n003            => ot_JSON.get('N003').get_number() --
              , p_n004            => ot_JSON.get('N004').get_number() --
              , p_n005            => ot_JSON.get('N005').get_number() --

              , p_c001            => ot_JSON.get('C001').get_string() --
              , p_c002            => ot_JSON.get('C002').get_string() --
              , p_c003            => ot_JSON.get('C003').get_string() --
              , p_c004            => ot_JSON.get('C004').get_string() --
              , p_c005            => ot_JSON.get('C005').get_string() --
              , p_c006            => ot_JSON.get('C006').get_string() --
              , p_c007            => ot_JSON.get('C007').get_string() --
              , p_c008            => ot_JSON.get('C008').get_string() --
              , p_c009            => ot_JSON.get('C009').get_string() --
              , p_c010            => ot_JSON.get('C010').get_string() --

              , p_c011            => ot_JSON.get('C011').get_string() --
              , p_c012            => ot_JSON.get('C012').get_string() --
              , p_c013            => ot_JSON.get('C013').get_string() --
              , p_c014            => ot_JSON.get('C014').get_string() --
              , p_c015            => ot_JSON.get('C015').get_string() --
              , p_c016            => ot_JSON.get('C016').get_string() --
              , p_c017            => ot_JSON.get('C017').get_string() --
              , p_c018            => ot_JSON.get('C018').get_string() --
              , p_c019            => ot_JSON.get('C019').get_string() --
              , p_c020            => ot_JSON.get('C020').get_string() --

              , p_c021            => ot_JSON.get('C021').get_string() --
              , p_c022            => ot_JSON.get('C022').get_string() --
              , p_c023            => ot_JSON.get('C023').get_string() --
              , p_c024            => ot_JSON.get('C024').get_string() --
              , p_c025            => ot_JSON.get('C025').get_string() --
              , p_c026            => ot_JSON.get('C026').get_string() --
              , p_c027            => ot_JSON.get('C027').get_string() --
              , p_c028            => ot_JSON.get('C028').get_string() --
              , p_c029            => ot_JSON.get('C029').get_string() --
              , p_c030            => ot_JSON.get('C030').get_string() --

              , p_c031            => ot_JSON.get('C031').get_string() --
              , p_c032            => ot_JSON.get('C032').get_string() --
              , p_c033            => ot_JSON.get('C033').get_string() --
              , p_c034            => ot_JSON.get('C034').get_string() --
              , p_c035            => ot_JSON.get('C035').get_string() --
              , p_c036            => ot_JSON.get('C036').get_string() --
              , p_c037            => ot_JSON.get('C037').get_string() --
              , p_c038            => ot_JSON.get('C038').get_string() --
              , p_c039            => ot_JSON.get('C039').get_string() --
              , p_c040            => ot_JSON.get('C040').get_string() --

              , p_c041            => ot_JSON.get('C041').get_string() --
              , p_c042            => ot_JSON.get('C042').get_string() --
              , p_c043            => ot_JSON.get('C043').get_string() --
              , p_c044            => ot_JSON.get('C044').get_string() --
              , p_c045            => ot_JSON.get('C045').get_string() --
              , p_c046            => ot_JSON.get('C046').get_string() --
              , p_c047            => ot_JSON.get('C047').get_string() --
              , p_c048            => ot_JSON.get('C048').get_string() --
              , p_c049            => ot_JSON.get('C049').get_string() --
              , p_c050            => ot_JSON.get('C050').get_string() --

              , p_clob001         => cl_JSON_DATA
              , p_blob001         => cl_IMAGE_BIN
            );

            ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
            ot_JSON.put('SEQ_ID', v_APP_AJAX_X03);
            ot_JSON.htp();
          END IF;

        END IF; -- v_APP_AJAX_X02 = 'PUT'

        IF v_APP_AJAX_X02 = 'POST'
        THEN
          --
          DBMS_LOB.createtemporary(cl_JSON, TRUE, DBMS_LOB.call);
          DBMS_LOB.createtemporary(cl_JSON_DATA, TRUE, DBMS_LOB.call);
          DBMS_LOB.createtemporary(cl_IMAGE_DATA, TRUE, DBMS_LOB.call);
          --
          -- APEX Collection Model
          FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT LOOP
            vc_VALUE := APEX_APPLICATION.G_F01(i);
            DBMS_LOB.writeappend(cl_JSON, length(vc_VALUE), vc_VALUE);
          END LOOP;

          ot_JSON := json(cl_JSON);

          -- Backbone Model
          FOR i IN 1 .. APEX_APPLICATION.G_F02.COUNT LOOP
            vc_VALUE := APEX_APPLICATION.G_F02(i);
            DBMS_LOB.writeappend(cl_JSON_DATA, length(vc_VALUE), vc_VALUE);
          END LOOP;

          -- Image
          FOR i IN 1 .. APEX_APPLICATION.G_F03.COUNT LOOP
            vc_VALUE := APEX_APPLICATION.G_F03(i);
            DBMS_LOB.writeappend(cl_IMAGE_DATA, length(vc_VALUE), vc_VALUE);
          END LOOP;

          cl_IMAGE_BIN := APEX_WEB_SERVICE.clobbase642blob(cl_IMAGE_DATA);

          v_SEQ_ID := APEX_COLLECTION.ADD_MEMBER(p_collection_name => v_APP_AJAX_X01);

          APEX_COLLECTION.UPDATE_MEMBER(
            p_collection_name  => v_APP_AJAX_X01
            , p_seq            => v_SEQ_ID

            , p_n001            => ot_JSON.get('N001').get_number() --
            , p_n002            => ot_JSON.get('N002').get_number() --
            , p_n003            => ot_JSON.get('N003').get_number() --
            , p_n004            => ot_JSON.get('N004').get_number() --
            , p_n005            => ot_JSON.get('N005').get_number() --

            , p_c001            => ot_JSON.get('C001').get_string() --
            , p_c002            => ot_JSON.get('C002').get_string() --
            , p_c003            => ot_JSON.get('C003').get_string() --
            , p_c004            => ot_JSON.get('C004').get_string() --
            , p_c005            => ot_JSON.get('C005').get_string() --
            , p_c006            => ot_JSON.get('C006').get_string() --
            , p_c007            => ot_JSON.get('C007').get_string() --
            , p_c008            => ot_JSON.get('C008').get_string() --
            , p_c009            => ot_JSON.get('C009').get_string() --
            , p_c010            => ot_JSON.get('C010').get_string() --

            , p_c011            => ot_JSON.get('C011').get_string() --
            , p_c012            => ot_JSON.get('C012').get_string() --
            , p_c013            => ot_JSON.get('C013').get_string() --
            , p_c014            => ot_JSON.get('C014').get_string() --
            , p_c015            => ot_JSON.get('C015').get_string() --
            , p_c016            => ot_JSON.get('C016').get_string() --
            , p_c017            => ot_JSON.get('C017').get_string() --
            , p_c018            => ot_JSON.get('C018').get_string() --
            , p_c019            => ot_JSON.get('C019').get_string() --
            , p_c020            => ot_JSON.get('C020').get_string() --

            , p_c021            => ot_JSON.get('C021').get_string() --
            , p_c022            => ot_JSON.get('C022').get_string() --
            , p_c023            => ot_JSON.get('C023').get_string() --
            , p_c024            => ot_JSON.get('C024').get_string() --
            , p_c025            => ot_JSON.get('C025').get_string() --
            , p_c026            => ot_JSON.get('C026').get_string() --
            , p_c027            => ot_JSON.get('C027').get_string() --
            , p_c028            => ot_JSON.get('C028').get_string() --
            , p_c029            => ot_JSON.get('C029').get_string() --
            , p_c030            => ot_JSON.get('C030').get_string() --

            , p_c031            => ot_JSON.get('C031').get_string() --
            , p_c032            => ot_JSON.get('C032').get_string() --
            , p_c033            => ot_JSON.get('C033').get_string() --
            , p_c034            => ot_JSON.get('C034').get_string() --
            , p_c035            => ot_JSON.get('C035').get_string() --
            , p_c036            => ot_JSON.get('C036').get_string() --
            , p_c037            => ot_JSON.get('C037').get_string() --
            , p_c038            => ot_JSON.get('C038').get_string() --
            , p_c039            => ot_JSON.get('C039').get_string() --
            , p_c040            => ot_JSON.get('C040').get_string() --

            , p_c041            => ot_JSON.get('C041').get_string() --
            , p_c042            => ot_JSON.get('C042').get_string() --
            , p_c043            => ot_JSON.get('C043').get_string() --
            , p_c044            => ot_JSON.get('C044').get_string() --
            , p_c045            => ot_JSON.get('C045').get_string() --
            , p_c046            => ot_JSON.get('C046').get_string() --
            , p_c047            => ot_JSON.get('C047').get_string() --
            , p_c048            => ot_JSON.get('C048').get_string() --
            , p_c049            => ot_JSON.get('C049').get_string() --
            , p_c050            => ot_JSON.get('C050').get_string() --

            , p_clob001         => cl_JSON_DATA
            , p_blob001         => cl_IMAGE_BIN
          );

          ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
          ot_JSON.put('SEQ_ID', v_SEQ_ID);
          ot_JSON.htp();

        END IF; -- v_APP_AJAX_X02 = 'POST'

        IF v_APP_AJAX_X02 = 'DELETE'
        THEN
          IF v_APP_AJAX_X03 IS NOT NULL
          THEN
            SELECT count(*)
            INTO v_count
            FROM APEX_collections
            WHERE collection_name = v_APP_AJAX_X01 AND seq_id = v_APP_AJAX_X03;

            APEX_COLLECTION.DELETE_MEMBER(v_APP_AJAX_X01, v_APP_AJAX_X03);

            apex_json.open_object;
            apex_json.write('SUCCESS', TRUE);
            apex_json.write('COLLECTION_NAME', v_APP_AJAX_X01);
            apex_json.write('SEQ_ID', v_APP_AJAX_X03);
            apex_json.write('AFFECTED_ROWS', v_count);
            apex_json.close_object;

          ELSE

            apex_json.open_object;
            apex_json.write('SUCCESS', TRUE);
            apex_json.write('COLLECTION_NAME', v_APP_AJAX_X01);
            apex_json.write('AFFECTED_ROWS', APEX_COLLECTION.COLLECTION_MEMBER_COUNT(v_APP_AJAX_X01));
            apex_json.close_object;

            APEX_COLLECTION.DELETE_COLLECTION(v_APP_AJAX_X01);

          END IF;
        END IF; -- v_APP_AJAX_X02 = 'DELETE'

        --
        --
        L_Finally();
        --
        EXCEPTION
        WHEN OTHERS THEN
        L_Finally();
        RAISE;
      END;

      RETURN v_Result;

    END process_ajax_item_request;

  --------------------------------------------------------------------------------------------------------

  FUNCTION process_ajax_region_request(p_region IN apex_plugin.T_REGION, p_plugin IN apex_plugin.T_PLUGIN)
    RETURN apex_plugin.T_REGION_AJAX_RESULT IS

    v_Result       APEX_PLUGIN.T_REGION_AJAX_RESULT;

    v_APP_AJAX_X01 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X02 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X03 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X04 VARCHAR2(32767 CHAR);

    v_APP_AJAX_X05 VARCHAR2(32767 CHAR);
    v_APP_AJAX_X10 VARCHAR2(32767 CHAR);

    vc_VALUE       VARCHAR2(32767 CHAR);

    l_offset       PLS_INTEGER := 1;
    l_chunk_sz     PLS_INTEGER := 8000;

    cl_JSON        CLOB;
    cl_JSON_DATA   CLOB;
    cl_IMAGE_DATA  CLOB;
    cl_IMAGE_BIN   BLOB;

    ot_JSON        JSON;
    ot_JSON_LIST   JSON_LIST;

    v_SEQ_ID       INTEGER;
    v_Count        INTEGER;
    v_is_send      BOOLEAN := FALSE;
    --
    --
    PROCEDURE L_Finally IS
      BEGIN
        IF (DBMS_LOB.istemporary(cl_JSON) != 0) THEN DBMS_LOB.freetemporary(cl_JSON); END IF;
        cl_JSON := NULL;
        IF (DBMS_LOB.istemporary(cl_JSON_DATA) != 0) THEN DBMS_LOB.freetemporary(cl_JSON_DATA); END IF;
        cl_JSON_DATA := NULL;
        IF (DBMS_LOB.istemporary(cl_IMAGE_DATA) != 0) THEN DBMS_LOB.freetemporary(cl_IMAGE_DATA); END IF;
        cl_IMAGE_DATA := NULL;
        ot_JSON := NULL;
        ot_JSON_LIST := NULL;
      END L_Finally;
    --
    --
    BEGIN
      --
      v_APP_AJAX_X01 := v('APP_AJAX_X01'); -- 'FINGERPRINTS';
      v_APP_AJAX_X02 := v('APP_AJAX_X02'); -- 'POST';
      v_APP_AJAX_X03 := v('APP_AJAX_X03'); -- '{id}';
      v_APP_AJAX_X04 := v('APP_AJAX_X04'); -- '';
      v_APP_AJAX_X05 := v('APP_AJAX_X05'); -- '';
      v_APP_AJAX_X10 := v('APP_AJAX_X10'); -- '';
      --
      IF NOT APEX_COLLECTION.collection_exists(p_collection_name => v_APP_AJAX_X01)
      THEN
        APEX_COLLECTION.create_or_truncate_collection(p_collection_name => v_APP_AJAX_X01);
      END IF;
      --
      BEGIN
        --
        IF v_APP_AJAX_X02 = 'GET'
        THEN
          IF v_APP_AJAX_X03 IS NOT NULL
          THEN -- Load Single Object
            FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = v_APP_AJAX_X01 AND seq_id = v_APP_AJAX_X03)
            LOOP
              cl_JSON := '{ "CLOB001": ' || R0.clob001 || '}';

              ot_JSON := json(cl_JSON);

              ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
              ot_JSON.put('SEQ_ID', R0.seq_id);

              ot_JSON.put('C001', R0.c001);
              ot_JSON.put('C002', R0.c002);
              ot_JSON.put('C003', R0.c003);
              ot_JSON.put('C004', R0.c004);
              ot_JSON.put('C005', R0.c005);
              ot_JSON.put('C006', R0.c006);
              ot_JSON.put('C007', R0.c007);
              ot_JSON.put('C008', R0.c008);
              ot_JSON.put('C009', R0.c009);
              ot_JSON.put('C010', R0.c010);

              ot_JSON.put('C011', R0.c011);
              ot_JSON.put('C012', R0.c012);
              ot_JSON.put('C013', R0.c013);
              ot_JSON.put('C014', R0.c014);
              ot_JSON.put('C015', R0.c015);
              ot_JSON.put('C016', R0.c016);
              ot_JSON.put('C017', R0.c017);
              ot_JSON.put('C018', R0.c018);
              ot_JSON.put('C019', R0.c019);
              ot_JSON.put('C020', R0.c020);

              ot_JSON.put('C021', R0.c021);
              ot_JSON.put('C022', R0.c022);
              ot_JSON.put('C023', R0.c023);
              ot_JSON.put('C024', R0.c024);
              ot_JSON.put('C025', R0.c025);
              ot_JSON.put('C026', R0.c026);
              ot_JSON.put('C027', R0.c027);
              ot_JSON.put('C028', R0.c028);
              ot_JSON.put('C029', R0.c029);
              ot_JSON.put('C030', R0.c030);

              ot_JSON.put('C031', R0.c031);
              ot_JSON.put('C032', R0.c032);
              ot_JSON.put('C033', R0.c033);
              ot_JSON.put('C034', R0.c034);
              ot_JSON.put('C035', R0.c035);
              ot_JSON.put('C036', R0.c036);
              ot_JSON.put('C037', R0.c037);
              ot_JSON.put('C038', R0.c038);
              ot_JSON.put('C039', R0.c039);

              ot_JSON.put('C040', R0.c040);
              ot_JSON.put('C041', R0.c041);
              ot_JSON.put('C042', R0.c042);
              ot_JSON.put('C043', R0.c043);
              ot_JSON.put('C044', R0.c044);
              ot_JSON.put('C045', R0.c045);
              ot_JSON.put('C046', R0.c046);
              ot_JSON.put('C047', R0.c047);
              ot_JSON.put('C048', R0.c048);
              ot_JSON.put('C049', R0.c049);

              ot_JSON.put('N001', R0.n001);
              ot_JSON.put('N002', R0.n002);
              ot_JSON.put('N003', R0.n003);
              ot_JSON.put('N004', R0.n004);
              ot_JSON.put('N005', R0.n005);

              IF v_APP_AJAX_X10 IS NOT NULL AND R0.blob001 is not null THEN
                ot_JSON.put('BLOB001', json_ext.encode(R0.blob001));
              END IF;

              sys.OWA_UTIL.mime_header('application/json');
              ot_JSON.htp();

              v_is_send := TRUE;
            END LOOP;

            IF not v_is_send THEN
              sys.OWA_UTIL.status_line(204, 'NO CONTENT', true);
              null;
            END IF;

          ELSIF v_APP_AJAX_X04 IS NOT NULL AND v_APP_AJAX_X05 IS NOT NULL
            THEN -- Filter Single Object
              FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = v_APP_AJAX_X01 AND N001 = v_APP_AJAX_X04 AND N002 = v_APP_AJAX_X05 AND ROWNUM = 1)
              LOOP
                cl_JSON := '{ "CLOB001": ' || R0.clob001 || '}';

                ot_JSON := json(cl_JSON);

                ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
                ot_JSON.put('SEQ_ID', R0.seq_id);

                ot_JSON.put('C001', R0.c001);
                ot_JSON.put('C002', R0.c002);
                ot_JSON.put('C003', R0.c003);
                ot_JSON.put('C004', R0.c004);
                ot_JSON.put('C005', R0.c005);
                ot_JSON.put('C006', R0.c006);
                ot_JSON.put('C007', R0.c007);
                ot_JSON.put('C008', R0.c008);
                ot_JSON.put('C009', R0.c009);
                ot_JSON.put('C010', R0.c010);

                ot_JSON.put('C011', R0.c011);
                ot_JSON.put('C012', R0.c012);
                ot_JSON.put('C013', R0.c013);
                ot_JSON.put('C014', R0.c014);
                ot_JSON.put('C015', R0.c015);
                ot_JSON.put('C016', R0.c016);
                ot_JSON.put('C017', R0.c017);
                ot_JSON.put('C018', R0.c018);
                ot_JSON.put('C019', R0.c019);
                ot_JSON.put('C020', R0.c020);

                ot_JSON.put('C021', R0.c021);
                ot_JSON.put('C022', R0.c022);
                ot_JSON.put('C023', R0.c023);
                ot_JSON.put('C024', R0.c024);
                ot_JSON.put('C025', R0.c025);
                ot_JSON.put('C026', R0.c026);
                ot_JSON.put('C027', R0.c027);
                ot_JSON.put('C028', R0.c028);
                ot_JSON.put('C029', R0.c029);
                ot_JSON.put('C030', R0.c030);

                ot_JSON.put('C031', R0.c031);
                ot_JSON.put('C032', R0.c032);
                ot_JSON.put('C033', R0.c033);
                ot_JSON.put('C034', R0.c034);
                ot_JSON.put('C035', R0.c035);
                ot_JSON.put('C036', R0.c036);
                ot_JSON.put('C037', R0.c037);
                ot_JSON.put('C038', R0.c038);
                ot_JSON.put('C039', R0.c039);

                ot_JSON.put('C040', R0.c040);
                ot_JSON.put('C041', R0.c041);
                ot_JSON.put('C042', R0.c042);
                ot_JSON.put('C043', R0.c043);
                ot_JSON.put('C044', R0.c044);
                ot_JSON.put('C045', R0.c045);
                ot_JSON.put('C046', R0.c046);
                ot_JSON.put('C047', R0.c047);
                ot_JSON.put('C048', R0.c048);
                ot_JSON.put('C049', R0.c049);

                ot_JSON.put('N001', R0.n001);
                ot_JSON.put('N002', R0.n002);
                ot_JSON.put('N003', R0.n003);
                ot_JSON.put('N004', R0.n004);
                ot_JSON.put('N005', R0.n005);

                IF v_APP_AJAX_X10 IS NOT NULL AND R0.blob001 is not null THEN
                    ot_JSON.put('BLOB001', json_ext.encode(R0.blob001));
                END IF;

                sys.OWA_UTIL.mime_header('application/json');
                ot_JSON.htp();

                v_is_send := TRUE;
            END LOOP;

            IF not v_is_send THEN
              sys.OWA_UTIL.status_line(204, 'NO CONTENT', true);
              null;
            END IF;
          ELSE
            -- Load Complete Collection
            ot_JSON_LIST := json_list();

            FOR R0 IN (SELECT * FROM APEX_collections WHERE collection_name = v_APP_AJAX_X01)
            LOOP
              cl_JSON := '{ "CLOB001": ' || R0.clob001 || '}';

              ot_JSON := json(cl_JSON);

              ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
              ot_JSON.put('SEQ_ID', R0.seq_id);

              ot_JSON.put('C001', R0.c001);
              ot_JSON.put('C002', R0.c002);
              ot_JSON.put('C003', R0.c003);
              ot_JSON.put('C004', R0.c004);
              ot_JSON.put('C005', R0.c005);
              ot_JSON.put('C006', R0.c006);
              ot_JSON.put('C007', R0.c007);
              ot_JSON.put('C008', R0.c008);
              ot_JSON.put('C009', R0.c009);
              ot_JSON.put('C010', R0.c010);

              ot_JSON.put('C011', R0.c011);
              ot_JSON.put('C012', R0.c012);
              ot_JSON.put('C013', R0.c013);
              ot_JSON.put('C014', R0.c014);
              ot_JSON.put('C015', R0.c015);
              ot_JSON.put('C016', R0.c016);
              ot_JSON.put('C017', R0.c017);
              ot_JSON.put('C018', R0.c018);
              ot_JSON.put('C019', R0.c019);
              ot_JSON.put('C020', R0.c020);

              ot_JSON.put('C021', R0.c021);
              ot_JSON.put('C022', R0.c022);
              ot_JSON.put('C023', R0.c023);
              ot_JSON.put('C024', R0.c024);
              ot_JSON.put('C025', R0.c025);
              ot_JSON.put('C026', R0.c026);
              ot_JSON.put('C027', R0.c027);
              ot_JSON.put('C028', R0.c028);
              ot_JSON.put('C029', R0.c029);
              ot_JSON.put('C030', R0.c030);

              ot_JSON.put('C031', R0.c031);
              ot_JSON.put('C032', R0.c032);
              ot_JSON.put('C033', R0.c033);
              ot_JSON.put('C034', R0.c034);
              ot_JSON.put('C035', R0.c035);
              ot_JSON.put('C036', R0.c036);
              ot_JSON.put('C037', R0.c037);
              ot_JSON.put('C038', R0.c038);
              ot_JSON.put('C039', R0.c039);

              ot_JSON.put('C040', R0.c040);
              ot_JSON.put('C041', R0.c041);
              ot_JSON.put('C042', R0.c042);
              ot_JSON.put('C043', R0.c043);
              ot_JSON.put('C044', R0.c044);
              ot_JSON.put('C045', R0.c045);
              ot_JSON.put('C046', R0.c046);
              ot_JSON.put('C047', R0.c047);
              ot_JSON.put('C048', R0.c048);
              ot_JSON.put('C049', R0.c049);

              ot_JSON.put('N001', R0.n001);
              ot_JSON.put('N002', R0.n002);
              ot_JSON.put('N003', R0.n003);
              ot_JSON.put('N004', R0.n004);
              ot_JSON.put('N005', R0.n005);

              IF v_APP_AJAX_X10 IS NOT NULL AND R0.blob001 is not null THEN
                ot_JSON.put('BLOB001', json_ext.encode(R0.blob001));
              END IF;

              ot_JSON_LIST.append(ot_JSON.to_json_value);
            END LOOP;

            sys.OWA_UTIL.mime_header('application/json', TRUE);
            ot_JSON_LIST.htp();

          END IF;

        END IF; -- v_APP_AJAX_X02 = 'GET'

        IF v_APP_AJAX_X02 = 'PUT'
        THEN

          IF v_APP_AJAX_X03 IS NOT NULL
          THEN
            --
            DBMS_LOB.createtemporary(cl_JSON, TRUE, DBMS_LOB.call);
            DBMS_LOB.createtemporary(cl_JSON_DATA, TRUE, DBMS_LOB.call);
            DBMS_LOB.createtemporary(cl_IMAGE_DATA, TRUE, DBMS_LOB.call);
            --
            -- APEX Collection Model
            FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT LOOP
              vc_VALUE := APEX_APPLICATION.G_F01(i);
              DBMS_LOB.writeappend(cl_JSON, length(vc_VALUE), vc_VALUE);
            END LOOP;

            ot_JSON := json(cl_JSON);

            -- Backbone Model
            FOR i IN 1 .. APEX_APPLICATION.G_F02.COUNT LOOP
              vc_VALUE := APEX_APPLICATION.G_F02(i);
              DBMS_LOB.writeappend(cl_JSON_DATA, length(vc_VALUE), vc_VALUE);
            END LOOP;

            -- Image
            FOR i IN 1 .. APEX_APPLICATION.G_F03.COUNT LOOP
              vc_VALUE := APEX_APPLICATION.G_F03(i);
              DBMS_LOB.writeappend(cl_IMAGE_DATA, length(vc_VALUE), vc_VALUE);
            END LOOP;

            cl_IMAGE_BIN := APEX_WEB_SERVICE.clobbase642blob(cl_IMAGE_DATA);

            APEX_COLLECTION.UPDATE_MEMBER(
              p_collection_name   => v_APP_AJAX_X01
              , p_seq             => v_APP_AJAX_X03

              , p_n001            => ot_JSON.get('N001').get_number() --
              , p_n002            => ot_JSON.get('N002').get_number() --
              , p_n003            => ot_JSON.get('N003').get_number() --
              , p_n004            => ot_JSON.get('N004').get_number() --
              , p_n005            => ot_JSON.get('N005').get_number() --

              , p_c001            => ot_JSON.get('C001').get_string() --
              , p_c002            => ot_JSON.get('C002').get_string() --
              , p_c003            => ot_JSON.get('C003').get_string() --
              , p_c004            => ot_JSON.get('C004').get_string() --
              , p_c005            => ot_JSON.get('C005').get_string() --
              , p_c006            => ot_JSON.get('C006').get_string() --
              , p_c007            => ot_JSON.get('C007').get_string() --
              , p_c008            => ot_JSON.get('C008').get_string() --
              , p_c009            => ot_JSON.get('C009').get_string() --
              , p_c010            => ot_JSON.get('C010').get_string() --

              , p_c011            => ot_JSON.get('C011').get_string() --
              , p_c012            => ot_JSON.get('C012').get_string() --
              , p_c013            => ot_JSON.get('C013').get_string() --
              , p_c014            => ot_JSON.get('C014').get_string() --
              , p_c015            => ot_JSON.get('C015').get_string() --
              , p_c016            => ot_JSON.get('C016').get_string() --
              , p_c017            => ot_JSON.get('C017').get_string() --
              , p_c018            => ot_JSON.get('C018').get_string() --
              , p_c019            => ot_JSON.get('C019').get_string() --
              , p_c020            => ot_JSON.get('C020').get_string() --

              , p_c021            => ot_JSON.get('C021').get_string() --
              , p_c022            => ot_JSON.get('C022').get_string() --
              , p_c023            => ot_JSON.get('C023').get_string() --
              , p_c024            => ot_JSON.get('C024').get_string() --
              , p_c025            => ot_JSON.get('C025').get_string() --
              , p_c026            => ot_JSON.get('C026').get_string() --
              , p_c027            => ot_JSON.get('C027').get_string() --
              , p_c028            => ot_JSON.get('C028').get_string() --
              , p_c029            => ot_JSON.get('C029').get_string() --
              , p_c030            => ot_JSON.get('C030').get_string() --

              , p_c031            => ot_JSON.get('C031').get_string() --
              , p_c032            => ot_JSON.get('C032').get_string() --
              , p_c033            => ot_JSON.get('C033').get_string() --
              , p_c034            => ot_JSON.get('C034').get_string() --
              , p_c035            => ot_JSON.get('C035').get_string() --
              , p_c036            => ot_JSON.get('C036').get_string() --
              , p_c037            => ot_JSON.get('C037').get_string() --
              , p_c038            => ot_JSON.get('C038').get_string() --
              , p_c039            => ot_JSON.get('C039').get_string() --
              , p_c040            => ot_JSON.get('C040').get_string() --

              , p_c041            => ot_JSON.get('C041').get_string() --
              , p_c042            => ot_JSON.get('C042').get_string() --
              , p_c043            => ot_JSON.get('C043').get_string() --
              , p_c044            => ot_JSON.get('C044').get_string() --
              , p_c045            => ot_JSON.get('C045').get_string() --
              , p_c046            => ot_JSON.get('C046').get_string() --
              , p_c047            => ot_JSON.get('C047').get_string() --
              , p_c048            => ot_JSON.get('C048').get_string() --
              , p_c049            => ot_JSON.get('C049').get_string() --

              , p_clob001         => cl_JSON_DATA
              , p_blob001         => cl_IMAGE_BIN
            );

            ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
            ot_JSON.put('SEQ_ID', v_APP_AJAX_X03);

            sys.OWA_UTIL.mime_header('application/json', TRUE);
            ot_JSON.htp();

          END IF;

        END IF; -- v_APP_AJAX_X02 = 'PUT'

        IF v_APP_AJAX_X02 = 'POST'
        THEN
          --
          DBMS_LOB.createtemporary(cl_JSON, TRUE, DBMS_LOB.call);
          DBMS_LOB.createtemporary(cl_JSON_DATA, TRUE, DBMS_LOB.call);
          DBMS_LOB.createtemporary(cl_IMAGE_DATA, TRUE, DBMS_LOB.call);
          --
          -- APEX Collection Model
          FOR i IN 1 .. APEX_APPLICATION.G_F01.COUNT LOOP
            vc_VALUE := APEX_APPLICATION.G_F01(i);
            DBMS_LOB.writeappend(cl_JSON, length(vc_VALUE), vc_VALUE);
          END LOOP;

          ot_JSON := json(cl_JSON);

          -- Backbone Model
          FOR i IN 1 .. APEX_APPLICATION.G_F02.COUNT LOOP
            vc_VALUE := APEX_APPLICATION.G_F02(i);
            DBMS_LOB.writeappend(cl_JSON_DATA, length(vc_VALUE), vc_VALUE);
          END LOOP;

          -- Image
          FOR i IN 1 .. APEX_APPLICATION.G_F03.COUNT LOOP
            vc_VALUE := APEX_APPLICATION.G_F03(i);
            DBMS_LOB.writeappend(cl_IMAGE_DATA, length(vc_VALUE), vc_VALUE);
          END LOOP;

          cl_IMAGE_BIN := APEX_WEB_SERVICE.clobbase642blob(cl_IMAGE_DATA);

          v_SEQ_ID := APEX_COLLECTION.ADD_MEMBER(p_collection_name => v_APP_AJAX_X01);

          APEX_COLLECTION.UPDATE_MEMBER(
            p_collection_name  => v_APP_AJAX_X01
            , p_seq            => v_SEQ_ID

            , p_n001            => ot_JSON.get('N001').get_number() --
            , p_n002            => ot_JSON.get('N002').get_number() --
            , p_n003            => ot_JSON.get('N003').get_number() --
            , p_n004            => ot_JSON.get('N004').get_number() --
            , p_n005            => ot_JSON.get('N005').get_number() --

            , p_c001            => ot_JSON.get('C001').get_string() --
            , p_c002            => ot_JSON.get('C002').get_string() --
            , p_c003            => ot_JSON.get('C003').get_string() --
            , p_c004            => ot_JSON.get('C004').get_string() --
            , p_c005            => ot_JSON.get('C005').get_string() --
            , p_c006            => ot_JSON.get('C006').get_string() --
            , p_c007            => ot_JSON.get('C007').get_string() --
            , p_c008            => ot_JSON.get('C008').get_string() --
            , p_c009            => ot_JSON.get('C009').get_string() --
            , p_c010            => ot_JSON.get('C010').get_string() --

            , p_c011            => ot_JSON.get('C011').get_string() --
            , p_c012            => ot_JSON.get('C012').get_string() --
            , p_c013            => ot_JSON.get('C013').get_string() --
            , p_c014            => ot_JSON.get('C014').get_string() --
            , p_c015            => ot_JSON.get('C015').get_string() --
            , p_c016            => ot_JSON.get('C016').get_string() --
            , p_c017            => ot_JSON.get('C017').get_string() --
            , p_c018            => ot_JSON.get('C018').get_string() --
            , p_c019            => ot_JSON.get('C019').get_string() --
            , p_c020            => ot_JSON.get('C020').get_string() --

            , p_c021            => ot_JSON.get('C021').get_string() --
            , p_c022            => ot_JSON.get('C022').get_string() --
            , p_c023            => ot_JSON.get('C023').get_string() --
            , p_c024            => ot_JSON.get('C024').get_string() --
            , p_c025            => ot_JSON.get('C025').get_string() --
            , p_c026            => ot_JSON.get('C026').get_string() --
            , p_c027            => ot_JSON.get('C027').get_string() --
            , p_c028            => ot_JSON.get('C028').get_string() --
            , p_c029            => ot_JSON.get('C029').get_string() --
            , p_c030            => ot_JSON.get('C030').get_string() --

            , p_c031            => ot_JSON.get('C031').get_string() --
            , p_c032            => ot_JSON.get('C032').get_string() --
            , p_c033            => ot_JSON.get('C033').get_string() --
            , p_c034            => ot_JSON.get('C034').get_string() --
            , p_c035            => ot_JSON.get('C035').get_string() --
            , p_c036            => ot_JSON.get('C036').get_string() --
            , p_c037            => ot_JSON.get('C037').get_string() --
            , p_c038            => ot_JSON.get('C038').get_string() --
            , p_c039            => ot_JSON.get('C039').get_string() --
            , p_c040            => ot_JSON.get('C040').get_string() --

            , p_c041            => ot_JSON.get('C041').get_string() --
            , p_c042            => ot_JSON.get('C042').get_string() --
            , p_c043            => ot_JSON.get('C043').get_string() --
            , p_c044            => ot_JSON.get('C044').get_string() --
            , p_c045            => ot_JSON.get('C045').get_string() --
            , p_c046            => ot_JSON.get('C046').get_string() --
            , p_c047            => ot_JSON.get('C047').get_string() --
            , p_c048            => ot_JSON.get('C048').get_string() --
            , p_c049            => ot_JSON.get('C049').get_string() --
--            , p_c050            => ot_JSON.get('C050').get_string() --

            , p_clob001         => cl_JSON_DATA
            , p_blob001         => cl_IMAGE_BIN
          );

          ot_JSON.put('COLLECTION_NAME', v_APP_AJAX_X01);
          ot_JSON.put('SEQ_ID', v_SEQ_ID);
          sys.OWA_UTIL.mime_header('application/json', TRUE);
          ot_JSON.htp();

        END IF; -- v_APP_AJAX_X02 = 'POST'

        IF v_APP_AJAX_X02 = 'DELETE'
        THEN
          IF v_APP_AJAX_X03 IS NOT NULL
          THEN
            SELECT count(*)
            INTO v_count
            FROM APEX_collections
            WHERE collection_name = v_APP_AJAX_X01 AND seq_id = v_APP_AJAX_X03;

            APEX_COLLECTION.DELETE_MEMBER(v_APP_AJAX_X01, v_APP_AJAX_X03);

            apex_json.open_object;
            apex_json.write('SUCCESS', TRUE);
            apex_json.write('COLLECTION_NAME', v_APP_AJAX_X01);
            apex_json.write('SEQ_ID', v_APP_AJAX_X03);
            apex_json.write('AFFECTED_ROWS', v_count);
            apex_json.close_object;

          ELSE

            apex_json.open_object;
            apex_json.write('SUCCESS', TRUE);
            apex_json.write('COLLECTION_NAME', v_APP_AJAX_X01);
            apex_json.write('AFFECTED_ROWS', APEX_COLLECTION.COLLECTION_MEMBER_COUNT(v_APP_AJAX_X01));
            apex_json.close_object;

            APEX_COLLECTION.DELETE_COLLECTION(v_APP_AJAX_X01);

          END IF;
        END IF; -- v_APP_AJAX_X02 = 'DELETE'

        --
        --
        L_Finally();
        --
--      EXCEPTION
--      WHEN OTHERS THEN
--        L_Finally();
--      RAISE;
      END;
      --
      --
      RETURN v_Result;
      --
    END process_ajax_region_request;

END;
/
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_PLUGIN_AJAX" TO "DL_BORDERCONTROL";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_PLUGIN_AJAX" TO "DERMALOG_PROXY";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_PLUGIN_AJAX" TO "BIOAPPREPORT";
  GRANT EXECUTE ON "DL_BLACKLIST"."PKG_DL_PLUGIN_AJAX" TO "BIOSUPPORT";
