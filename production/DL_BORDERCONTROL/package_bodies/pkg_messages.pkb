CREATE OR REPLACE EDITIONABLE PACKAGE BODY "DL_BORDERCONTROL"."PKG_MESSAGES" IS
  /**
  * ========================================================================<br/>
  * <b> Functions / Procedures for messages in apex application </b>  <br/> <br/>
  * <br/>
  * @file    $HeadURL: $<br/>
  * @version $Revision: 1.0 $<br/>
  * @author  $Author: C. Funke $<br/>
  * @date    $Date:  25/10/2017 $<br/>
  * @version $Id: $<br/>
  * ========================================================================<br/>
  * @headcom
  */

    PROCEDURE load_messages_workflow_js IS
  --Javascript Workflow.js

        l_mes1               VARCHAR2(500);
        l_mes2               VARCHAR2(500);
        l_mes3               VARCHAR2(500);
        l_mes4               VARCHAR2(500);
        l_mes5               VARCHAR2(500);
        l_mes6               VARCHAR2(500);
        l_mes7               VARCHAR2(500);
        l_mes8               VARCHAR2(500);
        l_mes9               VARCHAR2(500);
        l_mes10              VARCHAR2(500);
        l_mes11              VARCHAR2(500);
        l_mes12              VARCHAR2(500);
        l_mes13              VARCHAR2(500);
        l_mes14              VARCHAR2(500);
        l_mes15              VARCHAR2(500);
        l_mes16              VARCHAR2(500);
        l_mes17              VARCHAR2(500);
        l_mes18              VARCHAR2(500);
        l_mes19              VARCHAR2(500);
        l_mes20              VARCHAR2(500);
        l_mes21              VARCHAR2(500);
        l_mes22              VARCHAR2(500);
        l_mes23              VARCHAR2(500);
        l_mes25              VARCHAR2(500);
        l_mes26              VARCHAR2(500);

  -- Button add children Javascript on Page 17/Dynamic Action DA_AddChildren
        l_btn_add_children   VARCHAR2(500);

  --Javascript AbisFunction.js
        l_af1                VARCHAR2(500);
        l_af2                VARCHAR2(500);

  --Javascript CutOutPhoto.js
        l_cop1               VARCHAR2(500);

  --Javascript DermalogPlugins.js ----------------- MUSS DAS ÜBERSETZT WERDEN?? ---------------------------------------------------------------

  --Javascript FingerprintManagement.js
        l_fm1                VARCHAR2(500);
        l_fm2                VARCHAR2(500);
        l_fm3                VARCHAR2(500);
        l_fm4                VARCHAR2(500);
        l_fm5                VARCHAR2(500);
        l_fm6                VARCHAR2(500);
        l_fm7                VARCHAR2(500);
        l_fm8                VARCHAR2(500);
        l_fm9                VARCHAR2(500);
        l_fm10               VARCHAR2(500);
        l_fm11               VARCHAR2(500);
        l_fm12               VARCHAR2(500);

  --LiveFaceVerifyManagement.js
        l_lfvm1              VARCHAR2(500);

  --Javascript PassportManagement.js
        l_pm1                VARCHAR2(500);
        l_pm2                VARCHAR2(500);
    BEGIN
  --Javascript Workflow.js
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes1
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\1';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes1 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes2
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\2';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes2 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes3
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\3';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes3 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes4
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\4';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes4 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes5
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\5';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes5 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes6
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\6';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes6 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes7
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\7';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes7 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes8
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\8';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes8 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes9
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\9';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes9 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes10
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\10';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes10 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes11
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\11';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes11 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes12
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\12';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes12 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes13
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\13';
       EXCEPTION
        WHEN OTHERS THEN
          l_mes13 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes14
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\14';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes14 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes15
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\15';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes15 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes16
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\16';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes16 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes17
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\17';
       EXCEPTION
        WHEN OTHERS THEN
          l_mes17 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes18
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\18';
       EXCEPTION
        WHEN OTHERS THEN
          l_mes18 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes19
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\19';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes19 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes20
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\20';
       EXCEPTION
        WHEN OTHERS THEN
          l_mes20 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes21
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\21';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes21 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes22
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\22';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes22 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes23
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\23';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes23 := null;
      END;
      
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes25
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\25';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes25 := null;
      END;
      
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_mes26
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\Workflow_js\26';
      EXCEPTION
        WHEN OTHERS THEN
          l_mes26 := null;
      END;

        apex_util.set_session_state('P1017_WORKFLOW_JS_1',l_mes1);
        apex_util.set_session_state('P1017_WORKFLOW_JS_2',l_mes2);
        apex_util.set_session_state('P1017_WORKFLOW_JS_3',l_mes3);
        apex_util.set_session_state('P1017_WORKFLOW_JS_4',l_mes4);
        apex_util.set_session_state('P1017_WORKFLOW_JS_5',l_mes5);
        apex_util.set_session_state('P1017_WORKFLOW_JS_6',l_mes6);
        apex_util.set_session_state('P1017_WORKFLOW_JS_7',l_mes7);
        apex_util.set_session_state('P1017_WORKFLOW_JS_8',l_mes8);
        apex_util.set_session_state('P1017_WORKFLOW_JS_9',l_mes9);
        apex_util.set_session_state('P1017_WORKFLOW_JS_10',l_mes10);
        apex_util.set_session_state('P1017_WORKFLOW_JS_11',l_mes11);
        apex_util.set_session_state('P1017_WORKFLOW_JS_12',l_mes12);
        apex_util.set_session_state('P1017_WORKFLOW_JS_13',l_mes13);
        apex_util.set_session_state('P1017_WORKFLOW_JS_14',l_mes14);
        apex_util.set_session_state('P1017_WORKFLOW_JS_15',l_mes15);
        apex_util.set_session_state('P1017_WORKFLOW_JS_16',l_mes16);
        apex_util.set_session_state('P1017_WORKFLOW_JS_17',l_mes17);
        apex_util.set_session_state('P1017_WORKFLOW_JS_18',l_mes18);
        apex_util.set_session_state('P1017_WORKFLOW_JS_19',l_mes19);
        apex_util.set_session_state('P1017_WORKFLOW_JS_20',l_mes20);
        apex_util.set_session_state('P1017_WORKFLOW_JS_21',l_mes21);
        apex_util.set_session_state('P1017_WORKFLOW_JS_22',l_mes22);
        apex_util.set_session_state('P1017_WORKFLOW_JS_23',l_mes23);
        apex_util.set_session_state('P1017_WORKFLOW_JS_25',l_mes25);
        apex_util.set_session_state('P1017_WORKFLOW_JS_26',l_mes26);

  -- Button add children Javascript on Page 17/Dynamic Action DA_AddChildren
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_btn_add_children
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\DA_ChildrenAdded\Action_Seq10\1';
      EXCEPTION
        WHEN OTHERS THEN
          l_btn_add_children := null;
      END;

        apex_util.set_session_state('P1017_BUTTON_ADD_CHILDREN',l_btn_add_children);

  --Javascript AbisFunction.js
     BEGIN
       SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_af1
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\AbisFunction_js\1';
      EXCEPTION
        WHEN OTHERS THEN
          l_af1 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_af2
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\AbisFunction_js\2';
      EXCEPTION
        WHEN OTHERS THEN
          l_af2 := null;
      END;

        apex_util.set_session_state('P1017_ABIS_FUNCTION_JS_1',l_af1);
        apex_util.set_session_state('P1017_ABIS_FUNCTION_JS_2',l_af2);

  --Javascript CutOutPhoto.js
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_cop1
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\CutOutPhoto_js\1';
      EXCEPTION
        WHEN OTHERS THEN
          l_cop1 := null;
      END;

        apex_util.set_session_state('P1017_CUT_OUT_PHOTO_JS_1',l_cop1);

  --Javascript FingerprintManagement.js
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm1
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\1';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm1 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm2
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\2';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm2 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm3
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\3';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm3 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm4
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\4';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm4 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm5
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\5';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm5 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm6
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\6';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm6 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm7
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\7';
       EXCEPTION
        WHEN OTHERS THEN
          l_fm7 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm8
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\8';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm8 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm9
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\9';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm9 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm10
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\10';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm10 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm11
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\11';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm11 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_fm12
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\FingerprintManagement_JS\12';
      EXCEPTION
        WHEN OTHERS THEN
          l_fm1 := null;
      END;

        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_1',l_fm1);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_2',l_fm2);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_3',l_fm3);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_4',l_fm4);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_5',l_fm5);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_6',l_fm6);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_7',l_fm7);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_8',l_fm8);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_9',l_fm9);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_10',l_fm10);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_11',l_fm11);
        apex_util.set_session_state('P1017_FINGERPRINT_MANAGEMENT_JS_12',l_fm12);

  --LiveFaceVerifyManagement.js
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_lfvm1
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\LiveFaceVerifyManagement_JS\1';
      EXCEPTION
        WHEN OTHERS THEN
          l_lfvm1 := null;
      END;

        apex_util.set_session_state('P1017_LIVE_FACE_VERIFY_MANAGEMENT_JS_1',l_lfvm1);

  --Javascript PassportManagement.js
      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_pm1
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\PassportManagement_JS\1';
     EXCEPTION
        WHEN OTHERS THEN
          l_pm1 := null;
      END;

      BEGIN
        SELECT
            nvl(message_value,message_value$dlc)
        INTO
            l_pm2
        FROM
            dl_common.messages$lc
        WHERE
            message_key = 'BMBS\17\PassportManagement_JS\2';
      EXCEPTION
        WHEN OTHERS THEN
          l_pm2 := null;
      END;

        apex_util.set_session_state('P1017_PASSPORT_MANAGEMENT_JS_1',l_pm1);
        apex_util.set_session_state('P1017_PASSPORT_MANAGEMENT_JS_2',l_pm2);
    END;

END;
/
  GRANT EXECUTE ON "DL_BORDERCONTROL"."PKG_MESSAGES" TO "DERMALOG_PROXY";
