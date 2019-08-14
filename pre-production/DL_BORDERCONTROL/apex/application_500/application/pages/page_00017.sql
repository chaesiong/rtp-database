prompt --application/pages/page_00017
begin
wwv_flow_api.create_page(
 p_id=>17
,p_user_interface_id=>wwv_flow_api.id(563846918365049635)
,p_name=>'Passport Management'
,p_alias=>'PASSPORT_CHECK'
,p_page_mode=>'NORMAL'
,p_step_title=>'Passport Management'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_step_sub_title_type=>'TEXT_WITH_SUBSTITUTIONS'
,p_first_item=>'NO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#WORKSPACE_IMAGES#underscore-min.js',
'#WORKSPACE_IMAGES#PostLimiter.js',
'#WORKSPACE_IMAGES#ApexConfirm.js',
'#WORKSPACE_IMAGES#moment.js',
'#WORKSPACE_IMAGES#oridomi.min.js',
'#WORKSPACE_IMAGES#jquery.ambiance.js',
'#WORKSPACE_IMAGES#jquery-asPieProgress.js',
'#WORKSPACE_IMAGES#jquery.mask.min.js',
'#WORKSPACE_IMAGES#fotorama.js',
'#WORKSPACE_IMAGES#jquery.ui.droppable.min.js',
'#WORKSPACE_IMAGES#jquery.blockUI.js',
'#WORKSPACE_IMAGES#jquery.knob.js',
'#WORKSPACE_IMAGES#knobfunction.js',
'#WORKSPACE_IMAGES#jqmeter-fixed.js',
'#WORKSPACE_IMAGES#Layout.js',
'#WORKSPACE_IMAGES#cropper.min.js',
'',
'#WORKSPACE_IMAGES#Logging.js',
'#WORKSPACE_IMAGES#jQueryRotate.js',
'#WORKSPACE_IMAGES#GenericFunctions.js',
'#WORKSPACE_IMAGES#Dermalog.Plugins.js',
'#APP_IMAGES#Dermalog.DeviceProviderWebPlugin.js',
'#APP_IMAGES#BioScreenDisplayControl.js',
'#APP_IMAGES#FingerprintManagement.js',
'#APP_IMAGES#ABIS.js',
'#APP_IMAGES#PassportManagement.js',
'#WORKSPACE_IMAGES#FaceVerifyManagement.js',
'#APP_IMAGES#usersettings.js',
'#APP_IMAGES#LiveFaceVerifyManagement.js',
'#WORKSPACE_IMAGES#SecurityImages.js',
'#APP_IMAGES#Webcam.js',
'#APP_IMAGES#Workflow.js',
'#WORKSPACE_IMAGES#shortcut.js',
'#WORKSPACE_IMAGES#CutOutPhoto.js',
'#WORKSPACE_IMAGES#analogclock.js',
'#APP_IMAGES#jquery.zoom.fixed.js',
'#WORKSPACE_IMAGES#dermmeter.js',
'#WORKSPACE_IMAGES#AbisFunctions.js',
'#APP_IMAGES#imagedata-thailady.js',
'',
'#APP_IMAGES#dynamicActionsPage17.js',
'#APP_IMAGES#fullscreen.js',
'#APP_IMAGES#imagetools.js',
'',
'#APP_IMAGES#bmbs.lang.mask.js',
'#APP_IMAGES#ICPO.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("RUNTIME: Global variable declaration - " + (new Date()));',
'disableHardwareStatusIcons = false;',
'releaseBBSDevices();',
'reportDeviceStatus();',
'',
'// to be used in ext js files',
'var BMBS_APP_USER_JS = "&APP_USER.";',
'',
'// execute on change events of items for validation / passport reload',
'function loadLookUpItems() {',
'    ',
'    // load data into items...',
'    apex.event.trigger("#P17_NATIONALITY", "checkNationality");',
'    apex.event.trigger("#P17_DISPLAY_DOCCLASS", "checkDisplayDocclass");',
'    apex.event.trigger("#P17_DISPLAY_DOCTYPE", "checkDisplayDoctype");',
'    apex.event.trigger("#P17_DISPLAY_DOCNUMBER", "checkDisplayDocNumber");',
'',
'    apex.event.trigger("#P17_DISPLAY_FIRSTNAME", "change");',
'    apex.event.trigger("#P17_DISPLAY_LASTNAME", "change");',
'    apex.event.trigger("#P17_DISPLAY_GENDER", "change");',
'    apex.event.trigger("#P17_DISPLAY_DOB_TEXT", "change");',
'    apex.event.trigger("#P17_TRAVELCARD_NO", "change");',
'    apex.event.trigger("#TRNSPRTUNITID", "change");',
'    apex.event.trigger("#P17_DATE_OF_ENTRY", "change");',
'    apex.event.trigger("#MOVEMENT_ENTRY_EXIT", "change");',
'    apex.event.trigger("#P17_VEHICLE_TYPE_D", "change");',
'    //apex.event.trigger("#P17_PROVINCE", "change");',
'    ',
'    /* M. Langer, 01.11.2018 the following line commend out, because on click "Process Manually" Problems occurent',
'      In Item "P17_VEHICLE_TYPE_D" set default value (look in the Itmen Default value) */',
'     //$("#P17_VEHICLE_TYPE_D").val($("#P17_VEHICLE_TYPE_D option:nth-child(2)").val()).trigger("change");',
'    ',
'    if ($("#P17_VEHICLE_TYPE_D option").length > 1 && $("#P17_VEHICLE_TYPE_D").val() == "") {',
'        $("#P17_VEHICLE_TYPE_D").val($("#P17_VEHICLE_TYPE_D option:nth-child(2)").val()).trigger("change");',
'    }',
'    ',
'    if ($(''#TRNSPRTUNITID'').val() == "") {',
'        let ai_last_trnsprtunitid = ''&AI_LAST_TRNSPRTUNITID.'', ai_transmode = ''&AI_TRANSPORT_MODE.'';',
'        if (!!ai_last_trnsprtunitid) $(''#TRNSPRTUNITID'').val(ai_last_trnsprtunitid).trigger("change").focus();',
'        else if (ai_transmode == "2") $(''#TRNSPRTUNITID'').val("WALK").trigger("change").focus();',
'    }',
'}',
'',
'/*var emptyList = {'''': ''''};',
'',
'GET_BC_DOC_TYPE_IDS = emptyList',
'    , GET_BC_DOC_TYPE_KEY_VALUES = emptyList',
'    , GET_VEHICLE_TYPE_IDS = emptyList',
'    , GET_VEHICLE_TYPE_KEY_VALUES = emptyList',
'    , GET_VISA_TYPE_IDS = emptyList',
'    , GET_VISA_TYPE_KEY_VALUES = emptyList',
'    , GET_NATIONALITY_KEY_VALUES = emptyList',
'    , GET_NATIONALITY_IDS = emptyList',
'    , GET_PERMIT_TYPE_IDS = emptyList',
'    , GET_PERMIT_TYPE_KEY_VALUES = emptyList;*/',
'',
'var noSupportMessage = "Your browser cannot support WebSocket!";',
'',
'PluginProtocol = ''&AI_WEBSOCKET_PROTOCOL.'';',
'',
'/*document.onkeydown = function(event) {',
'  if (event.keyCode == 113) {',
'    showObject(2,true);',
'  }',
'  if (event.keyCode == 115) {',
'    showObject(3,true);',
'  }',
'  if (event.keyCode == 119) {',
'    apex.event.trigger(document,''submitItems'');  ',
'    showObject(4,true);',
'  }',
'  if (event.keyCode == 120) {',
'    showObject(7,true);',
'  }',
'  if (event.keyCode == 16) {',
'    showObject(8,true);',
'  }',
'}*/',
'',
'function regionToJson() {',
'    return {',
'        demographic: {',
'            firstname: "first name"',
'            ,surname: "sur name"',
'            ,dateOfBirth: "2001-02-03T00:00:00.000Z"',
'            ,placeOfBirth: "place of birth"',
'            ,passportNumber: "passno"',
'            ,passportExpiryDate: "2099-12-31T00:00:00.000Z"',
'            ,sex: "female"',
'            ,nationality: "KHM"',
'            ,passportIssuingCountry: "KHM"',
'        }',
'        ,biometric: {',
'            fingerprints: []',
'            ,faces: []',
'        }',
'    };',
'}',
'',
'var deviceProvidersLF10 = new DeviceProviderPlugin(0, null, null, function() {});',
'var deviceProvidersWebCam = new DeviceProviderPlugin(0, null, null, function(sender, data) {',
'    if (data.State == "config.provider") {',
'        var cfg = JSON.parse(data.ProviderConfig.Config);',
'        console.log("WEBCAM-CONFIG:", cfg);',
'        if (!cfg.EnableAdaptiveExposure || !cfg.EnablePTZControl) {',
'            cfg.EnableAdaptiveExposure = true;',
'            cfg.EnablePTZControl = true;',
'            var cfgText = JSON.stringify(cfg);',
'            console.log("WEBCAM-CONFIG-New:", cfgText);',
'            deviceProvidersWebCam.configUpdate("Webcam", "json", cfgText, true);',
'        }',
'    }',
'});',
'//deviceProvidersLF10.connect();',
'deviceProvidersWebCam.connect();',
'',
'setTimeout(function() {',
'    deviceProvidersWebCam.providerConfig("Webcam", "json");',
'}, 5000);',
'',
'var sleep = function() {',
'    var req = new XMLHttpRequest();',
'    req.open("GET", "http://127.0.0.1/non-existent-path", false); // sleeps ~1s',
'    req.send(null);',
'};',
'',
'var isSaveMovementActive = false;',
'window.onbeforeunload = function() { ',
'    //console.log("unload:"+document.activeElement.id);',
'    ShowSpinner();',
'    stopFingerscanner(); stopCamera();',
'    showObject(1, false);',
'    /*if (!(isSaveMovementActive)) { ',
'        //console.log("in unload: clear");',
'        //executePageProcess("Clear_All_Page_Items", [], function() {});',
'        //executePageProcess("Clear_All_Session_Bag", [], function() {});',
'    }',
'    //sleep();',
'    deviceProvidersWebCam.destroyProvider("Webcam");',
'    deviceProvidersLF10.destroyProvider("LF10");*/',
'    //sleep();',
'};',
'',
'function setLoadingBarProgress(color1, color2, progress)',
'{',
'    //$(''#scan_progress_bar'').css(''background-image'',''-webkit-linear-gradient(left, ''+color1+'', ''+color2+'' ''+ progress + ''%, transparent ''+ (progress+5) + ''%, transparent 100%)'');',
'    $(''#SCAN_PROGRESS_BAR'').css(''background-image'',''-webkit-linear-gradient(left, #81bb5f, #81bb5f ''+ progress + ''%, transparent ''+ (progress) + ''%, transparent 100%)'');',
'    $("#SCAN_PROGRESS_BAR").text(Math.round(progress) + ''%'');',
'}',
'',
'//Loading Bar for PassPort Reader Progress//',
'loadingEngine = {progress: 0, state: ''idle'', dataCount: 0, processing: false};',
'',
'function updateLoadingBar(readerStatus)',
'{',
'    //console.log(readerStatus);',
'    ',
'    if(readerStatus.Message === ''Start scan'' || readerStatus.State === ''scannerstarted'')',
'    {',
'        $("#passport_placeholder").hide();',
'        showDisplayWorkflow();',
'        loadingEngine = {progress: 0, state: ''started'', dataCount: 0, processing: false};',
'        setLoadingBarProgress(''#e29a9a'',''#9ae2aa'',loadingEngine.progress);',
'        //ShowSpinner();',
'        //$("#Passdata").addClass("input-disabled");',
'        $("#Passdata").find("input[type=text],select,a,button,textarea").prop("disabled", true);',
'    }',
'    else if(readerStatus.State === ''message'' && loadingEngine.state === ''started'')',
'    {',
'        //console.log(readerStatus);',
'        if(readerStatus.MessageType === ''Progress'')',
'        {',
'            loadingEngine.dataCount += 1;',
'            ',
'            if(!loadingEngine.processing)',
'            {',
'                loadingEngine.progress += 1;',
'            }',
'            else',
'            {',
'                var lvl = Number(readerStatus.Message);',
'                ',
'                var add = lvl - loadingEngine.progress;',
'                if(add > 10) add = 10;',
'                ',
'                if(lvl > loadingEngine.progress && (lvl+add) <= 70) ',
'                {',
'                    loadingEngine.progress += add;',
'                }',
'                else',
'                {',
'                    //90,97,99',
'                    if(loadingEngine.progress <= 80) loadingEngine.progress += 1;',
'                    else if(loadingEngine.progress <= 85) loadingEngine.progress += 0.5;',
'                    else if(loadingEngine.progress <= 98) loadingEngine.progress += 0.1;',
'                }',
'            }',
'        }',
'        else if(readerStatus.MessageType === ''StartProcessing'')',
'        {',
'            loadingEngine.processing = true;',
'        }',
'        else',
'        {',
'            if(loadingEngine.progress <= 50) loadingEngine.progress += 1',
'        }',
'        setLoadingBarProgress(''#e29a9a'',''#9ae2aa'',loadingEngine.progress);',
'        console.log(loadingEngine.progress);',
'    }    ',
'    else if(readerStatus.State === ''passport'')',
'    {',
'        console.log(''passport'');',
'        if(loadingEngine.dataCount > 0)',
'        {',
'            loadingEngine.state = ''finished'';',
'            setLoadingBarProgress(''#51915f'',''#9ae2aa'', 100);',
'        }',
'        else',
'        {',
'            loadingEngine.state = ''failed'';',
'            setLoadingBarProgress(''#aa3d3d'',''#f77e7e'', 100);',
'        }',
'        loadingEngine.progress = 100;',
'        HideSpinner();',
'        //$("#Passdata").removeClass("input-disabled");',
'        $("#Passdata").find("input[type=text],select,a,button,textarea").prop("disabled", false);',
'        ',
'        // 28.05.2018: C.Hagemann    Added MRZ Validation Info to Fields as this is not executed after changes in page progress',
'        applyMrzValidationInfo();',
'    }',
'    // 28.05.2018: C.Hagemann    Added image readerState --> missing state handling caused endless loadingSpinner',
'    else if(readerStatus.State === ''image'') ',
'    {',
'        console.log("updateLoadingBa: Scanned document is an image");',
'        loadingEngine.progress = 100;',
'        $("#Passdata").find("input[type=text],select,a,button,textarea").prop("disabled", false);',
'        HideSpinner();',
'    }',
'}',
'',
'let __pauseTrace = function(duration) { };',
'',
'(function() {',
'    let timer = null;',
'    __pauseTrace = function(duration) {',
'        return new Promise(function(done) {',
'            (v_pluginWebcam || v_primaryWebcam).Plugin().sendJson({ Command: "enable_trace", EnableTrace: false }).then(function() {',
'                done();',
'                if (!!timer) {',
'                    window.clearTimeout(timer);',
'                    timer = null;',
'                }',
'                timer = window.setTimeout(function() {',
'                    (v_pluginWebcam || v_primaryWebcam).Plugin().sendJson({ Command: "enable_trace", EnableTrace: true });',
'                }, duration);',
'            });',
'        });',
'    };',
'}());',
'',
'function sendCameraCommand(command) {',
'    // M. Langer, 13.02.2019 DISABLE Camera Trace function when control Camera',
'   /* __pauseTrace(500).then(function() {',
'        (v_pluginWebcam || v_primaryWebcam).Plugin().sendJson({ Command: command });',
'    }, function() { }); */',
'    ',
'    // M. Stephan, 2019-03-21 Synchronize camera actions with automatic person tracking button',
'    /*(v_pluginWebcam || v_primaryWebcam).Plugin().sendJson({ Command: "enable_trace", EnableTrace: false }).done(function(){',
'            (v_pluginWebcam || v_primaryWebcam).Plugin().sendJson({ Command: command });',
'    });*/',
'    stopCameraTrace();',
'    (v_pluginWebcam || v_primaryWebcam).Plugin().sendJson({ Command: command });',
'}',
'',
'function sendCmdRight() {',
'    sendCameraCommand("panRight");',
'/*            var command = "panRight";',
'            v_pluginWebcam.Plugin().sendJson({ Command: command });*/',
'}',
'',
'function sendCmdLeft() {',
'    sendCameraCommand("panLeft");',
'/*            var command = "panLeft";',
'            v_pluginWebcam.Plugin().sendJson({ Command: command });*/',
'}',
'',
'function sendCmdUp() {',
'    sendCameraCommand("tiltUp");',
'/*		    var command = "tiltUp";',
'		    v_pluginWebcam.Plugin().sendJson({ Command: command });*/',
'}',
'',
'function sendCmdDown() {',
'    sendCameraCommand("tiltDown");',
'/*            var command = "tiltDown";',
'		    v_pluginWebcam.Plugin().sendJson({ Command: command });*/',
'}',
'',
'function SameValues(id1, id2){',
'    return $(''#''+id1).val() == $(''#''+id2).val();',
'}',
'',
'',
'var fadeInValue = 0.2;',
'var fadeOffValue = 0.2;',
'var fadeSpeed = 200;',
'',
'',
'/*function blinker() {',
'    $(''.blink_me'').fadeOut(1000);',
'    $(''.blink_me'').fadeIn(300);',
'}*/',
'',
'',
'var URL_PLACEHOLDER_PERSON = "#WORKSPACE_IMAGES#person.svg";',
'var URL_PLACEHOLDER_PERSON_NOASPECT = "#WORKSPACE_IMAGES#person_noaspect.svg";',
'var URL_PLACEHOLDER_QUESTIONMARK = "#APP_IMAGES#questionmark_blue.svg";',
'var PARAMETER_NO_BIOMETRIC_CAPTURING = &AI_NO_BIOMETRIC_CAPTURING.;',
'var PARAMETER_DEFAULT_SCAN_TC = &AI_DEFAULT_SCAN_TC.;',
'var PARAMETER_DEFAULT_SCAN_VISA = &AI_DEFAULT_SCAN_VISA.;',
'',
'var AI_MUST_CONFIRM_RESET = ''&AI_MUST_CONFIRM_RESET.'';',
'var lastPibicsConnRequest;',
'',
'',
'if (''&AI_DEFAULT_DIRECTION.'' == ''0'' && ''&APP_PAGE_ID.'' == ''17'' ) {',
'	//$(''head'').append(''<style type="text/css">.t-Header-logo, .t-Header-navBar {background-color: #65090a !important;} .t-Body-main {background: linear-gradient(to bottom, #65090a, #24182d 100%);} .t-Header-branding {max-height: 40px}</style>'');',
'	/*$(".t-Header-logo").css("background-color", "#65090a !important");',
'	$(".t-Header-navBar").css("background-color", "#65090a !important");',
'	$(".t-Body-main").css("background", "linear-gradient(to bottom, #65090a, #24182d 100%)");',
'	$(".t-Header-branding").css("max-height", "40px");*/',
'}',
'',
'console.log("RUNTIME: Global variable declaration done - " + (new Date()));',
'',
'(function($) {',
'     $.fn.blinkElement = function(delay,duration){',
'         duration = duration || 300;',
'         var elem = $(this);',
'         elem.delay(delay).animate({opacity:0.1},duration,''linear'',',
'             function(){',
'                 elem.animate({opacity:1},duration,''linear'');',
'                 elem.delay(duration).blinkElement(delay);',
'         });	',
'     };',
'})(jQuery);  ',
'',
'',
'var mes1 = v_translation["Workflow_js/1"];',
'var mes2 = v_translation["Workflow_js/2"];',
'var mes3 = v_translation["Workflow_js/3"];',
'var mes4 = v_translation["Workflow_js/4"];',
'var mes5 = v_translation["Workflow_js/5"];',
'var mes6 = v_translation["Workflow_js/6"];',
'var mes7 = v_translation["Workflow_js/7"];',
'var mes8 = v_translation["Workflow_js/8"];',
'var mes9 = v_translation["Workflow_js/9"];',
'var mes10 = v_translation["Workflow_js/10"];',
'var mes11 = v_translation["Workflow_js/11"];',
'var mes12 = v_translation["Workflow_js/12"];',
'var mes13 = v_translation["Workflow_js/13"];',
'var mes14 = v_translation["Workflow_js/14"];',
'var mes15 = v_translation["Workflow_js/15"];',
'var mes16 = v_translation["Workflow_js/16"];',
'var mes17 = v_translation["Workflow_js/17"];',
'var mes18 = v_translation["Workflow_js/18"];',
'var mes19 = v_translation["Workflow_js/19"];',
'var mes20 = v_translation["Workflow_js/20"];',
'var mes21 = v_translation["Workflow_js/21"];',
'var mes22 = v_translation["Workflow_js/22"];',
'var mes23 = v_translation["Workflow_js/23"];',
'var mes32 = v_translation["Workflow_js/24"];',
'var mes33 = v_translation["Workflow_js/26"];',
'var mes34 = v_translation["Workflow_js/25"];',
'/*',
'var mes1 = ''&P1017_WORKFLOW_JS_1.'';',
'var mes2 = ''&P1017_WORKFLOW_JS_2.'';',
'var mes3 = ''&P1017_WORKFLOW_JS_3.'';',
'var mes4 = ''&P1017_WORKFLOW_JS_4.'';',
'var mes5 = ''&P1017_WORKFLOW_JS_5.'';',
'var mes6 = ''&P1017_WORKFLOW_JS_6.'';',
'var mes7 = ''&P1017_WORKFLOW_JS_7.'';',
'var mes8 = ''&P1017_WORKFLOW_JS_8.'';',
'var mes9 = ''&P1017_WORKFLOW_JS_9.'';',
'var mes10 = ''&P1017_WORKFLOW_JS_10.'';',
'var mes11 = ''&P1017_WORKFLOW_JS_11.'';',
'var mes12 = ''&P1017_WORKFLOW_JS_12.'';',
'var mes13 = ''&P1017_WORKFLOW_JS_13.'';',
'var mes14 = ''&P1017_WORKFLOW_JS_14.'';',
'var mes15 = ''&P1017_WORKFLOW_JS_15.'';',
'var mes16 = ''&P1017_WORKFLOW_JS_16.'';',
'var mes17 = ''&P1017_WORKFLOW_JS_17.'';',
'var mes18 = ''&P1017_WORKFLOW_JS_18.'';',
'var mes19 = ''&P1017_WORKFLOW_JS_19.'';',
'var mes20 = ''&P1017_WORKFLOW_JS_20.'';',
'var mes21 = ''&P1017_WORKFLOW_JS_21.'';',
'var mes22 = ''&P1017_WORKFLOW_JS_22.'';',
'var mes23 = ''&P1017_WORKFLOW_JS_23.'';',
'var mes32 = ''&P1017_WORKFLOW_JS_24.'';',
'*/',
'var button_lable = ''&P1017_BUTTON_ADD_CHILDREN.'';',
'var mes24 = ''&P1017_FINGERPRINT_M_JS_1.'';',
'var mes25 = ''&P1017_FINGERPRINT_M_JS_2.'';',
'var mes26 = ''&P1017_FINGERPRINT_M_JS_3.'';',
'var mes27 = ''&P1017_FINGERPRINT_M_JS_4.'';',
'var mes28 = ''&P1017_FINGERPRINT_M_JS_5.'';',
'var mes29 = ''&P1017_FINGERPRINT_M_JS_6.'';',
'var mes30 = ''&P1017_FINGERPRINT_M_JS_7.'';',
'var mes31 = ''&P1017_FINGERPRINT_M_JS_8.'';',
'',
'',
'',
'/*',
'$(".apex-item-text,.apex-item-select,.apex-item-textarea").each(function(idx, elem) {',
'    let $elem = $(elem);',
'    let id = $elem.attr("id");',
'    if (id) {',
'        $s(id, $elem.val());',
'    }',
'});',
'*/',
'',
'//$("#P17_PERMIT_DAYS_USED,#P17_PERMIT_DAYS_TOTAL,#P17_PERMIT_EXPIRY").prop("disabled", true).addClass("apex_disabled");',
'$("#P17_PERMIT_DAYS_USED,#P17_PERMIT_DAYS_TOTAL").prop("disabled", true).addClass("apex_disabled");',
'',
'setInterval(() => { $(".autovalidatedatepicker_invalid").addClass("apex-page-item-error"); $(".autovalidatedatepicker_valid").removeClass("apex-page-item-error"); }, 250);',
'',
'',
'iconUrl = {',
'    fingerprint: ''#WORKSPACE_IMAGES#icon-fingerprint.svg''',
'    , webcam: ''#WORKSPACE_IMAGES#icon-webcam.svg''',
'    , passport: ''#WORKSPACE_IMAGES#icon-passport.svg''',
'};',
'',
'',
'function setBmBSLookupTypeItems(a, ev){',
'    if ( $(a).val() == "" || $(a).attr(''maxlength'') == "" || $(a).val().length == $(a).attr(''maxlength'') ) {',
'        setTimeout(function() {',
'            console.log(''KeyRelease on lookup item '' + $(a).attr("id") + '':'' + $(a).val());',
'            $(a).trigger("change");',
'        }, 2);',
'    }',
'}',
'',
'',
'function toggleAllFingers() {',
'    toggleFingerMissing(1, "onclick");',
'    toggleFingerMissing(2, "onclick");',
'    toggleFingerMissing(3, "onclick");',
'    toggleFingerMissing(4, "onclick");',
'    toggleFingerMissing(5, "onclick");',
'    toggleFingerMissing(6, "onclick");',
'    toggleFingerMissing(7, "onclick");',
'    toggleFingerMissing(8, "onclick");',
'    toggleFingerMissing(9, "onclick");',
'    toggleFingerMissing(10, "onclick");',
'}',
'',
'',
'function toggleBmBSRequiredFields(e, r, t) {',
'    //e:elem; r:isRequired(boolean); t:triggerChange(boolean)',
'    console.log("toggleBmBSRequiredFields: " + e);',
'    let $e = $("#" + e), $c = $("#" + e + "_CONTAINER");',
'    if ($c.length) $c.removeClass("is-required").addClass(r ? "is-required" : "");',
'    if (t === true && $e.length && !$e.is('':hidden'') && !$e.is('':disabled'')) $e.trigger("change");',
'}',
'',
'',
'var getBmBSFocusableItems = function() {',
'    var focusable = $(''#Passdata'').find(''input,select,button,textarea'').filter('':visible:not([disabled]):not([tabindex^="-"])'');',
'    if (focusable.index($("#P17_BTN_FIND_MANUALLY")) != -1) focusable.splice(focusable.index($("#P17_MANUAL_EXPIRYDATE")) + 1, 0, focusable.splice(focusable.index($("#P17_BTN_FIND_MANUALLY")), 1)[0]);',
'    return focusable;',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("RUNTIME: On page load - " + (new Date()));',
'$("#R132374931714191231_control_panel").hide();',
'$("#REG_TODO").hide();',
'$("#REG_LOGGING").slideToggle(200);',
'',
'console.log("RUNTIME: 1 - " + (new Date()));',
'',
'function connectWebCam() {',
'			conStream = new WebCamPlugin(0, "status", appendMessage, responseWebcamStream);',
'			conStream.connect().done(',
'				function (data) {',
'					if (data.Result == 0) {',
'						conStream.connectDevice().done(',
'							function (data) {',
'								conStream.startDevice();',
'							}',
'						);',
'					}',
'				});	    ',
'		}',
'',
'//connectWebCam();',
'',
'',
'if ($v(''VISA_SCANNED'') == ''1'') {',
'	initializeRotateZoom($("#visa_to_zoom"), 200);//$(''#visa_to_zoom'').zoom(/*{ on:''click'' }*/);',
'} else {',
'	$s(''VISA_SCANNED'', 0);',
'}',
'if ($v(''LANDCARD_SCANNED'') == ''1'') {',
'	initializeRotateZoom($("#lc_to_zoom"), 200);//$(''#lc_to_zoom'').zoom(/*{ on:''click'' }*/);',
'} else {',
'	$s(''LANDCARD_SCANNED'', 0);',
'}',
'',
'console.log("RUNTIME: 2 - " + (new Date()));',
'',
'',
'',
'/*$(''#lc_to_zoom'').zoom({ on:''click'' });',
'$(''#visa_to_zoom'').zoom({ on:''click'' });*/',
'',
'// initialise layout',
'init_layout();',
'',
'$(".show_when_dataentered").hide();',
'',
'console.log("RUNTIME: 3 - " + (new Date()));',
'',
'// take over Parameter ',
'PARAMETER_ABIS_PREFIX = ''&AI_ABIS_PREFIX.'';',
'PARAMETER_REST_PREFIX = ''&AI_REST_PREFIX.'';',
'PARAMETER_PASSREADER = ''&AI_PASSPORTREADER.'';',
'PARAMETER_RED_IMAGE = "#APP_IMAGES#red_x.png";',
'PARAMETER_WHITE_IMAGE = "#APP_IMAGES#white.png";',
'PARAMETER_GREEN_IMAGE = "#WORKSPACE_IMAGES#finger_empty.png";',
'PARAMETER_APP_IMAGES = "#APP_IMAGES#";',
'PARAMETER_ANIMATIONIN = ''&AI_PARAMETER_ANIMATIONIN.'';',
'PARAMETER_ANIMATIONOUT = ''&AI_PARAMETER_ANIMATIONOUT.'';',
'PARAMETER_LOG = ''&AI_PARAMETER_LOG.'';',
'PARAMETER_FP_CROSSCHECK_THRESHOLD = &AI_FP_THRESHOLD_VER.;',
'PARAMETER_MIN_FINGER_MATCHES = &AI_MIN_FINGER_MATCHES.;',
'PARAMETER_FACE_THRESHOLD = &AI_FACE_THRESHOLD_VER.;',
'PARAMETER_COMPRESSION_LEVEL = Math.max(1, 0&AI_COMPRESSION_LEVEL.);',
'console.log("Compression-level: " + PARAMETER_COMPRESSION_LEVEL);',
'',
'//PARAMETER_NO_BIOMETRIC_CAPTURING = ''&AI_NO_BIOMETRIC_CAPTURING.'';',
'',
'/*FP_THRESHOLD_1 = Math.min(&AI_FP_THRESHOLD_1., &AI_FP_THRESHOLD_2.);',
'FP_THRESHOLD_2 = Math.max(&AI_FP_THRESHOLD_1., &AI_FP_THRESHOLD_2.);*/',
'',
'FACE_THRESHOLD_1 = &AI_FACE_THRESHOLD_1.;',
'FACE_THRESHOLD_2 = &AI_FACE_THRESHOLD_2.;',
'',
'FP_LIVENESS_1 = parseInt(''0&AI_FP_LIVENESS_1.'');',
'FP_LIVENESS_2 = parseInt(''0&AI_FP_LIVENESS_2.'');',
'',
'PARAMETER_FP_QUALITY = [0, &AI_FP_QUALITY_01., &AI_FP_QUALITY_02., &AI_FP_QUALITY_03., &AI_FP_QUALITY_04., &AI_FP_QUALITY_05., &AI_FP_QUALITY_06., &AI_FP_QUALITY_07., &AI_FP_QUALITY_08., &AI_FP_QUALITY_09., &AI_FP_QUALITY_10.];',
'',
'$("#REG_FINGERPRINTS_DETAIL").hide();',
'$("#REG_PASSPORT_DETAIL_DATA").hide();',
'$("#REG_SECIMAGES_DETAIL").hide();',
'$("#REG_PassportAnimation").show();',
'',
'/*collapse all hidden form labels*/',
'$(''.t-Form-labelContainer--hiddenLabel.col-3'').removeClass(''col-3'');',
'console.log("RUNTIME: 4 - " + (new Date()));',
'',
'$(''.pie_progress'').asPieProgress({',
'            ''namespace'': ''pie_progress''',
'});',
'',
'console.log("RUNTIME: 5 - " + (new Date()));',
'var $fotoramaDiv = $(''#fotorama'').fotorama();',
'console.log("RUNTIME: 6 - " + (new Date()));',
'',
'var fotorama = $fotoramaDiv.data(''fotorama'');',
'console.log("RUNTIME: 7 - " + (new Date()));',
'',
'if ($(''#PASS_VISUALPAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_VISUALPAGE'').attr(''src''), thumb: $(''#PASS_VISUALPAGE'').attr(''src'')});',
'console.log("RUNTIME: 8 - " + (new Date()));',
'if ($(''#PASS_AXIAL_IMAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_AXIAL_IMAGE'').attr(''src''), thumb: $(''#PASS_AXIAL_IMAGE'').attr(''src''), caption: ''Data Page (Axial Light)''});',
'console.log("RUNTIME: 9 - " + (new Date()));',
'if ($(''#PASS_UVPAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_UVPAGE'').attr(''src''), thumb: $(''#PASS_UVPAGE'').attr(''src''), caption: ''Data Page (UV Light)''});',
'console.log("RUNTIME: 10 - " + (new Date()));',
'if ($(''#PASS_IRPAGE'').length > 0)',
'fotorama.push({img: $(''#PASS_IRPAGE'').attr(''src''), thumb: $(''#PASS_IRPAGE'').attr(''src''), caption: ''Data Page (IR Light)''});',
'console.log("RUNTIME: 11 - " + (new Date()));',
'',
'if ($(''#PASS_ICAO_FACE2'').length > 0)',
'    fotorama.push({img: $(''#PASS_ICAO_FACE2'').attr(''src''), thumb: $(''#PASS_ICAO_FACE2'').attr(''src''), caption: ''Chip Photo (DG2)''});',
'console.log("RUNTIME: 12 - " + (new Date()));',
'if ($(''#PASS_VISUAL_FACE'').length > 0)',
'fotorama.push({img: $(''#PASS_VISUAL_FACE'').attr(''src''), thumb: $(''#PASS_VISUAL_FACE'').attr(''src''), caption: ''Cut-Out Photo''});',
'console.log("RUNTIME: 13 - " + (new Date()));',
'if ($(''#PASS_DG3_0'').length > 0)',
'fotorama.push({img: $(''#PASS_DG3_0'').attr(''src''), thumb: $(''#PASS_DG3_0'').attr(''src''), caption: ''First Fingerprint (DG3)''});',
'console.log("RUNTIME: 14 - " + (new Date()));',
'if ($(''#PASS_DG3_1'').length > 0)',
'fotorama.push({img: $(''#PASS_DG3_1'').attr(''src''), thumb: $(''#PASS_DG3_1'').attr(''src''), caption: ''Second Fingerprint (DG3)''});',
'console.log("RUNTIME: 15 - " + (new Date()));',
'',
'if ($(''#PASS_VISUALPAGE'').length > 0)',
'	$(''#SCI_1'')[0].src = $(''#PASS_VISUALPAGE'').attr(''src'');',
'if ($(''#PASS_UVPAGE'').length > 0)',
'	$(''#SCI_4'')[0].src = $(''#PASS_UVPAGE'').attr(''src'');',
'if ($(''#PASS_IRPAGE'').length > 0)',
'	$(''#SCI_7'')[0].src = $(''#PASS_IRPAGE'').attr(''src'');',
'',
'console.log("RUNTIME: 16 - " + (new Date()));',
'',
'',
'',
'//setInterval(blinker, 1000);',
'',
'var fotoramaIsFullscreen = false;',
'console.log("RUNTIME: 17 - " + (new Date()));',
'',
'$(''.fotorama'').on(''fotorama:fullscreenenter'', function() {',
'    fotoramaIsFullscreen = true;',
'}).on(''fotorama:fullscreenexit'', function() {',
'    fotoramaIsFullscreen = false;',
'}).on(''fotorama:load'', function (e, fotorama, data) {',
'  //if (data.index === 0) {',
'       $(''.fotorama__stage__shaft'').off().click(function() {',
'           if (fotoramaIsFullscreen) {',
'               return;',
'           }',
'           SCI_animate = true;',
'           shortcut.add(''esc'', function() {',
'               if (!animation_running) {',
'                   shortcut.remove(''esc'');',
'                   $(".CSS_ANIMATEBACK").trigger("click");',
'               }',
'           },{',
'               ''type'':''keydown'',',
'               ''propagate'':true,',
'               ''target'':document',
'           });',
'		animate_cell(''#REG_SECIMAGES_DETAIL'', ''#REG_LAYOUT_ROW_1'');',
'       });',
'  //}',
'});',
'',
'',
'',
'// setPassportScannerModeImageReader();',
'console.log("RUNTIME: 18 - " + (new Date()));',
'',
'$(window).trigger("resize");',
'console.log("RUNTIME: 19 - " + (new Date()));',
'',
'',
'if ($("#CELL_FINGERPRINTS").is(":visible")) {',
'    InitializeFingerprintCapturing();',
'}',
'',
'',
'console.log("RUNTIME: 20 - " + (new Date()));',
'',
'',
'/*(function() {',
'    var dob = $v(P17_DISPLAY_DOB_DISPLAY);',
'    var dobNumber = parseInt(dob.substr(8, 2) + dob.substr(3, 2) + dob.substr(0, 2));',
'    var now = new Date();',
'    var nowNumber = (now.getFullYear() % 100) * 10000 + (now.getMonth() + 1) * 100 + (now.getDate());',
'    var age = nowNumber - dobNumber;',
'    if (age < 0) {',
'        age += 1000000;',
'    }',
'    age = parseInt(age / 10000);',
'    $("#person_age").text(age);',
'    ',
'    var expiryDate = $v(P17_DISPLAY_EXPIRYDATE_DISPLAY);',
'    var expiryNumber = parseInt(expiryDate.substr(8, 2) + expiryDate.substr(3, 2) + expiryDate.substr(0, 2));// / 100;',
'	var expiryYears = parseInt(expiryNumber / 10000) + (parseInt(expiryNumber / 100) % 100) / 12 + (expiryNumber % 100) / 360;',
'	var nowYears = parseInt(nowNumber / 10000) + (parseInt(nowNumber / 100) % 100) / 12 + (nowNumber % 100) / 360;',
'    var remaining = expiryYears - nowYears;',
'    var months = parseInt(remaining * 12);//parseInt(remaining / 100) * 12 + parseInt(remaining % 100);',
'    var sgn = (remaining < 0) ? "-" : "+";',
'    months = Math.abs(months);',
'    $("#document_months_remaining").text(sgn + months + " Month" + (months == 1 ? "" : "s")).addClass("animated infinite");',
'    if (remaining < 0) {',
'        $("#document_months_remaining").addClass("checkdigit_invalid bounce");',
'    }',
'})();*/',
'',
'validateExpiryDates();',
'',
'',
'/*$(".zoomImg").addClass("rotate90onclick");',
'initiateRotate90OnClick();*/',
'console.log("RUNTIME: 21 - " + (new Date()));',
'',
'$(".single_fp_detail_liveness").parent().parent()/*.parent()*/.hide();',
'',
'// make calendar buttons being skipped on pressing tab',
'$(".a-Button--calendar").attr("tabindex", "-1");',
'',
'',
'$("#REG_MANUAL_1").find(".t-Form-labelContainer").css("width", "45%");',
'$("#REG_MANUAL_1").find(".t-Form-inputContainer").css("width", "55%");',
'$("#REG_MANUAL_2").find(".t-Form-labelContainer").css("width", "45%");',
'$("#REG_MANUAL_2").find(".t-Form-inputContainer").css("width", "55%");',
'$("#REG_MANUAL_1").parent().css("width", "50%").css("margin-left", "-2%");',
'$("#REG_MANUAL_2").parent().css("width", "50%");',
'//$("#REG_MANUAL_1").parent().parent().find(".icon-asterisk").each(function(idx, elem) {',
'$("body").find(".icon-asterisk").each(function(idx, elem) {',
'	var cont = $(elem).hide().parent().parent().parent().parent().find(".t-Form-inputContainer");',
'	cont.find("input,select").each(function(idx, elem) {',
'		elem = $(elem);',
'		//elem.addClass("mandatory-field " + (elem.val().trim().length == 0 ? "mandatory-field-empty" : ""));',
'	});',
'});',
'$(".mandatory-field").change(function() {',
'	var elem = $(this);',
'	/*if (elem.val().trim().length == 0) {',
'		//elem.addClass("mandatory-field-empty");',
'	} else {',
'		//elem.removeClass("mandatory-field-empty");',
'	}*/',
'});',
'//$("#REG_MANUAL_2").find(".icon-asterisk").hide();',
'',
'',
'$("#MRZ_CONTAINER").parent().parent().css("overflow", "visible");',
'',
'console.log("RUNTIME: On page load done - " + (new Date()));',
'',
'',
'$("#BTN_ADD_CHILDREN").find(".t-Button-label").text( button_lable +" "+ $v(''P17_CHILD_COUNT''));',
'',
'$s("P17_SUPERVISOR_AUTHENTICATED", "0");',
'$s(''P17_WORKFLOW_PROBLEMS'', '''');',
'',
'',
'/*var btn = $("<button>");',
'$("#ID_REG_ShowWhenPassportNotRead").append(btn);',
'btn.css("position", "absolute").css("top", "0").text("Simulate Form Post").click(simulateFormPost);*/',
'',
'//$("#P17_SAVE_MOVEMENT").attr("style", "width: 217px;position: fixed;top: 680px;margin-left: 70px;").parent().css("overflow", "visible").parent().css("overflow", "visible").parent().css("overflow", "visible");',
'',
'if ($("#DG_DOCUMENTNUMBER").val() == "") {',
'    //connectWebSocket();',
'    showObject(1, true);',
'	(function() {',
'		var src = $("#FINGERPRINT_CONTAINER").html();',
'		var $src = $(src);',
'		$src.find("[id]").removeAttr("id");',
'		$src.find("input,select").attr("disabled", "disabled");',
'		var buttons = $src.find("button");',
'		buttons.each(function(idx, elem) { elem.onclick = null; });',
'		var p = $("#FP_PLACEHOLDER_2").parent();',
'		$("#FP_PLACEHOLDER_2").remove();',
'		var dst = $("<div>");',
'		for (var att, i = 0, atts = $("#FINGERPRINT_CONTAINER")[0].attributes, n = atts.length; i < n; i++){',
'			att = atts[i];',
'			if (att.nodeName != "id") {',
'				dst.attr(att.nodeName, att.nodeValue);',
'			}',
'		}',
'		dst.append($src.addClass("makegrayscale"));',
'		$(dst).find("[onclick]").removeAttr("onclick");',
'		$(dst).find("[onmousemove]").removeAttr("onmousemove");',
'		$(dst).find("[onmouseleave]").removeAttr("onmouseleave");',
'		$(dst).find("[id]").removeAttr("id");',
'		p.append(dst);',
'	})();',
'}else{',
'    //connectWebSocket();',
'    showObject(2, true);',
'}',
'',
'//initFaceCapture();',
'',
'',
'',
'$("input").attr("autocomplete", "off");',
'//$s("P17_DISPLAY_DOCCLASS", "");',
'',
'apex.server.process("GET_BC_DOC_TYPE_IDS", ',
'{}, ',
'{',
'    success: function(pData) ',
'    {',
'        GET_BC_DOC_TYPE_IDS = pData[0];',
'        GET_BC_DOC_TYPE_KEY_VALUES = pData[1];',
'        GET_VEHICLE_TYPE_IDS = pData[2];',
'        GET_VEHICLE_TYPE_KEY_VALUES = pData[3];',
'        GET_NATIONALITY_IDS = pData[4];',
'        GET_NATIONALITY_KEY_VALUES = pData[5];',
'        GET_VISA_TYPE_IDS = pData[6];',
'        GET_VISA_TYPE_KEY_VALUES = pData[7];',
'        GET_PERMIT_TYPE_IDS = pData[8];',
'        GET_PERMIT_TYPE_KEY_VALUES = pData[9];',
'        GET_PROVINCE_IDS = pData[10];',
'        GET_PROVINCE_KEY_VALUES = pData[11];',
'        GET_NATIONALITY_PIB_IDS = pData[12];',
'        GET_DEPARTMENT_TYPE_IDS = pData[13];',
'        GET_DEPARTMENT_TYPE_KEY_VALUES = pData[14];',
'        GET_BC_DOC_TYPES = pData[15];',
'        ',
'        console.log(pData);',
'        ',
'        loadLookUpItems();',
'    }',
'});',
'',
'//apex.event.trigger(document, "validateFlightNum");',
'apex.event.trigger(document, "checkPibicsConn");',
'',
'$("#P17_DISPLAY_EXPIRYDATE,#P17_DISPLAY_DOB_TEXT").on("change", function() {',
'    var dt = $(this).val();',
'    var target = $(this).attr("data-short-target");',
'    if (dt.length == 10 && $(this).hasClass("autovalidatedatepicker_valid") && $(this)) {',
'        $(target).val(dt.substr(8, 2) + dt.substr(3, 2) + dt.substr(0, 2));',
'    }',
'});',
'',
'/*setTimeout(function() {',
'    $("#P17_VEHICLE_TYPE_D").val($("#P17_VEHICLE_TYPE_D option:nth-child(2)").val()).trigger("change");',
'}, 250);',
'*/',
'',
'refreshDoE();',
'',
'$(".bmbs-class-lookup-type").keyup((el) => {',
'    setBmBSLookupTypeItems(el.target);',
'});',
'',
'$("#P17_IS_CREW_MEMBER_Y,#P17_IS_CREW_MEMBER_N").attr("tabindex", "-1");',
'',
'$(''#Passdata'').keydown((e) => {',
'  if (e.which === 13 && $.inArray(document.activeElement.tagName, ["INPUT", "SELECT", "BUTTON"]) != -1) {',
'    var self = $(document.activeElement), form = self.parents(''form:eq(0)''), focusable, selfIndex;',
'    focusable = getBmBSFocusableItems();',
'	selfIndex = focusable.index(self);',
'    ',
'    if (selfIndex != -1 && !focusable.eq(selfIndex + 1).is(''button'')) {',
'      e.preventDefault();',
'    }',
'    focusable.eq(selfIndex + (e.shiftKey ? -1 : 1)).focus().select();',
'  }',
'});',
'',
'$("#Passdata input,#Passdata textarea").filter('':not([tabindex^="-"])'').on(''focus'', function() { $(this).select(); });',
'',
'setInterval(function(){ apex.event.trigger(document, "checkSessionStatus"); }, 60000);',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#css/font-awesome.min.css',
'#WORKSPACE_IMAGES#ApexConfirm.css',
'#WORKSPACE_IMAGES#jquery.ambiance.css',
'#WORKSPACE_IMAGES#animate.css',
'#WORKSPACE_IMAGES#font-awesome-animation.min.css',
'#WORKSPACE_IMAGES#progress.css',
'#WORKSPACE_IMAGES#fotorama.css',
'#WORKSPACE_IMAGES#SecurityImages.css',
'#WORKSPACE_IMAGES#FingerprintManagement.css',
'#WORKSPACE_IMAGES#LiveFaceVerifyManagement.css',
'#APP_IMAGES#Layout.css',
'#WORKSPACE_IMAGES#spinner-blue.css',
'#WORKSPACE_IMAGES#analogclock.css',
'#WORKSPACE_IMAGES#cropper.min.css',
'#WORKSPACE_IMAGES#roboto.css'))
,p_step_template=>wwv_flow_api.id(840871881040466776)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(186479920031388043)
,p_overwrite_navigation_list=>'N'
,p_page_is_public_y_n=>'N'
,p_cache_mode=>'NOCACHE'
,p_help_text=>'No help is available for this page.'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20190724181925'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(38453348575068618)
,p_plug_name=>'Permit Information'
,p_region_name=>'dialogPermitInfo'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43028047236716805)
,p_plug_name=>'Re-Entry'
,p_region_name=>'REG_REENTRY'
,p_parent_plug_id=>wwv_flow_api.id(38453348575068618)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43028168154716806)
,p_plug_name=>'Extend Stay'
,p_region_name=>'REG_EXTENDSTAY'
,p_parent_plug_id=>wwv_flow_api.id(38453348575068618)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43031092684716835)
,p_plug_name=>'Request for Residence'
,p_region_name=>'REG_REQ4RESIDENCE'
,p_parent_plug_id=>wwv_flow_api.id(38453348575068618)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51443533025222501)
,p_plug_name=>'Endorsement'
,p_region_name=>'REG_ENDORSEMENT'
,p_parent_plug_id=>wwv_flow_api.id(38453348575068618)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119104596846171009)
,p_plug_name=>'Change Visa'
,p_region_name=>'REG_CHANGEVISA'
,p_parent_plug_id=>wwv_flow_api.id(38453348575068618)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(43028465480716809)
,p_plug_name=>'TEMP ONLY'
,p_region_name=>'dialogTempOnly'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108032987983098002)
,p_plug_name=>'Overstay Alert!'
,p_region_name=>'showOverstayInformation'
,p_region_css_classes=>'inline-dialog-width-x-large'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:t-Form--slimPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170739803948646626)
,p_plug_name=>'Overstay Alert'
,p_region_name=>'ALERT_OVERSTAY'
,p_parent_plug_id=>wwv_flow_api.id(108032987983098002)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Overstay alert for this person!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170739878678646627)
,p_plug_name=>'Overstay Items'
,p_parent_plug_id=>wwv_flow_api.id(108032987983098002)
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170739962170646628)
,p_plug_name=>'Overstay Alert (Extend Stay)'
,p_region_name=>'ALERT_OVERSTAY_EXTENDSTAY'
,p_parent_plug_id=>wwv_flow_api.id(108032987983098002)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'Overstay alert for this person! Extend stay has been exceeded!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170740029398646629)
,p_plug_name=>'Overstay Extendstay Items'
,p_region_name=>'OVERSTAY_EXTENDSTAY_INFO'
,p_parent_plug_id=>wwv_flow_api.id(108032987983098002)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<h3>Extend Stay</h3>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(128280688427666520)
,p_plug_name=>'Change Background Color'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(155986711780829728)
,p_plug_name=>'Crew Information'
,p_region_name=>'dialogCrewInformation'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>190
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(441446335424127537)
,p_plug_name=>'TM5 Info'
,p_region_name=>'REG_CREW_TM5_INFO'
,p_parent_plug_id=>wwv_flow_api.id(155986711780829728)
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:margin-top-md'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165604062391467935)
,p_plug_name=>'Watchlist Passport'
,p_region_name=>'dialogWatchlistPassport'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(165604297182467937)
,p_plug_name=>'Watchlist Passport'
,p_region_name=>'ALERT_PASSPORT_WATCHLIST'
,p_parent_plug_id=>wwv_flow_api.id(165604062391467935)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'This passport is on the Wanted List!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170550711073907630)
,p_plug_name=>'Residence Information'
,p_region_name=>'DLG_RESIDENCE_INFORMATION'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size720x480:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>180
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170737762805646606)
,p_plug_name=>'Endorsement Alert'
,p_region_name=>'ALERT_ENDORSEMENT_INVALID'
,p_parent_plug_id=>wwv_flow_api.id(170550711073907630)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'The endorsement is not valid!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170737900921646607)
,p_plug_name=>'Residence Fields'
,p_parent_plug_id=>wwv_flow_api.id(170550711073907630)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5173634440452838650)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_api.id(170737900921646607)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21423520632681821401)
,p_plug_name=>'Search Left'
,p_parent_plug_id=>wwv_flow_api.id(5173634440452838650)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21423520722189821402)
,p_plug_name=>'Search Right'
,p_parent_plug_id=>wwv_flow_api.id(5173634440452838650)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21423520854777821403)
,p_plug_name=>'Display'
,p_parent_plug_id=>wwv_flow_api.id(170737900921646607)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170738013794646608)
,p_plug_name=>'Endorsement Alert'
,p_region_name=>'ALERT_ENDORSEMENT_NOT_PRESENT'
,p_parent_plug_id=>wwv_flow_api.id(170550711073907630)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'No endorsement found for departure!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21423522000051821415)
,p_plug_name=>'Find Resident Report'
,p_region_name=>'dialogFindResidentReport'
,p_parent_plug_id=>wwv_flow_api.id(170550711073907630)
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21423522521628821420)
,p_plug_name=>'Find Resident Report'
,p_region_name=>'id-ir-find-resident-report'
,p_parent_plug_id=>wwv_flow_api.id(21423522000051821415)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	--',
'	''<span id="id-span-find-resident-report-'' || cert.certofresidence_seqno || ''-'' || tm13.tm13_seqno || ''" class="t-Icon fa fa-circle-o cl-span-find-resident-report icon-2x" aria-hidden="true" title="Click to Select" data-selection="'' || cert.rcno_pvcd'
||' || '':'' || TO_CHAR(cert.rcno_runningno) || '':'' || cert.rcno_year || '':'' || certtype.rescerttypecd || '':'' || cert.tfamilynm || '':'' || cert.tfirstnm || '':'' || cert.tmiddlenm || ''" data-selection-status="N"></span>''',
'    SELECT_TO_FIND',
'	--',
'	,cert.certofresidence_seqno',
'	,cert.rcno_pvcd || ''/'' || cert.rcno_runningno || ''/'' || cert.rcno_year AS RESIDENT_NO',
'	,certtype.rescerttypecd || '' - '' || certtype.rescerttypenm AS RESCERTTYPE',
'	,cert.tfirstnm',
'	,cert.tfamilynm',
'	,cert.tmiddlenm',
'	,cert.controlbook_no',
'	,tm13.tm13_seqno',
'	,tm13.tm13no',
'	,tm13.tm13year',
'	,tm13.rcissue_by',
'	,tm13.edmexp_date',
'	--',
'FROM dl_bordercontrol.v_crs_certofresidence cert',
'INNER JOIN dl_bordercontrol.v_crs_rescerttype certtype',
'ON certtype.rescerttype_seqno = cert.rescerttype_seqno',
'LEFT JOIN dl_bordercontrol.v_ednq_tm13 tm13',
'ON cert.rcno_pvcd = tm13.rcno_pvcd',
'AND cert.rcno_runningno = tm13.rcno_runnungno',
'AND cert.rcno_year = tm13.rcno_year',
'AND cert.rescerttype_seqno = tm13.rescerttype_seqno',
'AND tm13.tm13sts = ''A''',
'WHERE cert.crs_sts = ''A''',
'AND (TRIM(:P17_RI_RCNO_PVCD || :P17_RI_RCNO_RUNNINGNO || :P17_RI_RCNO_YEAR) IS NULL OR cert.rcno_pvcd || cert.rcno_runningno || cert.rcno_year = TRIM(:P17_RI_RCNO_PVCD || :P17_RI_RCNO_RUNNINGNO || :P17_RI_RCNO_YEAR))',
'AND (:P17_RI_RESIDENT_TYPE IS NULL OR certtype.rescerttypecd = :P17_RI_RESIDENT_TYPE)',
'AND (TRIM(:P17_RI_LAST_NAME) IS NULL OR UPPER(TRIM(REGEXP_REPLACE(cert.tfamilynm, ''\s{2,}'', '' ''))) = UPPER(TRIM(:P17_RI_LAST_NAME)))',
'AND ( TRIM(:P17_RI_FIRST_NAME) || TRIM(:P17_RI_MIDDLE_NAME) IS NULL OR UPPER(TRIM(REGEXP_REPLACE(cert.tfirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(cert.tmiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(cert.tmiddlenm, ''\s{2,}'', '' ''))), NULL) = UPPER(TRIM(:P17_'
||'RI_FIRST_NAME)) || NVL2(TRIM(:P17_RI_MIDDLE_NAME), '' '' || UPPER(TRIM(:P17_RI_MIDDLE_NAME)), NULL) )',
'--',
'AND CASE WHEN :REQUEST in (''CSV'', ''HTMLD'', ''PDF'') THEN ''Y'' ELSE :P17_FIND_RESIDENT_REPORT_LOAD END = ''Y''',
'--',
'ORDER BY cert.certofresidence_seqno DESC, tm13.tm13_seqno DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P17_RI_RCNO_PVCD,P17_RI_RCNO_RUNNINGNO,P17_RI_RCNO_YEAR,P17_RI_RESIDENT_TYPE,P17_RI_LAST_NAME,P17_RI_FIRST_NAME,P17_RI_MIDDLE_NAMEP17_FIND_RESIDENT_REPORT_LOAD'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(21423522653881821421)
,p_max_row_count=>'500'
,p_no_data_found_message=>'No Data Found.'
,p_max_rows_per_page=>'10'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>21423522653881821421
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423522778231821422)
,p_db_column_name=>'SELECT_TO_FIND'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Select'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423522851707821423)
,p_db_column_name=>'CERTOFRESIDENCE_SEQNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Certofresidence Seqno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423523475733821429)
,p_db_column_name=>'TFIRSTNM'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Tfirstnm'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423523521313821430)
,p_db_column_name=>'TFAMILYNM'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Tfamilynm'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423523608468821431)
,p_db_column_name=>'TMIDDLENM'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Tmiddlenm'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423523746964821432)
,p_db_column_name=>'CONTROLBOOK_NO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Controlbook No'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423523856010821433)
,p_db_column_name=>'TM13_SEQNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Tm13 Seqno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423523953612821434)
,p_db_column_name=>'TM13NO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Tm13no'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423524085879821435)
,p_db_column_name=>'TM13YEAR'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Tm13year'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423524197224821436)
,p_db_column_name=>'RCISSUE_BY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Rcissue By'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423524218098821437)
,p_db_column_name=>'EDMEXP_DATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Edmexp Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423525378291821448)
,p_db_column_name=>'RESIDENT_NO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Resident no'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(21423525403838821449)
,p_db_column_name=>'RESCERTTYPE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Rescerttype'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(21423628346436005031)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'214236284'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'SELECT_TO_FIND:CERTOFRESIDENCE_SEQNO:RCNO_YEAR_SEQNOCD:TFIRSTNM:TFAMILYNM:TMIDDLENM:CONTROLBOOK_NO:TM13_SEQNO:TM13NO:TM13YEAR:RCISSUE_BY:EDMEXP_DATE:RESIDENT_NO:RESCERTTYPE'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170738027701646609)
,p_plug_name=>'Void Passport'
,p_region_name=>'dialogVoidPassport'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170738171046646610)
,p_plug_name=>'Lost Passport'
,p_region_name=>'ALERT_PASSPORT_LOST'
,p_parent_plug_id=>wwv_flow_api.id(170738027701646609)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'This passport has been marked as lost!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(170738242605646611)
,p_plug_name=>'Stolen Passport'
,p_region_name=>'ALERT_PASSPORT_STOLEN'
,p_parent_plug_id=>wwv_flow_api.id(170738027701646609)
,p_region_css_classes=>'alert'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none"'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'This passport has been marked as stolen!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(177575370442428393)
,p_plug_name=>'Remarks Region'
,p_parent_plug_id=>wwv_flow_api.id(170738027701646609)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172923365445506593)
,p_plug_name=>'Visa Run'
,p_region_name=>'dialogVisaRun'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172923808180506597)
,p_plug_name=>'Visa Run'
,p_region_name=>'ALERT_VISA_RUN'
,p_parent_plug_id=>wwv_flow_api.id(172923365445506593)
,p_region_css_classes=>'alert--'
,p_icon_css_classes=>'fa-exclamation-triangle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'This Passport has a Visa Run!'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(172923891874506598)
,p_plug_name=>'Visa Run List'
,p_region_name=>'VISA_RUN_LIST'
,p_parent_plug_id=>wwv_flow_api.id(172923365445506593)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196841006363019197)
,p_plug_name=>'Vehicle Detail'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261827073420776781)
,p_plug_name=>'Thai Nationality Information'
,p_region_name=>'DIALOG_THAI_INFORMATION'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480:t-Form--large:t-Form--stretchInputs:margin-left-md:margin-right-md'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>150
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261840901167223525)
,p_plug_name=>'Resident Information'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>160
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(262059033962100859)
,p_plug_name=>'Blacklist'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>210
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_header=>'<div style="width: 1000px;">'
,p_plug_footer=>'</div>'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(455376177247005495)
,p_plug_name=>'REG_HIDDENITEMS'
,p_region_name=>'REG_HIDDENITEMS'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(449699003149462754)
,p_plug_name=>'DG_LEFT'
,p_parent_plug_id=>wwv_flow_api.id(455376177247005495)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(449699169089462755)
,p_plug_name=>'DG_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(455376177247005495)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458671139153975082)
,p_plug_name=>'Fingerprints'
,p_region_name=>'REG_FINGERPRINTS_DETAIL'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="background-color:#FFFFFF;border-radius:15px;padding:10px; margin:5px;height:670px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458671413160975122)
,p_plug_name=>'Left Hand Content'
,p_parent_plug_id=>wwv_flow_api.id(458671139153975082)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table>',
'    <tr>',
'        <td>',
'            <div style="position:relative; text-align:center">',
'                <div id="fingerInfo10"  style="float:left; position:relative;"  >',
'                    <img id="finger10" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px"  onclick="enableDisableFinger(this);"/>  ',
'                    <p id="quality10" style="margin-top: 0px;">0%</p>',
'                </div>',
'                <div id="fingerInfo9"  style="float:left; position:relative;left:10px;"  >',
'                    <img id="finger9" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                    <p id="quality9" style="margin-top: 0px;">0%</p>',
'                </div>',
'                <div id="fingerInfo8"  style="float:left; position:relative; left:20px;" >',
'                    <img id="finger8" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                    <p id="quality8" style="margin-top: 0px;">0%</p>',
'                </div>',
'                <div id="fingerInfo7"  style="float:left; position:relative; left:30px;"  >',
'                    <img id="finger7" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                    <p id="quality7" style="margin-top: 0px;">0%</p>',
'                </div>',
'                <div id="fingerInfo6"  style="float:left; position:relative; left:40px;" >',
'                    <img id="finger6" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                    <p id="quality6" style="margin-top: 0px;">0%</p>',
'                </div>',
'            </div>',
'        </td>',
'',
'',
'    </tr>',
'     <tr>',
'            <td id="leftHand" style="background-image:url(#APP_IMAGES#left_hand.png);background-repeat:no-repeat; width: 335px; height: 395px;" />',
'     </tr>      ',
'            ',
'          ',
'      ',
'',
'</table>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458671860513975123)
,p_plug_name=>'Right Hand Content'
,p_parent_plug_id=>wwv_flow_api.id(458671139153975082)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table>',
'    <tr>',
'         <td>',
'                <div style="position:relative; text-align:center">',
'                    <div id="fingerInfo1"  style="float:left; position:relative;" >',
'                        <img id="finger1" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                        <p id="quality1" style="margin-top: 0px;">0%</p>',
'                    </div>',
'                    <div id="fingerInfo2"  style="float:left; position:relative; left:10px;" >',
'                        <img id="finger2" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                        <p id="quality2" style="margin-top: 0px;">0%</p>',
'                    </div>',
'                    <div id="fingerInfo3"  style="float:left; position:relative; left:20px;" >',
'                        <img id="finger3" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                        <p id="quality3" style="margin-top: 0px;">0%</p>',
'                    </div>',
'                    <div id="fingerInfo4"  style="float:left; position:relative; left:30px;" >',
'                        <img id="finger4" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                        <p id="quality4" style="margin-top: 0px;">0%</p>',
'                    </div>',
'                    <div id="fingerInfo5"  style="float:left; position:relative; left:40px;" >',
'                        <img id="finger5" src="#APP_IMAGES#green_tick.png" alt="" style="width:60px; height: 80px" onclick="enableDisableFinger(this);"/>',
'                        <p id="quality5" style="margin-top: 0px;">0%</p>',
'                    </div>',
'                </div>',
'            </td>',
'',
'    </tr>',
'    <tr>',
'            ',
'            ',
'            <td id="rightHand" style="background-image:url(#APP_IMAGES#right_hand.png);background-repeat:no-repeat; width: 335px; height: 395px;" />',
'        </tr>',
'',
'</table>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458672202681975124)
,p_plug_name=>'Left Hand'
,p_parent_plug_id=>wwv_flow_api.id(458671139153975082)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458673018640975128)
,p_plug_name=>'Right Hand'
,p_parent_plug_id=>wwv_flow_api.id(458671139153975082)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458673386926975129)
,p_plug_name=>'Unknown Finger Positions'
,p_parent_plug_id=>wwv_flow_api.id(458671139153975082)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458673856460975129)
,p_plug_name=>'Unknown Fingers Content'
,p_parent_plug_id=>wwv_flow_api.id(458671139153975082)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table>',
'    <tr>',
'        <td>',
'<div style="position:relative; left:70px; text-align:center">',
'    <div id="fingerInfo11"  style="float:left;" >',
'        <img id="finger11" src="#APP_IMAGES#white.png" alt="" style="width:60px; height: 80px" />',
'        <p id="quality11" style="margin-top: 0px;">0%</p>',
'    </div>',
'    <div id="fingerInfo12" style="float:left;">',
'        <img id="finger12" src="#APP_IMAGES#white.png" alt="" style="width:60px; height: 80px" />',
'        <p id="quality12" style="margin-top: 0px;">0%</p>',
'    </div>',
'    <div id="fingerInfo13" style="float:left;">',
'        <img id="finger13" src="#APP_IMAGES#white.png" alt="" style="width:60px; height: 80px" />',
'        <p id="quality13" style="margin-top: 0px;">0%</p>',
'    </div>',
'    <div id="fingerInfo14" style="float:left;;">',
'        <img id="finger14" src="#APP_IMAGES#white.png" alt="" style="width:60px; height: 80px" />',
'        <p id="quality14" style="margin-top: 0px;">0%</p>',
'    </div>',
'</div>',
'</td>',
'</tr>',
'</table>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458674194252975130)
,p_plug_name=>'Live View Content'
,p_parent_plug_id=>wwv_flow_api.id(458673856460975129)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<table>',
'    <tr>',
'        <td>',
'            <img id="fp_livestream" height=300 width=100% alt="" style="margin:0px 0px 0px 0px"/>',
'        </td>',
'    </tr>',
'    <tr>',
'        <td>',
'            <div id="fp_message" class="fingerprint-error" />',
'        </td>',
'    </tr>',
'</table>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458674573645975130)
,p_plug_name=>'Live View'
,p_parent_plug_id=>wwv_flow_api.id(458673856460975129)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(464182512610971317)
,p_plug_name=>'REG_LOGGING'
,p_region_name=>'REG_LOGGING'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(504470016726245950)
,p_plug_name=>'Find Manually Report'
,p_region_name=>'dialogFindManuallyReport'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480:t-Form--slimPadding'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(792668314952460106)
,p_plug_name=>'Find Manually Report'
,p_region_name=>'id-ir-find-manually-report'
,p_parent_plug_id=>wwv_flow_api.id(504470016726245950)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    --',
'    ''<span id="id-span-find-manually-report-'' || b.brddocid || ''" class="t-Icon fa fa-circle-o cl-span-find-manually-report icon-2x" aria-hidden="true" title="Click to Select" data-selection="'' || b.docno || '':'' || b.issuectry || '':'' || TO_CHAR(b.exp'
||'irydate, ''DD/MM/YYYY'') || ''" data-selection-status="N"></span>''',
'    SELECT_TO_FIND',
'    --',
'    , b.brddocid',
'    , b.docno',
'    , b.issuectry',
'    , TO_CHAR(b.expirydate, ''DD/MM/YYYY'') EXPIRYDATE',
'    , b.surname',
'    , b.givenname',
'    , b.middlename',
'    , t.form_no',
'    --, t.mvmntid',
'    --, t.RN',
'FROM ',
'    dl_bordercontrol.borderdocuments b',
'    ,   (',
'            SELECT ',
'                d.brddocid',
'                , m.mvmntid',
'                , e.key_value',
'                , e.form_no',
'                , ROW_NUMBER() OVER (PARTITION BY e.form_no ORDER BY e.ins_at DESC) RN',
'            FROM dl_bordercontrol.entry_forms e, dl_bordercontrol.movements m, dl_bordercontrol.borderdocuments d',
'            WHERE e.form_no = :P17_TRAVELCARD_NO',
'            AND m.entry_form = e.key_value ',
'            AND m.is_finished = ''Y''',
'            AND d.brddocid = m.brddocid',
'            -- dummy',
'            UNION ALL',
'            SELECT NULL brddocid, NULL mvmntid, NULL key_value, NULL form_no, 1 RN FROM DUAL',
'        ) t',
'WHERE ',
'    t.RN = 1',
'    --',
'    AND CASE ',
'        WHEN :P17_TRAVELCARD_NO IS NULL THEN 1 ',
'        WHEN :P17_TRAVELCARD_NO IS NOT NULL AND b.brddocid = t.brddocid THEN 1 ',
'    END = 1',
'    --',
'    AND b.issuectry = :P17_NATIONALITY --NVL(:P17_NATIONALITY, b.issuectry)',
'    AND b.docno = :P17_DISPLAY_DOCNUMBER --NVL(:P17_DISPLAY_DOCNUMBER, b.docno)',
'    AND b.expirydate = NVL(TO_DATE(:P17_DISPLAY_EXPIRYDATE, ''DD/MM/YYYY''), b.expirydate)',
'    --',
'    AND CASE WHEN :REQUEST in (''CSV'', ''HTMLD'', ''PDF'') THEN ''Y'' ELSE :P17_FIND_MANUALLY_REPORT_LOAD END = ''Y'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P17_TRAVELCARD_NO,P17_NATIONALITY,P17_DISPLAY_DOCNUMBER,P17_DISPLAY_EXPIRYDATE,P17_FIND_MANUALLY_REPORT_LOAD'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(792668453792460107)
,p_max_row_count=>'500'
,p_no_data_found_message=>'No Document Found.'
,p_max_rows_per_page=>'10'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_control_break=>'N'
,p_show_highlight=>'N'
,p_show_computation=>'N'
,p_show_aggregate=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_pivot=>'N'
,p_show_flashback=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_owner=>'ADMIN'
,p_internal_uid=>792668453792460107
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792668505640460108)
,p_db_column_name=>'SELECT_TO_FIND'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Select'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792668733465460110)
,p_db_column_name=>'DOCNO'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Document No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792668874862460111)
,p_db_column_name=>'ISSUECTRY'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Issuing Country'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792668998539460112)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Expiry Date'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792669072487460113)
,p_db_column_name=>'SURNAME'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Last Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792669168088460114)
,p_db_column_name=>'GIVENNAME'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'First Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792669214286460115)
,p_db_column_name=>'MIDDLENAME'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Middle Name'
,p_column_type=>'STRING'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792669368711460116)
,p_db_column_name=>'FORM_NO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'TM6 No.'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(792668674361460109)
,p_db_column_name=>'BRDDOCID'
,p_display_order=>90
,p_column_identifier=>'B'
,p_column_label=>'BRDDOCID'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(792706470959579449)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'7927065'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'SELECT_TO_FIND:DOCNO:ISSUECTRY:EXPIRYDATE:SURNAME:GIVENNAME:MIDDLENAME:FORM_NO:BRDDOCID'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553029961227276066)
,p_plug_name=>'REG_PASSPORT_DETAIL_DATA'
,p_region_name=>'REG_PASSPORT_DETAIL_DATA'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="background-color:#EEEEEE;border-radius:15px;padding:100px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458923698559802651)
,p_plug_name=>'REG_DOCUMENTDATA'
,p_parent_plug_id=>wwv_flow_api.id(553029961227276066)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458921812051802632)
,p_plug_name=>'Chip Data'
,p_region_name=>'DG1_DATA'
,p_parent_plug_id=>wwv_flow_api.id(458923698559802651)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460617636810160134)
,p_plug_name=>'DG1 is not available'
,p_parent_plug_id=>wwv_flow_api.id(458921812051802632)
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_plug_display_when_condition=>'DG1_DOCUMENTNUMBER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460617737176160135)
,p_plug_name=>'DG1Data'
,p_parent_plug_id=>wwv_flow_api.id(458921812051802632)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(459310892511179631)
,p_plug_name=>'Chip Photo'
,p_parent_plug_id=>wwv_flow_api.id(458923698559802651)
,p_region_template_options=>'#DEFAULT#:i-h640:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460617384042160132)
,p_plug_name=>'DG2Image'
,p_parent_plug_id=>wwv_flow_api.id(459310892511179631)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460617804177160136)
,p_plug_name=>'DG2 is not available'
,p_parent_plug_id=>wwv_flow_api.id(459310892511179631)
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'SQL_EXPRESSION'
,p_plug_display_when_condition=>'length(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'')) = 0'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(459360942270207328)
,p_plug_name=>'Chip Fingers'
,p_parent_plug_id=>wwv_flow_api.id(458923698559802651)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(449699460405462758)
,p_plug_name=>'DG3 Fingerprints not available'
,p_parent_plug_id=>wwv_flow_api.id(459360942270207328)
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_plug_display_when_condition=>'DG3_AVAILABLE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(487003979500923424)
,p_plug_name=>'Chip Templates'
,p_parent_plug_id=>wwv_flow_api.id(458923698559802651)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460617296055160131)
,p_plug_name=>'DG13 Fingerprint Templates are not available'
,p_parent_plug_id=>wwv_flow_api.id(487003979500923424)
,p_region_template_options=>'#DEFAULT#:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NULL_OR_ZERO'
,p_plug_display_when_condition=>'DG13_AVAILABLE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460617520321160133)
,p_plug_name=>'DG13_DATA'
,p_parent_plug_id=>wwv_flow_api.id(487003979500923424)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_NOT_NULL_OR_ZERO'
,p_plug_display_when_condition=>'DG13_AVAILABLE'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553296240603765044)
,p_plug_name=>'Travel History'
,p_parent_plug_id=>wwv_flow_api.id(553029961227276066)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'font-weight: bold;'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(547951225860021463)
,p_plug_name=>'Offloads'
,p_parent_plug_id=>wwv_flow_api.id(553296240603765044)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(583401501872702590)
,p_plug_name=>'Offloads Report'
,p_parent_plug_id=>wwv_flow_api.id(547951225860021463)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rownum,  o.*, tu.NAME as "FLIGHT"',
'FROM MOVEMENTS m',
'inner join OFFLOADS o on m.mvmntid = o.mvmntid',
'left join Transportunits tu on tu.trnsprtunitid = m.trnsprtunitid',
'WHERE BRDDOCID=GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE,:DG_EXPIRATIONDATE) and EXITFLG = 2;'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT o.*, m.*, tu.NAME as "FLIGHT"',
'FROM MOVEMENTS m',
'inner join OFFLOADS o on m.mvmntid = o.mvmntid',
'left join Transportunits tu on tu.trnsprtunitid = m.trnsprtunitid',
'WHERE BRDDOCID=GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE,:DG_EXPIRATIONDATE) and EXITFLG = 2;'))
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(583401557758702590)
,p_name=>'Offloads Report'
,p_max_row_count=>'500'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:EMAIL:XLS:PDF:RTF'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#menu/pencil16x16.gif" alt="" />'
,p_icon_view_columns_per_row=>1
,p_owner=>'ADMIN'
,p_internal_uid=>40976205577574042
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583401874591702598)
,p_db_column_name=>'OFFLDID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Offldid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'OTHER'
,p_tz_dependent=>'N'
,p_rpt_show_filter_lov=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583402309452702598)
,p_db_column_name=>'OFFLDRSNID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Offload Reason'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_api.id(582886410978825232)
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583402732462702599)
,p_db_column_name=>'OBSERVATION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Observation'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583403089248702599)
,p_db_column_name=>'CREATED'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_format_mask=>'DD-MM-YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583403494455702599)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583403876576702599)
,p_db_column_name=>'WORKSTATION_NAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Workstation Name'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583404289019702600)
,p_db_column_name=>'SERVER_ID'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Server Id'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583404715386702600)
,p_db_column_name=>'MVMNTID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583405126642702600)
,p_db_column_name=>'FLIGHT'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Flight'
,p_column_type=>'STRING'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(583411479664713969)
,p_db_column_name=>'ROWNUM'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'No.'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(583405492821702879)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'409802'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'ROWNUM:CREATED:FLIGHT:CREATED_BY:WORKSTATION_NAME:OFFLDRSNID:OBSERVATION:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(557915838422710781)
,p_plug_name=>'Movement Data'
,p_parent_plug_id=>wwv_flow_api.id(553296240603765044)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460618227856160140)
,p_plug_name=>'Tabs'
,p_parent_plug_id=>wwv_flow_api.id(557915838422710781)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553184518082552931)
,p_plug_name=>'REG_ShowWhenPassportRead'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460616804477160126)
,p_plug_name=>'Images stored with this Movement:'
,p_parent_plug_id=>wwv_flow_api.id(553184518082552931)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="fotorama" ',
'     style="float:left  height:1px"',
'     id="fotorama_movementdata"     height="1px"',
'     data-nav="thumbs"  data-auto="false" data-allowfullscreen="true" data-height="1px" data-width="1px">',
'    ',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(462723578543542632)
,p_plug_name=>'REG_LAYOUT_CONTAINER'
,p_region_name=>'REG_LAYOUT_CONTAINER'
,p_parent_plug_id=>wwv_flow_api.id(553184518082552931)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(276994711550050055)
,p_plug_name=>'REG_REGION_CONTAINER_L'
,p_region_name=>'Passdata'
,p_parent_plug_id=>wwv_flow_api.id(462723578543542632)
,p_region_css_classes=>'CSS_LAYOUT_ROW3 CSS_LAYOUT_COLUMN_LEFT CSS_NO_FINGERPRIN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107619566709742924)
,p_plug_name=>'Remarks'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107619709741742925)
,p_plug_name=>'Remarks Items'
,p_parent_plug_id=>wwv_flow_api.id(107619566709742924)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107619780740742926)
,p_plug_name=>'Remarks Buttons'
,p_parent_plug_id=>wwv_flow_api.id(107619566709742924)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261548920968998265)
,p_plug_name=>'Passport Data'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261557937319055279)
,p_plug_name=>'Details'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(261558234962075376)
,p_plug_name=>'Thai_name_formular'
,p_parent_plug_id=>wwv_flow_api.id(261557937319055279)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100209
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620178152160160)
,p_plug_name=>'CELL7'
,p_region_name=>'REG_LAYOUT_1_2'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--large'
,p_region_attributes=>'style="overflow:hidden"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190408527261595996)
,p_plug_name=>'VISUM_BUTTONS'
,p_parent_plug_id=>wwv_flow_api.id(460620178152160160)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(842496000742377245)
,p_plug_name=>'VISUM'
,p_parent_plug_id=>wwv_flow_api.id(460620178152160160)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620269610160161)
,p_plug_name=>'CELL4'
,p_region_name=>'CELL_PASSDATA'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_css_classes=>'CSS_LAYOUT_ROW3 CSS_LAYOUT_COLUMN CSS_NO_FINGERPRINT'
,p_region_template_options=>'#DEFAULT#:t-Form--large:t-Form--stretchInputs'
,p_region_attributes=>'style="padding-left:20px;padding-right:20px;padding-top:0px;background-color:#f6f9fd; display:none"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: relative"><div style="position: absolute;width: 100%;top: -16px;" class="tileheading">4 - Document hhgfhgfh Information</div></div>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(456721049301200061)
,p_plug_name=>'REG_PassportDAtaDG'
,p_parent_plug_id=>wwv_flow_api.id(460620269610160161)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding-top:20px;padding-left:17px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100019
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<label class="css_lbl_pd">Name: </label>',
'<label class="css_input_pd">&DG_LASTNAME. &DG_GIVENNAME.</label>',
'<br/>',
'<label class="css_lbl_pd">Expiry Date:</label>',
'<label class="css_input_pd" id="EXPIRY_DATE">&ITEM_EXPIRATION_DATE_VISUAL.</label>',
'<br/>',
'<label class="css_lbl_pd">Date of Birth:</label>',
'<label class="css_input_pd">&ITEM_DOB_VISUAL.</label>',
'',
'<br/>',
'<label class="css_lbl_pd">Gender: </label>',
'<label class="css_input_pd">&GENDER_VISUAL.</label>',
''))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(563578786833490506)
,p_plug_name=>'&DG_DOCUMENTNUMBER. - &DG_ISSUINGSTATENAME.'
,p_parent_plug_id=>wwv_flow_api.id(460620269610160161)
,p_icon_css_classes=>'flaticon-passport4'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563819309346049616)
,p_plug_display_sequence=>100009
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843675688891768448)
,p_plug_name=>'REG_MANUALDATE'
,p_parent_plug_id=>wwv_flow_api.id(460620269610160161)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100029
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620525789160163)
,p_plug_name=>'CELL8'
,p_region_name=>'REG_LAYOUT_1_3'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(190408578301595997)
,p_plug_name=>'TM6_BUTTONS'
,p_parent_plug_id=>wwv_flow_api.id(460620525789160163)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(842496314646377248)
,p_plug_name=>'LC_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(460620525789160163)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(919764681479395027)
,p_plug_name=>'CELL14'
,p_region_name=>'CELLE14'
,p_parent_plug_id=>wwv_flow_api.id(276994711550050055)
,p_region_template_options=>'#DEFAULT#:t-Form--large'
,p_region_attributes=>'style="position: relative; padding: 0;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>45
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(195021944244621191)
,p_plug_name=>'General Information'
,p_parent_plug_id=>wwv_flow_api.id(919764681479395027)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(196840613756019193)
,p_plug_name=>'General_Buttons'
,p_parent_plug_id=>wwv_flow_api.id(919764681479395027)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(920657562491880795)
,p_plug_name=>'VCENTER14'
,p_region_name=>'REG_VCENTER14x'
,p_parent_plug_id=>wwv_flow_api.id(919764681479395027)
,p_region_css_classes=>'horizontal-line'
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(920530325488398223)
,p_plug_name=>'Document Information'
,p_parent_plug_id=>wwv_flow_api.id(920657562491880795)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100159
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(262199710408648203)
,p_plug_name=>'Doc_INFO_BUTTON'
,p_parent_plug_id=>wwv_flow_api.id(920530325488398223)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(920530841648404621)
,p_plug_name=>'Document MRZ'
,p_parent_plug_id=>wwv_flow_api.id(920530325488398223)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="MRZPREVIEW" style="color:white;background-color:#2578cf;border-radius:15px;padding-top:1rem;padding-bottom:1rem;text-align:center;margin-left: 1rem; margin-right: 1rem; margin-top: 0.5rem" >',
'    <div class="CSS_MRZ_LINE" id="OVERVIEW_MRZ_1">',
'        &MRZ_LINE_1.',
'    </div>',
'    <div class="CSS_MRZ_LINE" id="OVERVIEW_MRZ_2" style="padding-top:6px"><span id="PASSPORT_MRZ_NUMBER"></span><span id="PASSPORT_MRZ_NUMBER_SUM"></span><span id="PASSPORT_MRZ_NATIONALITY"></span><span id="PASSPORT_MRZ_DOB"></span><span id="PASSPORT'
||'_MRZ_DOB_SUM"></span><span id="PASSPORT_MRZ_GENDER"></span><span id="PASSPORT_MRZ_DUE"></span><span id="PASSPORT_MRZ_DUE_SUM"></span><span id="PASSPORT_MRZ_TAIL"></span><span id="PASSPORT_MRZ_SUM"></span></div>',
'<script>',
'    var mrz = "&MRZ_LINE_2.".replace(/&lt;/g, "<");',
'        var passportNumber = mrz.substr(0, 9);',
'        var passportNumberSum = mrz[9];',
'        var passportNationality = mrz.substr(10, 3).replace(/\</g, "&lt;");',
'        var passportDob = mrz.substr(13, 6);',
'        var passportDobSum = mrz[19];',
'        var passportGender = mrz[20];',
'        var passportDue = mrz.substr(21, 6);',
'        var passportDueSum = mrz[27];',
'        var passportTail = mrz.substr(28, mrz.length - 29);',
'        var passportSum = mrz[mrz.length - 1];',
'        ',
'        document.getElementById(''PASSPORT_MRZ_NUMBER'').innerHTML = passportNumber;',
'        document.getElementById(''PASSPORT_MRZ_NUMBER_SUM'').innerHTML = passportNumberSum;',
'        document.getElementById(''PASSPORT_MRZ_NATIONALITY'').innerHTML = passportNationality;',
'        document.getElementById(''PASSPORT_MRZ_DOB'').innerHTML = passportDob;',
'        document.getElementById(''PASSPORT_MRZ_DOB_SUM'').innerHTML = passportDobSum;',
'        document.getElementById(''PASSPORT_MRZ_GENDER'').innerHTML = passportGender;',
'        document.getElementById(''PASSPORT_MRZ_DUE'').innerHTML = passportDue;',
'        document.getElementById(''PASSPORT_MRZ_DUE_SUM'').innerHTML = passportDueSum;',
'        document.getElementById(''PASSPORT_MRZ_TAIL'').innerHTML = passportTail;',
'        document.getElementById(''PASSPORT_MRZ_SUM'').innerHTML = passportSum;',
'    </script>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(935037628639386123)
,p_plug_name=>'DOC_INFO_LEFT'
,p_parent_plug_id=>wwv_flow_api.id(920530325488398223)
,p_region_css_classes=>'region-show-dialog-button'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>14
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_css_classes=>'no-padding'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(935037962603390286)
,p_plug_name=>'DOC_INFO_RIGHT'
,p_region_name=>'DOC_INFO_RIGHT'
,p_parent_plug_id=>wwv_flow_api.id(920530325488398223)
,p_region_template_options=>'#DEFAULT#:t-item-ultraslim:t-Form--large:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(157059858890138301)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>11
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(276994854008050056)
,p_plug_name=>'REG_REGION_CONTAINER_R'
,p_region_name=>'REG_LAYOUT_CONTAINER_R'
,p_parent_plug_id=>wwv_flow_api.id(462723578543542632)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620104557160159)
,p_plug_name=>'CELL1'
,p_region_name=>'PASSPORT_SCAN'
,p_parent_plug_id=>wwv_flow_api.id(276994854008050056)
,p_region_css_classes=>'CSS_LAYOUT_COLUMN CSS_NO_FINGERPRINT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="fotorama"',
'     data-nav="thumbs"',
'     data-arrows="true"',
'     data-click="false"',
'     data-swipe="false"',
'     style="float:left; max-width:100%; min-height:240px"',
'     id="fotorama"',
'     ',
'     data-allowfullscreen="native" data-height="240px">',
'    ',
'</div>',
'<img id="passport_placeholder" style="max-width: 100%; max-height: 100%; display: block; margin: auto; padding-bottom: 15px; vertical-align: middle;" src="#APP_IMAGES#passport_Icon.png"/>',
'',
'',
'<!-- M. Langer, 20.12.2018 - Progress bar for Passport scanning progress implemented -->',
'<div id="SCAN_PROGRESS" class="scan_progress">',
'    <img src="#APP_IMAGES#passport_Icon.png"/>',
'    <div class="scan_progress_text">Scanning in progress - Please wait!</div>',
'    <div id="SCAN_PROGRESS_BAR" class="scan_progress_bar">0%</div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620368948160162)
,p_plug_name=>'CELL5'
,p_region_name=>'CELL5WORKFLOW'
,p_parent_plug_id=>wwv_flow_api.id(276994854008050056)
,p_region_css_classes=>'CSS_LAYOUT_ROW3 CSS_LAYOUT_COLUMN CSS_NO_FINGERPRINT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(449698833487462752)
,p_plug_name=>'</!--REG_COL2>'
,p_parent_plug_id=>wwv_flow_api.id(460620368948160162)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="div_movement_status2" style="zoom:0.90;line-height:1.6;margin-left:10px">',
'',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(549012726090720467)
,p_plug_name=>'REG_COL1'
,p_parent_plug_id=>wwv_flow_api.id(460620368948160162)
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="div_movement_status" style="zoom:0.90;line-height:1.6;margin-left:10px">',
'',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620653648160164)
,p_plug_name=>'CELL6'
,p_parent_plug_id=>wwv_flow_api.id(276994854008050056)
,p_region_css_classes=>'CSS_LAYOUT_ROW3 CSS_LAYOUT_COLUMN CSS_NO_FINGERPRINT'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="background-color:#f6f9fd; padding-top: 0; position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(51444855158222514)
,p_plug_name=>'Movements PIB'
,p_region_name=>'REGION_MOVEMENTS'
,p_parent_plug_id=>wwv_flow_api.id(460620653648160164)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with trimming as (',
'    select 30 len, ''&#x2026;'' dots from dual',
')',
'select * from ',
'(',
'-- DL_BORDERCONTROL.MOVEMENTS',
'SELECT ''entry_img''',
'    , case',
'      when length((select NOTE from dl_bordercontrol.entry_forms where key_value = m.ENTRY_FORM)) > 0',
'      then ''<span class="fa fa-search my_yellow table-link-icon fa-1-5x" aria-hidden="true"></span>''',
'      else ''<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span''',
'      end link',
'    , decode(person_type, 2, ''<span class="fa fa-crew black fa-1-5x" aria-hidden="true" title="Crew"></span>'', ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'') UserType',
'    , DECODE (EXITFLG, 1, ''<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>'', 0, ''<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>'') as Direction',
'    , (select DOCNO from DL_BORDERCONTROL.BORDERDOCUMENTS where BRDDOCID = m.BRDDOCID) as Docnumber',
'    , m.DATE_OF_ENTRY as TravelDate',
'    , decode(nvl(m.SOURCE_SYSTEM, -999), 1, ''BIO'', 2, ''PIB'', 3, ''ATC'', 4, ''OFF'', -999, ''N/A'', '''' || m.SOURCE_SYSTEM) SOURCE_SYSTEM',
'    , (/*Select distinct case',
'              when length(NVL(display_value,DISPLAY_VALUE$DLC)) <= tr.len',
'              then NVL(display_value,DISPLAY_VALUE$DLC)',
'              else substr(NVL(display_value,DISPLAY_VALUE$DLC),1,tr.len)||''...''',
'              end',
'        from DL_COMMON.VISA_TYPES#ICAO_DC_ITMS$LC ',
'        where num_value = m.VISA_TYPE*/',
'        select substr(display_value, 1, tr.len) || case when length(display_value) > tr.len then tr.dots else '''' end',
'          from visa_name',
'         where key_value = m.visa_type',
'        ) VISA_TYPE',
'    , MVMNTID',
'    , (select case',
'              when nvl(length(name), 0) <= tr.len ',
'              then name',
'              else substr(name,1,tr.len)||tr.dots',
'              end Borderpost',
'       from DL_BORDERCONTROL.BORDERPOSTS',
'       where key_value = m.INS_BORDERPOST) borderpost',
'    , case',
'      when nvl(length(TRNSPRTUNITID), 0) <= tr.len ',
'      then TRNSPRTUNITID',
'      else substr(TRNSPRTUNITID,1,tr.len)||tr.dots',
'      end VehicleType',
'    , ''BIO'' AS DATA_SOURCE',
'    , ''BIO'' AS DATA_SOURCE_SEC',
'    , MVMNTID AS DATA_SOURCE_SEC_PK_VAL',
' FROM DL_BORDERCONTROL.MOVEMENTS m, trimming tr',
'WHERE BRDDOCID IN (SELECT BD.BRDDOCID ',
'                     FROM DL_BORDERCONTROL.BORDERDOCUMENTS BD',
'                        , DL_BORDERCONTROL.IDENTITIES I',
'                    WHERE BD.BRDDOCID = I.BRDDOCID',
'                      AND (',
'                             (:P17_BRDDOC_IDENTITY IS NULL ',
'                              AND  DOCNO      = :P17_DISPLAY_DOCNUMBER ',
'                              AND  ISSUECTRY  = :P17_NATIONALITY)',
'                               OR (:P17_BRDDOC_IDENTITY IS NOT NULL',
'                              AND  i.identity   = :P17_BRDDOC_IDENTITY)',
'                          )',
'                    /*AND trunc(EXPIRYDATE) = trunc(to_date(to_char(to_date(:P17_DISPLAY_EXPIRYDATE, ''DD/MM/RRRR''), ''RRMMDD''), ''RRMMDD''))*/',
'                  )',
'  AND IS_FINISHED = ''Y''',
'  --ORDER BY m.DATE_OF_ENTRY desc',
'  UNION ALL',
'SELECT ',
'    ''entry_img''',
'    , ''<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span'' link',
'    , ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' UserType',
'    , DECODE (cardtype, 2, ''<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>'', 1, ''<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>'') as DIRECTION',
'    , tdtno as DOCNUMBER',
'    , inoutdte as TRAVELDATE',
'    , DECODE(typedata, ''ATC'', ''ATC'', ''PIBICS'') SOURCE_SYSTEM -- PIB_TMINOUT_MA',
'    , (',
'        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END',
'        FROM dl_bordercontrol.visa_name',
'        WHERE key_value = ma.visatypecd',
'      ) VISA_TYPE',
'    , NULL MVMNTID',
'    --, TO_CHAR(chkpointno) AS BORDERPOST',
'    , (select ',
'            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''',
'            THEN',
'              case',
'              when nvl(length(depttnm), 0) <= tr.len ',
'              then depttnm',
'              else substr(depttnm,1,tr.len)||tr.dots',
'              end',
'            ELSE',
'              case',
'              when nvl(length(deptenm), 0) <= tr.len ',
'              then deptenm',
'              else substr(deptenm,1,tr.len)||tr.dots',
'              end',
'            END Borderpost',
'       from dl_bordercontrol.v_department',
'       where dept_seqno = ma.dept_seqno) AS BORDERPOST',
'    , TO_CHAR(conv_seqno) AS VEHICLETYPE',
'    , ''PIBICS'' AS DATA_SOURCE',
'    , ''TMINOUT_MA'' AS DATA_SOURCE_SEC',
'    , ma.seqno AS DATA_SOURCE_SEC_PK_VAL',
'FROM dl_bordercontrol.v_tminout_ma ma, trimming tr',
'WHERE nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --',
'AND sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)',
'AND birthdte = :P17_DISPLAY_DOB',
'AND ',
'(',
'    tdtno = :P17_DISPLAY_DOCNUMBER',
'    OR',
'    (',
'        UPPER(TRIM(REGEXP_REPLACE(efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME',
'        AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NU'
||'LL)',
'    )',
')',
'AND NVL(typedata, ''~'') NOT LIKE ''BIO%''',
'--AND tdtno = :P17_DISPLAY_DOCNUMBER',
'--ORDER BY ma.inoutdte DESC',
'UNION ALL',
'SELECT ',
'    ''entry_img''',
'    , ''<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span'' link',
'    , ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' UserType',
'    , DECODE (cardtype, 2, ''<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>'', 1, ''<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>'') as DIRECTION',
'    , tdtno as DOCNUMBER',
'    , inoutdte as TRAVELDATE',
'    , DECODE(typedata, ''ATC'', ''ATC'', ''PIBICS'') SOURCE_SYSTEM -- PIB_TMINOUT',
'    , (',
'        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END',
'        FROM dl_bordercontrol.visa_name',
'        WHERE key_value = m.visatypecd',
'      ) VISA_TYPE',
'    , NULL MVMNTID',
'    --, TO_CHAR(chkpointno) AS BORDERPOST',
'    , (select ',
'            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''',
'            THEN',
'              case',
'              when nvl(length(depttnm), 0) <= tr.len ',
'              then depttnm',
'              else substr(depttnm,1,tr.len)||tr.dots',
'              end',
'            ELSE',
'              case',
'              when nvl(length(deptenm), 0) <= tr.len ',
'              then deptenm',
'              else substr(deptenm,1,tr.len)||tr.dots',
'              end',
'            END Borderpost',
'       from dl_bordercontrol.v_department',
'       where dept_seqno = m.dept_seqno) AS BORDERPOST',
'    , TO_CHAR(conv_seqno) AS VEHICLETYPE',
'    , ''PIBICS'' AS DATA_SOURCE',
'    , ''TMINOUT'' AS DATA_SOURCE_SEC',
'    , m.seqno AS DATA_SOURCE_SEC_PK_VAL',
'FROM dl_bordercontrol.v_tminout m, trimming tr',
'WHERE nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --',
'AND sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)',
'AND birthdte = :P17_DISPLAY_DOB',
'AND ',
'(',
'    tdtno = :P17_DISPLAY_DOCNUMBER',
'    OR',
'    (',
'        UPPER(TRIM(REGEXP_REPLACE(efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME',
'        AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NU'
||'LL)',
'    )',
')',
'AND NVL(typedata, ''~'') NOT LIKE ''BIO%''',
'--AND tdtno = :P17_DISPLAY_DOCNUMBER',
'--ORDER BY m.inoutdte DESC',
'UNION ALL',
'SELECT ',
'    ''entry_img''',
'    , ''<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span'' link',
'    , ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' UserType',
'    , ''<span class="fa fa-arrow-right my_blue fa-1-5x cl-bold" aria-hidden="true" title="Arrival"></span>'' as DIRECTION',
'    , INTDTNO as DOCNUMBER',
'    , INDTE as TRAVELDATE',
'    , DECODE(typedata, ''ATC'', ''ATC'', ''PIBICS'') SOURCE_SYSTEM -- PIB_TMMAIN_IN',
'    , (',
'        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END',
'        FROM dl_bordercontrol.visa_name',
'        WHERE key_value = tm.INVISATYPECD',
'      ) VISA_TYPE',
'    , NULL MVMNTID',
'    --, TO_CHAR(INCHKPOINTNO) AS BORDERPOST',
'    , (select ',
'            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''',
'            THEN  ',
'              case',
'              when nvl(length(depttnm), 0) <= tr.len ',
'              then depttnm',
'              else substr(depttnm,1,tr.len)||tr.dots',
'              end ',
'            ELSE',
'              case',
'              when nvl(length(deptenm), 0) <= tr.len ',
'              then deptenm',
'              else substr(deptenm,1,tr.len)||tr.dots',
'              end ',
'            END Borderpost',
'       from dl_bordercontrol.v_department',
'       where dept_seqno = tm.indept_seqno) AS BORDERPOST',
'    , TO_CHAR(INCONVCD) AS VEHICLETYPE',
'    , ''PIBICS'' AS DATA_SOURCE',
'    , ''TMMAIN_IN'' AS DATA_SOURCE_SEC',
'    , tm.tmrunno AS DATA_SOURCE_SEC_PK_VAL',
'FROM dl_bordercontrol.v_tmmain tm, trimming tr',
'WHERE indte IS NOT NULL',
'AND nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --',
'AND sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)',
'AND birthdte = :P17_DISPLAY_DOB',
'AND ',
'(',
'    INTDTNO = :P17_DISPLAY_DOCNUMBER',
'    OR',
'    (',
'        UPPER(TRIM(REGEXP_REPLACE(efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME',
'        AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NU'
||'LL)',
'    )',
')',
'AND NVL(typedata, ''~'') NOT LIKE ''BIO%''',
'--AND INTDTNO = :P17_DISPLAY_DOCNUMBER',
'--ORDER BY tm.INDTE DESC;',
'UNION ALL',
'SELECT ',
'    ''entry_img''',
'    , ''<span class="fa fa-search table-link-icon fa-1-5x" aria-hidden="true"></span'' link',
'    , ''<span class="fa fa-user fa-1-5x" aria-hidden="true" title="Traveler"></span>'' UserType',
'    , ''<span class="fa fa-arrow-left my_red fa-1-5x cl-bold" aria-hidden="true" title="Departure"></span>'' as DIRECTION',
'    , OUTTDTNO as DOCNUMBER',
'    , OUTDTE as TRAVELDATE',
'    , DECODE(typedata, ''ATC'', ''ATC'', ''PIBICS'') SOURCE_SYSTEM -- PIB_TMMAIN_OUT',
'    , (',
'        SELECT SUBSTR(display_value, 1, TR.len) || CASE WHEN LENGTH(display_value) > TR.len THEN TR.dots ELSE '''' END',
'        FROM dl_bordercontrol.visa_name',
'        WHERE key_value = tm.OUTVISATYPECD',
'      ) VISA_TYPE',
'    , NULL MVMNTID',
'    --, TO_CHAR(OUTCHKPOINTNO) AS BORDERPOST',
'    , (select ',
'            CASE WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH''',
'            THEN  ',
'              case',
'              when nvl(length(depttnm), 0) <= tr.len ',
'              then depttnm',
'              else substr(depttnm,1,tr.len)||tr.dots',
'              end',
'            ELSE',
'              case',
'              when nvl(length(deptenm), 0) <= tr.len ',
'              then deptenm',
'              else substr(deptenm,1,tr.len)||tr.dots',
'              end',
'            END borderpost',
'       from dl_bordercontrol.v_department',
'       where dept_seqno = tm.outdept_seqno) AS BORDERPOST',
'    , TO_CHAR(OUTCONVCD) AS VEHICLETYPE',
'    , ''PIBICS'' AS DATA_SOURCE',
'    , ''TMMAIN_OUT'' AS DATA_SOURCE_SEC',
'    , tm.tmrunno AS DATA_SOURCE_SEC_PK_VAL',
'FROM dl_bordercontrol.v_tmmain tm, trimming tr',
'WHERE OUTDTE IS NOT NULL',
'AND nationcd = (SELECT notice$dlc FROM dl_common.icao_doc_codes$lc WHERE key_value = NVL(:P17_STATELESS, :P17_NATIONALITY)) --',
'AND sex = DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', sex)',
'AND birthdte = :P17_DISPLAY_DOB',
'AND ',
'(',
'    OUTTDTNO = :P17_DISPLAY_DOCNUMBER',
'    OR',
'    (',
'        UPPER(TRIM(REGEXP_REPLACE(efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME',
'        AND UPPER(TRIM(REGEXP_REPLACE(efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPLAY_MIDDLENAME, NU'
||'LL)',
'    )',
')',
'AND NVL(typedata, ''~'') NOT LIKE ''BIO%''',
'--AND OUTTDTNO = :P17_DISPLAY_DOCNUMBER',
'--ORDER BY tm.OUTDTE DESC;',
')',
'ORDER BY 6 DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P17_DISPLAY_DOCNUMBER,P17_NATIONALITY,P17_DISPLAY_GENDER,P17_DISPLAY_DOB,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_STATELESS,P17_CHECK_PIBICS_CONN'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
);
end;
/
begin
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(51444934624222515)
,p_max_row_count=>'500'
,p_no_data_found_message=>'No Movements yet '
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::P171_MVMNTID:#MVMNTID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page link-column" alt="">'
,p_detail_link_condition_type=>'NEVER'
,p_owner=>'ADMIN'
,p_internal_uid=>51444934624222515
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445093250222516)
,p_db_column_name=>'MVMNTID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Mvmntid'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445111614222517)
,p_db_column_name=>'DIRECTION'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'<!--Direction -->'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445204832222518)
,p_db_column_name=>'USERTYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Type'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445374984222519)
,p_db_column_name=>'DOCNUMBER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc No.'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445425999222520)
,p_db_column_name=>'VISA_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Visa'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445503342222521)
,p_db_column_name=>'BORDERPOST'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Post'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445699918222522)
,p_db_column_name=>'VEHICLETYPE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Vehicle'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445751327222523)
,p_db_column_name=>'TRAVELDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Date'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445865633222524)
,p_db_column_name=>'LINK'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'<!--Link -->'
,p_column_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP,171:P171_MVMNTID,P171_DATA_SOURCE_SEC,P171_DATA_SOURCE_SEC_PK_VAL,P171_CHECK_PIBICS_CONN:#MVMNTID#,#DATA_SOURCE_SEC#,#DATA_SOURCE_SEC_PK_VAL#,&P17_CHECK_PIBICS_CONN.'
,p_column_linktext=>'<span>#LINK#</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51445921990222525)
,p_db_column_name=>'SOURCE_SYSTEM'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'S'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Source System<br>',
'BIO = Dermalog<br>',
'PIB = PIBICS<br>',
'ATC = '))
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(51446029946222526)
,p_db_column_name=>'''ENTRY_IMG'''
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Direction'
,p_column_html_expression=>'<span class="#ICON#">#ACTION#</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119106620580171030)
,p_db_column_name=>'DATA_SOURCE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Data Source'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119106745957171031)
,p_db_column_name=>'DATA_SOURCE_SEC'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Data Source Sec'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(119106850672171032)
,p_db_column_name=>'DATA_SOURCE_SEC_PK_VAL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Data Source Sec PK Val'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(54153754730769806)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'541538'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>50
,p_report_columns=>'LINK:DIRECTION:USERTYPE:DOCNUMBER:VISA_TYPE:BORDERPOST:VEHICLETYPE:TRAVELDATE:SOURCE_SYSTEM:''ENTRY_IMG'':DATA_SOURCE:DATA_SOURCE_SEC:DATA_SOURCE_SEC_PK_VAL'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553296530286765048)
,p_plug_name=>'Movements'
,p_region_name=>'REGION_MOVEMENTS_INACTIVE'
,p_parent_plug_id=>wwv_flow_api.id(460620653648160164)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563820435896049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with trimming as (',
'    select 30 len, ''&#x2026;'' dots from dual',
')',
'select * from (',
'',
'SELECT ''entry_img''',
'    , case',
'      when length((select NOTE from dl_bordercontrol.entry_forms where key_value = m.ENTRY_FORM)) > 0',
'      then ''<span class="fa fa-search my_yellow table-link-icon" aria-hidden="true"></span>''',
'      else ''<span class="fa fa-search table-link-icon" aria-hidden="true"></span''',
'      end link',
'    , decode(person_type, 2, ''<span class="fa fa-crew black fa-1-5x" aria-hidden="true" title="Crew"></span>'', ''<span class="fa fa-user" aria-hidden="true" title="Traveler"></span>'') UserType',
'    , DECODE (EXITFLG, 1, ''<span class="fa fa-arrow-left my_red" aria-hidden="true" title="Departure"></span>'', 0, ''<span class="fa fa-arrow-right my_blue" aria-hidden="true" title="Arrival"></span>'') as Direction',
'    , (select DOCNO from DL_BORDERCONTROL.BORDERDOCUMENTS where BRDDOCID = m.BRDDOCID) as Docnumber',
'    , m.DATE_OF_ENTRY as TravelDate',
'    , decode(nvl(m.SOURCE_SYSTEM, -999), 1, ''BIO'', 2, ''PIB'', 3, ''ATC'', 4, ''OFF'', -999, ''N/A'', '''' || m.SOURCE_SYSTEM) SOURCE_SYSTEM',
'    , (/*Select distinct case',
'              when length(NVL(display_value,DISPLAY_VALUE$DLC)) <= tr.len',
'              then NVL(display_value,DISPLAY_VALUE$DLC)',
'              else substr(NVL(display_value,DISPLAY_VALUE$DLC),1,tr.len)||''...''',
'              end',
'        from DL_COMMON.VISA_TYPES#ICAO_DC_ITMS$LC ',
'        where num_value = m.VISA_TYPE*/',
'        select substr(display_value, 1, tr.len) || case when length(display_value) > tr.len then tr.dots else '''' end',
'          from visa_name',
'         where key_value = m.visa_type',
'        ) VISA_TYPE',
'    , MVMNTID',
'    , (select case',
'              when nvl(length(name), 0) <= tr.len ',
'              then name',
'              else substr(name,1,tr.len)||tr.dots',
'              end Borderpost',
'       from DL_BORDERCONTROL.BORDERPOSTS',
'       where key_value = m.INS_BORDERPOST) borderpost',
'    , case',
'      when nvl(length(TRNSPRTUNITID), 0) <= tr.len ',
'      then TRNSPRTUNITID',
'      else substr(TRNSPRTUNITID,1,tr.len)||tr.dots',
'      end VehicleType',
'',
' FROM DL_BORDERCONTROL.MOVEMENTS m, trimming tr',
'WHERE BRDDOCID IN (SELECT BD.BRDDOCID ',
'                     FROM DL_BORDERCONTROL.BORDERDOCUMENTS BD',
'                        , DL_BORDERCONTROL.IDENTITIES I',
'                    WHERE BD.BRDDOCID = I.BRDDOCID',
'                      AND (',
'                             (:P17_BRDDOC_IDENTITY IS NULL ',
'                              AND  DOCNO      = :P17_DISPLAY_DOCNUMBER ',
'                              AND  ISSUECTRY  = :P17_NATIONALITY)',
'                               OR (:P17_BRDDOC_IDENTITY IS NOT NULL',
'                              AND  i.identity   = :P17_BRDDOC_IDENTITY)',
'                          )',
'                    /*AND trunc(EXPIRYDATE) = trunc(to_date(to_char(to_date(:P17_DISPLAY_EXPIRYDATE, ''DD/MM/RRRR''), ''RRMMDD''), ''RRMMDD''))*/',
'                  )',
'  AND IS_FINISHED = ''Y''',
'ORDER BY m.DATE_OF_ENTRY desc',
')                                                                              ',
' --where rownum < NVL(:AI_MAX_MOVEMENTS_TO_SHOW,5)'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'NEVER'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_prn_output_show_link=>'Y'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_document_header=>'APEX'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#ffffff'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet(
 p_id=>wwv_flow_api.id(553296920887765050)
,p_name=>'Movements'
,p_max_row_count=>'500'
,p_no_data_found_message=>'No Movements yet '
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_show_search_bar=>'N'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_show_detail_link=>'C'
,p_show_calendar=>'N'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::P171_MVMNTID:#MVMNTID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-page.png" class="apex-edit-page link-column" alt="">'
,p_detail_link_condition_type=>'NEVER'
,p_owner=>'ADMIN'
,p_internal_uid=>10871568706636502
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176611795241283444)
,p_db_column_name=>'LINK'
,p_display_order=>10
,p_column_identifier=>'CT'
,p_column_label=>'<!--Link -->'
,p_column_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP:P171_MVMNTID:#MVMNTID#'
,p_column_linktext=>'<span>#LINK#</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(553298987943765058)
,p_db_column_name=>'''ENTRY_IMG'''
,p_display_order=>20
,p_column_identifier=>'F'
,p_column_label=>'Direction'
,p_column_html_expression=>'<span class="#ICON#">#ACTION#</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(228275115934282274)
,p_db_column_name=>'MVMNTID'
,p_display_order=>30
,p_column_identifier=>'CH'
,p_column_label=>'Mvmntid'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176609703748283423)
,p_db_column_name=>'USERTYPE'
,p_display_order=>40
,p_column_identifier=>'CM'
,p_column_label=>'Type'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176609619898283422)
,p_db_column_name=>'DIRECTION'
,p_display_order=>50
,p_column_identifier=>'CL'
,p_column_label=>'<!--Direction -->'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176609784545283424)
,p_db_column_name=>'DOCNUMBER'
,p_display_order=>60
,p_column_identifier=>'CN'
,p_column_label=>'Doc No.'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176610109563283427)
,p_db_column_name=>'BORDERPOST'
,p_display_order=>70
,p_column_identifier=>'CQ'
,p_column_label=>'Post'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176610210487283428)
,p_db_column_name=>'VEHICLETYPE'
,p_display_order=>80
,p_column_identifier=>'CR'
,p_column_label=>'Vehicle'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176609993522283426)
,p_db_column_name=>'VISA_TYPE'
,p_display_order=>90
,p_column_identifier=>'CP'
,p_column_label=>'Visa'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(176611677482283443)
,p_db_column_name=>'TRAVELDATE'
,p_display_order=>100
,p_column_identifier=>'CS'
,p_column_label=>'Date'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_tz_dependent=>'N'
);
wwv_flow_api.create_worksheet_column(
 p_id=>wwv_flow_api.id(186862084855161703)
,p_db_column_name=>'SOURCE_SYSTEM'
,p_display_order=>110
,p_column_identifier=>'CV'
,p_column_label=>'S'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Source System<br>',
'BIO = Dermalog<br>',
'PIB = PIBICS<br>',
'ATC = '))
);
wwv_flow_api.create_worksheet_rpt(
 p_id=>wwv_flow_api.id(553300158941765061)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'108749'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'''ENTRY_IMG'':LINK:DIRECTION:USERTYPE:DOCNUMBER:TRAVELDATE:VISA_TYPE:BORDERPOST:VEHICLETYPE:SOURCE_SYSTEM:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TS'
,p_sort_direction_2=>'DESC'
,p_flashback_enabled=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(846489023815257352)
,p_plug_name=>'<span class="okdirection">Travel History</span><span class="wrongdirection" style="display: none">Wrong Direction</span> for &DG_DOCUMENTNUMBER.'
,p_parent_plug_id=>wwv_flow_api.id(460620653648160164)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>1
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3 style="margin: 0.5em;float: left;">Travel History<span id="TH_DOCUMENT_NUMBER__" style="display:none">Travel History for </span></h3>',
'',
'<div class="container" style="float: right;display: block;margin: .5em;">',
'    <button class="t-Button t-Button--icon t-Button--iconLeft" style="display: none;" onclick="javascript:void(0);" type="button" id="CUSTOM_BTN_EDIT_LAST_MOVEMENT"><span class="t-Icon t-Icon--left fa fa-user-edit" aria-hidden="true"></span><span cla'
||'ss="t-Button-label">Edit Last Movement</span></button>',
'</div>',
'',
'<input type="hidden" id="BMBS_APP_USER_HIDDEN" value="&APP_USER." />'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
,p_plug_comment=>'<span class="okdirection">Travel History</span><span class="wrongdirection" style="display: none">Wrong Direction</span> for &DG_DOCUMENTNUMBER.'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(5173631053707838616)
,p_name=>'Movements PIB Dynamic'
,p_region_name=>'REGION_MOVEMENTS_DYNAMIC'
,p_parent_plug_id=>wwv_flow_api.id(460620653648160164)
,p_template=>wwv_flow_api.id(563820889302049617)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlightOff'
,p_display_point=>'BODY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_query  CLOB;',
'BEGIN',
'',
'    l_query := dl_bordercontrol.pkg_bmbs_apex_util.p17_get_travel_history_sql',
'                (',
'                    p_identity              => :P17_BRDDOC_IDENTITY',
'                    , p_docno               => :P17_DISPLAY_DOCNUMBER',
'                    , p_nationality         => :P17_NATIONALITY',
'                    , p_stateless           => :P17_STATELESS',
'                    , p_sex                 => :P17_DISPLAY_GENDER',
'                    , p_dob                 => :P17_DISPLAY_DOB_TEXT',
'                    , p_surname             => :P17_DISPLAY_LASTNAME',
'                    , p_givenname           => :P17_DISPLAY_FIRSTNAME',
'                    , p_middlename          => :P17_DISPLAY_MIDDLENAME',
'                    , p_rows                => 1000',
'                    , p_pibics_prd_conn     => 1 --:P17_CHECK_PIBICS_CONN',
'                    , p_dr                  => ''Y''',
'                );',
'',
'    RETURN l_query;',
'',
'END;'))
,p_source_type=>'NATIVE_FNC_REPORT'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P17_BRDDOC_IDENTITY,P17_DISPLAY_DOCNUMBER,P17_NATIONALITY,P17_STATELESS,P17_DISPLAY_GENDER,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_CHECK_PIBICS_CONN'
,p_query_row_template=>wwv_flow_api.id(563829676711049621)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Movements yet '
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631166162838617)
,p_query_column_id=>1
,p_column_alias=>'LINK'
,p_column_display_sequence=>1
,p_column_heading=>'<!--Link -->'
,p_column_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:RP,171:P171_MVMNTID,P171_DATA_SOURCE_SEC,P171_DATA_SOURCE_SEC_PK_VAL,P171_CHECK_PIBICS_CONN:#MVMNTID#,#DATA_SOURCE_SEC#,#DATA_SOURCE_SEC_PK_VAL#,&P17_CHECK_PIBICS_CONN.'
,p_column_linktext=>'<span>#LINK#</span>'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631265275838618)
,p_query_column_id=>2
,p_column_alias=>'USERTYPE'
,p_column_display_sequence=>3
,p_column_heading=>'Type'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631358745838619)
,p_query_column_id=>3
,p_column_alias=>'DIRECTION'
,p_column_display_sequence=>2
,p_column_heading=>'<!--Direction -->'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631473643838620)
,p_query_column_id=>4
,p_column_alias=>'DOCNUMBER'
,p_column_display_sequence=>4
,p_column_heading=>'Doc No.'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631578125838621)
,p_query_column_id=>5
,p_column_alias=>'TRAVELDATE'
,p_column_display_sequence=>8
,p_column_heading=>'Date'
,p_use_as_row_header=>'N'
,p_column_format=>'DD/MM/YYYY HH24:MI'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631654074838622)
,p_query_column_id=>6
,p_column_alias=>'SOURCE_SYSTEM'
,p_column_display_sequence=>9
,p_column_heading=>'S'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631717396838623)
,p_query_column_id=>7
,p_column_alias=>'VISA_TYPE'
,p_column_display_sequence=>5
,p_column_heading=>'Visa'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631835442838624)
,p_query_column_id=>8
,p_column_alias=>'MVMNTID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173631906588838625)
,p_query_column_id=>9
,p_column_alias=>'BORDERPOST'
,p_column_display_sequence=>6
,p_column_heading=>'Post'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173632037280838626)
,p_query_column_id=>10
,p_column_alias=>'VEHICLETYPE'
,p_column_display_sequence=>7
,p_column_heading=>'Vehicletype'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173632115701838627)
,p_query_column_id=>11
,p_column_alias=>'DATA_SOURCE'
,p_column_display_sequence=>11
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173632224287838628)
,p_query_column_id=>12
,p_column_alias=>'DATA_SOURCE_SEC'
,p_column_display_sequence=>12
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(5173632380307838629)
,p_query_column_id=>13
,p_column_alias=>'DATA_SOURCE_SEC_PK_VAL'
,p_column_display_sequence=>13
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620789671160166)
,p_plug_name=>'CELL3'
,p_region_name=>'LAYOUT_2_1'
,p_parent_plug_id=>wwv_flow_api.id(276994854008050056)
,p_region_css_classes=>'CSS_LAYOUT_COL1 CSS_LAYOUT_COLUMN CSS_NO_FINGERPRINT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="position: relative; margin-left: 10px; float: left; display: inline-block">',
'    <div class="movement_live_video_controls" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-color: rgba(0, 0, 0, 0.3); font-family: FontAwesome; z-index: 2; font-size: 40px; text-align: center">',
'        <span style="display: inline-block;color:blueviolet; line-height: 5rem; text-shadow: 0px 0px 15px #CCCCCC; position: absolute; bottom: 0; left: 0; width: 100%"><span id="btn_camera_playpause" class="fa-play"></span> / &#xf030; / &#xf1b8;</spa'
||'n>',
'<!--        <span style="display: inline-block;color:blueviolet; line-height: 300px; text-shadow: 0px 0px 15px #CCCCCC;">&#xf04b; / &#xf030; / &#xf1b8;</span>-->',
'    </div>',
'    <img id="video" src="#APP_IMAGES#blank439.gif" class="movement_live_video" style="padding-left: 0 !important; width: 100%; height: 100%"/>',
'    <img id="video_mask" style="position: absolute; top: 0; left: 0; bottom: 0; right: 0; z-index: 1; opacity: 0.1; width: 100%; height: 100%" src="#APP_IMAGES#person_mask_noaspect.svg">',
'</div>',
'',
'<div class="movement_preview_container" >',
'    <!--<div style="display: block; font-size: large; font-weight: bold; margin-bottom: 4px; text-align: center">Best photo</div>-->',
'    <div id="id_movementphoto_q_0" class="movement_preview_quality"></div>',
'    <img id="id_movementphoto_0" class="movement_preview_photo"/>',
'    <div id="id_movementphoto_db_0" class="movement_preview_quality"></div>',
'</div>',
'<div class="movement_preview_container">',
'    <!--<div style="display: block; font-size: large; font-weight: bold; margin-bottom: 4px; text-align: center">Current photo</div>-->',
'    <div id="id_movementphoto_q_1" class="movement_preview_quality"></div>',
'    <img id="id_movementphoto_1" class="movement_preview_photo"/>',
'    <div id="id_movementphoto_db_1" class="movement_preview_quality"></div>',
'</div>',
'<div class="movement_preview_container">',
'    <div id="id_movementphoto_q_2" class="movement_preview_quality"></div>',
'    <img id="id_movementphoto_2" class="movement_preview_photo"/>',
'    <div id="id_movementphoto_db_2" class="movement_preview_quality"></div>',
'</div>',
'',
'<div id="id_current_score" class="score_status">',
'    ',
'</div>',
''))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460620909942160167)
,p_plug_name=>'CELL9'
,p_region_name=>'CELL_FINGERPRINTS'
,p_parent_plug_id=>wwv_flow_api.id(276994854008050056)
,p_region_css_classes=>'CSS_LAYOUT_COL2 CSS_LAYOUT_COLUMN'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="position: relative"><div style="position: absolute;width: 100%;top: -16px;display:none" class="tileheading">7 - Fingerprint Capturing</div></div><div style="width:100%; float:left; position: relative" id="FINGERPRINT_CONTAINER">',
'    <div style="display: table; margin: 0 auto;">',
'        <div style="display: inline-block" class="fp_recapture_area_left">',
'            <div class="dark-finger finger_capture_status finger_position_ll finger_silhouette_10" onmousemove="showSingleFpDetails(10, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(10, event)" style="background-image: url'
||'(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_ll" style="background-image: url(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_lr finger_silhouette_9" onmousemove="showSingleFpDetails(9, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(9, event)" style="background-image: url'
||'(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_lr" style="background-image: url(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_lm finger_silhouette_8" onmousemove="showSingleFpDetails(8, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(8, event)" style="background-image: url'
||'(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_lm" style="background-image: url(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_li finger_silhouette_7" onmousemove="showSingleFpDetails(7, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(7, event)" style="background-image: url'
||'(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_li" style="background-image: url(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_recapture_left" style="position: absolute; left: 15%; top: 60%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-refresh"></i></button><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_finished_left" style="position: absolute; left: 15%; top: 60%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-check-square"></i></button><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_force_capture_left" style="position: absolute; left: 15%; top: 60%; padding: 7px; display: none; font-size: 32px;"><i class="fa fa-hand-stop-o fa-flip-horizontal t-HeroRegion-icon"></i>'
||'</button>',
'        </div>',
'        <div style="display: inline-block" class="fp_recapture_area_thumbs">',
'            <div class="dark-finger finger_capture_status finger_position_lt finger_silhouette_6" onmousemove="showSingleFpDetails(6, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(6, event)" style="background-image: url(''#'
||'APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_lt" style="background-image: url(''#APP_IMAGES#Left Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_rt finger_silhouette_1" onmousemove="showSingleFpDetails(1, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(1, event)" style="background-image: url'
||'(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_rt" style="background-image: url(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_finished_thumbs" style="position: absolute; left: 46%; top: 33%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-check-square"></i></button><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_recapture_thumbs" style="position: absolute; left: 46%; top: 33%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-refresh"></i></button>',
'        </div>',
'        <div style="display: inline-block" class="fp_recapture_area_right">',
'            <div class="dark-finger finger_capture_status finger_position_ri finger_silhouette_2" onmousemove="showSingleFpDetails(2, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(2, event)" style="background-image: url(''#'
||'APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_ri" style="background-image: url(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_rm finger_silhouette_3" onmousemove="showSingleFpDetails(3, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(3, event)" style="background-image: url'
||'(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_rm" style="background-image: url(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_rr finger_silhouette_4" onmousemove="showSingleFpDetails(4, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(4, event)" style="background-image: url'
||'(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_rr" style="background-image: url(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="dark-finger finger_capture_status finger_position_rl finger_silhouette_5" onmousemove="showSingleFpDetails(5, event)" onmouseleave="hideSingleFpDetails()" onclick="toggleFingerMissing(5, event)" style="background-image: url'
||'(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><div class="finger_capture_status finger_position_rl" style="background-image: url(''#APP_IMAGES#Right Hand_gray.png'');"></div><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_recapture_right" style="position: absolute; left: 77%; top: 60%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-refresh"></i></button><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_finished_right" style="position: absolute; left: 77%; top: 60%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-check-square"></i></button><!--',
'            --><button type="button" class="t-HeroRegion-icon fp_force_capture_right" style="position: absolute; left: 77%; top: 60%; padding: 7px; display: none; font-size: 32px;"><i class="fa t-HeroRegion-icon fa-hand-stop-o"></i></button>',
'        </div>',
'    </div>',
'    <div id="spinner_fingerprint" class="spinner" style="position: absolute; left: 50%; top: 0; display: none"><div class="bounce1"></div><div class="bounce2"></div><div class="bounce3"></div></div>',
'    <div style="position: absolute; left: 50%; top: 0;">',
'        <div class="animated bounce fp_capture_message" style="color: rgb(255, 255, 255);text-shadow: white 0px 0px 2px;position: relative;display: inline-block;margin-left: -122px;font-size: 2.3rem;font-weight: 400;text-align: center;line-height: 12'
||'0%;max-width: 244px;width: 244px;background-color: rgb(255, 0, 0);border-radius: 0.5em;border: 2px solid rgba(0, 0, 0, 0.2);/*padding-bottom: 0.5rem;*/margin-top: 1rem;"></div>',
'    </div>',
'    <div style="position: absolute; left: 50%; bottom: 0;">',
'        <div id="fp_preview_area" style="position: relative">',
'            <img id="finger_preview_liveview" class="fp_preview_liveview">',
'            <span id="fp_cc_time" class="liveview_blink"></span>',
'        </div>',
'    </div>',
'</div>',
'<div onclick="toggleAllFingers()" title="Toggle all Fingers" style="right: 20px; position: absolute; cursor: pointer; font-size: 2rem; color: red;" class="fa fa-ban"></div>',
'<div onclick="connectLF10()" title="Restart LF10" style="left: 20px; position: absolute; cursor: pointer; font-size: 2rem; color: red;" class="fa fa-refresh"></div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(462722918664542625)
,p_plug_name=>'CELL2'
,p_region_name=>'FACE_VERIFY'
,p_parent_plug_id=>wwv_flow_api.id(276994854008050056)
,p_region_css_classes=>'CSS_LAYOUT_COL2 CSS_LAYOUT_COLUMN grow CSS_NO_FINGERPRINT'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="face_comparison" style="margin: 0 auto;height: 300px;max-width: 600px;width: 600px;padding-left: 0 !important;">',
'    <div id="visual_photo_frame" class="visual_passport_photo" style="float:left;width:105px;height:300px;line-height:300px;background-color: #F8F8F8; border-radius: 12px; border: 1px solid #EEE; position: relative">',
'        <div class="photo_frame_header"><span>Scan</span></div>',
'        <img id="photoreference_1" style="max-width: 100%; max-height: 100%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg"/>',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'    <div id="visual_chip_comparison_meter" style="float:left; width:40px;height:300px; margin-left: 10px; margin-right: 10px"></div>',
'    <div id="chip_photo_frame" style="float:left;width:105px;height:300px;line-height:300px;background-color: #F8F8F8; border-radius: 12px; border: 1px solid #EEE; position: relative">',
'        <div  class="photo_frame_header"><span class="header_face_photo_chip">Chip</span></div>',
'        <img id="photoreference" style="max-width: 100%;max-height: 100%;display: inline-block;margin: 0 auto;vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg">',
'		<img id="photoreference_nochip" style="display: inline-block;max-width: 100%;max-height: 100%;margin: 0 auto;vertical-align: middle;width: 100%" src="#WORKSPACE_IMAGES#person.svg"><!--<img id="photoreference" style="max-width: 100%; max-height: 100'
||'%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#APP_IMAGES#questionmark_blue.svg"/>--><span id="text_nochip" class="display-no-chip" src="" style="display: none">NO CHIP FOUND</span>',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'    <div id="capture_comparison_quality" style="float:left;width:40px;height:300px; margin-left: 10px; margin-right: 10px"></div>',
'    <div id="capture_comparison_photo_frame" class="photo_frame" style="width:105px;">',
'        <div class="photo_frame_header"><span>Live</span></div>',
'        <img id="capture_comparison_photo" style="max-width: 100%; max-height: 100%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg">',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'    <div id="recent_quality" style="float:left;width:40px;height:300px; margin-left: 10px; margin-right: 10px"></div>',
'    <div id="recent_photo_frame" class="photo_frame" style="width:105px;">',
'        <div class="photo_frame_header"><span>Database</span></div>',
'        <img id="recent_photo" style="max-width: 100%; max-height: 100%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg">',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'</div>',
'<span id="id_passport_face_status"></span>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(462283547372310353)
,p_plug_name=>'LAYOUT_ROW_1'
,p_region_name=>'REG_LAYOUT_ROW_1'
,p_parent_plug_id=>wwv_flow_api.id(462723578543542632)
,p_region_css_classes=>'CSS_LAYOUT_ROW '
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553629039791917056)
,p_plug_name=>'REG_LEFT'
,p_region_name=>'REG_TODO'
,p_parent_plug_id=>wwv_flow_api.id(553184518082552931)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553149942448361145)
,p_plug_name=>'Passport Details'
,p_parent_plug_id=>wwv_flow_api.id(553629039791917056)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>2
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553035051537379217)
,p_plug_name=>'TABS_MAIN'
,p_parent_plug_id=>wwv_flow_api.id(553149942448361145)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--large:t-Form--stretchInputs:t-Form--leftLabels'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553149149284332467)
,p_plug_name=>'Passport Check & Movement'
,p_parent_plug_id=>wwv_flow_api.id(553035051537379217)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553029558079273587)
,p_plug_name=>'Biometric / Security Checks'
,p_region_name=>'REG_HIDEME'
,p_parent_plug_id=>wwv_flow_api.id(553149149284332467)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(557683975090515187)
,p_plug_name=>'Passport Security Checks'
,p_region_name=>'SecurityChecks'
,p_parent_plug_id=>wwv_flow_api.id(553029558079273587)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553046747327446180)
,p_plug_name=>'Visual MRZ / Photo'
,p_parent_plug_id=>wwv_flow_api.id(553149149284332467)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(458923966234802654)
,p_plug_name=>'REG_PASSPORT_TABS'
,p_parent_plug_id=>wwv_flow_api.id(553046747327446180)
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_api.id(563823021746049617)
,p_plug_display_sequence=>310
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(557895514608470180)
,p_plug_name=>'Face'
,p_parent_plug_id=>wwv_flow_api.id(458923966234802654)
,p_region_template_options=>'#DEFAULT#:t-Alert--horizontal:t-Alert--noIcon:t-Alert--info'
,p_plug_template=>wwv_flow_api.id(563811343906049613)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(549012468025720465)
,p_plug_name=>'Webcam'
,p_parent_plug_id=>wwv_flow_api.id(557895514608470180)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_column=>false
,p_plug_grid_column_span=>8
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(566925138413925215)
,p_plug_name=>'Dashboard'
,p_region_name=>'PassportData'
,p_parent_plug_id=>wwv_flow_api.id(458923966234802654)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody:t-Form--large'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(459800927068866152)
,p_plug_name=>'Security Checks'
,p_parent_plug_id=>wwv_flow_api.id(566925138413925215)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>1
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(553193586260621298)
,p_plug_name=>'REG_ShowWhenPassportNotRead'
,p_region_name=>'ID_REG_ShowWhenPassportNotRead'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="max-height:1024px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(460619808930160156)
,p_plug_name=>'REG_HEADER'
,p_parent_plug_id=>wwv_flow_api.id(553193586260621298)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>21
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_column=>5
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'      '))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843675861976768449)
,p_plug_name=>'INIT_REGION_CONTAINER'
,p_parent_plug_id=>wwv_flow_api.id(553193586260621298)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>11
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(276994474373050053)
,p_plug_name=>'INIT_REGION_CONTAINER_L'
,p_parent_plug_id=>wwv_flow_api.id(843675861976768449)
,p_region_css_classes=>'CSS_LAYOUT_ROW3 CSS_LAYOUT_COLUMN_LEFT CSS_NO_FINGERPRIN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="max-width:640px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 5px;" class="tileheading">1 - Document Identification</div>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843675887436768450)
,p_plug_name=>'INIT_CELL1'
,p_region_name=>'INIT_CELL1'
,p_parent_plug_id=>wwv_flow_api.id(276994474373050053)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_region_attributes=>'style="padding:0px; position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>45
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843676815851768459)
,p_plug_name=>'REG_MANUAL_1'
,p_region_name=>'REG_MANUAL_1x'
,p_parent_plug_id=>wwv_flow_api.id(843675887436768450)
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--large'
,p_region_attributes=>'style="margin-top: 4%"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843676992355768461)
,p_plug_name=>'REG_MANUAL_BTNS'
,p_parent_plug_id=>wwv_flow_api.id(843675887436768450)
,p_region_template_options=>'#DEFAULT#:t-Form--noPadding'
,p_region_attributes=>'style="text-align: center"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(934737479749060955)
,p_plug_name=>'REG_MANUAL_2'
,p_region_name=>'REG_MANUAL_2'
,p_parent_plug_id=>wwv_flow_api.id(843675887436768450)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="margin-top: 6%"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843676388528768455)
,p_plug_name=>'INIT_CELL7'
,p_parent_plug_id=>wwv_flow_api.id(276994474373050053)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center; position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 0px;" class="tileheading">Visa</div><br><img src="#APP_IMAGES#VISA.jpg" style="width: 40%; height: 40%; object-fit: contain">'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843678084633768472)
,p_plug_name=>'INIT_CELL8'
,p_parent_plug_id=>wwv_flow_api.id(276994474373050053)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center; position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 0;" class="tileheading">Travel Card</div><br><img src="#APP_IMAGES#LANDINGCARD.jpg" style="width: 45%; height: 45%; object-fit: contain">'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(276994656637050054)
,p_plug_name=>'INIT_REGION_CONTAINER_R'
,p_parent_plug_id=>wwv_flow_api.id(843675861976768449)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843676039383768451)
,p_plug_name=>'INIT_CELL5'
,p_parent_plug_id=>wwv_flow_api.id(276994656637050054)
,p_region_css_classes=>'CSS_LAYOUT_COLUMN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="position: relative;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 0;" class="tileheading">4 - Document Scan Progress</div>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843677261033768463)
,p_plug_name=>'INIT_CELL2_LOGO'
,p_parent_plug_id=>wwv_flow_api.id(843676039383768451)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="margin-top:0px;margin-left:150px" class="hide_when_dataentered">',
'',
'<img class="makegrayscale" style="opacitiy:0.8" width=300px src="" alt="logo_immigration" id=''id_main_logo_gdi''/>',
'',
'    <div style="width:300px;margin-top:-460px;margin-left:0px" class="pie_progress" role="progressbar" data-goal="100" data-barcolor="#3daf2c" data-barsize="6" id="id_scan_progress">',
'',
'    </div>    ',
'</div><div class="show_when_dataentered" id="graystatusdiv">',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843677287874768464)
,p_plug_name=>'INIT_CELL2_AUTOSELECTION'
,p_parent_plug_id=>wwv_flow_api.id(843676039383768451)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843676109473768452)
,p_plug_name=>'INIT_CELL2'
,p_parent_plug_id=>wwv_flow_api.id(276994656637050054)
,p_region_css_classes=>'CSS_LAYOUT_COLUMN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 0;" class="tileheading">2 - Manual Photo Crop</div>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917742175363028483)
,p_plug_name=>'REG_DUMMY_PASSPORT'
,p_region_name=>'REG_DUMMY_PASSPORT'
,p_parent_plug_id=>wwv_flow_api.id(843676109473768452)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100049
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img src="#WORKSPACE_IMAGES#passport_.png" style="width: 100%; height: 100%; object-fit: contain; max-height: 30vh">'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917742513562094407)
,p_plug_name=>'REG_MANUAL_PASSPORT_CROP'
,p_region_name=>'REG_MANUAL_PASSPORT_CROP'
,p_parent_plug_id=>wwv_flow_api.id(843676109473768452)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100059
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917743465060132564)
,p_plug_name=>'REG_CROP_IMAGE'
,p_parent_plug_id=>wwv_flow_api.id(917742513562094407)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100069
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>9
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img style="max-height: 280px; border: 1px solid black;" id="MANUAL_SCANNED_DOCUMENT">'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917743685174135739)
,p_plug_name=>'REG_CROP_BUTTONS'
,p_parent_plug_id=>wwv_flow_api.id(917742513562094407)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100079
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>'<!--<img id="CROPPED_PHOTO" src="#WORKSPACE_IMAGES#person_noaspect.svg" style="max-width: 120px; max-height: 170px">-->'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843676351964768454)
,p_plug_name=>'INIT_CELL4'
,p_parent_plug_id=>wwv_flow_api.id(276994656637050054)
,p_region_css_classes=>'CSS_LAYOUT_COLUMN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 0;" class="tileheading">5 - Photo Select</div>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917769147928680411)
,p_plug_name=>'REG_DUMMY_PHOTO'
,p_region_name=>'REG_DUMMY_PHOTO'
,p_parent_plug_id=>wwv_flow_api.id(843676351964768454)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100089
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>12
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--<img src="#WORKSPACE_IMAGES#no_photo_01.png">--><div id="face_comparison_" style="margin: 0 auto;height: 300px;max-width: 600px;width: 600px;padding-left: 0 !important;">',
'    <div id="visual_photo_frame_" class="visual_passport_photo" style="float:left;width:105px;height:300px;line-height:300px;background-color: #F8F8F8; border-radius: 12px; border: 1px solid #EEE; position: relative">',
'        <div class="photo_frame_header"><span>Scan</span></div>',
'        <img id="photoreference_1_" style="max-width: 100%; max-height: 100%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg"/>',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'    <div id="visual_chip_comparison_meter_" style="float:left; width:40px;height:300px; margin-left: 10px; margin-right: 10px"></div>',
'    <div id="chip_photo_frame_" style="float:left;width:105px;height:300px;line-height:300px;background-color: #F8F8F8; border-radius: 12px; border: 1px solid #EEE; position: relative">',
'        <div  class="photo_frame_header"><span class="header_face_photo_chip">Chip</span></div>',
'        <img id="photoreference_" style="max-width: 100%;max-height: 100%;display: inline-block;margin: 0 auto;vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg">',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'    <div id="capture_comparison_quality_" style="float:left;width:40px;height:300px; margin-left: 10px; margin-right: 10px"></div>',
'    <div id="capture_comparison_photo_frame_" class="photo_frame" style="width:105px;">',
'        <div class="photo_frame_header"><span>Live</span></div>',
'        <img id="capture_comparison_photo_" style="max-width: 100%; max-height: 100%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg">',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'    <div id="recent_quality_" style="float:left;width:40px;height:300px; margin-left: 10px; margin-right: 10px"></div>',
'    <div id="recent_photo_frame_" class="photo_frame" style="width:105px;">',
'        <div class="photo_frame_header"><span>Database</span></div>',
'        <img id="recent_photo_" style="max-width: 100%; max-height: 100%; display: inline-block; margin: 0 auto; vertical-align: middle" src="#WORKSPACE_IMAGES#person.svg">',
'        <div class="photo_frame_footer"></div>',
'    </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917770425807764998)
,p_plug_name=>'REG_SELECT_CROP_PHOTO'
,p_region_name=>'REG_SELECT_CROP_PHOTO'
,p_parent_plug_id=>wwv_flow_api.id(843676351964768454)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100099
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917995329096116678)
,p_plug_name=>'Crop Images'
,p_parent_plug_id=>wwv_flow_api.id(917770425807764998)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100139
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917967840264019860)
,p_plug_name=>'Manual Crop Image'
,p_parent_plug_id=>wwv_flow_api.id(917995329096116678)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100109
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>4
,p_plug_display_column=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img id="MANUALLY_CROPPED_IMAGE" src="#WORKSPACE_IMAGES#person_noaspect.svg" style="max-width: 200px; max-height: 220px; border: 1px solid black; cursor: pointer;">'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917968713677041712)
,p_plug_name=>'Automatic Crop Image'
,p_parent_plug_id=>wwv_flow_api.id(917995329096116678)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100119
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img id="AUTOMATICALLY_CROPPED_PHOTO" src="#WORKSPACE_IMAGES#person_noaspect.svg" style="max-width: 200px; max-height: 220px; border: 1px solid black; cursor: pointer;">'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917969246429046131)
,p_plug_name=>'Detected Crop Image'
,p_parent_plug_id=>wwv_flow_api.id(917995329096116678)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100129
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<img id="AUTOMATICALLY_DETECTED_PHOTO" src="#WORKSPACE_IMAGES#person_noaspect.svg" style="max-width: 200px; max-height: 220px; border: 1px solid black; display: none; cursor: pointer;">'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(917996427354129487)
,p_plug_name=>'Crop Select Buttons'
,p_parent_plug_id=>wwv_flow_api.id(917770425807764998)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100149
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'NEVER'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(918005861465174084)
,p_plug_name=>'Crop Headers'
,p_parent_plug_id=>wwv_flow_api.id(917770425807764998)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align:center;"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>100138
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843677738158768468)
,p_plug_name=>'INIT_CELL6'
,p_parent_plug_id=>wwv_flow_api.id(276994656637050054)
,p_region_css_classes=>'CSS_LAYOUT_COLUMN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="text-align: center; position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="position: absolute;width: 100%;top: 0;" class="tileheading">6 - Date and Time</div><!--<div style="position: relative; text-align: center">',
'    --><h1 style="position: absolute; width: 100%; margin-top:90px;font-weight:bold;color:#4992de" class="hide_when_dataentered" id="id_current_date"> </h1><!--',
'    <div class="clock">',
'      <div class="hours-container">',
'        <div class="hours"></div>',
'      </div>',
'      <div class="minutes-container">',
'        <div class="minutes"></div>',
'      </div>',
'      <div class="seconds-container">',
'        <div class="seconds"></div>',
'      </div>',
'        <div class="h12"></div><div class="h3"></div><div class="h6"></div><div class="h9"></div>',
'    </div>',
'</div>-->',
'<div class="t-HeroRegion show_when_dataentered" style="margin-left: 15px; margin-right: 15px; padding-top: 0; text-align: left">',
'  <div class="t-HeroRegion-wrap">',
'    <div class="t-HeroRegion-col t-HeroRegion-col--left"><span class="t-HeroRegion-icon t-Icon fa fa-database"></span></div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'      <h2 class="t-HeroRegion-title">Travel History</h2>',
'      Showing the last movement(s)',
'    </div>',
'    <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form"></div><div class="t-HeroRegion-buttons"></div></div>',
'  </div>',
'</div>',
'<div style="padding-left:15px;padding-right:15px;margin-top:0px;" class="t-IRR-region interactive_report_hide_filters show_when_dataentered" role="group">',
'  <h2 class="u-VisuallyHidden">Movements</h2>',
'<div class="a-IRR-container"><div class="a-IRR"><div class="a-IRR-singleRowView"></div><div class="a-IRR-fullView" style="max-height: 204px"><div class="a-IRR-colSearch"></div><div class="a-IRR-content"><div class="a-IRR-dialogBody" style="display:no'
||'ne"></div><style type="text/css">',
'</style>',
'<div class="a-IRR-chartView"></div><div class="a-IRR-groupByView"></div><div class="a-IRR-pivotView"></div><div class="a-IRR-reportView"><div class="a-IRR-noDataMsg"><div class="a-IRR-noDataMsg-icon"><span class="a-Icon icon-irr-no-results" aria-hidd'
||'en="true"></span></div><span class="a-IRR-noDataMsg-text">No Movements yet </span></div></div></div></div></div></div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(843677981129768471)
,p_plug_name=>'INIT_CELL3'
,p_parent_plug_id=>wwv_flow_api.id(276994656637050054)
,p_region_css_classes=>'CSS_LAYOUT_COLUMN'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="position: relative"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="position: absolute;width: 100%;top: 0;" class="tileheading">3 - Camera Preview</div><center><img id="init_video" style="margin-left: 10px;border-radius:15px;max-height:300px;max-width:590px"/></center>'
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(563601671165712112)
,p_plug_name=>'MRZ Check Error'
,p_region_name=>'MRZ_CONTAINER'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-size600x400'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(119255355271993203)
,p_plug_name=>'MRZ Number'
,p_region_name=>'MRZ_CONTAINER_SELECTOR'
,p_parent_plug_id=>wwv_flow_api.id(563601671165712112)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="mrz-correction-original" id="MRZ_SELECTOR_0">',
'    <div class="CSS_MRZ_LINE" id="OVERVIEW_MRZ_1"></div>',
'    <div class="mrz-selectable">',
'        <div class="mrz-line" id="OVERVIEW_MRZ_2" style="padding-top: 0.5em">',
'            <span id="PASSPORT_MRZ_NUMBER"></span><span id="PASSPORT_MRZ_NUMBER_SUM"></span><span id="PASSPORT_MRZ_NATIONALITY"></span><span id="PASSPORT_MRZ_DOB"></span><span id="PASSPORT_MRZ_DOB_SUM"></span><span id="PASSPORT_MRZ_GENDER"></span><sp'
||'an id="PASSPORT_MRZ_DUE"></span><span id="PASSPORT_MRZ_DUE_SUM"></span><!--span id="PASSPORT_MRZ_TAIL"></span--><span id="PASSPORT_MRZ_OPTIONAL"></span><span id="PASSPORT_MRZ_OPTIONAL_SUM"></span><span id="PASSPORT_MRZ_SUM"></span>',
'        </div>',
'        <div class="mrz-selector"></div>',
'    </div>        ',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(4687641602301952202)
,p_plug_name=>'MRZ Scanner Image'
,p_parent_plug_id=>wwv_flow_api.id(563601671165712112)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div style="text-align:center;overflow: hidden;margin-top: 1em;"><img id="PASSPORT_INVALID_MRZ_IMAGE" style="object-fit: contain;width: 100%;margin-top: -50%;"></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(841138445411463882)
,p_plug_name=>'REG_SECURITYIMAGES'
,p_region_name=>'REG_SECIMAGES_DETAIL'
,p_region_css_classes=>'CSS_ANIMATEBACK'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="background-color:#EEEEEE;border-radius:15px;padding:8px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<img id="SCI_1" class="css_sci">',
'<img id="SCI_2" class="css_sci">',
'<img id="SCI_3" class="css_sci">',
'<br>',
'<img id="SCI_4" class="css_sci">',
'<img id="SCI_5" class="css_sci" src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==">',
'<img id="SCI_6" class="css_sci">',
'<br>',
'<img id="SCI_7" class="css_sci">',
'<img id="SCI_8" class="css_sci">',
'<img id="SCI_9" class="css_sci">'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(841145134579660043)
,p_plug_name=>'REG_SINGLE_FP_DETAIL'
,p_region_name=>'REG_SINGLE_FP_DETAIL'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:none">',
'<img src="#APP_IMAGES#Left Hand_gray.png">',
'<img src="#APP_IMAGES#Right Hand_gray.png">',
'<img src="#APP_IMAGES#Left Hand_red.png">',
'<img src="#APP_IMAGES#Left Hand_green.png">',
'<img src="#APP_IMAGES#Left Hand_missing_sign.png">',
'<img src="#APP_IMAGES#Right Hand_red.png">',
'<img src="#APP_IMAGES#Right Hand_green.png">',
'<img src="#APP_IMAGES#Right Hand_missing_sign.png">',
'</div><div id="single_fp_details" class="css_input_pd" style="background-color: #2578cf; padding: 5px; border-radius: 5px; text-align: center; display: none">',
'    <div style="border-bottom: 5px solid #2578cf; padding: 20px; background-color: white; border-radius: 5px; font-size: 150%">',
'        Captured fingerprint details',
'    </div>',
'    <div style="background: white; padding: 10px; border-radius: 0px 0px 5px 5px; height: 420px; overflow: hidden">',
'        <div style="float: left">',
'            <img id="finger_detail_image_1" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_2" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_3" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_4" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_5" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_6" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_7" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_8" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_9" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'            <img id="finger_detail_image_10" class="single_fp_detail_image" src="#WORKSPACE_IMAGES#finger_empty_transparent.png">',
'        </div>',
'        <div style="float: right; vertical-align: middle; text-align: right">',
'            <div style="display: table">',
'                <div style="display: table-cell; vertical-align: middle; width: 80px; font-size: 120%">',
'                    <span style="display: block; transform: rotate(-90deg)" class="fingerprint-details-quality-text"><!--span class="NistQualityPresent" style="display: none">NIST&nbsp;</span>Quality--></span>',
'                </div>',
'                <div style="margin-left: -16px">',
'                    <div id="finger_detail_quality_1" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_2" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_3" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_4" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_5" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_6" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_7" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_8" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_9" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                    <div id="finger_detail_quality_10" class="single_fp_detail_quality" style="display:inline-block"></div>',
'                </div>',
'            </div>',
'            <br>',
'            <br><span id="finger_detail_hand" style="font-size: 150%"></span>',
'            <br>',
'            <br><span id="finger_detail_position" style="font-size: 150%"></span>',
'            <br><br>',
'            <div style="display: table">',
'                <div style="display: table-cell; vertical-align: middle; width: 60px">',
'                    <span style="display: block; transform: rotate(-90deg)">Liveness</span>',
'                </div>',
'                <div style="margin-left: -16px">',
'                    <div id="finger_detail_liveness_1" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_2" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_3" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_4" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_5" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_6" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_7" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_8" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_9" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                    <div id="finger_detail_liveness_10" class="single_fp_detail_liveness" style="display:inline-block"></div>',
'                </div>',
'            </div>',
'        </div>',
'    </div>',
'</div>'))
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(841428867291110161)
,p_plug_name=>'REG_PASS_DIGITS_DETAILS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(842495909979377244)
,p_plug_name=>'Visa'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--<div id="VISA_OVERLAY" style="position: absolute; z-index: 5; top: 0; left: 0; width: 100%; height: 340px; background: rgba(0, 0, 0, 0.3); display: none">',
'    <span style="position: absolute; cursor: pointer; top: 50%;left: 50%;transform: translateX(-40px) translateY(-40px);font-size: 80px;color: blueviolet;text-shadow: 0px 0px 15px #CCCCCC;" class="fa fa-recycle"></span>',
'</div>-->'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(923649982409082716)
,p_plug_name=>'VISUM_CLEAR'
,p_parent_plug_id=>wwv_flow_api.id(842495909979377244)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding:10px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<br>'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(923761359382424052)
,p_plug_name=>'VISUM_IMAGE'
,p_region_name=>'visa_to_zoom'
,p_parent_plug_id=>wwv_flow_api.id(842495909979377244)
,p_region_css_classes=>'zoomy-'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(842496260251377247)
,p_plug_name=>'Travelcard TM6'
,p_region_template_options=>'#DEFAULT#:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(563819470613049616)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!--<div id="LANDINGCARD_OVERLAY" style="position: absolute; z-index: 5; top: 0; left: 0; width: 100%; height: 340px; background: rgba(0, 0, 0, 0.3); display: none">',
'    <span style="position: absolute; cursor: pointer; top: 50%;left: 50%;transform: translateX(-40px) translateY(-40px);font-size: 80px;color: blueviolet;text-shadow: 0px 0px 15px #CCCCCC;" class="fa fa-recycle"></span>',
'</div>-->'))
,p_plug_query_row_template=>1
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(923646143755067586)
,p_plug_name=>'LC_CLEAR'
,p_parent_plug_id=>wwv_flow_api.id(842496260251377247)
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="padding:10px"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(923664198372119026)
,p_plug_name=>'LC_IMAGE'
,p_region_name=>'lc_to_zoom'
,p_parent_plug_id=>wwv_flow_api.id(842496260251377247)
,p_region_css_classes=>'zoomy-'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width: 100%"'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(842959974269191637)
,p_plug_name=>'REG_PASSPORTEDIT'
,p_region_name=>'REG_MANUALEDIT_FORM'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_region_attributes=>'style="border-radius:15px"'
,p_plug_template=>wwv_flow_api.id(563820889302049617)
,p_plug_display_sequence=>140
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(916895024379109223)
,p_plug_name=>'REG_HIDDEN_STATIC_ITEMS'
,p_region_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="display:none";'
,p_plug_template=>wwv_flow_api.id(563812786985049615)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'N'
,p_plug_display_point=>'BODY'
,p_plug_query_row_template=>1
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43028689557716811)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(43028465480716809)
,p_button_name=>'P17_CLOSE_TEMP_ONLY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(181668977767336829)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(455376177247005495)
,p_button_name=>'open_Blacklist'
,p_button_static_id=>'OPEN_BLACKLIST'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Open blacklist'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP::'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(466150883496054732)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_api.id(458671139153975082)
,p_button_name=>'NOFINGERS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'No Fingerprints available'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'LEFT'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(852081382716131263)
,p_button_sequence=>280
,p_button_plug_id=>wwv_flow_api.id(455376177247005495)
,p_button_name=>'BTN_LOGIN_SUPERVISOR'
,p_button_static_id=>'BTN_ID_SUPERVISOR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Btn Login Supervisor'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_WORKFLOWPROBLEMS:&P17_WORKFLOW_PROBLEMS.'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188234639442304727)
,p_button_sequence=>1420
,p_button_plug_id=>wwv_flow_api.id(460620789671160166)
,p_button_name=>'DOWN'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Down'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:sendCmdDown();'
,p_icon_css_classes=>'fa-chevron-down'
,p_button_cattributes=>'style="margin-top:-100px;margin-right: 10%"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(792672138284460144)
,p_button_sequence=>1430
,p_button_plug_id=>wwv_flow_api.id(460620789671160166)
,p_button_name=>'BTN_TRACK_PERSON'
,p_button_static_id=>'BTN_TRACK_PERSON'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Track'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:toggleCameraTrace();'
,p_icon_css_classes=>'fa-arrows'
,p_button_cattributes=>'style="margin-top:-100px;position: absolute;right: 68px;bottom: 74px;height: 29px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(900302970416613967)
,p_button_sequence=>4
,p_button_plug_id=>wwv_flow_api.id(196840613756019193)
,p_button_name=>'C'
,p_button_static_id=>'BTN_ADD_CHILDREN'
,p_button_action=>'REDIRECT_APP'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Collective Passport'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=GLOBAL_DIALOGS:20:&SESSION.::&DEBUG.:RP,20::'
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-users'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261841855662248867)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(935037628639386123)
,p_button_name=>'P17_SHOW_RESIDENT_INFORMATION'
,p_button_static_id=>'P17_SHOW_RESIDENT_INFORMATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Resident Info'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-user-secret'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(456559863480396218)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(553029961227276066)
,p_button_name=>'New'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Animate Back'
,p_button_position=>'BODY'
,p_button_css_classes=>'CSS_ANIMATEBACK'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(923627728648868221)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(923646143755067586)
,p_button_name=>'P17_RESET_LC_IMAGE'
,p_button_static_id=>'P17_RESET_LC_IMAGE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-recycle'
,p_button_cattributes=>'style="margin-left: .8rem; width: 200px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5173632605450838632)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(107619780740742926)
,p_button_name=>'P17_TOGGLE_REMARK_LANG'
,p_button_static_id=>'P17_TOGGLE_REMARK_LANG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Toggle Remark Language'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-layout-blank cl-mask-lang-disp cl-mask-lang-en'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21423520917287821404)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21423520722189821402)
,p_button_name=>'P17_RI_SEARCH_BTN'
,p_button_static_id=>'P17_RI_SEARCH_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-search'
,p_button_cattributes=>'tabindex="-1" style="margin-top: 8.2em; font-size: 125%;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(854699879504954919)
,p_button_sequence=>17
,p_button_plug_id=>wwv_flow_api.id(843676992355768461)
,p_button_name=>'BTN_SEARCH_DOC'
,p_button_static_id=>'BTN_FIND_DOC'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find Document'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261568718631276800)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(935037628639386123)
,p_button_name=>'P17_SHOW_THAI_NAME'
,p_button_static_id=>'P17_SHOW_THAI_NAME'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Thai Info'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-user-check'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(846658775313758084)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(843676992355768461)
,p_button_name=>'BTN_RESCAN_MANUAL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Restart Border Process (F7)'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:resetWorkstation();'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-close'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(930389503680362020)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(449698833487462752)
,p_button_name=>'P17_RESTART_BORDER_PROCESS'
,p_button_static_id=>'P17_RESTART_BORDER_PROCESS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Restart Border Process (F7)'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:resetWorkstation();'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-close'
,p_button_cattributes=>'style="margin-left:75px;width:206px;margin-bottom:20px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(842965790775277704)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(843676992355768461)
,p_button_name=>'REQUEST_MANUALPASSPORT'
,p_button_static_id=>'ID_BTN_MANUAL_PROCESS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Manually Process Passport (F10)'
,p_button_position=>'BODY'
,p_button_redirect_url=>'javascript:processManually();'
,p_icon_css_classes=>'flaticon-passport4'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2729914449084547142)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(935037628639386123)
,p_button_name=>'P17_TOGGLE_STATELESS'
,p_button_static_id=>'P17_TOGGLE_STATELESS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Stateless'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-globe'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54505302250889718)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(935037628639386123)
,p_button_name=>'P17_BTN_FIND_MANUALLY'
,p_button_static_id=>'P17_BTN_FIND_MANUALLY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find Document'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(196842305316019210)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(196840613756019193)
,p_button_name=>'VEHICLE_DETAIL'
,p_button_static_id=>'VEHICLE_DETAIL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Vehicle detail'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP::'
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-truck'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107621217046742940)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(935037628639386123)
,p_button_name=>'P17_PROCESS_MANUALLY'
,p_button_static_id=>'P17_BTN_PROCESS_MANUALLY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Process Manually'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-keyboard-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(441446472012127538)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(196840613756019193)
,p_button_name=>'VEHICLE_DETAIL_TM2'
,p_button_static_id=>'VEHICLE_DETAIL_TM2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Vehicle Detail'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14::'
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-truck'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(128282829167666542)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(196840613756019193)
,p_button_name=>'CREW_INFORMATION'
,p_button_static_id=>'CREW_INFORMATION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Crew Information'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-crew white'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(197228128342066390)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(190408578301595997)
,p_button_name=>'P17_SHOW_TRAVEL_CARD_DISPLAY'
,p_button_static_id=>'P17_SHOW_TRAVEL_CARD_DISPLAY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Travel Card TM6'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-address-card-o'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261675134020285579)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(196840613756019193)
,p_button_name=>'P17_SHOW_TRAVEL_CARD'
,p_button_static_id=>'P17_SHOW_TRAVEL_CARD'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Travel Card TM6'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-address-card-o'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261811486278970149)
,p_button_sequence=>71
,p_button_plug_id=>wwv_flow_api.id(190408527261595996)
,p_button_name=>'P17_SHOW_VISUM'
,p_button_static_id=>'P17_SHOW_VISUM'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Visa'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-address-book-o'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38454545811068630)
,p_button_sequence=>81
,p_button_plug_id=>wwv_flow_api.id(190408527261595996)
,p_button_name=>'P17_SHOW_PERMIT_INFO'
,p_button_static_id=>'P17_SHOW_PERMIT_INFO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Permit Information'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-layout-modal-blank'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(43029342729716818)
,p_button_sequence=>91
,p_button_plug_id=>wwv_flow_api.id(190408527261595996)
,p_button_name=>'P17_SHOW_TEMP_ONLY'
,p_button_static_id=>'P17_SHOW_TEMP_ONLY'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Env Var Info (Temp Only)'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_button_css_classes=>'show-dialog-button'
,p_icon_css_classes=>'fa-layout-modal-blank'
,p_button_cattributes=>'tabindex="-1"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(262059462216109193)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_api.id(935037962603390286)
,p_button_name=>'P17_SHOW_BLACKLIST'
,p_button_static_id=>'P17_SHOW_BLACKLIST'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Blacklist'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="margin-left: 37%;margin-bottom: 1em;width: 175px;"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(937482749802694163)
,p_button_sequence=>960
,p_button_plug_id=>wwv_flow_api.id(455376177247005495)
,p_button_name=>'P17_HIDDEN_BTNFIND'
,p_button_static_id=>'P17_HIDDEN_BTNFIND'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Hidden Btnfind'
,p_button_position=>'BODY'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(917775234427205826)
,p_button_sequence=>1000
,p_button_plug_id=>wwv_flow_api.id(917743685174135739)
,p_button_name=>'P17_ROTATE_CROP_IMAGE'
,p_button_static_id=>'P17_ROTATE_CROP_IMAGE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rotate Image'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'CropRotate180Degrees CropButton'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(917983914392071657)
,p_button_sequence=>1000
,p_button_plug_id=>wwv_flow_api.id(917996427354129487)
,p_button_name=>'P17_SELECT_MANUAL_CROP_PHOTO'
,p_button_static_id=>'P17_SELECT_MANUAL_CROP_PHOTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Use Manually Cropped Photo'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'style="width: 18rem"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(917996904810145393)
,p_button_sequence=>1000
,p_button_plug_id=>wwv_flow_api.id(917996427354129487)
,p_button_name=>'P17_SELECT_AUTOMATIC_CROP_PHOTO'
,p_button_static_id=>'P17_SELECT_AUTOMATIC_CROP_PHOTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Use Automatically Cropped Photo'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'style="width: 18rem"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(917997390328151450)
,p_button_sequence=>1000
,p_button_plug_id=>wwv_flow_api.id(917996427354129487)
,p_button_name=>'P17_SELECT_DETECT_CROP_PHOTO'
,p_button_static_id=>'P17_SELECT_DETECT_CROP_PHOTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Use Detected Crop Photo'
,p_button_position=>'BODY'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-check'
,p_button_cattributes=>'style="width: 18rem"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(923650355631089860)
,p_button_sequence=>1200
,p_button_plug_id=>wwv_flow_api.id(923649982409082716)
,p_button_name=>'P17_VISA_CLEAR'
,p_button_static_id=>'P17_VISA_CLEAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Clear'
,p_button_position=>'BODY'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-recycle'
,p_button_cattributes=>'style="margin-left: .8rem; width: 200px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261822330747622028)
,p_button_sequence=>1330
,p_button_plug_id=>wwv_flow_api.id(923649982409082716)
,p_button_name=>'P17_VISUM_CLOSE'
,p_button_static_id=>'P17_VISUM_CLOSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BODY'
,p_button_cattributes=>'style="margin-left: 35%; width: 200px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261825032508721326)
,p_button_sequence=>1330
,p_button_plug_id=>wwv_flow_api.id(923646143755067586)
,p_button_name=>'P17_CLOSE_LC'
,p_button_static_id=>'P17_CLOSE_LC'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'BODY'
,p_button_alignment=>'LEFT'
,p_button_cattributes=>'style="margin-left: 35%; width: 200px"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(186862786111161710)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(449698833487462752)
,p_button_name=>'P17_MANUAL_BLACKLIST_CHECK'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'BL Check'
,p_button_position=>'BOTTOM'
,p_button_alignment=>'LEFT'
,p_button_redirect_url=>'javascript:demographicDates();'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(951382784829652808)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(449698833487462752)
,p_button_name=>'P17_SAVE_MOVEMENT'
,p_button_static_id=>'P17_SAVE_MOVEMENT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save (F12)'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:saveMovement();'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-floppy-o fa-1-5x'
,p_button_cattributes=>'style="margin-top:-7px;margin-right: 3%"'
,p_grid_new_grid=>false
,p_button_comment=>'Save (F10)'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188233536943212896)
,p_button_sequence=>1400
,p_button_plug_id=>wwv_flow_api.id(460620789671160166)
,p_button_name=>'LEFT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Left'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:sendCmdLeft();'
,p_icon_css_classes=>'fa-chevron-left'
,p_button_cattributes=>'style="margin-top:-205px;"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188234405378294869)
,p_button_sequence=>1405
,p_button_plug_id=>wwv_flow_api.id(460620789671160166)
,p_button_name=>'UP'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Up'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:sendCmdUp();'
,p_icon_css_classes=>'fa-chevron-up'
,p_button_cattributes=>'style="margin-top:-270px;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(188195146325659512)
,p_button_sequence=>1410
,p_button_plug_id=>wwv_flow_api.id(460620789671160166)
,p_button_name=>'RIGHT'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841661582049626)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Right'
,p_button_position=>'BOTTOM'
,p_button_redirect_url=>'javascript:sendCmdRight();'
,p_icon_css_classes=>'fa-chevron-right'
,p_button_cattributes=>'style="margin-top:-205px;margin-right: 3%"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(38453440440068619)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(38453348575068618)
,p_button_name=>'P17_CLOSE_PERMIT_INFO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108033190189098004)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(108032987983098002)
,p_button_name=>'OVERSTAY_OK'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(155987221607829734)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(155986711780829728)
,p_button_name=>'P17_CLOSE_CI'
,p_button_static_id=>'P17_CLOSE_CI'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(165604182477467936)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(165604062391467935)
,p_button_name=>'P17_CLOSE_WATCHLIST_PASSPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170551301741907636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(170550711073907630)
,p_button_name=>'P17_CLOSE_RESIDENCE'
,p_button_static_id=>'P17_CLOSE_XRI'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="margin-left: 65%; width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(170738339698646612)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(170738027701646609)
,p_button_name=>'P17_CLOSE_VOIDPASSPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(172923452696506594)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(172923365445506593)
,p_button_name=>'P17_CLOSE_VISARUN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261829720078828199)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(261827073420776781)
,p_button_name=>'P17_CLOSE_TNI'
,p_button_static_id=>'P17_CLOSE_TNI'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="margin-left: 70%; width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(261846115949369659)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(261840901167223525)
,p_button_name=>'P17_CLOSE_RI'
,p_button_static_id=>'P17_CLOSE_RI'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="margin-left: 65%; width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(792668093511460103)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(504470016726245950)
,p_button_name=>'P17_CLOSE_FIND_MANUALLY_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_button_cattributes=>'style="width: 200px"'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21423522209596821417)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(21423522000051821415)
,p_button_name=>'P17_CLOSE_FIND_RESIDENT_REPORT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107618044672742909)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(563601671165712112)
,p_button_name=>'BTN_INVALID_MRZ_CLOSE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'OK'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(196842209387019209)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(196841006363019197)
,p_button_name=>'CLOSE_VD'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_image_alt=>'Close'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(4687641746831952203)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(563601671165712112)
,p_button_name=>'BTN_INVALID_MRZ_RESCAN'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(563841742376049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Rescan'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'javascript:resetWorkstation(true);'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(460611114506108238)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(458671139153975082)
,p_button_name=>'RESCAN_FP'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Re-Scan Fingerprints'
,p_button_position=>'TOP'
,p_button_alignment=>'LEFT'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(854044918910797029)
,p_button_sequence=>290
,p_button_plug_id=>wwv_flow_api.id(843676351964768454)
,p_button_name=>'CUTOUT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(563841797390049627)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Find face'
,p_button_position=>'TOP'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-scissors'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(566955892058164432)
,p_branch_name=>'ResetScanPassport'
,p_branch_action=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:RP,17::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38452857837068613)
,p_name=>'P17_RI_RESIDENT_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'Resident Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT rescerttypenm d, rescerttypecd r',
'FROM dl_bordercontrol.v_crs_rescerttype',
'WHERE actflag = ''Y''',
'ORDER BY rescerttype_seqno',
';'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38452965795068614)
,p_name=>'P17_RI_FIRST_NAME'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'Thai Firstname:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38453086123068615)
,p_name=>'P17_RI_MIDDLE_NAME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'Thai Middlename:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38453150777068616)
,p_name=>'P17_RI_LAST_NAME'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'Thai Familyname:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38453221483068617)
,p_name=>'P17_RI_RESIDENT_NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Resident No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38453804383068623)
,p_name=>'P17_RE_TM8_SEQNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43028047236716805)
,p_prompt=>'Key of Re Entry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38453998083068624)
,p_name=>'P17_RE_DOCTYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43028047236716805)
,p_prompt=>'Re-Entry Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38454037352068625)
,p_name=>'P17_RE_ENDPERMIT_DATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(43028047236716805)
,p_prompt=>'Date of Permit Expiry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38454178459068626)
,p_name=>'P17_IS_PERMIT_INFO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(38453348575068618)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38455001497068635)
,p_name=>'P17_EXT_LIST_SEQNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43028168154716806)
,p_prompt=>'Key of Re ExtendStay:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(38455117156068636)
,p_name=>'P17_EXT_PERMIT_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43028168154716806)
,p_prompt=>'Date of Permit Expiry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43028590713716810)
,p_name=>'P17_IS_TEMP_ONLY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43028465480716809)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43029261380716817)
,p_name=>'P17_TEMP_ONLY_VAR_INFO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(43028465480716809)
,p_prompt=>'Temp only var info'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>50
,p_cHeight=>15
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43031125113716836)
,p_name=>'P17_RQS_PERSON_SEQNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(43031092684716835)
,p_prompt=>'Key of Re Request for Residence:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(43031271131716837)
,p_name=>'P17_RQS_PERMIT_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(43031092684716835)
,p_prompt=>'Date of Permit Expiry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(46069969056049356)
,p_name=>'P17_BRDDOC_IDENTITY'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51443691068222502)
,p_name=>'P17_ENDQ_RESIDENCE_NO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Residence No:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51443788555222503)
,p_name=>'P17_ENDQ_RESIDENCE_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Residence Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51443818095222504)
,p_name=>'P17_ENDQ_THAI_FIRSTNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Thai Firstname:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51443928933222505)
,p_name=>'P17_ENDQ_THAI_FAMILYNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Thai Familyname:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51444042626222506)
,p_name=>'P17_ENDQ_RESIDENCE_BOOK_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Residence Book No:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51444169003222507)
,p_name=>'P17_ENDQ_ENDORSEMENT_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Endorsement No:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51444284520222508)
,p_name=>'P17_ENDQ_ISSUE_PLACE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Issue Place:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51444312994222509)
,p_name=>'P17_ENDQ_EXPIRED_DATE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Endorsement Expired Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(51444429514222510)
,p_name=>'P17_ENDQ_THAI_MIDDLENAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(51443533025222501)
,p_prompt=>'Thai Middlename:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65870360433818421)
,p_name=>'P17_CITIZENID_THAI'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_prompt=>'Citizen ID :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(65870471665818422)
,p_name=>'P17_MIDDLE_NAME_THAI'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_prompt=>'Middle Name Thai:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(77077195282382668)
,p_name=>'P17_CAMERA_DIRECTION_X'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(95456429755695415)
,p_name=>'P17_BLACKLISTALERT_ACTION'
,p_item_sequence=>920
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(100392684875729401)
,p_name=>'P17_BLACKLIST_CANCEL_REASON'
,p_item_sequence=>930
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107620051575742929)
,p_name=>'P17_DISPLAY_DOCTYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_placeholder=>'Type'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field auto-upper-case CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108033240929098005)
,p_name=>'P17_OVERSTAY_INFO_TRAVEL_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(170739878678646627)
,p_prompt=>'Arrival Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108033395137098006)
,p_name=>'P17_OVERSTAY_INFO_TODAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(170739878678646627)
,p_prompt=>'Current Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cattributes_element=>'style="opacity:0.35"'
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108033422220098007)
,p_name=>'P17_OVERSTAY_INFO_EXPIRY_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(170739878678646627)
,p_prompt=>'Visa Expiry Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108033615142098008)
,p_name=>'P17_OVERSTAY_INFO_DAYS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(170739878678646627)
,p_prompt=>'Overstay Days:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119104698765171010)
,p_name=>'P17_CHNG_PERSON_SEQNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(119104596846171009)
,p_prompt=>'Key of Change Visa:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119104700087171011)
,p_name=>'P17_CHNG_EXPIRED_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(119104596846171009)
,p_prompt=>'Change Visa Expiry Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119104896668171012)
,p_name=>'P17_CHNG_VISA_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(119104596846171009)
,p_prompt=>'Change Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(vt.display_value, vt.display_value$dlc) || NVL2(vt.permit_days, '' - ''|| vt.permit_days, '''') d, vt.key_value r',
'FROM dl_common.visa_types$lc vt',
'WHERE vt.is_active = ''Y'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119105526913171019)
,p_name=>'P17_OVERSTAY_VISA_TYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(170739878678646627)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(vt.display_value, vt.display_value$dlc) || NVL2(vt.permit_days, '' - ''|| vt.permit_days, '''') d, vt.key_value r',
'FROM dl_common.visa_types$lc vt',
'WHERE vt.is_active = ''Y'''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119106932177171033)
,p_name=>'P17_LAST_MVMNT_SRC'
,p_item_sequence=>1230
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119107061155171034)
,p_name=>'P17_LAST_MVMNT_SRC_SEC'
,p_item_sequence=>1240
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119107115636171035)
,p_name=>'P17_LAST_MVMNT_SRC_SEC_PK_VAL'
,p_item_sequence=>1250
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(119254861277993198)
,p_name=>'P17_NEED_LANDCARD'
,p_item_sequence=>1220
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_item_default=>'YES'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'US_ONLY'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128277969947666493)
,p_name=>'P17_HEALTHCHECK_COUNTRY'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128279217482666505)
,p_name=>'P17_PERMIT_DAYS_USED'
,p_item_sequence=>261
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Permit days used'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'disabled="disabled"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128279265860666506)
,p_name=>'P17_PERMIT_DAYS_TOTAL'
,p_item_sequence=>271
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Permit days total'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'disabled="disabled" tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(128280725505666521)
,p_name=>'P17_IS_CREW_MEMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_prompt=>'Crew:'
,p_source=>'AI_LAST_CREW_OPTION_VALUE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_YES_NO'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133526858396270508)
,p_name=>'P17_MANUAL_PASSPORT'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133529021963270530)
,p_name=>'P17_SUBNAT_PLACEHOLDER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Sub-Nationality:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(133529147166270531)
,p_name=>'P17_SUBNATIONALITY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Subnationality'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d, r from (',
'    select ''A'' d, 1 r, ''CHN'' p from dual union all select ''B'', 2, ''CHN'' from dual union all select ''C'', 3, ''CHN'' from dual',
')',
'where p = :P17_NATIONALITY'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P17_NATIONALITY'
,p_ajax_items_to_submit=>'P17_NATIONALITY'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143923922837387907)
,p_name=>'P17_MANUAL_EXPIRYDATE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Manual expirydate'
,p_placeholder=>'Manual'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 cl-no-padding'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143925738451387925)
,p_name=>'P17_HEALTHCHECK_FLIGHT'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143926662747387934)
,p_name=>'P17_HEALTHCHECK_FLIGHT_COMMENT'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(143926936682387937)
,p_name=>'P17_LAST_DIRECTION'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155983255938829694)
,p_name=>'P17_DISPLAY_TEXT'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155986787614829729)
,p_name=>'P17_CREW_TRANSPORTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(155986711780829728)
,p_prompt=>'Flight No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155986857223829730)
,p_name=>'P17_CREW_TRAVELDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(155986711780829728)
,p_prompt=>'Travel Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155986983947829731)
,p_name=>'P17_CREW_DOCNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(155986711780829728)
,p_prompt=>'Document No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155987082830829732)
,p_name=>'P17_CREW_LASTNAME'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(155986711780829728)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(155987172600829733)
,p_name=>'P17_CREW_FIRSTNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(155986711780829728)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165599897249467893)
,p_name=>'P17_PERSONID'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165601352927467908)
,p_name=>'P17_DISPLAY_MESSAGE_CAPTURE_LEFT'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165601469934467909)
,p_name=>'P17_DISPLAY_MESSAGE_CAPTURE_RIGHT'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165601581573467910)
,p_name=>'P17_DISPLAY_MESSAGE_CAPTURE_THUMBS'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(165604811214467942)
,p_name=>'P17_PASSPORT_ISWATCHLIST'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170549867351907622)
,p_name=>'P17_NEXT_DIALOG_URL'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170550811328907631)
,p_name=>'P17_RESIDENT_ADDR_L1'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Resident Address 1:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170550822124907632)
,p_name=>'P17_RESIDENT_ADDR_L2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Resident Address 2:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170550958474907633)
,p_name=>'P17_RESIDENT_ADDR_L3'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Resident Address 3:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170551111787907634)
,p_name=>'P17_ENDORSEMENT_NO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Endorsement No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170551214375907635)
,p_name=>'P17_ENDORSEMENT_UNTIL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Endorsement Expired Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170551410448907637)
,p_name=>'P17_ENDORSEMENT_FROM'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Endorsement From:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_colspan=>7
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170551435799907638)
,p_name=>'P17_ENDORSEMENT_BY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Endorsement Officer:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170736596974646594)
,p_name=>'P17_RESIDENCE_DOCNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Document No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170736623847646595)
,p_name=>'P17_RESIDENCE_ISSUINGCOUNTRY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170736775059646596)
,p_name=>'P17_RESIDENCE_EXPIRYDATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Date of Expiry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_read_only_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170738653225646615)
,p_name=>'P17_PASSPORT_ISVOID'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170738723351646616)
,p_name=>'P17_PASSPORT_ISSTOLEN'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170738946685646618)
,p_name=>'P17_EXTENDSTAY_UNTIL'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170740168744646630)
,p_name=>'P17_EXTENDSTAY_EXPIRY_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(170740029398646629)
,p_prompt=>'Extended Expiry Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170740221030646631)
,p_name=>'P17_EXTENDSTAY_OVERSTAY_DAYS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(170740029398646629)
,p_prompt=>'Overstay Days:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170740407114646632)
,p_name=>'P17_TMP_AMPUR'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(170740503102646633)
,p_name=>'P17_TMP_TAMBON'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(172923937697506599)
,p_name=>'P17_PROVINCE_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_tag_css_classes=>'force-numeric-input bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(176610816227283434)
,p_name=>'P17_PASS_DETECTED'
,p_item_sequence=>1190
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_item_default=>'0'
,p_prompt=>'Pass detected'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177575512605428394)
,p_name=>'P17_VOID_PASSPORT_REMARKS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(177575370442428393)
,p_prompt=>'Remarks:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'Y'
,p_attribute_04=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(177575731861428397)
,p_name=>'P17_RESIDENTBOOK_NO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(21423520854777821403)
,p_prompt=>'Resident Book No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181665964608336799)
,p_name=>'P17_VEHICLE_TYPE_D'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_item_default=>'0001'
,p_prompt=>'Vehicle Type:'
,p_source=>'AI_LAST_VEHICLE_TYPE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t0.DISPLAY_VALUE, t0.key_value',
'  from dl_common.TRANS_VEHICLES$LC t0',
' inner join dl_common.TRANS_MODES t1',
'    on (t0.TRANS_MODE is null or t0.TRANS_MODE = t1.KEY_VALUE)',
' inner join dl_common.BORDER_TYPES t2',
'    on (t1.BORDER_TYPE is null or t1.BORDER_TYPE = t2.KEY_VALUE)',
' where t2.KEY_VALUE = :AI_BORDER_TYPE',
' and t0.is_active = ''Y''',
' order by ',
'   case ',
'     when :AI_TRANSPORT_MODE = 2 and t0.key_value = ''OTHERS'' then 1',
'     when :AI_TRANSPORT_MODE = 1 and t0.key_value = ''SHIP'' then 1',
'     else 2',
'   end,',
'   t0.DISPLAY_VALUE'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field CLASS_STATUSRELEVANCE'
,p_tag_attributes=>'style="width:200px"'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181666526065336804)
,p_name=>'P17_DOC_CLASS_ID'
,p_item_sequence=>15
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field force-numeric-input bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181666639791336805)
,p_name=>'P17_BC_DOC_TYPE_IDS'
,p_item_sequence=>1200
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Bc doc type ids'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_string VARCHAR2(32000) := ''var doc_types = {'';',
'    l_length NUMBER;',
'BEGIN',
'',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.BC_DOC_CLASS) LOOP',
'        l_string := l_string || i_type.NUM_VALUE || '':'''''''' || i_type.KEY_VALUE || '''''''','';',
'    END LOOP;',
'',
'    SELECT  LENGTH(l_string) INTO l_length FROM dual;',
'    l_string := SUBSTR(l_string,0, l_length-1) || ''};'';',
'    return replace(utl_raw.cast_to_varchar2(utl_encode.base64_encode(utl_raw.cast_to_raw(l_string))),CHR(10)||CHR(13),'''');',
'',
'END;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181667173344336811)
,p_name=>'P17_NATIONALITY_ID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181667670402336816)
,p_name=>'P17_VISA_TYPE_ID'
,p_item_sequence=>81
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>2
,p_tag_css_classes=>'force-numeric-input bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(181668189148336821)
,p_name=>'P17_PERMIT_TYPE_ID'
,p_item_sequence=>251
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Permit Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'bmbs-class-lookup-type'
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185249394091645889)
,p_name=>'P17_LAST_VISA_CHANGE'
,p_item_sequence=>221
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185689708426632997)
,p_name=>'P17_VISA_TYPE_ID_DISPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185689840503632998)
,p_name=>'P17_PERMIT_TYPE_ID_DISPLAY'
,p_item_sequence=>281
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Permit Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'style= "width: calc(100% - 3px);margin-left:"'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185690026945633000)
,p_name=>'P17_BRDDOCID'
,p_item_sequence=>1210
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Brddocid'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(185708184710174912)
,p_name=>'P17_MVMNTID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187700906450290993)
,p_name=>'P17_VISA_NUMBER_DISPLAY'
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187700979427290994)
,p_name=>'P17_VISA_TYPE_DISPLAY'
,p_item_sequence=>101
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE mandatory-field'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187701126222290995)
,p_name=>'P17_ISSUERING_DT_DISPLAY'
,p_item_sequence=>171
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Date of Issue:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187701151590290996)
,p_name=>'P17_EXPIRY_DT'
,p_item_sequence=>151
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Date of Expiry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187701234430290997)
,p_name=>'P17_ISSURING_PLACE_DISPLAY'
,p_item_sequence=>191
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Place of Issue:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(187701354957290998)
,p_name=>'P17_VISUM_ADD_INFO_DISPLAY'
,p_item_sequence=>211
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Additional VISA Information'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188089577176224590)
,p_name=>'P17_MISSING_ARIVAL'
,p_item_sequence=>1100
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188352939266738090)
,p_name=>'P17_TRAVELCARD_NO'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_prompt=>'TM6 No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>7
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_tag_attributes=>'do-auto-uppercase mask-pattern="aabbbbb" mask-pattern-a="/[A-Z]/" mask-pattern-b="/[0-9]/"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188353110171738091)
,p_name=>'P17_TRAVELCARD_NO_DISPLAY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'TM6 Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(188705464021765096)
,p_name=>'P17_SSPC'
,p_item_sequence=>1170
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Sspc'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare  ',
'  v_sspc varchar(500);  ',
'  v_start number;  ',
'  v_end number;  ',
'begin   ',
'  v_sspc:=APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:12:&APP_SESSION.::NO::'',p_checksum_type => ''SESSION'') ;  ',
'  v_start:=instr(v_sspc,''\u'')+6;  ',
'  v_end:=instr(v_sspc,''{t'')-3;  ',
'  return substr(v_sspc,v_start,v_end-v_start+1);  ',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189216262896349290)
,p_name=>'CHECK_PASSPORT_VALID_6_MONTH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'nearly expired?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(189267217626067791)
,p_name=>'P17_PARING_TM_NO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_display_as=>'NATIVE_CHECKBOX'
,p_lov=>'STATIC:TM No. is paring;Y'
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'1'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190253727918851190)
,p_name=>'P17_SEND_IMAGE_ABIS'
,p_item_sequence=>1110
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'New'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190253777237851191)
,p_name=>'P17_SEND_FINGER_ABIS'
,p_item_sequence=>1120
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Send finger abis'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190872717313000290)
,p_name=>'P17_DOB_ABIS'
,p_item_sequence=>1130
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Dob abis'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190872804711000291)
,p_name=>'P17_EXPIRATIONDATE_ABIS'
,p_item_sequence=>1140
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Expirationdate abis'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(190872898148000292)
,p_name=>'P17_GENDER_ABIS'
,p_item_sequence=>1150
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Gender abis'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(192788094226888439)
,p_name=>'P17_ABIS_URL'
,p_item_sequence=>1160
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Abis url'
,p_source=>'select value from dl_bordercontrol.parameters where name = ''ABIS_URL_REST'';'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022117851621192)
,p_name=>'P17_DATE_OF_ENTRY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_item_default=>'to_char(sysdate, ''DD/MM/YYYY HH24:MI'')'
,p_item_default_type=>'PLSQL_EXPRESSION'
,p_prompt=>'Date of Entry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY HH24:MI'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_css_classes=>'mandatory-field CLASS_STATUSRELEVANCE'
,p_tag_attributes=>'tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022175618621193)
,p_name=>'P17_PERMIT_TYPE'
,p_item_sequence=>241
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Permit Type:'
,p_source=>'SELECT TM8_TYPE d, KEY_VALUE r FROM TM8_REENTRIES WHERE PASSPORTNO = :P17_DISPLAY_DOCNUMBER AND PASSPORT_ISSUED_BY = :P17_NATIONALITY AND PASSPORT_EXPIRY_DATE = nvl(pkg_common.parse_date(:P17_DISPLAY_EXPIRYDATE, 1, 0, 0, 0), pkg_common.parse_date(:P1'
||'7_DISPLAY_EXPIRYDATE, 0, 1, 0, 0))'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'/*decode(TM8_TYPE, ''S'', ''Single'', ''M'', ''Multiple'', ''N/A'') d, KEY_VALUE r FROM TM8_REENTRIES WHERE PASSPORTNO = :P17_DISPLAY_DOCNUMBER AND PASSPORT_ISSUED_BY = :P17_NATIONALITY AND PASSPORT_EXPIRY_DATE = nvl(pkg_common.parse_date(:P17_DISPLAY_EXPIRYDA'
||'TE, 1, 0, 0, 0), pkg_common.parse_date(:P17_DISPLAY_EXPIRYDATE, 0, 1, 0, 0))*/',
'    nvl(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM',
'    DL_COMMON.PERMIT_TYPES$LC'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022275733621194)
,p_name=>'P17_PERMIT_EXPIRY'
,p_item_sequence=>301
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Date of Permit Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20'
,p_colspan=>8
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022365863621195)
,p_name=>'P17_TAMBON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Tambon:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value, return_value FROM lov_adm_class_subdistrict ',
'WHERE adm_class_district = :P17_AMPUR'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P17_AMPUR'
,p_ajax_items_to_submit=>'P17_AMPUR'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022440354621196)
,p_name=>'P17_AMPUR'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Ampur:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_district',
'WHERE adm_class_province = :P17_PROVINCE'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P17_PROVINCE'
,p_ajax_items_to_submit=>'P17_PROVINCE'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022585558621197)
,p_name=>'P17_PROVINCE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Province:'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT :AI_BORDERPOST_PROVINCE_ID',
'FROM DUAL ',
'WHERE :AI_BORDERPOST_PROVINCE_ID IS NOT NULL',
'AND :MOVEMENT_ENTRY_EXIT = 0'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_PROVINCE'
,p_lov=>'SELECT display_value, return_value FROM dl_bordercontrol.lov_adm_class_province;'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022726919621198)
,p_name=>'P17_PERMIT_TYPE_DISPLAY'
,p_item_sequence=>291
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Permit Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022759885621199)
,p_name=>'P17_PERMIT_EXPIRY_DISPLAY'
,p_item_sequence=>311
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Date of Permit Expiry:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195022878640621200)
,p_name=>'P17_PROVINCE_DISPLAY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195023019249621201)
,p_name=>'P17_AMPUR_DISPLAY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Ampur:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195023040338621202)
,p_name=>'P17_TAMBON_DISPLAY'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Tambon:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195023172027621203)
,p_name=>'P17_LC_ADDRESS_DISPLAY'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(195023313135621204)
,p_name=>'P17_LC_ADD_INFO_DISPLAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(107619709741742925)
,p_prompt=>'Remark:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>500
,p_cHeight=>2
,p_tag_attributes=>'style="resize: none; height: 15px;font-size:14px;"'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196840495948019192)
,p_name=>'P17_COLLECTIVE_PASSPORT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196840613756019193)
,p_prompt=>'Collective passport'
,p_source=>'select ''#APP_IMAGES#glyphicons-500-family@2x.png'' from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196840842560019196)
,p_name=>'P17_VEHICLE_DETAIL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196840613756019193)
,p_prompt=>'Vehicle Detail'
,p_source=>'select ''#APP_IMAGES#glyphicons-568-transport@2x.png'' from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841311533019200)
,p_name=>'P17_VEHICLE_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'Vehicle Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841367623019201)
,p_name=>'P17_VEHICLE_NAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'Vehicle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841524983019202)
,p_name=>'P17_OWNER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'Owner:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841539559019203)
,p_name=>'P17_FROM'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'From:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841724054019204)
,p_name=>'P17_TO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'To:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841788228019205)
,p_name=>'P17_PROVINCE_VD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'Province:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196841863506019206)
,p_name=>'P17_DATE_TIME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'Date Time:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196842018839019207)
,p_name=>'P17_FROM2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'From:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(196842038402019208)
,p_name=>'P17_TO2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(196841006363019197)
,p_prompt=>'To:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(201149526704677899)
,p_name=>'P17_AGE_DISPLAY'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Age'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(201149687819677901)
,p_name=>'P17_VALID'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Valid'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(201149877861677903)
,p_name=>'P17_DISPLAY_MIDDLENAME'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(201150278730677907)
,p_name=>'P17_AGE_MANUEL'
,p_item_sequence=>1180
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Age manuel'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(227888290152896956)
,p_name=>'P17_TRAVELER_TYPES'
,p_item_sequence=>61
,p_item_plug_id=>wwv_flow_api.id(449698833487462752)
,p_item_default=>'PASSENGER'
,p_prompt=>'Traveler Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TRAVEL_TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.BC_PERSON_TYPES$LC ',
'WHERE IS_ACTIVE = ''Y''',
'AND (TRANS_MODE is null OR TRANS_MODE = (SELECT KEY_VALUE from DL_COMMON.TRANS_MODES where NUM_VALUE = :AI_TRANSPORT_MODE))',
'ORDER BY DISPLAY_ORDER;'))
,p_cHeight=>1
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(232130121014176219)
,p_name=>'P17_URL_BLACKLIST'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_source=>'apex_util.prepare_url(''f?p=&APP_ID.:150:&SESSION.::NO:170:'', p_triggering_element => ''$(''''body'''')'')'
,p_source_type=>'FUNCTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(232291823392155419)
,p_name=>'P17_MATCH_ON_BLACKLIST'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261618172365307277)
,p_name=>'DG_ENTERMANUAL_MIDDLE_NAME'
,p_item_sequence=>95
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>42
,p_cMaxlength=>39
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261827402471776793)
,p_name=>'P17_GIVEN_NAME_THAI'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_prompt=>'First Name Thai:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261827866512776805)
,p_name=>'P17_LASTNAME_THAI'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_prompt=>'Last Name Thai:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261832069039095776)
,p_name=>'P17_DISPLAY_DOCTYPE_THAI'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Document Type:'
,p_source=>'DG_DOCUMENTCLASSCODE'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261832462191117735)
,p_name=>'P17_DOCNUMBER_THAI'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_prompt=>'Document No:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261847967503473912)
,p_name=>'P17_RESIDENT_NUMBER'
,p_item_sequence=>1350
,p_item_plug_id=>wwv_flow_api.id(261840901167223525)
,p_prompt=>'Resident No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261848336252479033)
,p_name=>'P17_LAST_NAME_RI'
,p_item_sequence=>1370
,p_item_plug_id=>wwv_flow_api.id(261840901167223525)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261848615981484883)
,p_name=>'P17_FIRST_NAME_RI'
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_api.id(261840901167223525)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261848890335488786)
,p_name=>'P17_MIDDLE_NAME_RI'
,p_item_sequence=>1390
,p_item_plug_id=>wwv_flow_api.id(261840901167223525)
,p_prompt=>'Middle Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(261849194316496173)
,p_name=>'P17_RESIDENT_TYPE'
,p_item_sequence=>1330
,p_item_plug_id=>wwv_flow_api.id(261840901167223525)
,p_prompt=>'Type of Resident:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(289965737325508229)
,p_name=>'DG_ENTERMANUAL_FIRSTNAME_TH'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Firstname TH'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(289965845774508230)
,p_name=>'DG_ENTERMANUAL_LASTNAME_TH'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Lastname TH'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(289965943009508231)
,p_name=>'P17_DISPLAY_FIRSTNAME_TH'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(261558234962075376)
,p_prompt=>'First Name TH'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(289966064173508232)
,p_name=>'P17_DISPLAY_LASTNAME_TH'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(261558234962075376)
,p_prompt=>'Lastname TH'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313154769388585789)
,p_name=>'DG_CHECKDIGITDATEOFBIRTH'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Check Digit DOB'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313154898661585790)
,p_name=>'DG_CHECKDIGITDOCUMENTNUMBER'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Check Digit Documentnumber'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313155008179585791)
,p_name=>'DG_CHECKDIGITEXPIRATIONDATE'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Check Digit expiration date'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(313155162331585792)
,p_name=>'DG_CHECKDIGITFINAL'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Check Digit final'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(426375415669226744)
,p_name=>'P17_VISUM'
,p_item_sequence=>85
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Visa Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT d, r',
'FROM',
'(',
'    -- 1',
'    SELECT NVL(vt.display_value, vt.display_value$dlc) || NVL2(vt.permit_days, '' - ''|| vt.permit_days, '''') d, vt.key_value r, DECODE(vis.defaultvisa, ''Y'', -2, 0) SORT_ORDER',
'    FROM dl_common.visa_types$lc vt,',
'    dl_bordercontrol.v_visabynation vis',
'    WHERE vt.is_active = ''Y''',
'    AND vt.key_value != ''0022''',
'    AND vis.countcd = (SELECT icao.notice$dlc FROM dl_common.icao_doc_codes$lc icao WHERE icao.key_value = :P17_NATIONALITY)',
'    AND vis.actflag = ''Y''',
'    AND vt.key_value = vis.visatypecd',
'    UNION ALL',
'    -- 2',
'    SELECT NVL(vt.display_value, vt.display_value$dlc) || NVL2(vt.permit_days, '' - ''|| vt.permit_days, '''') d, vt.key_value r, CASE WHEN vt.key_value = ''0008'' THEN -1 ELSE TO_NUMBER(vt.notice$dlc) END SORT_ORDER',
'    FROM dl_common.visa_types$lc vt',
'    WHERE vt.is_active = ''Y''',
'    AND vt.key_value != ''0022''',
'    AND vt.key_value NOT IN ',
'	(',
'		SELECT vt.key_value',
'		FROM dl_common.visa_types$lc vt,',
'		dl_bordercontrol.v_visabynation vis',
'		WHERE vt.is_active = ''Y''',
'		AND vt.key_value != ''0022''',
'		AND vis.countcd = (SELECT icao.notice$dlc FROM dl_common.icao_doc_codes$lc icao WHERE icao.key_value = :P17_NATIONALITY)',
'		AND vis.actflag = ''Y''',
'		AND vt.key_value = vis.visatypecd',
'	)',
')',
'ORDER BY sort_order',
';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P17_NATIONALITY,MOVEMENT_ENTRY_EXIT,P17_IS_CREW_MEMBER'
,p_ajax_items_to_submit=>'P17_NATIONALITY,MOVEMENT_ENTRY_EXIT,P17_BRDDOCID'
,p_ajax_optimize_refresh=>'Y'
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE mandatory-field'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441446043031127534)
,p_name=>'P17_BLACKLIST_INCIDENT_ID'
,p_item_sequence=>1320
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Passed from 120'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441446572426127539)
,p_name=>'P17_CHECK_VEHICLE_DETAIL_TM2'
,p_item_sequence=>1340
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'set from custom event checkVehicleDetailTM2'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441446687498127540)
,p_name=>'P17_VEHICLE_DETAIL_TM2_SEQNO'
,p_item_sequence=>1350
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'set from custom event checkVehicleDetailTM2'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441446745824127541)
,p_name=>'P17_CREW_ADD_REDUCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(155986711780829728)
,p_prompt=>'Reduce Vehicle Crew :'
,p_display_as=>'NATIVE_YES_NO'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'APPLICATION'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441447393185127547)
,p_name=>'P17_TM5_INDEPT_SEQNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'In Dept Seqno :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'cl-crew-tm5-lookup bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441447483873127548)
,p_name=>'P17_TM5_INDEPT_SEQNO_LOOKUP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'In Dept Seqno :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END d,',
'    dept_seqno r',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'ORDER BY NVL(deptenm, depttnm);'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-crew-tm5-lookup'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441447586311127549)
,p_name=>'P17_TM5_CHKDEPT_SEQNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Chk Dept Seqno :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'cl-crew-tm5-lookup bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(441447640670127550)
,p_name=>'P17_TM5_CHKDEPT_SEQNO_LOOKUP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Chk Dept Seqno :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END d,',
'    dept_seqno r',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'AND checkpoint = ''Y''',
'ORDER BY NVL(deptenm, depttnm);'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-crew-tm5-lookup'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(449698401126462748)
,p_name=>'PASS_AXIAL_IMAGE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-height:300px; max-width:200px;height:300px;width:200px";'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_AXIAL_IMAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(449698715224462751)
,p_name=>'CHECK_PASSPORTPHOTOMATCHED'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Check passportphotomatched'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(449698919774462753)
,p_name=>'DG_FACECAPTURED'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Face captured'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(449699320147462757)
,p_name=>'DG3_AVAILABLE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(459360942270207328)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'decode(',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_0'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_1'')), 0), 0,0,1) from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455136623891415502)
,p_name=>'CHECK_ISPASSPORTEXPIRED'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'expired?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455152353614464198)
,p_name=>'PASSPORT_TIMEDELTA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(449699169089462755)
,p_prompt=>'Valid/Expired Months'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(455158181411768631)
,p_name=>'CHECK_CHECKSUMS_OK'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'checksums'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(456279700289318325)
,p_name=>'DG_MRZ'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mrz'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458672593389975125)
,p_name=>'P17_ALERT_MESSAGE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(458672202681975124)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458891021608787117)
,p_name=>'P17_FP_QUALITY_LL'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458920911583802623)
,p_name=>'P17_FP_QUALITY_RL'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458920993365802624)
,p_name=>'P17_FP_QUALITY_LR'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921080969802625)
,p_name=>'P17_FP_QUALITY_RR'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921179131802626)
,p_name=>'P17_FP_QUALITY_LM'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921302507802627)
,p_name=>'P17_FP_QUALITY_RM'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921369500802628)
,p_name=>'P17_FP_QUALITY_LI'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921499093802629)
,p_name=>'P17_FP_QUALITY_RI'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921627517802630)
,p_name=>'P17_FP_QUALITY_LT'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458921714609802631)
,p_name=>'P17_FP_QUALITY_RT'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(458671139153975082)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925259854802666)
,p_name=>'TEMPLATE_LIVE_FP_T1'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RT'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925281649802667)
,p_name=>'TEMPLATE_LIVE_FP_T2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RI'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925376354802668)
,p_name=>'TEMPLATE_LIVE_FP_T3'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RM'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925504389802669)
,p_name=>'TEMPLATE_LIVE_FP_T4'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RR'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925662092802670)
,p_name=>'TEMPLATE_LIVE_FP_T5'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RL'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925745130802671)
,p_name=>'TEMPLATE_LIVE_FP_T6'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LT'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(458925789400802672)
,p_name=>'TEMPLATE_LIVE_FP_T7'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LI'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(459971061341044552)
,p_name=>'P17_MOVEMENTPHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Movement Photo'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'width="100"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''MOVEMENT_PHOTO'') blob from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460616510298160123)
,p_name=>'TEMPLATE_LIVE_FP_T8'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LM'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460616592915160124)
,p_name=>'TEMPLATE_LIVE_FP_T9'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LR'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460616685793160125)
,p_name=>'TEMPLATE_LIVE_FP_T10'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LL'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460621100923160169)
,p_name=>'P17_LANDINGCARD_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(923664198372119026)
,p_prompt=>'Travel Card'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="max-width:400px;max-height:400px; display:block;margin:0 auto;margin-top:70px" onmouseover="showVisaOverlay(event)"'
,p_colspan=>12
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(PKG_APEX_UTIL.COLL_Get_BLOB001(''LANDINGCARD_IMAGE''), (select PKG_APEX_UTIL.Get_APP_Static_File_Content(''LANDINGCARD.jpg'') from dual)) t FROM DUAL',
'',
'',
''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(460621242523160170)
,p_name=>'LANDCARD_SCANNED'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Landing Cad scanned:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(462400986141699656)
,p_name=>'P17_VISA_PHOTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(923761359382424052)
,p_prompt=>'VISA'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="max-width:400px;max-height:400px; display:block;margin:0 auto;margin-top:70px" onmouseover="showVisaOverlay(event)"'
,p_colspan=>12
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT NVL(PKG_APEX_UTIL.COLL_Get_BLOB001(''VISA_IMAGE''), (SELECT PKG_APEX_UTIL.Get_APP_Static_File_Content(''VISA.jpg'') from dual)) t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(462501056458899987)
,p_name=>'VISA_SCANNED'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'VISA scanned:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(462551058499966559)
,p_name=>'P17_WORKFLOW_STATUS'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(553029558079273587)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' iconclass varchar2(4000) := '''';',
' htmlText varchar2(4000) := '''';',
'begin',
'',
'',
'',
'htmlText := ''<p>'' ;',
'htmlText := htmlText || ''<b>Workflow Status: </b><br/>'';',
'',
'if(:VISA_SCANNED= ''1'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Visa Page scanned</span><br/>'';',
'',
'if(:LANDCARD_SCANNED= ''1'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Travel Card scanned</span><br/>'';',
'',
'if(:DG_FACECHECKED= ''1'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Face checked</span><br/>'';',
'',
'if(:DG_FINGERCHECKED= ''1'') ',
'then iconclass := ''fa-check-circle" style="color: green;'';',
'else iconclass := ''fa-minus-circle" style="color: red;'';',
'end if;',
'',
'htmlText := htmlText || ''<span class="fa '' || iconclass || ''" ></span><span>'' || '' Fingers checked</span><br/>'';',
'',
'',
'',
'',
'',
'return htmlText;',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(464221240354053317)
,p_name=>'ITEM_LOGARCHIVE'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(464182512610971317)
,p_prompt=>'Log Messages:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(465530969298026111)
,p_name=>'P17_FP_CAPTURED'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'FP captured'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487004337671929335)
,p_name=>'DG13_T_1_LENGTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 1 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T1'')), 0)  from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005033777941887)
,p_name=>'DG13_T_4_LENGTH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 4 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T4'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005174860941888)
,p_name=>'DG13_T_7_LENGTH'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 7 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T7'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005242214941889)
,p_name=>'DG13_T_2_LENGTH'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 2 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T2'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005338425941890)
,p_name=>'DG13_T_5_LENGTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 5 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T5'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005485806941891)
,p_name=>'DG13_T_8_LENGTH'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 8 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T8'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005619866941892)
,p_name=>'DG13_T_3_LENGTH'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 3 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T3'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005666198941893)
,p_name=>'DG13_T_6_LENGTH'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 6 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T6'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005744415941894)
,p_name=>'DG13_T_9_LENGTH'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 9 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T9'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005857490941895)
,p_name=>'DG13_T_10_LENGTH'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Template 10 Length'
,p_source=>'select nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T10'')), 0) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487005987311941896)
,p_name=>'DG13_T_1_FINGERPOS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 1 Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006053631941897)
,p_name=>'DG13_T_2_FINGERPOS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 2 Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006177220941898)
,p_name=>'DG13_T_3_FINGERPOS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 3 Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006311724941899)
,p_name=>'DG13_T_4_FINGERPOS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 4 Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006362188941900)
,p_name=>'DG13_T_5_FINGERPOS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 5 Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006431043941901)
,p_name=>'DG13_T_6_FINGERPOS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 6 Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006598668941902)
,p_name=>'DG13_T_7_FINGERPOS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 7 Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006704111941903)
,p_name=>'DG13_T_8_FINGERPOS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 8 Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006739272941904)
,p_name=>'DG13_T_9_FINGERPOS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 9 Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487006867212941905)
,p_name=>'DG13_T_10_FINGERPOS'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(460617520321160133)
,p_prompt=>'Template 10 Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_FINGERPOSITIONS'
,p_lov=>'.'||wwv_flow_api.id(487098868238599867)||'.'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007017082941906)
,p_name=>'DG13_AVAILABLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(487003979500923424)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'decode(',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T1'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T2'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T3'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T4'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T5'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T6'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T7'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T8'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T9'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T10'')), 0), 0,0,1) from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007077700941907)
,p_name=>'TEMPLATE_PASS_DG13_T8'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T8'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007211395941908)
,p_name=>'TEMPLATE_PASS_DG13_T1'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T1'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007232672941909)
,p_name=>'TEMPLATE_PASS_DG13_T6'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T6'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007397853941910)
,p_name=>'TEMPLATE_PASS_DG13_T9'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T9'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007460275941911)
,p_name=>'TEMPLATE_PASS_DG13_T2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T2'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007548882941912)
,p_name=>'TEMPLATE_PASS_DG13_T7'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T7'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007713929941913)
,p_name=>'TEMPLATE_PASS_DG13_T10'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T10'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007802684941914)
,p_name=>'TEMPLATE_PASS_DG13_T3'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T3'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487007891618941915)
,p_name=>'TEMPLATE_PASS_DG13_T5'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T5'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(487246254909763209)
,p_name=>'TEMPLATE_PASS_DG13_T4'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Dg13 T4'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_begin_on_new_line=>'N'
,p_begin_on_new_field=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T4'') a FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465151975245901)
,p_name=>'P17_TM5_GUARANTOR'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Guarantor :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465295176245902)
,p_name=>'P17_TM5_INSTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Ins Type :'
,p_source=>'D'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:ด่าน;D,เงินสด;C,ธนาคาร;B,ด่านอากาศ;A'
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'4'
,p_attribute_02=>'NONE'
,p_item_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'STATIC2:Dept;D,Cash;C,Bank;B,Air;A',
'STATIC2:ด่าน;D,เงินสด;C,ธนาคาร;B,ด่านอากาศ;A'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465551844245905)
,p_name=>'P17_INSDEPT_GUART_SEQNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Company Code :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT comcd || '' : '' || COMNM d, guartdept_seqno r',
'FROM dl_bordercontrol.v_guartdept',
'WHERE actflag = ''Y''',
'AND dept_seqno = :P17_TM5_INDEPT_SEQNO_LOOKUP',
'ORDER BY comcd;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P17_TM5_INDEPT_SEQNO_LOOKUP'
,p_ajax_items_to_submit=>'P17_TM5_INDEPT_SEQNO_LOOKUP'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-dept'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465674654245906)
,p_name=>'P17_INSDEPT_GUART_COMNM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Company Name :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'apex_disabled'
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-dept'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465761766245907)
,p_name=>'P17_INSDEPT_GUART_AMOUNTLEFT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Remaining Insurance Amount :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'apex_disabled'
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-dept'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465834327245908)
,p_name=>'P17_INSBANK_BANKNM'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Bank Name :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>250
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-bank'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504465911507245909)
,p_name=>'P17_INSAIR_DEPT_AIR'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Air Dept :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case cl-crew-tm5-lookup bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-air'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504466089094245910)
,p_name=>'P17_INSAIR_DEPT_AIR_LOOKUP'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Air Dept :'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    CASE ',
'        WHEN DL_COMMON.PKG_I18N.Get_Sess_Data_Locale() = ''th_TH'' THEN NVL(depttnm, deptenm)',
'        ELSE NVL(deptenm, depttnm)',
'    END d,',
'    dept_seqno r',
'FROM dl_bordercontrol.v_department',
'WHERE actflag = ''Y''',
'AND checkpoint = ''Y''',
'ORDER BY NVL(deptenm, depttnm);'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'cl-crew-tm5-lookup'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-air'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504466158663245911)
,p_name=>'P17_INSAIR_FLIGHTNO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Flight No :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'cl-crew-tm5-ins cl-crew-tm5-ins-air'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504466270660245912)
,p_name=>'P17_TM5_AMOUNT'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_item_default=>'20000'
,p_prompt=>' Credit Limit :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'apex_disabled'
,p_tag_attributes=>'readonly tabindex="-1"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504466333223245913)
,p_name=>'P17_TM5_NOTE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(441446335424127537)
,p_prompt=>'Note :'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>250
,p_cHeight=>5
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504469731084245947)
,p_name=>'P17_LAST_MVMNT_TRAVEL_DATE'
,p_item_sequence=>1260
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504469856174245948)
,p_name=>'P17_LAST_MVMNT_DOCNO'
,p_item_sequence=>1270
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(504469960095245949)
,p_name=>'P17_LAST_MVMNT_DOCNO_EXP_DATE'
,p_item_sequence=>1280
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(547951109051021462)
,p_name=>'P17_RANKDESIGNATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'rank'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(548425427070551951)
,p_name=>'TRNSPRTUNITID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_prompt=>'Vehicle No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE auto-upper-case autofocus-on-load'
,p_tag_attributes=>'mask-pattern="a" mask-pattern-a="/[A-Za-z0-9]/" mask-option-recursive-a="true" mask-condition="''&AI_TRANSPORT_MODE.''===''0''"'
,p_colspan=>8
,p_grid_label_column_span=>4
,p_grid_column_css_classes=>'CLASS_STATUSRELEVANCE '
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(550495186239001510)
,p_name=>'CHECK_BLACKLISTALERT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Blacklist?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552940288502938949)
,p_name=>'DG_ISSUINGSTATENAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(449699003149462754)
,p_prompt=>'Issuing State Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552940440621938950)
,p_name=>'DG_DOCUMENTCLASSCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(449699169089462755)
,p_prompt=>'Class Code:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552974011893735169)
,p_name=>'DG1_LASTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552974361554735170)
,p_name=>'DG1_GIVENNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552974840570735171)
,p_name=>'DG1_DOCUMENTNUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Document Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552975165380735172)
,p_name=>'DG1_DOCUMENTCLASSCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Document Class Code:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552975626425735172)
,p_name=>'DG1_ISSUINGSTATECODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Issuing SC/Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552975998422735173)
,p_name=>'DG1_ISSUINGSTATENAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Issuing State Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552976451002735174)
,p_name=>'DG1_EXPIRATIONDATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Expiration Date:'
,p_format_mask=>'YYMMDD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552976834840735175)
,p_name=>'DG1_GENDER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_GENDER'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, ICAO r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where ICAO is not null',
'order by DISPLAY_ORDER;'))
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(552977160714735176)
,p_name=>'DG1_DATEOFBIRTH'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(460617737176160135)
,p_prompt=>'Date of Birth'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553101485861131684)
,p_name=>'PASS_VISUALPAGE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-height:280px"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*SELECT NVL(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUALPAGE''), PKG_APEX_UTIL.Get_WS_Static_File_Content(''passport_.png'')) t FROM DUAL*/',
'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUALPAGE'') t FROM DUAL'))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553101782748132762)
,p_name=>'PASS_UVPAGE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'PASS_UVPAGE'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'height="400"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_UVPAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553102067225134782)
,p_name=>'PASS_IRPAGE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'height="400"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_IRPAGE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553102386650135983)
,p_name=>'PASS_DG3_0'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(459360942270207328)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_0'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553102674030137440)
,p_name=>'PASS_DG3_1'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(459360942270207328)
,p_prompt=>'DG3'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'height="400"'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_1'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553290353427691635)
,p_name=>'MOVEMENT_ENTRY_EXIT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_prompt=>'Direction:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ENTRY_EXIT'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, NUM_VALUE r',
'FROM DL_COMMON.PORT_MOVEMENTS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_VALUE;'))
,p_cHeight=>1
,p_tag_attributes=>'style="width:300px"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>4
,p_read_only_when=>'AI_DEFAULT_DIRECTION'
,p_read_only_when2=>'2'
,p_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE mandatory-field'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553459854065036009)
,p_name=>'SECURITY_DUPLICATE_MOVEMENTS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'duplicates:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553512091210478675)
,p_name=>'MVT_OBSERVATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(449698833487462752)
,p_prompt=>'Note:'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>40
,p_cMaxlength=>80
,p_cHeight=>1
,p_tag_attributes=>'style="resize: none; max-width: 67.6%; min-height:80px"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(553641256423561255)
,p_name=>'PASS_ICAO_FACE2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(460617384042160132)
,p_prompt=>'ICAO Face'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="max-height:300px"'
,p_begin_on_new_line=>'N'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554252698415547420)
,p_name=>'DG_FACECHECKED'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Face verified'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554258179042831452)
,p_name=>'PHOTO_TO_MATCH_AGAINST'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'To Match Against'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'width="230" height="300"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT /*NVL(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE''), PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE''))*/ PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'') face from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554580199364462883)
,p_name=>'DG_CHECKRESULTDATEOFBIRTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(557683975090515187)
,p_prompt=>'Check Date of Birth:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554581620085473331)
,p_name=>'DG_CHECKRESULTDOCUMENTNUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(557683975090515187)
,p_prompt=>'Check Document Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554581913196477504)
,p_name=>'DG_CHECKRESULTEXPIRATIONDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(557683975090515187)
,p_prompt=>'Check Expiration Date:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554582202154481446)
,p_name=>'DG_CHECKRESULTFINAL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(557683975090515187)
,p_prompt=>'Check Result Final'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(554582500043484077)
,p_name=>'DG_CHECKRESULTOPTIONALDATA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(557683975090515187)
,p_prompt=>'Check Result Optional Data:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(557711222364003736)
,p_name=>'DG_FINGERCHECKED'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Fingerprints checked:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(563433147818110586)
,p_name=>'ITEM_EXPIRATION_DATE_VISUAL'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Expiration Date Visual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(563437674630173167)
,p_name=>'ITEM_DOB_VISUAL'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Dob Visual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(563474420344991775)
,p_name=>'GENDER_VISUAL'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Visual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(563475269635037407)
,p_name=>'CHIP_INFORMATION_VISUAL'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Information Visual'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(563604815063868620)
,p_name=>'MRZ_LINE_1'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Line 1'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(563605141668870935)
,p_name=>'MRZ_LINE_2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Line 2'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(575807664563668494)
,p_name=>'DG_LASTNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(449699003149462754)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(575810188499681013)
,p_name=>'DG_GIVENNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(449699003149462754)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(575810514564681015)
,p_name=>'DG_DOCUMENTNUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(449699169089462755)
,p_prompt=>'Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(575813527755693396)
,p_name=>'DG_ISSUINGSTATECODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(449699169089462755)
,p_prompt=>'Issuing SC/Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(575813784039693398)
,p_name=>'DG_EXPIRATIONDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(449699169089462755)
,p_prompt=>'Expiry Date:'
,p_format_mask=>'YYMMDD'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(575814176770696854)
,p_name=>'DG_GENDER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(449699003149462754)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(577709263252368938)
,p_name=>'DG_DATEOFBIRTH'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(449699003149462754)
,p_prompt=>'Date of Birth:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(583176655003029602)
,p_name=>'P17_PSSNGRSTATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'status'
,p_source=>'1'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(792667849118460101)
,p_name=>'P17_FIND_MANUALLY_REPORT_LOAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(504470016726245950)
,p_use_cache_before_default=>'NO'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(792669856490460121)
,p_name=>'P17_LAST_MVMNT_VISA_TYPE'
,p_item_sequence=>1290
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(792669925333460122)
,p_name=>'P17_LAST_MVMNT_VISA_EXP_DATE'
,p_item_sequence=>1300
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(792670833735460131)
,p_name=>'CHECK_BLACKLISTALERT_DEMO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(792670957731460132)
,p_name=>'CHECK_BLACKLISTALERT_BIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842496386789377249)
,p_name=>'P17_LC_ADD_INFO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(107619709741742925)
,p_prompt=>'Remark:'
,p_placeholder=>'Additional Information'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>500
,p_cMaxlength=>2000
,p_cHeight=>2
,p_tag_css_classes=>'mask-lang-th'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842496496183377250)
,p_name=>'DG_ENTERMANUAL_FIRSTNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>42
,p_cMaxlength=>39
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842496570119377251)
,p_name=>'DG_ENTERMANUAL_DOB'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Date of Birth:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypepast validate_mustbepast validate_nottoday'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842496749704377252)
,p_name=>'DG_ENTERMANUAL_EXPIRYDATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Date of Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 validate_mustbefuture validate_nottoday'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-0:+20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842496797495377253)
,p_name=>'DG_ENTERMANUAL_PASSNUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Document No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>15
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this, event)"'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842496880127377254)
,p_name=>'DG_ENTERMANUAL_ISSUINGCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Issuing Country:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842497039226377255)
,p_name=>'DG_ENTERMANUAL_GENDER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Gender:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842499822838377283)
,p_name=>'DG_ENTERMANUAL_DOCTYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'BORDER_DOCUMENT_CLASS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842499904310377284)
,p_name=>'P17_LAST_MVMNT_WSQ_LL'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_LL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_LL'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500049929377285)
,p_name=>'P17_LAST_MVMNT_WSQ_LR'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_LR'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_LR'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500071767377286)
,p_name=>'P17_LAST_MVMNT_WSQ_LM'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_LM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_LM'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500223395377287)
,p_name=>'P17_LAST_MVMNT_WSQ_LI'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_LI'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_LI'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500321358377288)
,p_name=>'P17_LAST_MVMNT_WSQ_LT'
,p_item_sequence=>640
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_LT'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_LT'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500431706377289)
,p_name=>'P17_LAST_MVMNT_WSQ_RL'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_RL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_RL'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500531931377290)
,p_name=>'P17_LAST_MVMNT_WSQ_RR'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_RR'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_RR'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500627568377291)
,p_name=>'P17_LAST_MVMNT_WSQ_RM'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_RM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_RM'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500759195377292)
,p_name=>'P17_LAST_MVMNT_WSQ_RI'
,p_item_sequence=>630
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_RI'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_RI'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842500797654377293)
,p_name=>'P17_LAST_MVMNT_WSQ_RT'
,p_item_sequence=>650
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_WSQ_RT'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''WSQ_RT'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(842502617764393532)
,p_name=>'P17_VISUM_ADD_INFO'
,p_item_sequence=>201
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Additional VISA Information'
,p_placeholder=>'Enter additional information for this visa here'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cMaxlength=>200
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--large'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'Y'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843306625333287367)
,p_name=>'DG_ENTERMANUAL_LASTNAME'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>42
,p_cMaxlength=>39
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this)" autofocus'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class nopadding'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843675363837768444)
,p_name=>'DG_FINGERCHECKED_TH'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Fingerprints checked: travel history'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843675460230768445)
,p_name=>'P17_LAST_MVMNT_LIVE_PHOTO'
,p_item_sequence=>660
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P17_LAST_MVMNT_LIVE_PHOTO'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''LIVE_PHOTO'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843675504488768446)
,p_name=>'DG_FACECHECKED_TH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Face verified'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843675651390768447)
,p_name=>'DG2_AVAILABLE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'decode(',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'')), 0), 0,0,1) from dual'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>30
,p_cHeight=>1
,p_lov_display_extra=>'YES'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843677475200768466)
,p_name=>'P17_LC_ADDRESS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Address:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>255
,p_cMaxlength=>256
,p_tag_attributes=>'style="resize: none;"'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843677596924768467)
,p_name=>'P17_LC_LENGTHOFSTAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(842496314646377248)
,p_prompt=>'Length of Stay'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>255
,p_cMaxlength=>256
,p_tag_attributes=>'style="resize: none;"'
,p_grid_label_column_span=>5
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843678219171768473)
,p_name=>'LANDINGCARD_PLACEHOLDER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(843678084633768472)
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-height:280px"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PKG_APEX_UTIL.Get_WS_Static_File_Content(''LANDINGCARD.jpg'') t FROM DUAL',
''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843678410345768475)
,p_name=>'FP_PLACEHOLDER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Visualimage'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'style="max-height:280px"'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PKG_APEX_UTIL.Get_WS_Static_File_Content(''fp_capturing_placeholder.png'') t FROM DUAL',
''))
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843678836410768479)
,p_name=>'TRNSPRTUNITID_SEA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_prompt=>'Vehicle Type:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE force-numeric-input'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(843678880205768480)
,p_name=>'TRNSPRTUNITID_LAND'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(195021944244621191)
,p_prompt=>'Transport:'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct t0.DISPLAY_VALUE',
'  from dl_common.TRANS_VEHICLES$LC t0',
' inner join dl_common.TRANS_MODES t1',
'    on (t0.TRANS_MODE is null or t0.TRANS_MODE = t1.KEY_VALUE)',
' inner join dl_common.BORDER_TYPES t2',
'    on (t1.BORDER_TYPE is null or t1.BORDER_TYPE = t2.KEY_VALUE)',
' where t2.KEY_VALUE = ''LAND_BORDER''',
' order by 1 '))
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE auto-upper-case'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'CLASS_STATUSRELEVANCE'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'CONTAINS_IGNORE'
,p_attribute_04=>'N'
,p_attribute_06=>'N'
,p_attribute_07=>'Y'
,p_attribute_08=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(846213870899213880)
,p_name=>'DG_SCANNED_EXPIRYDATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_item_default=>'&DG_ENTERMANUAL_EXTEXPIRYDATE.'
,p_prompt=>'Manual Expiry Date:'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 validate_mustbefuture validate_nottoday'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'Y'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(846619009143406125)
,p_name=>'P17_MOVEMENTCOUNT'
,p_item_sequence=>670
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Movementcount'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select (case when :AI_CURRENT_USER_RIGHTS >= 300 then null else txt end) cnt from (',
'select (case when (count(*) > 4) then ''4'' else to_char(count(*)) end)  ||  '' of ''  || to_char(count(*)) txt from (',
'',
'SELECT ''t'' as q',
'FROM MOVEMENTS m',
'WHERE BRDDOCID in (SELECT BRDDOCID FROM BORDERDOCUMENTS WHERE DOCNO = :DG_DOCUMENTNUMBER and ISSUECTRY = :DG_ISSUINGSTATECODE AND trunc(EXPIRYDATE) = trunc(TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD''))) and EXITFLG < 2',
'                                                                                               order by dml_by desc',
')                                                                                               ',
' --where rownum = 1',
')'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852081216328123710)
,p_name=>'P17_SUPERVISOR_AUTHENTICATED'
,p_item_sequence=>680
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852091063567371104)
,p_name=>'P17_USER_LEVEL'
,p_item_sequence=>690
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852414789307393816)
,p_name=>'P17_VISA_REQUIRED'
,p_item_sequence=>700
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Visa Required'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(852416579003471875)
,p_name=>'P17_LC_REQUIRED'
,p_item_sequence=>710
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Lc Required'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(853374058921502362)
,p_name=>'P17_AUTOPROCESSPASSPORT__'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(843676992355768461)
,p_source=>'Y'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_YES_NO'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'Y'
,p_attribute_03=>'Process the Passport automatically'
,p_attribute_04=>'N'
,p_attribute_05=>'Process the Passport manually'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(854520731838394345)
,p_name=>'P17_MOVEMENT_START_POINT'
,p_item_sequence=>720
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855011574529091023)
,p_name=>'P17_VISUM_1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Visa Number:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'auto-upper-case'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855011892531091025)
,p_name=>'P17_VISUM_2'
,p_item_sequence=>181
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Place of Issue:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855012296947091027)
,p_name=>'P17_VISUM_3'
,p_item_sequence=>161
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Date of Issue:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 validate_mustbepast CLASS_STATUSRELEVANCE'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-10:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855012768087091028)
,p_name=>'P17_VISUM_4'
,p_item_sequence=>141
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Length of Stay:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_cMaxlength=>4
,p_tag_css_classes=>'force-numeric-input number-allow-negative'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'-9999'
,p_attribute_02=>'9999'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855013127000091029)
,p_name=>'P17_VISUM_5'
,p_item_sequence=>131
,p_item_plug_id=>wwv_flow_api.id(842496000742377245)
,p_prompt=>'Date of Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 validate_mustbefuture CLASS_STATUSRELEVANCE'
,p_colspan=>8
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'Y'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855107639640639096)
,p_name=>'P17_SUPERVISOR_NAME'
,p_item_sequence=>730
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Supervisor Name'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(855434550503069827)
,p_name=>'P17_AUTOPROCESSPASSPORT'
,p_is_required=>true
,p_item_sequence=>11
,p_item_plug_id=>wwv_flow_api.id(843676992355768461)
,p_prompt=>'Passport processing'
,p_source=>'Y'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(message_value, message_value$dlc) d, ''Y'' r',
'from DL_COMMON.Messages$LC',
'where MESSAGE_KEY = ''BMBS\17\REG_MANUAL_BTNS\P17_AUTOPROCESSPASSPORT\1''',
'Union all',
'select NVL(message_value, message_value$dlc) d, ''N'' r',
'from DL_COMMON.Messages$LC',
'where MESSAGE_KEY = ''BMBS\17\REG_MANUAL_BTNS\P17_AUTOPROCESSPASSPORT\2'';'))
,p_colspan=>12
,p_grid_label_column_span=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'alignleft'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(861140462773767310)
,p_name=>'PASS_VISUAL_FACE'
,p_item_sequence=>740
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Pass Face'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_tag_attributes=>'style="max-height:300px"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(883335525156047960)
,p_name=>'P17_VISA_NEEDED'
,p_item_sequence=>750
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Visa Needed'
,p_source=>'select need_visum from country_management where coutry_code = :DG_ISSUINGSTATECODE and direction = :MOVEMENT_ENTRY_EXIT'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(883396065328094119)
,p_name=>'P17_LC_NEEDED'
,p_item_sequence=>760
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Lc Needed'
,p_source=>'select need_lc from country_management where coutry_code = :DG_ISSUINGSTATECODE and direction = :MOVEMENT_ENTRY_EXIT'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893328766247308078)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_RT'
,p_item_sequence=>770
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_RT'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_RT'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893614338782930042)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_RI'
,p_item_sequence=>780
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_RI'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_RI'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893615548851935335)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_RM'
,p_item_sequence=>790
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_RM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_RM'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893616275104938569)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_RR'
,p_item_sequence=>800
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_RR'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_RR'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893616684078940426)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_RL'
,p_item_sequence=>810
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_RL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_RL'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893617601884950354)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_LT'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_LT'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_LT'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893617958935952070)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_LI'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_LI'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_LI'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893618169231953828)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_LM'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_LM'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_LM'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893618548873955700)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_LR'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_LR'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_LR'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(893618773933958313)
,p_name=>'P17_LAST_MVMNT_TEMPLATE_LL'
,p_item_sequence=>860
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'P17_LAST_MVMNT_TEMPLATE_LL'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'SQL'
,p_attribute_06=>'select DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(:DG_DOCUMENTNUMBER, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_ISSUINGSTATECODE, ''TEMPLATE_LL'' ) q from dual'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(908802480897919017)
,p_name=>'P17_ARRIVAL_VISA_NEEDED'
,p_item_sequence=>870
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrival Visa Needed'
,p_source=>'select need_visum from country_management where coutry_code = :DG_ISSUINGSTATECODE and direction = 0'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(908802794912922856)
,p_name=>'P17_DEPARTURE_VISA_NEEDED'
,p_item_sequence=>880
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Departure Visa Needed'
,p_source=>'select need_visum from country_management where coutry_code = :DG_ISSUINGSTATECODE and direction = 1'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(908803127044927579)
,p_name=>'P17_ARRIVAL_LC_NEEDED'
,p_item_sequence=>890
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Arrival Lc Needed'
,p_source=>'select need_lc from country_management where coutry_code = :DG_ISSUINGSTATECODE and direction = 0'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(908803428438930827)
,p_name=>'P17_DEPARTURE_LC_NEEDED'
,p_item_sequence=>900
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Departure Lc Needed'
,p_source=>'select need_lc from country_management where coutry_code = :DG_ISSUINGSTATECODE and direction = 1'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(916725145508011853)
,p_name=>'PASSPORT_PLACEHOLDER'
,p_item_sequence=>960
,p_item_plug_id=>wwv_flow_api.id(917742175363028483)
,p_prompt=>'Placeholder'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cHeight=>1
,p_tag_attributes=>'title=""'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SQL'
,p_attribute_06=>'SELECT PKG_APEX_UTIL.Get_WS_Static_File_Content(''passport_.png'') t FROM DUAL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(916864688193097539)
,p_name=>'P17_VISA_PLACEHOLDER'
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_api.id(916895024379109223)
,p_source=>'#WORKSPACE_IMAGES#VISUM.jpg'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_IMAGE'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'URL'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(917105739654492792)
,p_name=>'P17_BASE64_TEST'
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_api.id(460620104557160159)
,p_prompt=>'Base64 Test'
,p_source=>'select cb(''PASS_DG3_0'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>80
,p_cMaxlength=>4000
,p_cHeight=>5
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(917461599193352590)
,p_name=>'P17_SUPERVISOR_REASON'
,p_item_sequence=>910
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Supervisor Reason'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(918006468464191814)
,p_name=>'P17_HEADER_MANUAL_CROP'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_api.id(918005861465174084)
,p_use_cache_before_default=>'NO'
,p_source=>'Manual'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_colspan=>4
,p_grid_column=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(918014009744206108)
,p_name=>'P17_HEADER_AUTOMATIC_CROP'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_api.id(918005861465174084)
,p_use_cache_before_default=>'NO'
,p_source=>'Automatic'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(918014541420213315)
,p_name=>'P17_HEADER_DETECTED_CROP'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_api.id(918005861465174084)
,p_use_cache_before_default=>'NO'
,p_source=>'Detected'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_attributes=>'style="display:none"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841085109049625)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919795239536447815)
,p_name=>'P17_DISPLAY_LASTNAME'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Last Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field auto-upper-case CLASS_STATUSRELEVANCE'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919808727077484958)
,p_name=>'P17_DISPLAY_FIRSTNAME'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'First Name:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919809051561484959)
,p_name=>'P17_DISPLAY_GENDER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sex:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_SEX_NUM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC)d, num_value r ',
'from DL_COMMON.HUMAN_SEXES$LC',
'where num_value is not null',
'order by DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field CLASS_STATUSRELEVANCE'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919809459399484960)
,p_name=>'P17_DISPLAY_DOB'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Birth:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_css_classes=>'autovalidatedatepicker datetypepast mandatory-field CLASS_STATUSRELEVANCE'
,p_tag_attributes=>'tabindex="-1"'
,p_begin_on_new_line=>'N'
,p_colspan=>1
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919809868129484960)
,p_name=>'P17_DISPLAY_ISSUINGCOUNTRY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_item_default=>'&DG_ISSUINGSTATECODE. - &DG_ISSUINGSTATENAME.'
,p_prompt=>'Issuing Country:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919810201496484961)
,p_name=>'P17_DISPLAY_DOCCLASS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Document Type:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_DOCUEMENT_CLASS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL(DISPLAY_VALUE, DISPLAY_VALUE$DLC) d, KEY_VALUE r',
'FROM DL_COMMON.BC_DOC_CLASS$LC ',
'WHERE IS_ACTIVE = ''Y''',
'ORDER BY DISPLAY_ORDER;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'mandatory-field CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919810664758484962)
,p_name=>'P17_DISPLAY_DOCNUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Document No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'mandatory-field auto-upper-case'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919811003190484963)
,p_name=>'P17_DISPLAY_EXPIRYDATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Expiry:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>10
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 cl-no-padding'
,p_tag_attributes=>'data-short-target="#DG_EXPIRATIONDATE"'
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-100:+100'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919868935205948574)
,p_name=>'P17_PLACEOFBIRTH'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_item_default=>'&DG_ENTERMANUAL_PLACEOFBIRTH.'
,p_prompt=>'Place of Birth:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_cattributes_element=>'style="height:130px"'
,p_tag_css_classes=>'auto-upper-case'
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919880496624024009)
,p_name=>'P17_DATEOFISSUE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_item_default=>'&DG_ENTERMANUAL_DATEOFISSUE.'
,p_prompt=>'Date of Issue:'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_tag_css_classes=>'autovalidatedatepicker datetypepast yearrange20 validate_mustbepast CLASS_STATUSRELEVANCE'
,p_grid_label_column_span=>4
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'nopadding'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(919918574060136116)
,p_name=>'P17_NATIONALITY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_NATIONALITY_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920055964390898760)
,p_name=>'DG_ENTERMANUAL_DATEOFISSUE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Date of Issue:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypepast validate_mustbepast auto-upper-case'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'manual_edit_input_class'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'-20:+0'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920056224211914367)
,p_name=>'DG_ENTERMANUAL_EXTEXPIRYDATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Manual Expiry Date:'
,p_placeholder=>'DD/MM/YYYY'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'autovalidatedatepicker datetypefuture yearrange20 validate_mustbefuture validate_nottoday'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_colspan=>6
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'manual_edit_input_class'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
,p_attribute_08=>'+0:+20'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920056712368924014)
,p_name=>'DG_ENTERMANUAL_PLACEOFBIRTH'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Place of Birth:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>42
,p_cMaxlength=>4000
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_css_classes=>'manual_edit_input_class'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(920057007183927669)
,p_name=>'DG_ENTERMANUAL_NATIONALITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(843676815851768459)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ICAO_DOC_CODES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d,',
'   key_value r',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'    order by DISPLAY_ORDER',
'    ;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_css_classes=>'SHOW_UPPERCASE'
,p_tag_attributes=>'onkeydown="upperCaseF(this)"'
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'manual_edit_input_class'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(921006231633704004)
,p_name=>'P17_FINGERS_OKAY'
,p_item_sequence=>940
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Fingers Okay'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(921006533588711627)
,p_name=>'P17_FACE_OKAY'
,p_item_sequence=>950
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Face Okay'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(938860685945733834)
,p_name=>'P17_CHILD_COUNT'
,p_item_sequence=>970
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Child Count'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(940027876627157384)
,p_name=>'P17_WORKFLOW_PROBLEMS'
,p_item_sequence=>980
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Workflow Problems'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>100
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941414386412326917)
,p_name=>'P17_P_1009_SEE_SAV_WHENRED'
,p_item_sequence=>990
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P 1009 See Sav Whenred'
,p_source=>'AI_P_1009_see_sav_whenred'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941465609850527876)
,p_name=>'P17_P_1008_SEE_SAV_NOFACEMATCH'
,p_item_sequence=>1000
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P 1008 See Sav Nofacematch'
,p_source=>'AI_P_1008_see_sav_nofacematch'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941641990693788779)
,p_name=>'P17_LASTDIRECTION'
,p_item_sequence=>1010
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Lastdirection'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(941642299280792442)
,p_name=>'P17_P_1010_SEE_SAV_BLACKLISTED'
,p_item_sequence=>1020
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P 1010 See Sav Blacklisted'
,p_source=>'AI_P_1010_see_sav_blacklisted'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(942105987573498635)
,p_name=>'P17_P_1006_SEE_SAV_LESSMATCH'
,p_item_sequence=>1030
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'P 1006 See Sav Lessmatch'
,p_source=>'AI_P_1006_see_sav_lessmatch'
,p_source_type=>'ITEM'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'VALUE'
,p_attribute_04=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(943096881607206349)
,p_name=>'P17_AGE'
,p_item_sequence=>1040
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_source=>'select MOD(FLOOR((TO_NUMBER(TO_CHAR(SYSDATE, ''YYMMDD'')) - TO_NUMBER(TO_CHAR(PKG_COMMON.Parse_Date(:DG_DATEOFBIRTH, 1, 0, 0, 1), ''YYMMDD''))) / 10000) + 100, 100) from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(943097371889228979)
,p_name=>'P17_FINGERMINAGE'
,p_item_sequence=>1050
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_source=>'select PKG_COMMON.Get_Parameter(''FINGER_MINAGE'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(943097677285234036)
,p_name=>'P17_FINGERMAXAGE'
,p_item_sequence=>1060
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_source=>'select PKG_COMMON.Get_Parameter(''FINGER_MAXAGE'') from dual'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(961875833252294966)
,p_name=>'P17_PASSPORT_HAS_CHIP'
,p_item_sequence=>1070
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Passport Has Chip'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(961876097641299273)
,p_name=>'P17_PASSPORT_CHIP_READABLE'
,p_item_sequence=>1080
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Passport Chip Readable'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(961891073911344969)
,p_name=>'P17_DG1_MRZ_MATCH'
,p_item_sequence=>1090
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_prompt=>'Dg1 Mrz Match'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2729913745667547135)
,p_name=>'P17_STATELESS_ID'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>3
,p_tag_css_classes=>'auto-upper-case bmbs-class-lookup-type'
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2729913898306547136)
,p_name=>'P17_STATELESS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_prompt=>'Nationality:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'LOV_STATELESS_PK'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc)) d, icao.key_value r',
'FROM dl_common.icao_doc_codes$lc icao',
'LEFT JOIN dl_bordercontrol.v_country pib',
'ON icao.notice$dlc = pib.countcd',
'WHERE icao.is_active = ''Y''',
'AND icao.key_value IN (''XXA'', ''XXB'', ''XXC'', ''XXX'')',
'ORDER BY LOWER(NVL2(pib.counttnm, pib.nationenm || '' / '' || pib.counttnm, NVL(icao.display_value, icao.display_value$dlc))) ASC',
';'))
,p_lov_display_null=>'YES'
,p_tag_css_classes=>'mandatory-field CLASS_STATUSRELEVANCE'
,p_begin_on_new_line=>'N'
,p_grid_column=>7
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_css_classes=>'cl-hidden'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2729913942584547137)
,p_name=>'P17_LAST_STATELESS'
,p_item_sequence=>1360
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'set from pkg_bmbs_apex_util'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2729914068357547138)
,p_name=>'P17_STATELESS_TRIG'
,p_item_sequence=>1370
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'set from pkg_bmbs_apex_util'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2842097385068083633)
,p_name=>'P17_CHECK_PIBICS_CONN'
,p_item_sequence=>1380
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'set from pkg_bmbs_apex_util'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2842097766052083637)
,p_name=>'P17_TYPEDPASSPORT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(261827073420776781)
,p_prompt=>'Type Passport:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Issued;A,Cancelled;C,Deleted;D,Lost;L'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_tag_attributes=>'readonly disabled="disabled"'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(2842098557787083645)
,p_name=>'P17_BLACKLIST_ALLOW_PASS'
,p_item_sequence=>1330
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Passed from 120'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683851465500328607)
,p_name=>'P17_DISPLAY_DOB_TEXT'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(935037962603390286)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Date of Birth:'
,p_placeholder=>'DD/MM/YYYY'
,p_post_element_text=>'<span id="id-span-birthday-gift" class="t-Icon fa fa-gift cl-birthday-today cl-hidden" aria-hidden="true"></span>'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_tag_css_classes=>'actdatepicker autovalidatedatepicker2 datetypepast mandatory-field CLASS_STATUSRELEVANCE'
,p_tag_attributes=>'data-short-target="#DG_DATEOFBIRTH"'
,p_colspan=>7
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841465920049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4683852121766328614)
,p_name=>'P17_IS_DOB_PARTIAL'
,p_item_sequence=>1420
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Passed from 120'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4686448980275738401)
,p_name=>'P17_MRZ_CORRECTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(563601671165712112)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5173633074589838636)
,p_name=>'P17_TRNSPRTUNITID_EXISTS'
,p_item_sequence=>1390
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_prompt=>'TRNSPRTUNITID Exists ?'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>20
,p_tag_css_classes=>'CLASS_STATUSRELEVANCE'
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5173634008006838646)
,p_name=>'CHECK_ICPO_ALERT'
,p_item_sequence=>1400
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_use_cache_before_default=>'NO'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5173634334855838649)
,p_name=>'P17_ICPO_INCIDENT_ID'
,p_item_sequence=>1410
,p_item_plug_id=>wwv_flow_api.id(455376177247005495)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
,p_item_comment=>'Passed from 120'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21423521223640821407)
,p_name=>'P17_RI_RESIDENT_TYPE_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'Resident Type :'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21423521713594821412)
,p_name=>'P17_RI_RCNO_PVCD'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'Resident No.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_grid_label_column_span=>4
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21423521894881821413)
,p_name=>'P17_RI_RCNO_RUNNINGNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'RCNO Running No..:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21423521950609821414)
,p_name=>'P17_RI_RCNO_YEAR'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(21423520632681821401)
,p_prompt=>'RCNO Year.:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>0
,p_field_template=>wwv_flow_api.id(563841216965049626)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(21423522122605821416)
,p_name=>'P17_FIND_RESIDENT_REPORT_LOAD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(21423522000051821415)
,p_use_cache_before_default=>'NO'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(77077406831382670)
,p_computation_sequence=>10
,p_computation_item=>'P17_CAMERA_DIRECTION_X'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select pkg_common.get_parameter(''WEBCAM_INIT_X'' || decode(:AI_CAMERA_DIRECTION, ''L'', ''_LEFT'', ''R'', ''_RIGHT'', '''')) from dual'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(455158479435776900)
,p_computation_sequence=>10
,p_computation_item=>'CHECK_CHECKSUMS_OK'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (:DG_CHECKRESULTDATEOFBIRTH = ''true'' AND :DG_CHECKRESULTDOCUMENTNUMBER = ''true'' AND :DG_CHECKRESULTEXPIRATIONDATE = ''true'' AND :DG_CHECKRESULTFINAL = ''true'') THEN ',
'RETURN 1;',
'END IF;',
'RETURN 0;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(461631305270095882)
,p_computation_sequence=>10
,p_computation_item=>'CHECK_ISPASSPORTEXPIRED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       DECLARE',
'      v_currentdate DATE;',
'    BEGIN',
'IF (trunc(TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD'')) < trunc(sysdate)) THEN',
'RETURN 1;',
'END IF;',
'      RETURN 0;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN 1;',
'    END;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(550524420822237884)
,p_computation_sequence=>10
,p_computation_item=>'CHECK_BLACKLISTALERT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>'select PKG_BORDERDOCUMENTS.Is_On_Blacklist(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''), :DG_LASTNAME, :DG_GIVENNAME, :DG_GENDER, :DG_DATEOFBIRTH) a from dual'
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(550562689954888350)
,p_computation_sequence=>10
,p_computation_item=>'SECURITY_DUPLICATE_MOVEMENTS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select count(BRDDOCID) ',
'from (',
'  select BRDDOCID, exitflg',
'  , lag(exitflg) over (order by INS_AT) as previous',
'  from ( ',
'    select BRDDOCID, exitflg, INS_AT',
'    from  MOVEMENTS ',
'    where BRDDOCID = PKG_BORDERDOCUMENTS.Get_Document(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''))',
'      and exitflg < 2',
'    order by INS_AT',
'  ) ',
')',
'where previous is not null and (exitflg - previous) = 0;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(563474711165999430)
,p_computation_sequence=>10
,p_computation_item=>'GENDER_VISUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF (:DG_GENDER = 1) THEN',
'RETURN ''Male'';',
'END IF;',
'IF (:DG_GENDER = 2) THEN',
'RETURN ''Female'';',
'END IF;',
'RETURN ''Unknown'';'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(843814010499074031)
,p_computation_sequence=>10
,p_computation_item=>'DG2_AVAILABLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'decode(',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'')), 0), 0,0,1) from dual'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(843825346719112507)
,p_computation_sequence=>10
,p_computation_item=>'DG3_AVAILABLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'decode(',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_0'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_1'')), 0), 0,0,1) from dual'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(843825587874117259)
,p_computation_sequence=>10
,p_computation_item=>'DG13_AVAILABLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'decode(',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T1'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T2'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T3'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T4'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T5'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T6'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T7'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T8'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T9'')), 0)+',
'nvl(dbms_lob.getlength(PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG13_T10'')), 0), 0,0,1) from dual'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(852113941863414168)
,p_computation_sequence=>10
,p_computation_item=>'P17_USER_LEVEL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'AI_CURRENT_USER_RIGHTS'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(852114202127418074)
,p_computation_sequence=>10
,p_computation_item=>'P17_SUPERVISOR_AUTHENTICATED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'0'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(852415089976401918)
,p_computation_sequence=>10
,p_computation_item=>'P17_VISA_REQUIRED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'visum number;',
'BEGIN',
'SELECT NEED_VISUM INTO visum from country_management where coutry_code = :DG_ISSUINGSTATECODE;',
'RETURN visum;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN 1;',
'END;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(855107921337641853)
,p_computation_sequence=>10
,p_computation_item=>'P17_SUPERVISOR_NAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(920995502103681804)
,p_computation_sequence=>10
,p_computation_item=>'DG_ISSUINGSTATENAME'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*SELECT CTRYNAME FROM ICAOCOUNTRIES WHERE CTRYCD = :DG_ISSUINGSTATECODE*/',
'',
'SELECT',
'   NVL(display_value,DISPLAY_VALUE$DLC) d',
'FROM',
'    DL_COMMON.ICAO_DOC_CODES$LC',
'    where IS_ACTIVE=''Y''',
'and key_value = :DG_ISSUINGSTATECODE ;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(938934880241933789)
,p_computation_sequence=>10
,p_computation_item=>'P17_CHILD_COUNT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum (sum_child)',
'from',
'(select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_1''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_2''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_3''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_4''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_5''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_6''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_7''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_8''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_9''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_10''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_11''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_12''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_13''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_14''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_15''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_16''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_17''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_18''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_19''',
'and c001 is not null',
'and c002 is not null',
'union all',
'select count(*) sum_child',
'from APEX_COLLECTIONS',
'where collection_name = ''CHILD_20''',
'and c001 is not null',
'and c002 is not null);'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(941642970728814334)
,p_computation_sequence=>10
,p_computation_item=>'P17_LASTDIRECTION'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EXITFLG from (',
'      SELECT EXITFLG ',
'      FROM V_MOVEMENTS ',
'      WHERE BRDDOCID in (SELECT BRDDOCID FROM BORDERDOCUMENTS WHERE DOCNO = :DG_DOCUMENTNUMBER and ISSUECTRY = :DG_ISSUINGSTATECODE ',
'',
'',
'AND trunc(EXPIRYDATE) = trunc(to_date(:DG_EXPIRATIONDATE, ''RRMMDD''))',
'',
'',
' )      order by INS_AT desc)',
'    where rownum = 1;'))
,p_compute_when=>'DG_DOCUMENTNUMBER'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(455152668124544117)
,p_computation_sequence=>11
,p_computation_item=>'PASSPORT_TIMEDELTA'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' DECLARE',
'      v_currentdate DATE;',
'      v_delta NUMBER;',
'    BEGIN',
'	select round(abs(MONTHS_BETWEEN(sysdate,TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD'')))) MONTHS into v_delta from dual;',
'return v_delta;',
'',
'EXCEPTION WHEN OTHERS THEN',
'RETURN 0;',
'    END;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(563434577301135324)
,p_computation_sequence=>12
,p_computation_item=>'ITEM_EXPIRATION_DATE_VISUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_currentdate DATE;',
'    BEGIN',
'v_currentdate := TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD'');',
'IF (:CHECK_ISPASSPORTEXPIRED = 1) THEN',
'return TO_CHAR(v_currentdate ,''DD MONTH YY'') || '' (expired for: '' || :PASSPORT_TIMEDELTA || '' month(s))'';',
'END IF;',
'IF (:CHECK_ISPASSPORTEXPIRED = 0) THEN',
'return TO_CHAR(v_currentdate ,''DD MONTH YY'') || '' (still valid: '' || :PASSPORT_TIMEDELTA || '' month(s))'';',
'END IF;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN ''n.a.'';',
'    END;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(563438174818177190)
,p_computation_sequence=>21
,p_computation_item=>'ITEM_DOB_VISUAL'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'v_currentdate DATE;',
'    BEGIN',
'v_currentdate := TO_DATE(:DG_DATEOFBIRTH, ''RRMMDD'');',
'',
'return TO_CHAR(v_currentdate ,''DD MONTH RR'') || '' (Age: '' || trunc(months_between(sysdate,v_currentdate)/12) || '')'';',
'EXCEPTION WHEN OTHERS THEN',
'RETURN ''n.a.'';',
'    END;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(563605932905885641)
,p_computation_sequence=>30
,p_computation_item=>'MRZ_LINE_1'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   ret varchar2(256);',
'BEGIN',
'   ',
'   ret := NVL(:DG_MRZ, ''NO MRZ AVAILABLE'');',
'   ret := SUBSTR(ret, 1, 44);',
'',
'  RETURN ret;',
'END;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(563606496196889879)
,p_computation_sequence=>31
,p_computation_item=>'MRZ_LINE_2'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   ret varchar2(256);',
'BEGIN',
'   ',
'   ret := NVL(:DG_MRZ, ''NO MRZ AVAILABLE'');',
'   ret := SUBSTR(ret, 45);',
'',
'  RETURN ret;',
'END;'))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(852416905262476452)
,p_computation_sequence=>41
,p_computation_item=>'P17_LC_REQUIRED'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'lc number;',
'BEGIN',
'SELECT NEED_LC INTO lc from country_management where coutry_code = :DG_ISSUINGSTATECODE;',
'RETURN lc;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN 1;',
'END;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(165599954556467894)
,p_computation_sequence=>51
,p_computation_item=>'P17_PERSONID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>'sys_guid()'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(165601642391467911)
,p_computation_sequence=>61
,p_computation_item=>'P17_DISPLAY_MESSAGE_CAPTURE_RIGHT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select replace(asciistr(nvl(max(message_fingers_right), pkg_common.get_parameter(''MSG_CAPTURE_RIGHT''))), ''\'', ''0x'') from country_management where coutry_code = :P17_NATIONALITY;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(165601790886467912)
,p_computation_sequence=>71
,p_computation_item=>'P17_DISPLAY_MESSAGE_CAPTURE_LEFT'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select replace(asciistr(nvl(max(message_fingers_left), pkg_common.get_parameter(''MSG_CAPTURE_LEFT''))), ''\'', ''0x'') from country_management where coutry_code = :P17_NATIONALITY;',
''))
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(165601900176467913)
,p_computation_sequence=>81
,p_computation_item=>'P17_DISPLAY_MESSAGE_CAPTURE_THUMBS'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select replace(asciistr(nvl(max(message_thumbs), pkg_common.get_parameter(''MSG_CAPTURE_THUMBS''))), ''\'', ''0x'') from country_management where coutry_code = :P17_NATIONALITY;',
''))
);
end;
/
begin
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(792671916809460142)
,p_computation_sequence=>91
,p_computation_item=>'P17_MVMNTID'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'PLSQL_EXPRESSION'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DL_MOVEMENTHANDLING.CREATE_MOVEMENT(',
'                                p_EXITFLG           => :AI_DEFAULT_DIRECTION,',
'                                p_INS_TERMINAL      => :AI_TERMINAL_ID,',
'                                p_INS_BORDERPOST    => :AI_BORDERPOST_ID',
'                                )'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(554216987382136780)
,p_validation_name=>'VAL_DG_EXPIRATIONDATE'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       DECLARE',
'      v_currentdate DATE;',
'    BEGIN',
'IF (LENGTH(:DG_EXPIRATIONDATE) != 6) THEN',
'RETURN FALSE;',
'END IF;',
'      SELECT TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD'')',
'      INTO v_currentdate',
'      FROM dual;',
'      RETURN TRUE;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN FALSE;',
'    END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Expiration Date must be valid and exactly 6 characters (YYMMDD)'
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(575813784039693398)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(554235141150403498)
,p_validation_name=>'VAL_DG_PASSEXPIRED'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'       DECLARE',
'      v_currentdate DATE;',
'    BEGIN',
'IF (trunc(TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD'')) < trunc(sysdate)) THEN',
'RETURN FALSE;',
'END IF;',
'      RETURN TRUE;',
'EXCEPTION WHEN OTHERS THEN',
'RETURN FALSE;',
'    END;'))
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'Attention - Passport expired'
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(575813784039693398)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(554239457213458932)
,p_validation_name=>'VAL_DG_ISSUINGSTATECODE'
,p_validation_sequence=>30
,p_validation=>'DG_ISSUINGSTATECODE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Issuing State Code must be filled'
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(575813527755693396)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(554240687752469893)
,p_validation_name=>'VAL_DG_DOCUMENTNUMBER'
,p_validation_sequence=>40
,p_validation=>'DG_DOCUMENTNUMBER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Passport Number must be filled!'
,p_always_execute=>'Y'
,p_validation_condition_type=>'NEVER'
,p_only_for_changed_rows=>'Y'
,p_associated_item=>wwv_flow_api.id(575810514564681015)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(583688418076428384)
,p_validation_name=>'P17_PSSNGRSTATUS'
,p_validation_sequence=>60
,p_validation=>'P17_PSSNGRSTATUS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(583690326742441563)
,p_validation_name=>'P17_OFFLDRSNID'
,p_validation_sequence=>70
,p_validation=>'P17_OFFLDRSNID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(190253845575851192)
,p_validation_name=>'VAL TM NO is paring'
,p_validation_sequence=>80
,p_validation=>'P17_PARING_TM_NO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please check TM No.!'
,p_always_execute=>'N'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(197228835996066397)
,p_name=>'New View'
,p_event_sequence=>1
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(197228953578066398)
,p_event_id=>wwv_flow_api.id(197228835996066397)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(553184518082552931)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(197229056750066399)
,p_event_id=>wwv_flow_api.id(197228835996066397)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(553193586260621298)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(197229372717066402)
,p_event_id=>wwv_flow_api.id(197228835996066397)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Workflow_OnLoad(0);',
'startCamera();',
'window.setTimeout(() => {',
'    $("#t_Body_content_offset").css("height", "49px");',
'}, 1000);',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(553187423812581623)
,p_name=>'DA_ToggleRegion'
,p_event_sequence=>2
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#DG_DOCUMENTNUMBER").val() != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553187832333581625)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(553184518082552931)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553189282264597117)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(553184518082552931)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553194017578623850)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(553193586260621298)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553194360775625483)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(553193586260621298)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553503465587402936)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Workflow ',
'Workflow_OnLoad(1);',
'',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553506182869409324)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'Workflow_OnLoad(0);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185708074801174911)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_BORDERDOCUMENTS.Create_Document(',
'                        p_DOCNO                 => :DG_DOCUMENTNUMBER,',
'                        p_DOCTYPE               => :DG_DOCUMENTCLASSCODE,',
'                        p_ISSUECTRY             => :DG_ISSUINGSTATECODE,',
'                        p_EXPIRYDATE            => to_date(:DG_EXPIRATIONDATE, ''RRMMDD''),',
'                        p_SURNAME               => :DG_LASTNAME,',
'                        p_GIVENNAME             => :DG_GIVENNAME,',
'                        p_SEX                   => :DG_GENDER,',
'                        p_DOB                   => :DG_DATEOFBIRTH,',
'                        p_MRZDG1                => :DG_MRZ,',
'                        p_INS_TERMINAL          => :AI_TERMINAL_ID,',
'                        p_INS_BORDERPOST        => :AI_BORDERPOST_ID,',
'                        p_Img_VISUAL_FACE       => PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE''),',
'                        p_Img_ICAO_FACE         => PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE''),',
'                        p_Img_VISUALPAGE        => PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUALPAGE''),',
'                        p_Img_UVPAGE            => null,',
'                        p_Img_IRPAGE            => null,',
'                        p_Img_DG3_0             => PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_0''),',
'                        p_Img_DG3_1             => PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_DG3_1''),',
'                        p_MANUAL_EXPIRY_DATE    => :P17_MANUAL_EXPIRYDATE,         ',
'                        p_MANUAL_ISSUING_DATE   => :P17_DATEOFISSUE,          ',
'                        p_MANUAL_NATIONALITY    => :P17_NATIONALITY,',
'                        p_MANUAL_PLACEOFBIRTH   => :P17_PLACEOFBIRTH',
'                       );',
'                       ',
' :P17_MVMNTID := DL_MOVEMENTHANDLING.CREATE_MOVEMENT(',
'                                p_DOCNO             => :DG_DOCUMENTNUMBER,',
'                                p_ISSUECTRY         => :DG_ISSUINGSTATECODE,',
'                                p_EXPIRYDATE        => to_date(:DG_EXPIRATIONDATE,''RRMMDD''),',
'                                p_EXITFLG           => :MOVEMENT_ENTRY_EXIT,',
'                                p_INS_TERMINAL      => :AI_TERMINAL_ID,',
'                                p_INS_BORDERPOST    => :AI_BORDERPOST_ID',
'                                );',
'                                ',
' -- Default Value for Traveler Type',
' select DEFAULT_TRAVELER_TYPE ',
' into :P17_TRAVELER_TYPES',
' from dl_bordercontrol.terminals ',
' where id = :AI_TERMINAL_ID;',
' ',
' :P17_DOB_ABIS := TO_CHAR(TO_DATE(:DG_DATEOFBIRTH, ''RRMMDD'') ,''RRRR-MM-DD'');',
' :P17_EXPIRATIONDATE_ABIS := TO_CHAR(TO_DATE(:DG_EXPIRATIONDATE, ''RRMMDD'') ,''RRRR-MM-DD'');',
' :P17_SEND_IMAGE_ABIS := ''NULL'';',
' :P17_SEND_FINGER_ABIS := ''NULL'';',
' ',
' if :DG_GENDER = 1 then :P17_GENDER_ABIS := ''M'';',
' elsif :DG_GENDER = 2 then :P17_GENDER_ABIS := ''F'';',
' else :P17_GENDER_ABIS := ''O'';',
' end if;',
' ',
' '))
,p_attribute_02=>'DG_DOCUMENTNUMBER,DG_DOCUMENTCLASSCODE,DG_ISSUINGSTATECODE,DG_EXPIRATIONDATE,DG_LASTNAME,DG_GIVENNAME,DG_GENDER,DG_DATEOFBIRTH,DG_MRZ,DG_SCANNED_EXPIRYDATE,P17_DATEOFISSUE,P17_NATIONALITY,P17_PLACEOFBIRTH'
,p_attribute_03=>'P17_MVMNTID,P17_DOB_ABIS,P17_EXPIRATIONDATE_ABIS,P17_SEND_FINGER_ABIS,P17_SEND_IMAGE_ABIS,P17_TRAVELER_TYPES'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(190931283594523190)
,p_event_id=>wwv_flow_api.id(553187423812581623)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#P17_SEND_IMAGE_ABIS").text("NULL");',
'$("#P17_SEND_FINGER_ABIS").text("NULL");',
'demographicDates();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(920477716715302591)
,p_name=>'DA_FILL_OPTIONAL_FIELDS'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(920478147946302622)
,p_event_id=>wwv_flow_api.id(920477716715302591)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*if :DG_ISSUINGSTATECODE is not null then',
'  SELECT CTRYNAME INTO :DG_ISSUINGSTATENAME FROM ICAOCOUNTRIES WHERE CTRYCD = :DG_ISSUINGSTATECODE;',
'end if;*/',
'declare',
'v_exp varchar2(255);',
'v_doi varchar2(255);',
'v_pob varchar2(255);',
'begin',
'if :DG_DOCUMENTNUMBER is not null and :DG_EXPIRATIONDATE is not null and :DG_ISSUINGSTATECODE is not null then',
'  begin',
'    :P17_NATIONALITY := :DG_ENTERMANUAL_NATIONALITY;',
'    /*select dateofissue, nationality, placeofbirth, manualexpirydate into :P17_DATEOFISSUE, :P17_NATIONALITY, :P17_PLACEOFBIRTH, :DG_SCANNED_EXPIRYDATE from v_borderocuments bd join v_movements m on bd.brddocid = m.brddocid where :DG_DOCUMENTNUMBER '
||'= bd.docno and :DG_EXPIRATIONDATE = to_char(bd.expirydate, ''yymmdd'') and :DG_ISSUINGSTATECODE = bd.issuectry;*/',
'select manualexpirydate, dateofissue, /*nationality,*/ placeofbirth',
'into',
'  v_exp --:DG_SCANNED_EXPIRYDATE',
'  , v_doi -- :P17_DATEOFISSUE',
'  --, :P17_NATIONALITY',
'  , v_pob --, :P17_PLACEOFBIRTH',
'from (',
'select',
'  (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 21) manualexpirydate',
'  , (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 22) dateofissue',
'  --, (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 23) nationality',
'  , (select attrvarchar from movement_attr ma where ma.mvmntid = m.mvmntid and seqno = 24) placeofbirth',
'from',
'  v_borderocuments bd',
'join',
'  v_movements m on bd.brddocid = m.brddocid',
'where',
'  :DG_DOCUMENTNUMBER = bd.docno',
'  and :DG_EXPIRATIONDATE = to_char(bd.expirydate, ''yymmdd'')',
'  and :DG_ISSUINGSTATECODE = bd.issuectry',
'order by m.INS_AT desc)',
'where rownum < 2',
';',
'  exception when others then',
'    v_doi := :DG_ENTERMANUAL_DATEOFISSUE;',
'    v_pob := :DG_ENTERMANUAL_PLACEOFBIRTH;',
'    v_exp := :DG_ENTERMANUAL_EXTEXPIRYDATE;',
'  end;',
'  if :DG_ENTERMANUAL_DATEOFISSUE is not null then',
'    :P17_DATEOFISSUE := :DG_ENTERMANUAL_DATEOFISSUE;',
'  else',
'    :P17_DATEOFISSUE := v_doi;',
'  end if;',
'  if :DG_ENTERMANUAL_PLACEOFBIRTH is not null then',
'    :P17_PLACEOFBIRTH := :DG_ENTERMANUAL_PLACEOFBIRTH;',
'  else',
'    :P17_PLACEOFBIRTH := v_pob;',
'  end if;',
'  if :DG_ENTERMANUAL_EXTEXPIRYDATE is not null then',
'    :DG_SCANNED_EXPIRYDATE := :DG_ENTERMANUAL_EXTEXPIRYDATE;',
'  else',
'    :DG_SCANNED_EXPIRYDATE := v_exp;',
'  end if;',
'end if;',
'end;'))
,p_attribute_02=>'DG_DOCUMENTNUMBER,DG_EXPIRATIONDATE,DG_ISSUINGSTATECODE'
,p_attribute_03=>'P17_PLACEOFBIRTH,P17_NATIONALITY,P17_DATEOFISSUE,DG_SCANNED_EXPIRYDATE,DG_ISSUINGSTATENAME'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(553480758329129957)
,p_name=>'DA_HideHighlights'
,p_event_sequence=>11
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(553481196481129960)
,p_event_id=>wwv_flow_api.id(553480758329129957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#R10871178105636500_control_panel'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(582848536079443583)
,p_name=>'DA_ChangeDirection'
,p_event_sequence=>51
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'MOVEMENT_ENTRY_EXIT'
,p_condition_element=>'MOVEMENT_ENTRY_EXIT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'2'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(582848915671443584)
,p_event_id=>wwv_flow_api.id(582848536079443583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_OFFLDRSNID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(582849439078451368)
,p_event_id=>wwv_flow_api.id(582848536079443583)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_OFFLDRSNID'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(582888625256858328)
,p_event_id=>wwv_flow_api.id(582848536079443583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'TRNSPRTUNITID,P17_PSSNGRSTATUS,P17_RANKDESIGNATION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(582888983143860841)
,p_event_id=>wwv_flow_api.id(582848536079443583)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'TRNSPRTUNITID,P17_PSSNGRSTATUS,P17_RANKDESIGNATION'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(583271983272278607)
,p_name=>'DA_ChangePassangerStatus'
,p_event_sequence=>61
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PSSNGRSTATUS'
,p_condition_element=>'P17_PSSNGRSTATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(583272430543278608)
,p_event_id=>wwv_flow_api.id(583271983272278607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_RANKDESIGNATION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(583295840806377503)
,p_event_id=>wwv_flow_api.id(583271983272278607)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_RANKDESIGNATION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(460851785323273457)
,p_name=>'DA_HIDEMOVEMENTSREGION'
,p_event_sequence=>101
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(553296530286765048)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(460852223163273460)
,p_event_id=>wwv_flow_api.id(460851785323273457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#R101105765612339626_control_panel").hide();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(464380868869557051)
,p_name=>'DA_PARTIALSUBMIT'
,p_event_sequence=>121
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'VISA_SCANNED,LANDCARD_SCANNED,P17_FP_CAPTURED,DG_FACECHECKED,DG_FINGERCHECKED,CHECK_PASSPORTPHOTOMATCHED,DG_FINGERCHECKED_TH,P17_FINGERS_OKAY,P17_FACE_OKAY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(464381293823557067)
,p_event_id=>wwv_flow_api.id(464380868869557051)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'VISA_SCANNED,LANDCARD_SCANNED,P17_FP_QUALITY_LL,P17_FP_QUALITY_LR,P17_FP_QUALITY_LM,P17_FP_QUALITY_LI,P17_FP_QUALITY_LT,P17_FP_QUALITY_RL,P17_FP_QUALITY_RR,P17_FP_QUALITY_RM,P17_FP_QUALITY_RI,P17_FP_QUALITY_RT,P17_FP_CAPTURED,DG_FACECHECKED,DG_FINGER'
||'CHECKED,CHECK_PASSPORTPHOTOMATCHED,DG_FINGERCHECKED_TH,P17_FINGERS_OKAY,P17_FACE_OKAY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(465560930501087399)
,p_name=>'DA_RESETFINGERPRINTS'
,p_event_sequence=>131
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(460611114506108238)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(465561315687087418)
,p_event_id=>wwv_flow_api.id(465560930501087399)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RT'');',
'',
':P17_FP_CAPTURED := 0;',
':P17_FP_QUALITY_RT := NULL;',
':P17_FP_QUALITY_RI := NULL;',
':P17_FP_QUALITY_RM := NULL;',
':P17_FP_QUALITY_RR := NULL;',
':P17_FP_QUALITY_RL := NULL;',
':P17_FP_QUALITY_LT := NULL;',
':P17_FP_QUALITY_LI := NULL;',
':P17_FP_QUALITY_LM := NULL;',
':P17_FP_QUALITY_LR := NULL;',
':P17_FP_QUALITY_LL := NULL;'))
,p_attribute_03=>'P17_FP_CAPTURED,P17_FP_QUALITY_RT,P17_FP_QUALITY_RI,P17_FP_QUALITY_RM,P17_FP_QUALITY_RR,P17_FP_QUALITY_RL,P17_FP_QUALITY_LT,P17_FP_QUALITY_LI,P17_FP_QUALITY_LM,P17_FP_QUALITY_LR,P17_FP_QUALITY_LL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(465611014394183270)
,p_event_id=>wwv_flow_api.id(465560930501087399)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Start Fingerprint Scanner again',
'',
'ScanFingerprints();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(466161104772057396)
,p_name=>'DA_NOFINGERPRINTS'
,p_event_sequence=>141
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(466150883496054732)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(466161533975057436)
,p_event_id=>wwv_flow_api.id(466161104772057396)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RT'');',
'',
':P17_FP_CAPTURED := 0;',
':P17_FP_QUALITY_RT := NULL;',
':P17_FP_QUALITY_RI := NULL;',
':P17_FP_QUALITY_RM := NULL;',
':P17_FP_QUALITY_RR := NULL;',
':P17_FP_QUALITY_RL := NULL;',
':P17_FP_QUALITY_LT := NULL;',
':P17_FP_QUALITY_LI := NULL;',
':P17_FP_QUALITY_LM := NULL;',
':P17_FP_QUALITY_LR := NULL;',
':P17_FP_QUALITY_LL := NULL;'))
,p_attribute_03=>'P17_FP_CAPTURED,P17_FP_QUALITY_RT,P17_FP_QUALITY_RI,P17_FP_QUALITY_RM,P17_FP_QUALITY_RR,P17_FP_QUALITY_RL,P17_FP_QUALITY_LT,P17_FP_QUALITY_LI,P17_FP_QUALITY_LM,P17_FP_QUALITY_LR,P17_FP_QUALITY_LL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(466162054074057438)
,p_event_id=>wwv_flow_api.id(466161104772057396)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// No Fingerprints available',
'',
'NoFingerprintsAvailable();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(452658412537774367)
,p_name=>'DA_ANIMATEBACK'
,p_event_sequence=>161
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.CSS_ANIMATEBACK'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(452658827885774369)
,p_event_id=>wwv_flow_api.id(452658412537774367)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'animate_cell(last_animationtarget, last_animationsource);',
'SCI_animate = false;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(455875055346817655)
,p_name=>'DA_SetStatus'
,p_event_sequence=>171
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.CLASS_STATUSRELEVANCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(455875446933817656)
,p_event_id=>wwv_flow_api.id(455875055346817655)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''DA_SetStatus'');',
'setStatusDiv("div_movement_status");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(843402762353830635)
,p_name=>'DA_RefreshPassportHitList'
,p_event_sequence=>181
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.manual_edit_input_class'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(843405211418869512)
,p_event_id=>wwv_flow_api.id(843402762353830635)
,p_event_result=>'TRUE'
,p_action_sequence=>9
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'DG_ENTERMANUAL_ISSUINGCODE,DG_ENTERMANUAL_GENDER,DG_ENTERMANUAL_PASSNUMBER,DG_ENTERMANUAL_LASTNAME,DG_ENTERMANUAL_FIRSTNAME,DG_ENTERMANUAL_DOCTYPE,DG_ENTERMANUAL_DOB,DG_ENTERMANUAL_EXPIRYDATE,DG_ENTERMANUAL_LASTNAME,DG_ENTERMANUAL_FIRSTNAME,DG_ENTERM'
||'ANUAL_DATEOFISSUE,DG_ENTERMANUAL_EXTEXPIRYDATE,DG_ENTERMANUAL_NATIONALITY,DG_ENTERMANUAL_PLACEOFBIRTH,DG_ENTERMANUAL_NATIONALITY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(843785524672886402)
,p_name=>'DA_SetStatus_KeyRelease'
,p_event_sequence=>191
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.CLASS_STATUSRELEVANCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(843785917428886438)
,p_event_id=>wwv_flow_api.id(843785524672886402)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log(''KeyRelease'');',
'setStatusDiv("div_movement_status");',
'',
'if (this.triggeringElement.getAttribute("id") === "P17_TRAVELCARD_NO" && $v(''P17_TRAVELCARD_NO'').length == $(''#P17_TRAVELCARD_NO'').attr(''maxlength'')) {',
'    if ($v(''DG_DOCUMENTNUMBER'') != "" && $v("P17_AUTOPROCESSPASSPORT") == "Y" && $v(''DG_DATEOFBIRTH'') != "" && $v("DG_EXPIRATIONDATE") != "") {',
'        if(!$("#P17_VISUM_1").is('':hidden'') && $v(''P17_NATIONALITY'') != "THA") {',
'            $("#P17_VISUM_1").focus(); ',
'        }',
'    }',
'}',
'',
'if (this.triggeringElement.getAttribute("id") === "TRNSPRTUNITID") {',
'    apex.event.trigger(document, "validateFlightNum");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(852144065959637073)
,p_name=>'DA_CLOSESUPERVISORDIALOG'
,p_event_sequence=>201
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(852081382716131263)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(852144384472637083)
,p_event_id=>wwv_flow_api.id(852144065959637073)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_03=>'P17_SUPERVISOR_AUTHENTICATED,P17_SUPERVISOR_NAME,P17_SUPERVISOR_REASON'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(854050373601866371)
,p_name=>'DA_CUTOUTDATAPAGEPHOTO'
,p_event_sequence=>211
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(854044918910797029)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(854050843482866374)
,p_event_id=>wwv_flow_api.id(854050373601866371)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'CutOutDataPagePhoto();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(855694056589332747)
,p_name=>'DA_RETURN_SELECTED_DOCUMENT'
,p_event_sequence=>230
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(937482749802694163)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(855694413338332750)
,p_event_id=>wwv_flow_api.id(855694056589332747)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_03=>'DG_ENTERMANUAL_PASSNUMBER,DG_ENTERMANUAL_LASTNAME,DG_ENTERMANUAL_DOCTYPE,DG_ENTERMANUAL_EXPIRYDATE,DG_ENTERMANUAL_DOB,DG_ENTERMANUAL_GENDER,DG_ENTERMANUAL_ISSUINGCODE,DG_ENTERMANUAL_FIRSTNAME,DG_ENTERMANUAL_DATEOFISSUE,DG_ENTERMANUAL_EXTEXPIRYDATE,DG'
||'_ENTERMANUAL_NATIONALITY,DG_ENTERMANUAL_PLACEOFBIRTH'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937413531514262424)
,p_event_id=>wwv_flow_api.id(855694056589332747)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*$(".manual_edit_input_class").first().trigger("change");*/',
'$(".mandatory-field").trigger("change");',
'$(".autovalidatedatepicker").trigger("change");',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(923631459631896270)
,p_name=>'DA_CLEAR_LC_IMAGE'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(923627728648868221)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(923631859033896277)
,p_event_id=>wwv_flow_api.id(923631459631896270)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'clearScannedLandingCard();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(923768945236455492)
,p_name=>'DA_CLEAR_VISUM_IMAGE'
,p_event_sequence=>250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(923650355631089860)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(923769332702455493)
,p_event_id=>wwv_flow_api.id(923768945236455492)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'clearScannedVisa();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(937450879597416071)
,p_name=>'DA_ShowSelectPassport'
,p_event_sequence=>260
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(854699879504954919)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937452113446421891)
,p_event_id=>wwv_flow_api.id(937450879597416071)
,p_event_result=>'TRUE'
,p_action_sequence=>9
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'DG_ENTERMANUAL_ISSUINGCODE,DG_ENTERMANUAL_GENDER,DG_ENTERMANUAL_PASSNUMBER,DG_ENTERMANUAL_LASTNAME,DG_ENTERMANUAL_FIRSTNAME,DG_ENTERMANUAL_DOCTYPE,DG_ENTERMANUAL_DOB,DG_ENTERMANUAL_EXPIRYDATE,DG_ENTERMANUAL_LASTNAME,DG_ENTERMANUAL_FIRSTNAME,DG_ENTERM'
||'ANUAL_DATEOFISSUE,DG_ENTERMANUAL_EXTEXPIRYDATE,DG_ENTERMANUAL_NATIONALITY,DG_ENTERMANUAL_PLACEOFBIRTH,DG_ENTERMANUAL_NATIONALITY'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(937451288350416076)
,p_event_id=>wwv_flow_api.id(937450879597416071)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*apex.navigation.dialog(''f?p=&APP_ID.:3:&APP_SESSION.::::P3_COUNTRY:&DG_ENTERMANUAL_ISSUINGCODE.'');*/',
'$("#P17_HIDDEN_BTNFIND").trigger("click");',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(938799942199588045)
,p_name=>'DA_ChildrenAdded'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(900302970416613967)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165600118708467895)
,p_event_id=>wwv_flow_api.id(938799942199588045)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_person_id varchar2(32) := :P17_PERSONID;',
'    l_count number;',
'begin',
'    if pkg_collective_passport.GET_FELLOW_PASSENGER_COUNT() > 0 then',
'        select count(1) into l_count from person where key_value = l_person_id;',
'        if l_count < 1 then',
'            insert into person (key_value) values (l_person_id);',
'            commit;',
'        end if;',
'        pkg_collective_passport.persist_data(l_person_id);',
'        update fellow_passenger set mvmntid = :P17_MVMNTID where person = :P17_PERSONID;',
'    end if;',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(940028315779213595)
,p_name=>'DA_SUBMITWORKFLOWPROBLEMS'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_WORKFLOW_PROBLEMS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(940028698685213598)
,p_event_id=>wwv_flow_api.id(940028315779213595)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'NULL;'
,p_attribute_02=>'P17_WORKFLOW_PROBLEMS'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(941659631237904771)
,p_name=>'DA_ALERTDIRECTION'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'MOVEMENT_ENTRY_EXIT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(941660026522904773)
,p_event_id=>wwv_flow_api.id(941659631237904771)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("#"+this.triggeringElement.id).removeClass("animated infinite passport_stillvalid");',
'$("#"+this.triggeringElement.id + "_DISPLAY").removeClass("animated infinite passport_stillvalid");',
'$("#"+this.triggeringElement.id + "_LABEL").removeClass("animated infinite passport_stillvalid bounce");',
'',
'/*',
'if ($v("P17_LASTDIRECTION") != "") {',
'	if (this.triggeringElement.value == $v("P17_LASTDIRECTION")){',
'		$("#"+this.triggeringElement.id).addClass("animated infinite passport_stillvalid");',
'		$("#"+this.triggeringElement.id+ "_DISPLAY").addClass("animated infinite passport_stillvalid");',
'		$("#"+this.triggeringElement.id+ "_LABEL").addClass("animated infinite passport_stillvalid bounce");',
'		$(".okdirection").hide();',
'		$(".wrongdirection").show().parent().addClass("passport_stillvalid animated infinite bounce");',
'		$(".direction-icon").removeClass("fa-database").addClass("fa-exclamation-triangle");',
'	} else {',
'		$(".okdirection").show();',
'		$(".wrongdirection").hide().parent().removeClass("passport_stillvalid animated infinite bounce");',
'		$(".direction-icon").addClass("fa-database").removeClass("fa-exclamation-triangle");',
'	}',
'} */',
'',
'$(".okdirection").show();',
'$(".wrongdirection").hide().parent().removeClass("passport_stillvalid animated infinite bounce");',
'$(".direction-icon").addClass("fa-database").removeClass("fa-exclamation-triangle");',
'',
'var exitFlag = $("#MOVEMENT_ENTRY_EXIT").val();',
'',
'if (exitFlag == 1) {',
'    //document.getElementsByTagName("body")[0].classList.add("direction-departure");',
'    $("body").addClass("direction-departure");',
'} else {',
'    $("body").removeClass("direction-departure");',
'}',
'',
'toggleBmBSRequiredFields("P17_PROVINCE", (exitFlag != 1), true);'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4686930182586369047)
,p_event_id=>wwv_flow_api.id(941659631237904771)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF NVL(:MOVEMENT_ENTRY_EXIT, -1) != 2 AND NVL(:MOVEMENT_ENTRY_EXIT, ''~'') != NVL(:AI_LAST_DIRECTION, ''~'') then',
'        :AI_LAST_DIRECTION := :MOVEMENT_ENTRY_EXIT;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :AI_LAST_DIRECTION := NULL;',
'END;'))
,p_attribute_02=>'MOVEMENT_ENTRY_EXIT,AI_LAST_DIRECTION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261676002589310065)
,p_name=>'DA_ShowTM6'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261675134020285579)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261676384336310070)
,p_event_id=>wwv_flow_api.id(261676002589310065)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(842496260251377247)
,p_attribute_01=>'this.affectedElements.dialog(''open''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261825477553738751)
,p_name=>'DA_CloseTM6'
,p_event_sequence=>310
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261825032508721326)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261825946978738753)
,p_event_id=>wwv_flow_api.id(261825477553738751)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(842496260251377247)
,p_attribute_01=>'this.affectedElements.dialog(''close''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261812265729017327)
,p_name=>'DA_ShowVisum'
,p_event_sequence=>320
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261811486278970149)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261812633043017330)
,p_event_id=>wwv_flow_api.id(261812265729017327)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(842495909979377244)
,p_attribute_01=>'this.affectedElements.dialog(''open'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261822857395637473)
,p_name=>'DA_CloseVisum'
,p_event_sequence=>330
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261822330747622028)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261823209516637483)
,p_event_id=>wwv_flow_api.id(261822857395637473)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(842495909979377244)
,p_attribute_01=>' this.affectedElements.dialog(''close''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261828657769800504)
,p_name=>'DA_ShowThaiNationalityInformation'
,p_event_sequence=>340
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261568718631276800)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261829040444800506)
,p_event_id=>wwv_flow_api.id(261828657769800504)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261827073420776781)
,p_attribute_01=>'this.affectedElements.dialog(''open''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261829990479838686)
,p_name=>'DA_CloseThaiNationalityInformation'
,p_event_sequence=>350
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261829720078828199)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261830398402838687)
,p_event_id=>wwv_flow_api.id(261829990479838686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261827073420776781)
,p_attribute_01=>'this.affectedElements.dialog(''close''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261844919355358266)
,p_name=>'DA_ShowResidentInformation'
,p_event_sequence=>360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261841855662248867)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261845300330358269)
,p_event_id=>wwv_flow_api.id(261844919355358266)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261840901167223525)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//this.affectedElements.dialog(''open'');',
'openModal("DLG_RESIDENCE_INFORMATION");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(261846324910378752)
,p_name=>'DA_CloseResidentInformation'
,p_event_sequence=>370
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(261846115949369659)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(261846739302378755)
,p_event_id=>wwv_flow_api.id(261846324910378752)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(261840901167223525)
,p_attribute_01=>'this.affectedElements.dialog(''close''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(262059624850116157)
,p_name=>'DA_ShowBlacklist'
,p_event_sequence=>380
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(262059462216109193)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(262060064046116162)
,p_event_id=>wwv_flow_api.id(262059624850116157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(262059033962100859)
,p_attribute_01=>'this.affectedElements.dialog(''open''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38454684263068631)
,p_name=>'DA_ShowPermitInfo'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38454545811068630)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38454769078068632)
,p_event_id=>wwv_flow_api.id(38454684263068631)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(38453348575068618)
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!!$("#P17_IS_PERMIT_INFO").val()) {',
'    openModal(''dialogPermitInfo'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(221485614136049198)
,p_name=>'DA_ShowBlacklistMatch'
,p_event_sequence=>400
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(221486006887049201)
,p_event_id=>wwv_flow_api.id(221485614136049198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'eval($(''#P17_URL_BLACKLIST'').val())'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(232275470551110746)
,p_name=>'DA_ShowHideButtonBlacklist'
,p_event_sequence=>410
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_MATCH_ON_BLACKLIST'
,p_condition_element=>'P17_MATCH_ON_BLACKLIST'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(232275858920110750)
,p_event_id=>wwv_flow_api.id(232275470551110746)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(262059462216109193)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(184673965747188244)
,p_name=>'Set Visa Expiry Date and Length of stay'
,p_event_sequence=>420
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'(!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) && ($v("MOVEMENT_ENTRY_EXIT") != "1" || $v("P17_NATIONALITY") == "THA") && $v("P17_DISPLAY_DOCNUMBER") != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(184674375215188293)
,p_event_id=>wwv_flow_api.id(184673965747188244)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select max(permit_days), DECODE( max(permit_days), 0, NULL, trunc(sysdate) + max(permit_days) - 1 )',
'into :P17_VISUM_4, :P17_VISUM_5 ',
'--from dl_common.visa_types#icao_doc_codes$lc ',
'from dl_common.visa_types$lc ',
'where key_value = :P17_VISUM',
'--and icao_doc_code = :P17_NATIONALITY',
';'))
,p_attribute_02=>'P17_VISUM,P17_NATIONALITY'
,p_attribute_03=>'P17_VISUM_4,P17_VISUM_5'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504468958602245939)
,p_name=>'Departure Set Visa Expiry Date and Length of stay'
,p_event_sequence=>430
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'(!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) && $v("MOVEMENT_ENTRY_EXIT") == "1" && $v("P17_NATIONALITY") != "THA" && $v("P17_DISPLAY_DOCNUMBER") != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504469077295245940)
,p_event_id=>wwv_flow_api.id(504468958602245939)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P17_LAST_DIRECTION = 0 AND :P17_LAST_MVMNT_VISA_EXP_DATE IS NOT NULL AND :P17_LAST_MVMNT_TRAVEL_DATE IS NOT NULL THEN',
'        :P17_VISUM_4 := TO_DATE(:P17_LAST_MVMNT_VISA_EXP_DATE, ''DD/MM/YYYY'') - TO_DATE(:P17_LAST_MVMNT_TRAVEL_DATE, ''DD/MM/YYYY'') + 1;',
'        :P17_VISUM_5 := TO_DATE(:P17_LAST_MVMNT_VISA_EXP_DATE, ''DD/MM/YYYY'');',
'    -- when last visa expiry date is null (ex - special visa)',
'    ELSIF :P17_LAST_DIRECTION = 0 AND :P17_LAST_MVMNT_VISA_EXP_DATE IS NULL AND :P17_LAST_MVMNT_TRAVEL_DATE IS NOT NULL THEN',
'        :P17_VISUM_4 := NULL;',
'        :P17_VISUM_5 := NULL;',
'    -- for all other cases',
'    ELSIF :P17_LAST_MVMNT_TRAVEL_DATE IS NOT NULL THEN',
'        SELECT MAX(permit_days), TO_DATE(:P17_LAST_MVMNT_TRAVEL_DATE, ''DD/MM/YYYY'') + MAX(permit_days) - 1 ',
'        INTO :P17_VISUM_4, :P17_VISUM_5 ',
'        FROM dl_common.visa_types$lc ',
'        WHERE key_value = :P17_VISUM;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :P17_VISUM_4 := NULL;',
'        :P17_VISUM_5 := NULL;',
'END;'))
,p_attribute_02=>'P17_VISUM,P17_LAST_MVMNT_TRAVEL_DATE,P17_LAST_DIRECTION,P17_LAST_MVMNT_VISA_EXP_DATE'
,p_attribute_03=>'P17_VISUM_4,P17_VISUM_5'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(185185156453316583)
,p_name=>'Set Visa Expiry Date'
,p_event_sequence=>440
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM_4'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'/*$v("MOVEMENT_ENTRY_EXIT") != "1" && $v("P17_DISPLAY_DOCNUMBER") != ""*/ (!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) && (!parseInt($("#MOVEMENT_ENTRY_EXIT").val()) || $v("P17_NATIONALITY") == "THA") && '
||'!!$("#P17_DISPLAY_DOCNUMBER").val()'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185467334403647190)
,p_event_id=>wwv_flow_api.id(185185156453316583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P17_VISUM_4").replace("-", "").length === 0)',
'    $("#P17_VISUM_4").val("");'))
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Delete'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185185591028316588)
,p_event_id=>wwv_flow_api.id(185185156453316583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P17_VISUM_5 := trunc(sysdate) + to_number(:P17_VISUM_4) - 1; -- + 1;'
,p_attribute_02=>'P17_VISUM_4'
,p_attribute_03=>'P17_VISUM_5'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Javascript'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504469498248245944)
,p_name=>'Departure Set Visa Expiry Date'
,p_event_sequence=>450
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM_4'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'/*$v("MOVEMENT_ENTRY_EXIT") != "1" && $v("P17_DISPLAY_DOCNUMBER") != ""*/ (!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) && !!parseInt($("#MOVEMENT_ENTRY_EXIT").val()) && $v("P17_NATIONALITY") != "THA" && !'
||'!$("#P17_DISPLAY_DOCNUMBER").val()'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173630928107838615)
,p_event_id=>wwv_flow_api.id(504469498248245944)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P17_VISUM_4").replace("-", "").length === 0)',
'    $("#P17_VISUM_4").val("");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504469569682245945)
,p_event_id=>wwv_flow_api.id(504469498248245944)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P17_LAST_MVMNT_TRAVEL_DATE IS NOT NULL THEN',
'        :P17_VISUM_5 := TO_DATE(:P17_LAST_MVMNT_TRAVEL_DATE, ''DD/MM/YYYY'') + TO_NUMBER(:P17_VISUM_4) - 1; -- + 1;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :P17_VISUM_5 := NULL;',
'END;'))
,p_attribute_02=>'P17_VISUM_4,P17_LAST_MVMNT_TRAVEL_DATE'
,p_attribute_03=>'P17_VISUM_5'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Javascript'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(185186434887413191)
,p_name=>'Set Visa Length of stay'
,p_event_sequence=>460
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM_5'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'(!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) && ($v("MOVEMENT_ENTRY_EXIT") != "1" || $v("P17_NATIONALITY") == "THA") && $v("P17_DISPLAY_DOCNUMBER") != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185186876388413193)
,p_event_id=>wwv_flow_api.id(185186434887413191)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_los number;',
'begin',
'    l_los := to_date(:P17_VISUM_5, ''DD/MM/YYYY'') - trunc(sysdate) + 1; -- - 1;',
'    :P17_VISUM_4 := l_los;',
'end;'))
,p_attribute_02=>'P17_VISUM_5'
,p_attribute_03=>'P17_VISUM_4'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Javascript?'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185467471614647191)
,p_event_id=>wwv_flow_api.id(185186434887413191)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*document.getElementsByClassName(''.u-Processing-spinner:before'').style.visibility=''hidden'';*/',
'',
''))
,p_stop_execution_on_error=>'Y'
,p_da_action_comment=>'Delete'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504469130430245941)
,p_name=>'Departure Set Visa Length of stay'
,p_event_sequence=>470
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM_5'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'(!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) && $v("MOVEMENT_ENTRY_EXIT") == "1" && $v("P17_NATIONALITY") != "THA" && $v("P17_DISPLAY_DOCNUMBER") != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504469243746245942)
,p_event_id=>wwv_flow_api.id(504469130430245941)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_los NUMBER;',
'BEGIN',
'    IF :P17_LAST_MVMNT_TRAVEL_DATE IS NOT NULL THEN',
'        l_los := TO_DATE(:P17_VISUM_5, ''DD/MM/YYYY'') - TO_DATE(:P17_LAST_MVMNT_TRAVEL_DATE, ''DD/MM/YYYY'') + 1; -- - 1;',
'        :P17_VISUM_4 := l_los;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :P17_VISUM_4 := NULL;',
'END;'))
,p_attribute_02=>'P17_VISUM_5,P17_LAST_MVMNT_TRAVEL_DATE'
,p_attribute_03=>'P17_VISUM_4'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'Javascript?'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(185706041887174891)
,p_name=>'Overstay'
,p_event_sequence=>480
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM_5'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'PLSQL_EXPRESSION'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*:AI_ENTRY_MODE_DESCRIPTION = ''Departure'' and',
':DG_DOCUMENTNUMBER is not null and ',
':P17_VISUM_6 is not null AND 1 = 2*/false'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(185706159159174892)
,p_event_id=>wwv_flow_api.id(185706041887174891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*$x("P17_VISUM_6_DISPLAY").style.backgroundColor = "red";',
'$x("P17_VISUM_6_DISPLAY").style.color = "white";',
'jQuery(document).ready(function ($) {',
'   $("#P17_VISUM_6_DISPLAY").blinkElement(300);',
'}); */'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191036049989524390)
,p_name=>'ABIS Blacklist Alarm'
,p_event_sequence=>500
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'CHECK_BLACKLISTALERT'
,p_condition_element=>'CHECK_BLACKLISTALERT'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191036271012524392)
,p_event_id=>wwv_flow_api.id(191036049989524390)
,p_event_result=>'TRUE'
,p_action_sequence=>1
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'in da'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191036207682524391)
,p_event_id=>wwv_flow_api.id(191036049989524390)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'abisHit();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(191038815382524417)
,p_name=>'Search on Blacklist (P17_SEND_IMAGE_ABIS)'
,p_event_sequence=>510
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SEND_IMAGE_ABIS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(191038853393524418)
,p_event_id=>wwv_flow_api.id(191038815382524417)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'Ich suche dann jetzt!'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(196840649382019194)
,p_name=>'Open COLLECTIVE PASSPORT'
,p_event_sequence=>520
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_COLLECTIVE_PASSPORT'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(196840802980019195)
,p_event_id=>wwv_flow_api.id(196840649382019194)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//var mySession = "&APP_SESSION.";',
'//apex.navigation.dialog(''f?p=500:12:'' +mySession+''::NO:::'',{title:''Collective Passport'',height:''700'',width:''1200'',maxWidth:''960'',modal:true,dialog:null},''t-Dialog--standard'',apex.jQuery(''#BTN_ADD_CHILDREN''));',
'',
'',
' ',
' //   var l_urla="f?p="+$v("pFlowId")+":12:"+$v("pInstance")+"::NO::"+$v("P17_SSPC");   ',
'  ',
'/*    apex.navigation.dialog(l_urla, {   ',
'    title:''Collective Passport'',   ',
'    height:''700'',   ',
'    width:''1200'',   ',
'    maxWidth:''960'',   ',
'    modal:true,  ',
'    dialog:null},   ',
'    ''t-Dialog--standard'',   ',
'    $(''#BTN_ADD_CHILDREN''));  ',
'    ',
'    apex.navigation.popup ({',
'    url: l_urla,',
'     name: ''Collective Passport'',',
'     width: 1200,',
'     height: 700,',
'     scroll: "no",',
'     resizable: "no",',
'     toolbar: "yes" });',
' */',
'',
'$("#BTN_ADD_CHILDREN").click()'))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(196841078979019198)
,p_name=>'DA_Show_Vehicle_Ditail'
,p_event_sequence=>530
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(196842305316019210)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(196841218240019199)
,p_event_id=>wwv_flow_api.id(196841078979019198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(196841006363019197)
,p_attribute_01=>'this.affectedElements.dialog(''open''); '
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(197229477959066403)
,p_name=>'Submit Pass Items'
,p_event_sequence=>540
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'submitItems'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(197229544732066404)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'  -- !! all functions are using the apex functionalities to get and set session states from APEX ITEMS directly',
'  pkg_bmbs_apex_util.p17_calc_after_submit_passport();',
'  pkg_bmbs_apex_util.p17_create_document_after_submit_passport();  ',
'  pkg_bmbs_apex_util.p17_check_warning_information(); -- uses x_void_passport, x_extendstay, x_watchlist_passport',
'',
'  ',
'end;'))
,p_attribute_02=>'P17_AGE_DISPLAY,PASS_VISUALPAGE,CHECK_BLACKLISTALERT,CHECK_CHECKSUMS_OK,CHECK_ISPASSPORTEXPIRED,DG13_AVAILABLE,DG1_DATEOFBIRTH,DG1_DOCUMENTCLASSCODE,DG1_DOCUMENTNUMBER,DG1_EXPIRATIONDATE,DG1_GENDER,DG1_GIVENNAME,DG1_ISSUINGSTATECODE,DG1_ISSUINGSTATEN'
||'AME,DG1_LASTNAME,DG2_AVAILABLE,DG3_AVAILABLE,DG_CHECKDIGITDATEOFBIRTH,DG_CHECKDIGITDOCUMENTNUMBER,DG_CHECKDIGITEXPIRATIONDATE,DG_CHECKDIGITFINAL,DG_CHECKRESULTDATEOFBIRTH,DG_CHECKRESULTDOCUMENTNUMBER,DG_CHECKRESULTEXPIRATIONDATE,DG_CHECKRESULTFINAL,D'
||'G_CHECKRESULTOPTIONALDATA,DG_DATEOFBIRTH,DG_DOCUMENTCLASSCODE,DG_DOCUMENTNUMBER,DG_ENTERMANUAL_NATIONALITY,DG_EXPIRATIONDATE,DG_FACECHECKED,DG_FINGERCHECKED,DG_FINGERCHECKED_TH,DG_GENDER,DG_GIVENNAME,DG_ISSUINGSTATECODE,DG_ISSUINGSTATENAME,DG_LASTNAM'
||'E,DG_MRZ,GENDER_VISUAL,ITEM_DOB_VISUAL,ITEM_EXPIRATION_DATE_VISUAL,LANDCARD_SCANNED,MOVEMENT_ENTRY_EXIT,MRZ_LINE_1,MRZ_LINE_2,P17_ABIS_URL,P17_AUTOPROCESSPASSPORT,P17_CHILD_COUNT,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_DOCNUMBER,P17_DISPLAY_DOCCLASS,P17_DIS'
||'PLAY_DOCTYPE,P17_DISPLAY_EXPIRYDATE,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_GENDER,P17_DISPLAY_LASTNAME,P17_FACE_OKAY,P17_FINGERMAXAGE,P17_FINGERMINAGE,P17_FINGERS_OKAY,P17_FP_CAPTURED,P17_LC_REQUIRED,P17_MOVEMENTCOUNT,P17_MVMNTID,P17_NATIONALITY,P17_PSSNG'
||'RSTATUS,P17_P_1006_SEE_SAV_LESSMATCH,P17_P_1008_SEE_SAV_NOFACEMATCH,P17_P_1009_SEE_SAV_WHENRED,P17_P_1010_SEE_SAV_BLACKLISTED,P17_SSPC,P17_SUPERVISOR_AUTHENTICATED,P17_URL_BLACKLIST,P17_USER_LEVEL,P17_VISA_REQUIRED,P17_WORKFLOW_STATUS,SECURITY_DUPLIC'
||'ATE_MOVEMENTS,VISA_SCANNED,P17_NATIONALITY_ID,TRNSPRTUNITID_SEA,P17_DISPLAY_MIDDLENAME,P17_TRAVELCARD_NO'
,p_attribute_03=>'P17_OVERSTAY_INFO_TRAVEL_DATE,P17_OVERSTAY_INFO_EXPIRY_DATE,P17_OVERSTAY_INFO_TODAY,P17_OVERSTAY_INFO_DAYS,P17_VISUM_5,P17_VISUM,P17_VISUM_1,P17_VISA_TYPE_ID,P17_VISUM_4,P17_PERMIT_TYPE,P17_PERMIT_EXPIRY,P17_LC_ADD_INFO,P17_BRDDOCID,P17_PROVINCE,P17_'
||'TMP_AMPUR,P17_TMP_TAMBON,P17_LC_ADDRESS,P17_TRAVELCARD_NO,P17_PASS_DETECTED,P17_EXPIRATIONDATE_ABIS,P17_DOB_ABIS ,P17_DISPLAY_GENDER,P17_AGE_DISPLAY,CHECK_ISPASSPORTEXPIRED,P17_VALID,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_EXPIRYDATE,CHECK_CHECKSUMS_OK,DG_M'
||'RZ,P17_PASS_DETECTED,P17_ARRIVAL_LC_NEEDED,P17_ARRIVAL_VISA_NEEDED,P17_DEPARTURE_LC_NEEDED,P17_DEPARTURE_VISA_NEEDED,TRNSPRTUNITID_SEA,P17_LAST_DIRECTION,P17_LAST_MVMNT_SRC,P17_LAST_MVMNT_SRC_SEC,P17_LAST_MVMNT_SRC_SEC_PK_VAL,P17_LAST_MVMNT_TRAVEL_DA'
||'TE,P17_LAST_MVMNT_DOCNO,P17_LAST_MVMNT_DOCNO_EXP_DATE,P17_LAST_MVMNT_VISA_TYPE,P17_LAST_MVMNT_VISA_EXP_DATE,P17_BRDDOC_IDENTITY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729915112028547149)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//$s("P17_DISPLAY_DOB_TEXT",$v("P17_DISPLAY_DOB_TEXT"));',
'let isDeparture = !!parseInt($("#MOVEMENT_ENTRY_EXIT").val());',
'',
'apexCustomEvent(''validateDemographicInput'');',
'',
'//stateless',
'let stateless = $("#P17_LAST_STATELESS").val();',
'',
'if (!!stateless) {',
'    //apex.event.trigger("#P17_STATELESS", "change");',
'    $("#P17_STATELESS_TRIG").val(stateless);',
'    apex.event.trigger(document, "toggleStatelessOption");',
'}',
'',
'if (isDeparture) {',
'    apexCustomEvent(''getLastMovementInfoWithArrData'');',
'}',
'else {',
'    apexCustomEvent(''getLastMovementInfo'');',
'}',
'',
'apexCustomEvent(''getPermitInfo'');',
'apexCustomEvent(''getOverstayInfo'');',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181665768489336797)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//apexCustomEvent(''splitMiddleName'');',
'apexCustomEvent(''getThaiPassportInfo'');',
'',
'var nat = $("#P17_NATIONALITY_ID").val() || $("#P17_NATIONALITY").val();',
'var docno = $("#P17_DISPLAY_DOCNUMBER").val();',
'var expdt = $("#DG_EXPIRATIONDATE").val();',
'',
'var req = {x01: docno, x02: expdt, x03: nat};',
'',
'//console.log("LOAD_LIVE_IMAGE-parms:", req);',
'',
'apex.server.process("LOAD_LIVE_IMAGE",',
'                    req ',
'                    , {',
'                        success: function(pData) ',
'                        {',
'                            if(pData.status == ''success'')',
'                            {',
'                                if (pData.image != null)',
'                                {',
'',
'                                //livestreamEnabled = false;',
'                                $(''#recent_photo'').attr(''src'', ''data:image/jpg;base64,'' + pData.image);',
'                                v_photoDatabase = pData.image;',
'                                //$(''#video'').css(''width'',''180px'');',
'                                }',
'                            }',
'                        }',
'                    }',
');',
'',
'$s("MRZ_LINE_1", $v("DG_MRZ").substr(0, 44));',
'$s("MRZ_LINE_2", $v("DG_MRZ").substr(44));',
'',
'$("#P17_PROVINCE,#P17_AMPUR,#P17_TAMBON,#P17_LC_ADDRESS").trigger("change");',
'',
'$("#P17_PASS_DETECTED").trigger("change");',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51446144993222527)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5173631053707838616)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108033636616098009)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(108032987983098002)
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(197231707662066425)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'executePageProcess(''PROC_LOAD_RECENT_FINGERS'', function(data) {',
'    //console.log("FP: recent fingers:", data);',
'    data = JSON.parse(data);',
'    if (data) {',
'        data.fp01 = data.fp01 || null;',
'        data.fp02 = data.fp02 || null;',
'        data.fp03 = data.fp03 || null;',
'        data.fp04 = data.fp04 || null;',
'        data.fp05 = data.fp05 || null;',
'        data.fp06 = data.fp06 || null;',
'        data.fp07 = data.fp07 || null;',
'        data.fp08 = data.fp08 || null;',
'        data.fp09 = data.fp09 || null;',
'        data.fp10 = data.fp10 || null;',
'        setHistoryTemplates([data.fp01, data.fp02, data.fp03, data.fp04, data.fp05, data.fp06, data.fp07, data.fp08, data.fp09, data.fp10]);',
'        captureComplete();',
'    }',
'});',
'setStatusDiv("div_movement_status");',
'',
'// start blacklist check with demographics only',
'demographicDates2();',
'demographicDates();',
'',
'// ICPO ',
'doICPOStandard("SLTD");'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(201148665550677891)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'MatchPassportImages();',
'stopCamera();',
'ToggleLiveFaceComparison();',
'DownloadAndRenderSecurityImages();',
'disconnectPassportReader();',
'PARAMETER_TARGET_READ = 1; ',
'PARAMETER_PASSREADER_SETTING = 7; //7239;',
'connectPassportReader();',
'$("#TH_DOCUMENT_NUMBER").text($v("P17_DISPLAY_DOCNUMBER"));',
'		/*shortcut.remove("F10");',
'		shortcut.add("F10", saveMovement, {*/',
'		shortcut.remove("F12");',
'		shortcut.add("F12", saveMovement, {',
'			''type'':''keydown'',',
'			''propagate'':true,',
'			''target'':document',
'		});',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(179719525599037856)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apexCustomEvent(''checkForCrewStatus'');',
'apexCustomEvent(''loadResidentInformation'');',
'//apexCustomEvent(''validateDemographicInput'');',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181669793461336837)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("$(''#PASS_VISUALPAGE'').length "+$(''#PASS_VISUALPAGE'').length);',
'console.log("$(''#PASS_UVPAGE'').length "+$(''#PASS_UVPAGE'').length);',
'console.log("$(''#PASS_IRPAGE'').length "+$(''#PASS_IRPAGE'').length);',
'',
'if ($(''#PASS_VISUALPAGE'').length > 0)',
'	$(''#SCI_1'')[0].src = $(''#PASS_VISUALPAGE'').attr(''src'');',
'if ($(''#PASS_UVPAGE'').length > 0)',
'	$(''#SCI_4'')[0].src = $(''#PASS_UVPAGE'').attr(''src'');',
'if ($(''#PASS_IRPAGE'').length > 0)',
'	$(''#SCI_7'')[0].src = $(''#PASS_IRPAGE'').attr(''src'');',
'',
'console.log("RUNTIME: 16 - " + (new Date()));',
'',
'',
'',
'//setInterval(blinker, 1000);',
'',
'var fotoramaIsFullscreen = false;',
'console.log("RUNTIME: 17 - " + (new Date()));',
'',
'$(''.fotorama'').on(''fotorama:fullscreenenter'', function() {',
'    fotoramaIsFullscreen = true;',
'}).on(''fotorama:fullscreenexit'', function() {',
'    fotoramaIsFullscreen = false;',
'}).on(''fotorama:load'', function (e, fotorama, data) {',
'  //if (data.index === 0) {',
'       /*$(''.fotorama__stage__shaft'').off().click(function() {',
'           if (fotoramaIsFullscreen) {',
'               return;',
'           }',
'           SCI_animate = true;',
'           shortcut.add(''esc'', function() {',
'               if (!animation_running) {',
'                   shortcut.remove(''esc'');',
'                   $(".CSS_ANIMATEBACK").trigger("click");',
'               }',
'           },{',
'               ''type'':''keydown'',',
'               ''propagate'':true,',
'               ''target'':document',
'           });',
'		animate_cell(''#REG_SECIMAGES_DETAIL'', ''#REG_LAYOUT_ROW_1'');',
'       });*/',
'  //}',
'});',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(157274860686993892)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'loadLookUpItems();',
'//apex.event.trigger("#P17_VISUM_5","change");',
'apex.event.trigger("#P17_PERMIT_TYPE", "change");',
'apex.event.trigger("#P17_DISPLAY_DOCCLASS", "checkDisplayDocclass");',
'apex.event.trigger("#P17_DISPLAY_DOCTYPE", "checkDisplayDoctype");',
'',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108033733371098010)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var extendStayDate = $("#P17_EXTENDSTAY_UNTIL").val();',
'var hasExtendStay = !!extendStayDate;',
'var extendStayUntil = parseCambodianDate(extendStayDate);',
'var extendStayOverstay = ((86400 * 1000 + (+extendStayUntil)) - (+new Date()));',
'var extendStayOkay = extendStayOverstay > 0;',
'var overstayDays = parseInt($("#P17_OVERSTAY_INFO_DAYS").val());',
'var hasOverstay = !!overstayDays;',
'var extendStayOverstayDays = Math.abs(Math.floor(((86400 * 1000 + (+parseCambodianDate($("#P17_EXTENDSTAY_UNTIL").val()))) - (+new Date())) / 86400 / 1000));',
'',
'$("#ALERT_OVERSTAY,#ALERT_OVERSTAY_EXTENDSTAY,#OVERSTAY_EXTENDSTAY_INFO").hide();',
'$("#P17_EXTENDSTAY_EXPIRY_DATE").val(extendStayDate);',
'$("#P17_EXTENDSTAY_OVERSTAY_DAYS").val(extendStayOverstayDays);',
'',
'if (hasOverstay) {',
'    if (hasExtendStay) {',
'        $("#P17_VISUM_5").val(toCambodianDateString(extendStayUntil)).trigger("change");',
'        if (!extendStayOkay) {',
'            $("#ALERT_OVERSTAY_EXTENDSTAY,#OVERSTAY_EXTENDSTAY_INFO").show();',
'            openModal("showOverstayInformation");',
'            $(''[aria-describedby="showOverstayInformation"]'').css("width", "");',
'        }',
'    } else {',
'        $("#ALERT_OVERSTAY").show();',
'        openModal("showOverstayInformation");',
'        $(''[aria-describedby="showOverstayInformation"]'').css("width", "");',
'    }',
'}',
'',
'//$(document).trigger("validateDemographicInput");',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170738916531646617)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>150
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!!parseInt($("#P17_PASSPORT_ISVOID").val())) {',
'    openModal(''dialogVoidPassport'');',
'}',
'',
'checkVisaRun().then((runList) => {',
'    if (runList.length > 0) {',
'        let ul = $("<ul>");',
'        for (let i in runList) {',
'            let name = runList[i].visa_name;',
'            let li = $("<li>").text(name);',
'            ul.append(li);',
'        }',
'        $("#VISA_RUN_LIST").html(ul);',
'        openModal(''dialogVisaRun'');',
'    }',
'});',
'',
'if (!!parseInt($("#P17_PASSPORT_ISWATCHLIST").val())) {',
'    openModal(''dialogWatchlistPassport'');',
'}',
'',
'//$("#MOVEMENT_ENTRY_EXIT").prop("disabled", true);',
'$("#MOVEMENT_ENTRY_EXIT").addClass("disableClick apex_disabled").attr("tabindex", "-1");',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54506001650889725)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>160
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let elems = [',
'    "#P17_NATIONALITY_ID",',
'    "#P17_NATIONALITY",',
'    "#P17_DISPLAY_DOCNUMBER",',
'    "#P17_DISPLAY_EXPIRYDATE",',
'    "#P17_BTN_FIND_MANUALLY"',
'];',
'',
'$(elems.join(",")).addClass("apex_disabled").prop("disabled", true);',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38454476102068629)
,p_event_id=>wwv_flow_api.id(197229477959066403)
,p_event_result=>'TRUE'
,p_action_sequence=>170
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!!$("#P17_IS_PERMIT_INFO").val()) {',
'    let regions = [',
'        "#REG_REENTRY",',
'        "#REG_EXTENDSTAY",',
'        "#REG_REQ4RESIDENCE",',
'        "#REG_ENDORSEMENT",',
'        "#REG_CHANGEVISA"',
'    ];',
'    let permits = $("#P17_IS_PERMIT_INFO").val().split(",");',
'    $(regions.join(",")).hide();',
'    for (let i = 0; i < permits.length; ++i) {',
'        $("#" + permits[i]).show();',
'    }',
'    $("#P17_SHOW_PERMIT_INFO").removeClass("button-data-available apex_disabled").addClass("button-data-available");',
'    //openModal(''dialogPermitInfo'');',
'} ',
'else {',
'    $("#P17_SHOW_PERMIT_INFO").removeClass("button-data-available apex_disabled").addClass("apex_disabled").prop("disabled", true);',
'}',
'',
'if(!$("#CUSTOM_BTN_EDIT_LAST_MOVEMENT").is('':hidden'')) {',
'    $("#CUSTOM_BTN_EDIT_LAST_MOVEMENT").attr("onclick", "javascript:void(0);").hide();',
'};',
'',
'if(!!parseInt($("#MOVEMENT_ENTRY_EXIT").val())){',
'    //console.log("refreshing visa/tm6 images");',
'    apexCustomEvent(''refreshVisaTM6Image'');',
'}',
'',
'/*',
'if (!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val())) {',
'    if ($v("MOVEMENT_ENTRY_EXIT") == "1" || $v("TRNSPRTUNITID").length === 0) {',
'        $("#TRNSPRTUNITID").focus().select();',
'    }',
'    else if ($("#P17_TRAVELCARD_NO").is(":visible")) {',
'        $("#P17_TRAVELCARD_NO").focus().select();',
'    }',
'    else {',
'        let focusable = getBmBSFocusableItems(), currIdx = focusable.index($("#P17_DISPLAY_GENDER"));',
'        if (currIdx != -1 && focusable.eq(currIdx + 1).length) focusable.eq(currIdx + 1).focus().select();',
'    }',
'}',
'else {',
'    let focusable = getBmBSFocusableItems(), currIdx = focusable.index($("#P17_DISPLAY_GENDER"));',
'    if (currIdx != -1 && focusable.eq(currIdx + 1).length) focusable.eq(currIdx + 1).focus().select();',
'}',
'*/',
'',
'apex.event.trigger(document, "validateFlightNum");',
'$("#TRNSPRTUNITID").focus();'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(197230073694066409)
,p_name=>'Refresh Movements on Nationality'
,p_event_sequence=>550
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_NATIONALITY'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(197230331947066412)
,p_name=>'Refresh Movements on Doc-Number'
,p_event_sequence=>560
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_DOCNUMBER'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(201148818800677892)
,p_name=>'Restart after Supervisor Reason'
,p_event_sequence=>570
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SUPERVISOR_REASON'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(201148989664677894)
,p_event_id=>wwv_flow_api.id(201148818800677892)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ALERT'
,p_attribute_01=>'in der DA'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(201148893920677893)
,p_event_id=>wwv_flow_api.id(201148818800677892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'javascript:resetWorkstation(this);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(201149243961677897)
,p_name=>'Restart after Supervisor check'
,p_event_sequence=>580
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "5"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(201149343505677898)
,p_event_id=>wwv_flow_api.id(201149243961677897)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'		//shortcut.remove("F10");',
'		shortcut.remove("F12");',
'        isSaveMovementActive = true;',
'		apex.submit({',
'			request : ''REQUEST_PROCESSBORDERDOCUMENT'',',
'			showWait : true 			});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181668476685336824)
,p_name=>'GET: PERMIT TYPE INFORMATION'
,p_event_sequence=>590
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PERMIT_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getPermitTypeInformation'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128279544401666509)
,p_event_id=>wwv_flow_api.id(181668476685336824)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select number_of_entries',
'      ,number_of_entries_used',
'      ,endpermit_date',
'  into :P17_PERMIT_DAYS_TOTAL',
'      ,:P17_PERMIT_DAYS_USED',
'      ,:P17_PERMIT_EXPIRY',
'  from tm8_reentries ',
' where key_value = :P17_PERMIT_TYPE',
'   and rownum = 1;'))
,p_attribute_02=>'P17_PERMIT_TYPE'
,p_attribute_03=>'P17_PERMIT_DAYS_TOTAL,P17_PERMIT_DAYS_USED,P17_PERMIT_EXPIRY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(181668792477336827)
,p_name=>'Open Blacklist'
,p_event_sequence=>600
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'openBlackList'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(181669137363336830)
,p_event_id=>wwv_flow_api.id(181668792477336827)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#OPEN_BLACKLIST").click()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(68637961702542268)
,p_name=>'MANDATORY: ITEMS'
,p_event_sequence=>610
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_FIRSTNAME,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_LASTNAME,P17_DISPLAY_GENDER,P17_DATE_OF_ENTRY,TRNSPRTUNITID,MOVEMENT_ENTRY_EXIT,P17_NATIONALITY,P17_DISPLAY_DOCCLASS,P17_DISPLAY_DOCTYPE,P17_DISPLAY_EXPIRYDATE,P17_DISPLAY_DOCNUMBER,TRNSPRTUNITID'
||'_SEA,P17_STATELESS,P17_VEHICLE_TYPE_D'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value == ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68638051038542269)
,p_event_id=>wwv_flow_api.id(68637961702542268)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(68638202589542270)
,p_event_id=>wwv_flow_api.id(68637961702542268)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119108396218171047)
,p_name=>'MANDATORY: P17_TRAVELCARD_NO'
,p_event_sequence=>620
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_TRAVELCARD_NO'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value.length != 7'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119108454916171048)
,p_event_id=>wwv_flow_api.id(119108396218171047)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119108536755171049)
,p_event_id=>wwv_flow_api.id(119108396218171047)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(157271546399993859)
,p_name=>'MANDATORY: P17_DISPLAY_DOCNUMBER'
,p_event_sequence=>630
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_DOCNUMBER'
,p_condition_element=>'P17_DISPLAY_DOCNUMBER'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkDisplayDocNumber'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(157271705910993860)
,p_event_id=>wwv_flow_api.id(157271546399993859)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(157271816059993861)
,p_event_id=>wwv_flow_api.id(157271546399993859)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108033905020098011)
,p_name=>'CLOSE MODAL: OVERSTAY INFO'
,p_event_sequence=>650
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(108033190189098004)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108033932189098012)
,p_event_id=>wwv_flow_api.id(108033905020098011)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119254946389993199)
,p_name=>'RESET: NEED LANDCARD'
,p_event_sequence=>660
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_NATIONALITY,P17_TRAVELCARD_NO'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'resetNeedLandcard'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119255098781993200)
,p_event_id=>wwv_flow_api.id(119254946389993199)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger("#P17_TRAVELCARD_NO", "change");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(107618162386742910)
,p_name=>'Validate Demographic Input'
,p_event_sequence=>670
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'validateDemographicInput'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(107618313891742911)
,p_event_id=>wwv_flow_api.id(107618162386742910)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- !! this function uses the apex session functionalities to get and set values',
'pkg_bmbs_apex_util.p17_validate_demographic_input();'))
,p_attribute_02=>'P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_DOB_TEXT,P17_NATIONALITY,P17_DISPLAY_DOCNUMBER,P17_MVMNTID,P17_DISPLAY_DOCTYPE,P17_DISPLAY_DOCCLASS'
,p_attribute_03=>'P17_DISPLAY_DOCTYPE,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_GENDER,P17_DISPLAY_DOCCLASS,P17_MANUAL_EXPIRYDATE,P17_VALID,CHECK_ISPASSPORTEXPIRED,P17_DISPLAY_TEXT,P17_DISPLAY_MESSAGE_CAPTURE_RIGHT,P17_DISPLAY_MESSAGE'
||'_CAPTURE_LEFT,P17_DISPLAY_MESSAGE_CAPTURE_THUMBS,P17_HEALTHCHECK_COUNTRY,P17_RESIDENT_TYPE,P17_RESIDENT_NUMBER,P17_LAST_NAME_RI,P17_FIRST_NAME_RI,P17_MIDDLE_NAME_RI,P17_LAST_DIRECTION,P17_DISPLAY_MIDDLENAME,P17_LAST_MVMNT_SRC,P17_LAST_MVMNT_SRC_SEC,P'
||'17_LAST_MVMNT_SRC_SEC_PK_VAL,P17_LAST_MVMNT_TRAVEL_DATE,P17_LAST_MVMNT_DOCNO,P17_LAST_MVMNT_DOCNO_EXP_DATE,P17_LAST_MVMNT_VISA_TYPE,P17_LAST_MVMNT_VISA_EXP_DATE,P17_LAST_STATELESS'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128278440182666498)
,p_event_id=>wwv_flow_api.id(107618162386742910)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'showDisplayWorkflow();',
'$("#P17_DISPLAY_DOCCLASS").trigger("change");',
'$("#P17_DISPLAY_DOCTYPE").trigger("change");',
'//$("#P17_PERMIT_TYPE").trigger(''apexrefresh'');',
'//if (!$("#P17_IS_PERMIT_INFO").val()) {$("#P17_PERMIT_TYPE").trigger(''apexrefresh'');}',
'$("#P17_PERMIT_TYPE").trigger("change");',
'',
'$("#P17_VALID").removeClass("field-warn apex-page-item-error");',
'if ($("#P17_VALID").text().trim().length > 0) {',
'    if ($("#P17_VALID").text().trim().startsWith("-")) {',
'        $("#P17_VALID").addClass("apex-page-item-error");',
'    } else {',
'        $("#P17_VALID").addClass("field-warn");',
'    }',
'}',
'',
'$("#P17_DISPLAY_LASTNAME,#P17_DISPLAY_FIRSTNAME,#P17_DISPLAY_DOB_TEXT,#P17_DISPLAY_GENDER,#P17_TRAVELCARD_NO,#P17_PROVINCE,#P17_MANUAL_EXPIRYDATE").trigger("change");',
'validateDatePicker.call($("#P17_DISPLAY_EXPIRYDATE"));',
'$("#P17_PASS_DETECTED,#MOVEMENT_ENTRY_EXIT").trigger("change");',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(128278030410666494)
,p_name=>'MANDATORY: P17_PROVINCE'
,p_event_sequence=>680
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PROVINCE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'apex.item("P17_PROVINCE").getValue() == "" && apex.item("P17_NEED_LANDCARD").getValue() == "YES" && apex.item("MOVEMENT_ENTRY_EXIT").getValue() != 1'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128278206481666495)
,p_event_id=>wwv_flow_api.id(128278030410666494)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128278276709666496)
,p_event_id=>wwv_flow_api.id(128278030410666494)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(128279669483666510)
,p_name=>'After Refresh: P17_PERMIT_TYPE'
,p_event_sequence=>690
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PERMIT_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128279788424666511)
,p_event_id=>wwv_flow_api.id(128279669483666510)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*if ($("#P17_PERMIT_TYPE option").length > 0) {',
'    var permitID = $("#P17_PERMIT_TYPE").find("option:nth-child(1)").val();',
'    //$s("P17_PERMIT_TYPE", permitID);',
'    ',
'    //$("#P17_PERMIT_TYPE").find("option:nth-child(1)").prop("selected", true);',
'    //$("#P17_PERMIT_TYPE").prop("disabled", true);',
'    //setTimeout(() => $("#P17_PERMIT_TYPE").trigger("change"), 250);',
'    $("#P17_PERMIT_TYPE").val(permitID).trigger("change");',
'    $("#P17_PERMIT_TYPE ").prop("disabled", true);    ',
'}',
'$("#P17_PERMIT_TYPE,#P17_PERMIT_DAYS_USED,#P17_PERMIT_DAYS_TOTAL,#P17_PERMIT_EXPIRY").prop("disabled", true).addClass("apex_disabled");*/',
'//$("#P17_PERMIT_DAYS_USED,#P17_PERMIT_DAYS_TOTAL,#P17_PERMIT_EXPIRY").prop("disabled", true).addClass("apex_disabled");',
'$("#P17_PERMIT_DAYS_USED,#P17_PERMIT_DAYS_TOTAL").prop("disabled", true).addClass("apex_disabled");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(128279872392666512)
,p_name=>'ON CHANGE: DISABLE ITEMS'
,p_event_sequence=>700
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PERMIT_DAYS_TOTAL,P17_PERMIT_EXPIRY,P17_PERMIT_DAYS_USED'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128279998830666513)
,p_event_id=>wwv_flow_api.id(128279872392666512)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(128280827302666522)
,p_name=>'Check For Crew Status'
,p_event_sequence=>710
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkForCrewStatus'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128281013153666523)
,p_event_id=>wwv_flow_api.id(128280827302666522)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    is_crew',
'    , doc_no',
'    , to_char(travel_date, ''DD/MM/YYYY'')',
'    , transport_no',
'    , last_name',
'    , first_name',
'into',
'    :P17_IS_CREW_MEMBER',
'    , :P17_CREW_DOCNO',
'    , :P17_CREW_TRAVELDATE',
'    , :P17_CREW_TRANSPORTNO',
'    , :P17_CREW_LASTNAME',
'    , :P17_CREW_FIRSTNAME',
'from (',
'    select',
'        ''Y'' is_crew',
'        , doc_no',
'        , arrival_date travel_date',
'        , flight_no transport_no',
'        , last_name',
'        , first_name',
'    from',
'        crew_members',
'    where',
'        /*:MOVEMENT_ENTRY_EXIT = 0',
'        and*/ upper(doc_no) = upper(:P17_DISPLAY_DOCNUMBER)',
'        and upper(first_name) = upper(trim(trim(:P17_DISPLAY_FIRSTNAME) || '' '' || trim(:P17_DISPLAY_MIDDLENAME)))',
'        and upper(last_name) = upper(trim(:P17_DISPLAY_LASTNAME))',
'        and upper(flight_no) = upper(trim(:TRNSPRTUNITID))',
'        and trunc(arrival_date) = trunc(sysdate)',
'        and rownum < 2',
'    ',
'    union all',
'    select ''N'', null, null, null, null, null from dual',
')',
'where rownum < 2 /*''N'' from dual*/;'))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_DISPLAY_LASTNAME,TRNSPRTUNITID,MOVEMENT_ENTRY_EXIT'
,p_attribute_03=>'P17_IS_CREW_MEMBER,P17_CREW_TRANSPORTNO,P17_CREW_TRAVELDATE,P17_CREW_LASTNAME,P17_CREW_FIRSTNAME,P17_CREW_DOCNO,P17_CREW_TRANSPORTNO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43029632549716821)
,p_name=>'Check For Crew Status 2'
,p_event_sequence=>720
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkForCrewStatus'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504468607508245936)
,p_event_id=>wwv_flow_api.id(43029632549716821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// crew auto check to be disabled temporarily',
'return false;'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43029738338716822)
,p_event_id=>wwv_flow_api.id(43029632549716821)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	v_tm2_seqno	dl_bordercontrol.v_crew.tm2inout_seqno%TYPE	:= null;',
'	',
'	v_conv_seqno	dl_bordercontrol.v_tm2.conv_seqno%TYPE		:= null;',
'	v_iodte				dl_bordercontrol.v_tm2.iodte%TYPE				:= null;',
'	v_cardtype		dl_bordercontrol.v_tm2.cardtype%TYPE			:= null;',
'	v_convnm			dl_bordercontrol.v_tm2.convnm%TYPE			:= null;',
'	v_convregno		dl_bordercontrol.v_tm2.convregno%TYPE		:= null;',
'	v_convowner		dl_bordercontrol.v_tm2.convowner%TYPE		:= null;',
'	v_iocountcd		dl_bordercontrol.v_tm2.iocountcd%TYPE			:= null;',
'	v_ioportnm		dl_bordercontrol.v_tm2.ioportnm%TYPE			:= null;',
'	v_ionote			dl_bordercontrol.v_tm2.ionote%TYPE				:= null;',
'	v_iodept			dl_bordercontrol.v_tm2.iodept%TYPE				:= null;',
'	v_iodeptth			dl_bordercontrol.v_tm2.iodeptth%TYPE			:= null;',
'begin',
'',
'	/* crew info block start */',
'	begin',
'		',
'		with t_crew as ',
'		(',
'			select ',
'				crew_seqno',
'				, tm2inout_seqno',
'				, tdtno',
'				, efamilynm',
'				, efirstnm',
'				, ROW_NUMBER() OVER (PARTITION BY tdtno ORDER BY crew_seqno DESC) RN',
'			from ',
'				dl_bordercontrol.v_crew --crew_members',
'			where ',
'				tdtno = UPPER(:P17_DISPLAY_DOCNUMBER)',
'				and ( passportexpdte is null or TRUNC(passportexpdte) = TO_DATE(NVL(:P17_MANUAL_EXPIRYDATE, :P17_DISPLAY_EXPIRYDATE), ''DD/MM/YYYY'') )',
'				and nationcd = ',
'					(',
'						select pib.count_seqno',
'						from dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib',
'						where icao.key_value = :P17_NATIONALITY',
'						and icao.is_active = ''Y''',
'						and icao.notice$dlc = pib.countcd ',
'					)',
'		)',
'		select ',
'			tm2inout_seqno',
'			, ''Y''',
'			, tdtno',
'			, efamilynm',
'			, efirstnm',
'			, NVL2(:P17_DATE_OF_ENTRY, SUBSTR(:P17_DATE_OF_ENTRY, 1, 10), null)',
'		into ',
'			v_tm2_seqno',
'			, :P17_IS_CREW_MEMBER',
'			, :P17_CREW_DOCNO',
'			, :P17_CREW_LASTNAME',
'			, :P17_CREW_FIRSTNAME',
'			, :P17_CREW_TRAVELDATE',
'		from t_crew',
'		where RN = 1;',
'		',
'	exception',
'		when no_data_found then',
'			v_tm2_seqno						:= null;',
'			:P17_IS_CREW_MEMBER	:= ''N'';',
'			:P17_CREW_DOCNO			:= null;',
'			:P17_CREW_LASTNAME		:= null;',
'			:P17_CREW_FIRSTNAME		:= null;',
'			:P17_CREW_TRAVELDATE	:= null;',
'			',
'	end;',
'	/* crew info block end */',
'',
'	if v_tm2_seqno is not null then',
'		/* TM2 (Conveyance) info block start */',
'		begin',
'			',
'			select ',
'				conv_seqno,',
'				iodte,',
'				DECODE(cardtype, ''2'', ''0'', cardtype), --cardtype,',
'				convnm,',
'				convregno,',
'				convowner,',
'				iocountcd,',
'				ioportnm,',
'				ionote,',
'				iodept,',
'				iodeptth',
'			into ',
'				v_conv_seqno,',
'				v_iodte,',
'				v_cardtype,',
'				v_convnm,',
'				v_convregno,',
'				v_convowner,',
'				v_iocountcd,',
'				v_ioportnm,',
'				v_ionote,',
'				v_iodept,',
'				v_iodeptth',
'			from dl_bordercontrol.v_tm2',
'			where tm2_seqno = v_tm2_seqno;',
'			',
'		exception',
'			when no_data_found then',
'				v_conv_seqno	:= null;',
'				v_iodte				:= null;',
'				v_cardtype		:= null;',
'				v_convnm			:= null;',
'				v_convregno		:= null;',
'				v_convowner		:= null;',
'				v_iocountcd		:= null;',
'				v_ioportnm		:= null;',
'				v_ionote			:= null;',
'				v_iodept			:= null;',
'				v_iodeptth			:= null;',
'				',
'		end;',
'		/* TM2 (Conveyance) info block end */',
'	elsif TRIM(:TRNSPRTUNITID) is not null then',
'		v_convregno := TRIM(:TRNSPRTUNITID);',
'	end if;',
'	',
'	if v_convregno is not null then',
'		:P17_CREW_TRANSPORTNO := v_convregno;',
'		:P13_VEHICLE_NAME := v_convnm;',
'		:P13_OWNER := v_convowner;',
'		:P13_DATE_TIME := CAST(v_iodte as date);',
'		:P13_DIRECTION := TO_NUMBER(v_cardtype);',
'		:P13_CONVEYANCE_NO := v_convregno;',
'		:P13_FROM_TO_COUNTRY := v_iocountcd;',
'		:P13_PORT_NAME := v_ioportnm;',
'		:P13_FROM_TO_OTHER_PORT := v_ionote;',
'		:P13_FROM_TO_PORT_IN_THAI := v_iodept;',
'		:P13_IN_OUT_PORT_IN_THAI := v_iodeptth;',
'		',
'		if v_conv_seqno is not null then',
'			begin',
'				select key_value',
'				into :P13_VEHICLE_TYPE',
'				from dl_common.trans_vehicles$lc',
'				where num_value = v_conv_seqno;',
'			exception',
'				when no_data_found then',
'					:P13_VEHICLE_TYPE := null;',
'			end;',
'		end if;',
'	end if;',
'',
'end;'))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,TRNSPRTUNITID,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_EXPIRYDATE,P17_NATIONALITY,P17_CREW_TRANSPORTNO,P17_DATE_OF_ENTRY,P13_VEHICLE_TYPE,P13_VEHICLE_NAME,P13_OWNER,P13_DATE_TIME,P13_DIRECTION,P13_CONVEYANCE_NO,P13_FROM_TO_COUNTRY,P13_'
||'PORT_NAME,P13_FROM_TO_OTHER_PORT,P13_FROM_TO_PORT_IN_THAI,P13_IN_OUT_PORT_IN_THAI'
,p_attribute_03=>'P17_IS_CREW_MEMBER,P17_CREW_TRANSPORTNO,P17_CREW_TRAVELDATE,P17_CREW_LASTNAME,P17_CREW_FIRSTNAME,P17_CREW_DOCNO,P17_CREW_TRANSPORTNO,P17_CREW_TRAVELDATE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43029972936716824)
,p_event_id=>wwv_flow_api.id(43029632549716821)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if TRIM(:TRNSPRTUNITID) is null and :P17_CREW_TRANSPORTNO is not null then',
'        :TRNSPRTUNITID := :P17_CREW_TRANSPORTNO;',
'    end if;',
'end;'))
,p_attribute_02=>'TRNSPRTUNITID'
,p_attribute_03=>'TRNSPRTUNITID'
,p_attribute_04=>'Y'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51446412937222530)
,p_name=>'Set Last Flight Number'
,p_event_sequence=>730
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'setLastFlightNum'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51446528897222531)
,p_event_id=>wwv_flow_api.id(51446412937222530)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF NVL(:AI_TRANSPORT_MODE, -1) != 2 AND NVL(TRIM(:TRNSPRTUNITID), ''~'') != NVL(:AI_LAST_TRNSPRTUNITID, ''~'') then',
'        :AI_LAST_TRNSPRTUNITID := TRIM(:TRNSPRTUNITID);',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :AI_LAST_TRNSPRTUNITID := NULL;',
'END;'))
,p_attribute_02=>'TRNSPRTUNITID,AI_LAST_TRNSPRTUNITID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423525530147821450)
,p_name=>'Set Last Province ID'
,p_event_sequence=>740
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'setLastProvinceID'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31426988964113704901)
,p_event_id=>wwv_flow_api.id(21423525530147821450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF NVL(:P17_PROVINCE, ''~'') != NVL(:AI_BORDERPOST_PROVINCE_ID, ''~'') then',
'        :AI_BORDERPOST_PROVINCE_ID := :P17_PROVINCE;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :AI_BORDERPOST_PROVINCE_ID := NULL;',
'END;'))
,p_attribute_02=>'P17_PROVINCE,AI_BORDERPOST_PROVINCE_ID'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683850964688328602)
,p_name=>'Set Last Vehicle Type'
,p_event_sequence=>750
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'setLastVehicleType'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683851045659328603)
,p_event_id=>wwv_flow_api.id(4683850964688328602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF NVL(:P17_VEHICLE_TYPE_D, ''~'') != NVL(:AI_LAST_VEHICLE_TYPE, ''~'') then',
'        :AI_LAST_VEHICLE_TYPE := :P17_VEHICLE_TYPE_D;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :AI_LAST_VEHICLE_TYPE := NULL;',
'END;'))
,p_attribute_02=>'P17_VEHICLE_TYPE_D,AI_LAST_VEHICLE_TYPE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51446972472222535)
,p_name=>'Set Auto Complete Fields'
,p_event_sequence=>760
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'TRNSPRTUNITID'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'result'
,p_display_when_type=>'NEVER'
,p_da_event_comment=>'Required with event name result for DA on autocomplete fields. Add other auto complete fields if required.'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51447046167222536)
,p_event_id=>wwv_flow_api.id(51446972472222535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#TRNSPRTUNITID").trigger("change");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143926045768387928)
,p_name=>'Check For Flight Health Check'
,p_event_sequence=>770
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkForFlightHealthCheck'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143926163949387929)
,p_event_id=>wwv_flow_api.id(143926045768387928)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select need_check, warning_text into :P17_HEALTHCHECK_FLIGHT, :P17_HEALTHCHECK_FLIGHT_COMMENT from (',
'    select',
'        1 need_check',
'        , warning_text',
'    from',
'        flight_health_check',
'    where',
'        flightnum = :TRNSPRTUNITID',
'        and trunc(valid_from) <= trunc(sysdate)',
'        and trunc(valid_until) >= trunc(sysdate)',
'    union all',
'    select 0, '''' from dual',
')',
'where',
'    rownum < 2',
';'))
,p_attribute_02=>'TRNSPRTUNITID'
,p_attribute_03=>'P17_HEALTHCHECK_FLIGHT,P17_HEALTHCHECK_FLIGHT_COMMENT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143926313170387930)
,p_event_id=>wwv_flow_api.id(143926045768387928)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("HEALTHCHECK: country=", $("#P17_HEALTHCHECK_COUNTRY").val(), " / flight=", $("#P17_HEALTHCHECK_FLIGHT").val());',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504468846897245938)
,p_event_id=>wwv_flow_api.id(143926045768387928)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'// check if the flight exists',
'// current src: flights',
'',
'// return if trans mode is not air border ',
'if (''&AI_TRANSPORT_MODE.'' != 0) {',
'    console.log("Trans Mode: " + ''&AI_TRANSPORT_MODE.'');',
'    $("#P17_TRNSPRTUNITID_EXISTS").val("1").trigger("change");',
'    return false;',
'}',
'',
'if ($v("TRNSPRTUNITID").trim().length > 0) {',
'    apex.server.process("CHECK_FLIGHT_NUM", ',
'    {',
'        x01: $v("TRNSPRTUNITID"),',
'        x02: $v("MOVEMENT_ENTRY_EXIT"),',
'        x03: ''&AI_BORDERPOST_ID.''',
'    }, ',
'    {',
'        success: function(pData) ',
'        {',
'            //console.log(''CHECK_FLIGHT_NUM Result: '', pData.flight_num + '' '' + pData.flight_num_exists);',
'            //$("#TRNSPRTUNITID").removeClass("cl-red").addClass(pData.flight_num_exists != "Y" ? "cl-red" : "");',
'            $("#P17_TRNSPRTUNITID_EXISTS").val(pData.flight_num_exists != "Y" ? "0" : "1").trigger("change");',
'        }',
'    });',
'}',
'else {',
'    //$("#TRNSPRTUNITID").removeClass("cl-red");',
'    $("#P17_TRNSPRTUNITID_EXISTS").val("").trigger("change");',
'}',
'*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143927075920387938)
,p_name=>'MOVEMENT_ENTRY_EXIT: Check Travel Direction'
,p_event_sequence=>780
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'MOVEMENT_ENTRY_EXIT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143927200149387939)
,p_event_id=>wwv_flow_api.id(143927075920387938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var lastDirection = $("#P17_LAST_DIRECTION").val() || "";',
'var currentDirection = $("#MOVEMENT_ENTRY_EXIT").val() || "";',
'',
'var warningClasses = "cell-blink";',
'$("#MOVEMENT_ENTRY_EXIT").removeClass(warningClasses).addClass((lastDirection == currentDirection) ? warningClasses : "");',
'',
'apex.event.trigger(document, "validateFlightNum");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504466467465245914)
,p_event_id=>wwv_flow_api.id(143927075920387938)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let exitFlag = $("#MOVEMENT_ENTRY_EXIT").val();',
'',
'if (exitFlag == 1) {',
'    //$("#P17_CREW_ADD_REDUCE_LABEL").text("Add Vehicle Crew :");',
'    $("#P17_CREW_ADD_REDUCE_LABEL").text("เพิ่ม-คนประจำพาหนะ :");',
'} else {',
'    //$("#P17_CREW_ADD_REDUCE_LABEL").text("Reduce Vehicle Crew :");',
'    $("#P17_CREW_ADD_REDUCE_LABEL").text("ลด-คนประจำพาหนะ :");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(128282538090666539)
,p_name=>'P17_IS_CREW_MEMBER: Warning Color'
,p_event_sequence=>790
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_IS_CREW_MEMBER'
,p_condition_element=>'P17_IS_CREW_MEMBER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173633848900838644)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'body'
,p_attribute_01=>'bmbs-crew-mode'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173633991734838645)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'body'
,p_attribute_01=>'bmbs-crew-mode'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128282711541666540)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#P17_IS_CREW_MEMBER>label:first'
,p_attribute_01=>'field-warn'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(128282795682666541)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#P17_IS_CREW_MEMBER>label:first'
,p_attribute_01=>'field-warn'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133525351260270493)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(128282829167666542)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133525464176270494)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(128282829167666542)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504466560658245915)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P17_TRAVELCARD_NO") == "") {',
'    $s("P17_TRAVELCARD_NO", "XX00000");',
'    $("#P17_TRAVELCARD_NO").trigger("change");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504466690903245916)
,p_event_id=>wwv_flow_api.id(128282538090666539)
,p_event_result=>'FALSE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P17_TRAVELCARD_NO") == "XX00000") {',
'    $s("P17_TRAVELCARD_NO", "");',
'    $("#P17_TRAVELCARD_NO").trigger("change");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504466762410245917)
,p_name=>'P17_IS_CREW_MEMBER: Change'
,p_event_sequence=>800
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_IS_CREW_MEMBER'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504467269878245922)
,p_event_id=>wwv_flow_api.id(504466762410245917)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apexCustomEvent(''checkVehicleDetailTM2'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173630807362838614)
,p_event_id=>wwv_flow_api.id(504466762410245917)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF NVL(:P17_IS_CREW_MEMBER, ''N'') != NVL(:AI_LAST_CREW_OPTION_VALUE, ''N'') then',
'        :AI_LAST_CREW_OPTION_VALUE := :P17_IS_CREW_MEMBER;',
'    END IF;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :AI_LAST_CREW_OPTION_VALUE := ''N'';',
'END;'))
,p_attribute_02=>'P17_IS_CREW_MEMBER,AI_LAST_CREW_OPTION_VALUE'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133525539817270495)
,p_name=>'P17_NATIONALITY: Activate Thai Button'
,p_event_sequence=>810
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_NATIONALITY'
,p_condition_element=>'P17_NATIONALITY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'THA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133525708029270496)
,p_event_id=>wwv_flow_api.id(133525539817270495)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(261568718631276800)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133525753843270497)
,p_event_id=>wwv_flow_api.id(133525539817270495)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(261568718631276800)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133529305601270532)
,p_name=>'P17_SUBNATIONALITY: After Refresh'
,p_event_sequence=>820
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_SUBNATIONALITY'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#P17_SUBNATIONALITY option").length > 1'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133529382028270533)
,p_event_id=>wwv_flow_api.id(133529305601270532)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SUBNATIONALITY,P17_SUBNAT_PLACEHOLDER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133529452186270534)
,p_event_id=>wwv_flow_api.id(133529305601270532)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_SUBNATIONALITY,P17_SUBNAT_PLACEHOLDER'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170736879438646597)
,p_name=>'P17_SHOW_RESIDENCE: Set Button Color'
,p_event_sequence=>830
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_RESIDENCE_DOCNO'
,p_condition_element=>'P17_RESIDENCE_DOCNO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170737001930646598)
,p_event_id=>wwv_flow_api.id(170736879438646597)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(261841855662248867)
,p_attribute_01=>'button-data-available'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170737115548646599)
,p_event_id=>wwv_flow_api.id(170736879438646597)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(261841855662248867)
,p_attribute_01=>'button-data-available'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133526274403270502)
,p_name=>'P17_DISPLAY_DOCNUMBER: Load Thai Information'
,p_event_sequence=>840
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_DOCNUMBER,P17_NATIONALITY,P17_NATIONALITY_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133526988752270509)
,p_name=>'P17_PROCESS_MANUALLY: Click'
,p_event_sequence=>850
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(107621217046742940)
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$("#P17_DISPLAY_DOCNUMBER").val() != "" && $("#P17_NATIONALITY_ID").val() != "" && $("#P17_DISPLAY_EXPIRYDATE").val() != ""'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133527069485270510)
,p_event_id=>wwv_flow_api.id(133526988752270509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(document).trigger("submitItems");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133528677077270526)
,p_name=>'P17_VISUM: Select VISA after refresh'
,p_event_sequence=>860
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133528756498270527)
,p_event_id=>wwv_flow_api.id(133528677077270526)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let isArrival = !parseInt($v("MOVEMENT_ENTRY_EXIT"));',
'let vPermitInfo = $v("P17_IS_PERMIT_INFO");',
'let isChangeVisa = (vPermitInfo === "REG_CHANGEVISA");',
'let isResident = !!$v("P17_RESIDENCE_DOCNO");',
'let isThai = ($v("P17_NATIONALITY") == "THA");',
'let vLastMvmntVisaType = $v("P17_LAST_MVMNT_VISA_TYPE") || "";',
'let passportDetected = (!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val()));',
'',
'if ($("#P17_VISUM option").length > 1 && $("#P17_VISUM").val() == "") {',
'    console.log("setting visa");',
'    ',
'    //Case 1: is Resident',
'    if ((vPermitInfo === "REG_ENDORSEMENT") || isResident) {',
'        console.log("is Resident: 0010");',
'        $("#P17_VISUM").val("0010");',
'    }',
'    //Case 2: is Crew',
'    else if ($v("P17_IS_CREW_MEMBER") === "Y") {',
'        console.log("is Crew: 0023");',
'        $("#P17_VISUM").val("0023");',
'    }',
'    //Case 3: is Change Visa',
'    else if (isChangeVisa && $v("P17_CHNG_VISA_TYPE") != "") {',
'        console.log("is Change Visa: " + $v("P17_CHNG_VISA_TYPE"));',
'        $("#P17_VISUM").val($v("P17_CHNG_VISA_TYPE"));',
'    }',
'    //Case 4: is Departure',
'    else if (!isArrival && !isThai && $v("P17_LAST_DIRECTION") == "0" && !!vLastMvmntVisaType) {',
'        console.log("is Departure: " + vLastMvmntVisaType);',
'        $("#P17_VISUM").val(vLastMvmntVisaType);',
'    }',
'    //Case 5: Default',
'    else {',
'        $("#P17_VISUM").val($("#P17_VISUM option:nth-child(2)").val());',
'    }',
'    ',
'    console.log("isArrival: " + isArrival + " triggering change");',
'    $("#P17_VISUM").trigger("change");',
'    if (isChangeVisa && $v("P17_CHNG_EXPIRED_DATE") != "") {',
'        $s("P17_VISUM_5", $v("P17_CHNG_EXPIRED_DATE"));',
'    }',
'    ',
'    if (!isThai && passportDetected) validateDatePicker.call($("#P17_VISUM_5"));',
'    ',
'    setStatusDiv("div_movement_status");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(133528871323270528)
,p_name=>'Movements: Colorize row after refresh'
,p_event_sequence=>870
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(51444855158222514)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133528931344270529)
,p_event_id=>wwv_flow_api.id(133528871323270528)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("span.my_yellow").closest("tr").addClass("cell-warn").find("td").css("background-color", "inherit");',
'$("#TH_DOCUMENT_NUMBER").val($("#P17_DISPLAY_DOCNUMBER").val());',
''))
,p_stop_execution_on_error=>'Y'
);
end;
/
begin
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143925386628387921)
,p_name=>'P17_DISPLAY_FIRSTNAME: Split Middle Names'
,p_event_sequence=>880
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'splitMiddleName'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143925466529387922)
,p_event_id=>wwv_flow_api.id(143925386628387921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//debugger;',
'let elems = {firstName: "#P17_DISPLAY_FIRSTNAME", middleName: "#P17_DISPLAY_MIDDLENAME"};',
'console.log("NAMES: 1", ''"'' + $(elems.firstName).val() + ''"'', ''"'' + $(elems.middleName).val() + ''"'');',
'let currentFirstName = ($(elems.firstName).val() || "").trim();',
'let currentMiddleName = ($(elems.middleName).val() || "").trim();',
'if (currentFirstName.replace(/^.*? +/, "") == currentMiddleName) {',
'    currentFirstName = currentFirstName.replace(/ .*/, "").trim();',
'}',
'let names = {firstName: (currentFirstName.trim() + " " + currentMiddleName.trim()).trim(), middleName: ""};',
'let order = ["middleName", "firstName"];',
'if (names.firstName.length > 0) { ',
'    let idx = names.firstName.indexOf('' ''); ',
'    if (idx > 0) { ',
'        names.middleName = names.firstName.substr(idx).trim(); ',
'        names.firstName = names.firstName.substr(0, idx).trim(); ',
'    } ',
'}',
'console.log("NAMES: 2", ''"'' + $(elems.firstName).val() + ''"'', ''"'' + $(elems.middleName).val() + ''"'');',
'for (let i in order) { ',
'    let a = order[i];',
'    if ($(elems[a]).val() != names[a]) {',
'        console.log("NAMES:", "setting " + a);',
'        $(elems[a]).val(names[a]);',
'    }',
'} ',
'console.log("NAMES: 3", ''"'' + $(elems.firstName).val() + ''"'', ''"'' + $(elems.middleName).val() + ''"'');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(143926344099387931)
,p_name=>'P17_PASS_DETECTED: Disable Expiry Date'
,p_event_sequence=>890
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PASS_DETECTED'
,p_condition_element=>'P17_PASS_DETECTED'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143926433746387932)
,p_event_id=>wwv_flow_api.id(143926344099387931)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_DISPLAY_EXPIRYDATE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(143926589213387933)
,p_event_id=>wwv_flow_api.id(143926344099387931)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_DISPLAY_EXPIRYDATE'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(155986492033829726)
,p_name=>'P17_CREW_INFORMATION: Show Dialog'
,p_event_sequence=>900
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(128282829167666542)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155986589568829727)
,p_event_id=>wwv_flow_api.id(155986492033829726)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal("dialogCrewInformation");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(155987387790829735)
,p_name=>'Crew Information: Close Dialog'
,p_event_sequence=>910
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(155987221607829734)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(155987425144829736)
,p_event_id=>wwv_flow_api.id(155987387790829735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'closeModal("dialogCrewInformation");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170738480554646613)
,p_name=>'Void Passport: Close Dialog'
,p_event_sequence=>920
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170738339698646612)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170738576624646614)
,p_event_id=>wwv_flow_api.id(170738480554646613)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(165604344346467938)
,p_name=>'Watchlist Passport: Close Dialog'
,p_event_sequence=>930
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(165604182477467936)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165604435918467939)
,p_event_id=>wwv_flow_api.id(165604344346467938)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170549622851907620)
,p_name=>'Check Duplicate Passport'
,p_event_sequence=>940
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkDuplicatePassport'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170549750270907621)
,p_event_id=>wwv_flow_api.id(170549622851907620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_count number;',
'begin',
'    with dups as (',
'      select dup.refid duplicateid, bd.refid brddocid from',
'        (select duplicateid refid, documentno docno, issuingcountry issuectry, expirydate from x_duplicate_passport) dup,',
'        (select brddocid refid, docno, issuectry, to_char(expirydate, ''YYMMDD'') expirydate from borderdocuments) bd',
'      where',
'        bd.refid = pkg_borderdocuments.get_document(:P1400_DOCNO, :P1400_ISSUECTRY, to_date(:P1400_EXPIRYDATE, ''RRMMDD''))',
'        and dup.docno = bd.docno',
'        and dup.issuectry = bd.issuectry',
'        and dup.expirydate = bd.expirydate',
'    )',
'    select count(1) into l_count from dups;',
'    if l_count > 0 then',
'        :P17_NEXT_DIALOG_URL := apex_util.prepare_url(''f?p=&APP_ID.:1400:&APP_SESSION.::::P1400_DOCNO,P1400_ISSUECTRY,P1400_EXPIRYDATE:'' || :P17_DISPLAY_DOCNUMBER || '','' || :P17_NATIONALITY || '','' || TO_CHAR(TO_DATE(:P17_DISPLAY_EXPIRYDATE, ''DD/MM/YY'
||'YY''), ''YYMMDD''));',
'    else',
'        :P17_NEXT_DIALOG_URL := null;',
'    end if;',
'end;'))
,p_attribute_03=>'P17_NEXT_DIALOG_URL'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170549928208907623)
,p_event_id=>wwv_flow_api.id(170549622851907620)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let url = $("#P17_NEXT_DIALOG_URL").val();',
'if (!!url) {',
'    apex.navigation.redirect(url);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170737188806646600)
,p_name=>'Load Resident Information'
,p_event_sequence=>950
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'loadResidentInformation'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170551839677907642)
,p_event_id=>wwv_flow_api.id(170737188806646600)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select',
'        *',
'    into',
'        :P17_RESIDENCE_DOCNO',
'        , :P17_RESIDENCE_ISSUINGCOUNTRY',
'        , :P17_RESIDENCE_EXPIRYDATE',
'        , :P17_RESIDENT_ADDR_L1',
'        , :P17_RESIDENT_ADDR_L2',
'        , :P17_RESIDENT_ADDR_L3',
'        , :P17_ENDORSEMENT_NO',
'        , :P17_ENDORSEMENT_FROM',
'        , :P17_ENDORSEMENT_UNTIL',
'        , :P17_ENDORSEMENT_BY',
'        , :P17_RESIDENTBOOK_NO',
'        , :P17_RI_RESIDENT_NUMBER',
'        , :P17_RI_RESIDENT_TYPE',
'        , :P17_RI_FIRST_NAME',
'        , :P17_RI_MIDDLE_NAME',
'        , :P17_RI_LAST_NAME',
'    from (',
'            select  t.document_no as documentno',
'                    , t.nationality as issuingcountry',
'                    , t.expire_date as expirydate',
'                    , t.resident_addr_l1',
'                    , t.resident_addr_l2',
'                    , t.resident_addr_l3',
'                    , t.endorsement_no',
'                    , t.endorsement_from',
'                    , t.endorsement_until',
'                    , t.endorsement_by',
'                    , t.resident_no as residentbook_no',
'                    , t.resident_no',
'                    , t.resident_type',
'                    , t.first_name_thai',
'                    , t.middle_name_thai',
'                    , t.last_name_thai',
'            from    residence t',
'            where   t.document_no = :P17_DISPLAY_DOCNUMBER',
'                    and (t.nationality = :P17_NATIONALITY or t.nationality in(select i.country from dl_common.countries_icao_doc_codes i where i.icao_code = :P17_NATIONALITY )) ',
'                    and trunc(t.expire_date) = to_date(nvl(:P17_MANUAL_EXPIRYDATE, :P17_DISPLAY_EXPIRYDATE), ''DD/MM/YYYY'')',
'         );',
'         ',
'exception when no_data_found then',
'    :P17_RESIDENCE_DOCNO := null;',
'    :P17_RESIDENCE_ISSUINGCOUNTRY := null;',
'    :P17_RESIDENCE_EXPIRYDATE := null;',
'    :P17_RESIDENT_ADDR_L1 := null;',
'    :P17_RESIDENT_ADDR_L2 := null;',
'    :P17_RESIDENT_ADDR_L3 := null;',
'    :P17_ENDORSEMENT_NO := null;',
'    :P17_ENDORSEMENT_FROM := null;',
'    :P17_ENDORSEMENT_UNTIL := null;',
'    :P17_ENDORSEMENT_BY := null;',
'    :P17_RESIDENTBOOK_NO := null;',
'    :P17_RI_RESIDENT_NUMBER := null;',
'    :P17_RI_RESIDENT_TYPE := null;',
'    :P17_RI_FIRST_NAME := null;',
'    :P17_RI_MIDDLE_NAME := null;',
'    :P17_RI_LAST_NAME := null;',
'    ',
'end;',
''))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_NATIONALITY'
,p_attribute_03=>'P17_RESIDENCE_DOCNO,P17_RESIDENCE_ISSUINGCOUNTRY,P17_RESIDENCE_EXPIRYDATE,P17_RESIDENT_ADDR_L1,P17_RESIDENT_ADDR_L2,P17_RESIDENT_ADDR_L3,P17_ENDORSEMENT_NO,P17_ENDORSEMENT_FROM,P17_ENDORSEMENT_UNTIL,P17_ENDORSEMENT_BY,P17_RESIDENTBOOK_NO,P17_RI_RESID'
||'ENT_NUMBER,P17_RI_RESIDENT_TYPE,P17_RI_FIRST_NAME,P17_RI_LAST_NAME,P17_RI_MIDDLE_NAME'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170736459557646593)
,p_event_id=>wwv_flow_api.id(170737188806646600)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let hasResidenceDocNo = !!$("#P17_RESIDENCE_DOCNO").val();',
'let nationality = $("#P17_NATIONALITY_ID").val();',
'let isDeparture = !$("#MOVEMENT_ENTRY_EXIT").val();',
'',
'$("#P17_SHOW_RESIDENT_INFORMATION").removeClass("button-data-available").addClass(hasResidenceDocNo ? "button-data-available" : "");',
'',
'let isMissingEndorsement = (nationality == "THA") && isDeparture && !hasResidenceDocNo;',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(51444510460222511)
,p_name=>'Load Resident Information 2'
,p_event_sequence=>960
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'loadResidentInformation'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51444641095222512)
,p_event_id=>wwv_flow_api.id(51444510460222511)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'	SELECT ',
'		rcno_pvcd',
'		,rcno_runningno',
'		,rcno_year',
'		,rcno_pvcd || TO_CHAR(rcno_runningno) || rcno_year',
'		,rescerttypecd',
'		,rescerttypecd',
'		,tfirstnm',
'		,tfamilynm',
'		,tmiddlenm',
'		,controlbook_no',
'		,TO_CHAR(tm13no) || tm13year',
'		,rcissue_by',
'		,edmexp_date',
'		,:P17_DISPLAY_DOCNUMBER',
'	INTO ',
'		:P17_RI_RCNO_PVCD',
'		,:P17_RI_RCNO_RUNNINGNO',
'		,:P17_RI_RCNO_YEAR',
'		,:P17_RI_RESIDENT_NUMBER',
'		,:P17_RI_RESIDENT_TYPE',
'		,:P17_RI_RESIDENT_TYPE_CODE',
'		,:P17_RI_FIRST_NAME',
'		,:P17_RI_LAST_NAME',
'		,:P17_RI_MIDDLE_NAME',
'		,:P17_RESIDENTBOOK_NO',
'		,:P17_ENDORSEMENT_NO',
'		,:P17_RESIDENCE_ISSUINGCOUNTRY',
'		,:P17_ENDORSEMENT_UNTIL',
'		,:P17_RESIDENCE_DOCNO',
'	FROM ',
'	(',
'		SELECT ',
'			person.certofresidence_seqno',
'			,person.rcno_pvcd',
'			,person.rcno_runningno',
'			,person.rcno_year',
'			,person.rescerttype_seqno',
'			,(SELECT rescerttypecd FROM dl_bordercontrol.v_crs_rescerttype WHERE rescerttype_seqno = person.rescerttype_seqno) RESCERTTYPECD',
'			,person.tfirstnm',
'			,person.tfamilynm',
'			,person.tmiddlenm',
'			,cert.controlbook_no',
'			,tm13.tm13_seqno',
'			,tm13.tm13no',
'			,tm13.tm13year',
'			,tm13.rcissue_by',
'			,tm13.edmexp_date',
'		FROM dl_bordercontrol.v_crs_person person',
'		LEFT JOIN dl_bordercontrol.v_crs_certofresidence cert',
'		ON person.certofresidence_seqno = cert.certofresidence_seqno',
'		LEFT JOIN dl_bordercontrol.v_ednq_tm13 tm13',
'		--ON person.certofresidence_seqno = tm13.certofresidence_seqno',
'		ON person.rcno_pvcd = tm13.rcno_pvcd',
'		AND person.rcno_runningno = tm13.rcno_runnungno',
'		AND person.rcno_year = tm13.rcno_year',
'		AND person.rescerttype_seqno = tm13.rescerttype_seqno',
'		AND tm13.tm13sts = ''A''',
'		WHERE ',
'		person.crs_sts = ''A''',
'		AND ',
'		(',
'			person.birth_date = :P17_DISPLAY_DOB_TEXT ',
'			OR ',
'			person.birth_date = SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4) ',
'			OR ',
'			person.birth_date = SUBSTR(:P17_DISPLAY_DOB_TEXT, -7, 7) ',
'			OR ',
'			person.birth_date = SUBSTR(:P17_DISPLAY_DOB_TEXT, -8, 8)',
'			OR ',
'			person.birth_date = ''//'' || SUBSTR(:P17_DISPLAY_DOB_TEXT, -4, 4)',
'		)',
'		AND person.nation_seqno =',
'		(',
'			SELECT pib.count_seqno',
'			FROM dl_common.icao_doc_codes$lc icao, dl_bordercontrol.v_country pib',
'			WHERE icao.key_value = :P17_NATIONALITY',
'			AND icao.is_active = ''Y''',
'			AND icao.notice$dlc = pib.countcd ',
'		)',
'		AND',
'		(',
'			person.cpassportno = :P17_DISPLAY_DOCNUMBER',
'			OR',
'			person.opassportno = :P17_DISPLAY_DOCNUMBER',
'			OR',
'			(',
'				UPPER(TRIM(REGEXP_REPLACE(person.efamilynm, ''\s{2,}'', '' ''))) = :P17_DISPLAY_LASTNAME',
'				AND UPPER(TRIM(REGEXP_REPLACE(person.efirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(person.emiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(person.emiddlenm, ''\s{2,}'', '' ''))), NULL) = :P17_DISPLAY_FIRSTNAME || NVL2(:P17_DISPLAY_MIDDLENAME, '' '' || :P17_DISPL'
||'AY_MIDDLENAME, NULL)',
'			)',
'		)',
'		ORDER BY person.certofresidence_seqno DESC, tm13.tm13_seqno DESC',
'	) t_endq',
'	WHERE ROWNUM = 1;',
'EXCEPTION',
'	WHEN NO_DATA_FOUND THEN',
'		:P17_RI_RCNO_PVCD := NULL;',
'		:P17_RI_RCNO_RUNNINGNO := NULL;',
'		:P17_RI_RCNO_YEAR := NULL;',
'		:P17_RI_RESIDENT_NUMBER := NULL;',
'		:P17_RI_RESIDENT_TYPE := NULL;',
'		:P17_RI_RESIDENT_TYPE_CODE := NULL;',
'		:P17_RI_FIRST_NAME := NULL;',
'		:P17_RI_LAST_NAME := NULL;',
'		:P17_RI_MIDDLE_NAME := NULL;',
'		:P17_RESIDENTBOOK_NO := NULL;',
'		:P17_ENDORSEMENT_NO := NULL;',
'		:P17_RESIDENCE_ISSUINGCOUNTRY := NULL;',
'		:P17_ENDORSEMENT_UNTIL := NULL;',
'		:P17_RESIDENCE_DOCNO := NULL;',
'END;'))
,p_attribute_02=>'P17_DISPLAY_DOB_TEXT,P17_NATIONALITY,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_DISPLAY_DOCNUMBER,MOVEMENT_ENTRY_EXIT'
,p_attribute_03=>'P17_RI_RESIDENT_NUMBER,P17_RI_RESIDENT_TYPE,P17_RI_FIRST_NAME,P17_RI_LAST_NAME,P17_RI_MIDDLE_NAME,P17_RESIDENTBOOK_NO,P17_ENDORSEMENT_NO,P17_RESIDENCE_ISSUINGCOUNTRY,P17_ENDORSEMENT_UNTIL,P17_RESIDENCE_DOCNO,P17_RI_RESIDENT_TYPE_CODE,P17_RI_RCNO_PVCD'
||',P17_RI_RCNO_RUNNINGNO,P17_RI_RCNO_YEAR'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(51444785382222513)
,p_event_id=>wwv_flow_api.id(51444510460222511)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let hasResidenceDocNo = !!$("#P17_RESIDENCE_DOCNO").val();',
'let nationality = $("#P17_NATIONALITY_ID").val();',
'let isDeparture = !$("#MOVEMENT_ENTRY_EXIT").val();',
'',
'$("#P17_SHOW_RESIDENT_INFORMATION").removeClass("button-data-available").addClass(hasResidenceDocNo ? "button-data-available" : "");',
'',
'let isMissingEndorsement = (nationality == "THA") && isDeparture && !hasResidenceDocNo;',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423524326027821438)
,p_name=>'Find Resident Information'
,p_event_sequence=>970
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'findResidentInformation'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423524415204821439)
,p_event_id=>wwv_flow_api.id(21423524326027821438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P17_RI_RESIDENT_NUMBER := NULL; ',
'    :P17_RESIDENTBOOK_NO := NULL; ',
'    :P17_ENDORSEMENT_NO := NULL; ',
'    :P17_RESIDENCE_ISSUINGCOUNTRY := NULL; ',
'    :P17_ENDORSEMENT_UNTIL := NULL; ',
'    :P17_RESIDENCE_DOCNO := NULL;',
'END;'))
,p_attribute_02=>'P17_RI_RESIDENT_NUMBER,P17_RESIDENTBOOK_NO,P17_ENDORSEMENT_NO,P17_RESIDENCE_ISSUINGCOUNTRY,P17_ENDORSEMENT_UNTIL,P17_RESIDENCE_DOCNO'
,p_attribute_03=>'P17_RI_RESIDENT_NUMBER,P17_RESIDENTBOOK_NO,P17_ENDORSEMENT_NO,P17_RESIDENCE_ISSUINGCOUNTRY,P17_ENDORSEMENT_UNTIL,P17_RESIDENCE_DOCNO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423524602969821441)
,p_event_id=>wwv_flow_api.id(21423524326027821438)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	l_resident_no	VARCHAR2(1000) := TRIM(:P17_RI_RCNO_PVCD || :P17_RI_RCNO_RUNNINGNO || :P17_RI_RCNO_YEAR);',
'	l_rescerttypecd VARCHAR2(32) := :P17_RI_RESIDENT_TYPE;',
'	l_th_last_name  VARCHAR2(100) := UPPER(TRIM(:P17_RI_LAST_NAME));',
'	l_th_first_name VARCHAR2(100) := UPPER(TRIM(:P17_RI_FIRST_NAME));',
'	l_th_middle_name VARCHAR2(100) := UPPER(TRIM(:P17_RI_MIDDLE_NAME));',
'	l_th_first_middle_name VARCHAR2(200) := l_th_first_name || l_th_middle_name;',
'BEGIN',
'IF l_resident_no IS NOT NULL OR l_th_last_name IS NOT NULL OR l_th_first_middle_name IS NOT NULL THEN',
'	BEGIN',
'		SELECT ',
'			rcno_pvcd',
'			,rcno_runningno',
'			,rcno_year',
'			,rescerttypecd',
'			,rescerttypecd',
'			,tfirstnm',
'			,tfamilynm',
'			,tmiddlenm',
'			,rcno_pvcd || TO_CHAR(rcno_runningno) || rcno_year',
'			,controlbook_no',
'			,TO_CHAR(tm13no) || tm13year',
'			,rcissue_by',
'			,edmexp_date',
'			,:P17_DISPLAY_DOCNUMBER',
'		INTO ',
'			:P17_RI_RCNO_PVCD',
'			,:P17_RI_RCNO_RUNNINGNO',
'			,:P17_RI_RCNO_YEAR',
'			,:P17_RI_RESIDENT_TYPE',
'			,:P17_RI_RESIDENT_TYPE_CODE',
'			,:P17_RI_FIRST_NAME',
'			,:P17_RI_LAST_NAME',
'			,:P17_RI_MIDDLE_NAME',
'			,:P17_RI_RESIDENT_NUMBER',
'			,:P17_RESIDENTBOOK_NO',
'			,:P17_ENDORSEMENT_NO',
'			,:P17_RESIDENCE_ISSUINGCOUNTRY',
'			,:P17_ENDORSEMENT_UNTIL',
'			,:P17_RESIDENCE_DOCNO',
'		FROM ',
'		(',
'			SELECT ',
'				COUNT(DISTINCT cert.certofresidence_seqno) OVER() AS DISTINCT_RESIDENTS_COUNT',
'				,ROW_NUMBER() OVER (PARTITION BY cert.certofresidence_seqno ORDER BY cert.certofresidence_seqno DESC, tm13.tm13_seqno DESC) RN',
'				,cert.certofresidence_seqno',
'				,cert.rcno_pvcd',
'				,cert.rcno_runningno',
'				,cert.rcno_year',
'				,cert.rescerttype_seqno',
'				,certtype.rescerttypecd',
'				,cert.tfirstnm',
'				,cert.tfamilynm',
'				,cert.tmiddlenm',
'				,cert.controlbook_no',
'				,tm13.tm13_seqno',
'				,tm13.tm13no',
'				,tm13.tm13year',
'				,tm13.rcissue_by',
'				,tm13.edmexp_date',
'			FROM dl_bordercontrol.v_crs_certofresidence cert',
'			INNER JOIN dl_bordercontrol.v_crs_rescerttype certtype',
'			ON certtype.rescerttype_seqno = cert.rescerttype_seqno',
'			LEFT JOIN dl_bordercontrol.v_ednq_tm13 tm13',
'			ON cert.rcno_pvcd = tm13.rcno_pvcd',
'			AND cert.rcno_runningno = tm13.rcno_runnungno',
'			AND cert.rcno_year = tm13.rcno_year',
'			AND cert.rescerttype_seqno = tm13.rescerttype_seqno',
'			AND tm13.tm13sts = ''A''',
'			WHERE cert.crs_sts = ''A''',
'			AND (l_resident_no IS NULL OR cert.rcno_pvcd || cert.rcno_runningno || cert.rcno_year = l_resident_no)',
'			AND (l_rescerttypecd IS NULL OR certtype.rescerttypecd = l_rescerttypecd)',
'			AND (l_th_last_name IS NULL OR UPPER(TRIM(REGEXP_REPLACE(cert.tfamilynm, ''\s{2,}'', '' ''))) = l_th_last_name)',
'			AND ( l_th_first_middle_name IS NULL OR UPPER(TRIM(REGEXP_REPLACE(cert.tfirstnm, ''\s{2,}'', '' ''))) || NVL2(TRIM(cert.tmiddlenm), '' '' || UPPER(TRIM(REGEXP_REPLACE(cert.tmiddlenm, ''\s{2,}'', '' ''))), NULL) = l_th_first_name || NVL2(l_th_middle_name, '' '
||''' || l_th_middle_name, NULL) )',
'			ORDER BY cert.certofresidence_seqno DESC, tm13.tm13_seqno DESC',
'		) t_endq',
'		WHERE ',
'		( DISTINCT_RESIDENTS_COUNT = 1 AND RN = 1)',
'		OR DISTINCT_RESIDENTS_COUNT != 1;',
'',
'		-- reset',
'        :P17_FIND_RESIDENT_REPORT_LOAD := ''N'';',
'',
'	EXCEPTION',
'		WHEN TOO_MANY_ROWS THEN',
'			:P17_FIND_RESIDENT_REPORT_LOAD := ''Y'';',
'		WHEN NO_DATA_FOUND THEN',
'			:P17_FIND_RESIDENT_REPORT_LOAD := ''N'';',
'		WHEN OTHERS THEN',
'			:P17_FIND_RESIDENT_REPORT_LOAD := ''N'';',
'	END;',
'END IF;',
'END;'))
,p_attribute_02=>'P17_RI_RCNO_PVCD,P17_RI_RCNO_RUNNINGNO,P17_RI_RCNO_YEAR,P17_RI_RESIDENT_TYPE,P17_RI_LAST_NAME,P17_RI_FIRST_NAME,P17_RI_MIDDLE_NAME'
,p_attribute_03=>'P17_RI_RCNO_PVCD,P17_RI_RCNO_RUNNINGNO,P17_RI_RCNO_YEAR,P17_RI_RESIDENT_TYPE,P17_RI_RESIDENT_TYPE_CODE,P17_RI_FIRST_NAME,P17_RI_LAST_NAME,P17_RI_MIDDLE_NAME,P17_RI_RESIDENT_NUMBER,P17_RESIDENTBOOK_NO,P17_ENDORSEMENT_NO,P17_RESIDENCE_ISSUINGCOUNTRY,P1'
||'7_ENDORSEMENT_UNTIL,P17_RESIDENCE_DOCNO,P17_FIND_RESIDENT_REPORT_LOAD'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423524523101821440)
,p_event_id=>wwv_flow_api.id(21423524326027821438)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("P17_FIND_RESIDENT_REPORT_LOAD") == "Y") {',
'    apex.event.trigger("#id-ir-find-resident-report", "apexrefresh");',
'    openModal("dialogFindResidentReport");',
'    $(''[aria-describedby="dialogFindResidentReport"]'').css("width", "70%");',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423524740334821442)
,p_event_id=>wwv_flow_api.id(21423524326027821438)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'	IF :P17_RESIDENCE_DOCNO IS NOT NULL THEN',
'		:P17_ENDQ_RESIDENCE_NO := :P17_RI_RESIDENT_NUMBER;',
'		:P17_ENDQ_RESIDENCE_TYPE := :P17_RI_RESIDENT_TYPE;',
'		:P17_ENDQ_THAI_FIRSTNAME := :P17_RI_FIRST_NAME;',
'		:P17_ENDQ_THAI_FAMILYNAME := :P17_RI_LAST_NAME;',
'		:P17_ENDQ_THAI_MIDDLENAME := :P17_RI_MIDDLE_NAME;',
'		:P17_ENDQ_RESIDENCE_BOOK_NO := :P17_RESIDENTBOOK_NO;',
'		:P17_ENDQ_ENDORSEMENT_NO := :P17_ENDORSEMENT_NO;',
'		:P17_ENDQ_ISSUE_PLACE := :P17_RESIDENCE_ISSUINGCOUNTRY;',
'		:P17_ENDQ_EXPIRED_DATE := :P17_ENDORSEMENT_UNTIL;',
'',
'		:P17_IS_PERMIT_INFO := ''REG_ENDORSEMENT'';',
'		:P17_PERMIT_TYPE := ''3'';',
'		:P17_PERMIT_EXPIRY := :P17_ENDORSEMENT_UNTIL;',
'',
'		-- for departure and resident/endorsement, only show valid permit with expiry date more than sysdate',
'		IF NVL(:P17_ENDORSEMENT_UNTIL, SYSDATE - 1) < SYSDATE AND :MOVEMENT_ENTRY_EXIT = 1 THEN',
'			:P17_IS_PERMIT_INFO := NULL;',
'			:P17_PERMIT_TYPE := NULL;',
'			:P17_PERMIT_EXPIRY := NULL;',
'		END IF;',
'',
'	END IF;',
'END;'))
,p_attribute_02=>'P17_RESIDENCE_DOCNO,P17_RI_RESIDENT_NUMBER,P17_RI_RESIDENT_TYPE,P17_RI_FIRST_NAME,P17_RI_LAST_NAME,P17_RI_MIDDLE_NAME,P17_RESIDENTBOOK_NO,P17_ENDORSEMENT_NO,P17_RESIDENCE_ISSUINGCOUNTRY,P17_ENDORSEMENT_UNTIL,MOVEMENT_ENTRY_EXIT'
,p_attribute_03=>'P17_ENDQ_RESIDENCE_NO,P17_ENDQ_RESIDENCE_TYPE,P17_ENDQ_THAI_FIRSTNAME,P17_ENDQ_THAI_FAMILYNAME,P17_ENDQ_THAI_MIDDLENAME,P17_ENDQ_RESIDENCE_BOOK_NO,P17_ENDQ_ENDORSEMENT_NO,P17_ENDQ_ISSUE_PLACE,P17_ENDQ_EXPIRED_DATE,P17_IS_PERMIT_INFO,P17_PERMIT_TYPE,P'
||'17_PERMIT_EXPIRY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423524873846821443)
,p_event_id=>wwv_flow_api.id(21423524326027821438)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let hasResidenceDocNo = !!$("#P17_RESIDENCE_DOCNO").val();',
'',
'$("#P17_SHOW_RESIDENT_INFORMATION").removeClass("button-data-available").addClass(hasResidenceDocNo ? "button-data-available" : "");',
'',
'if (hasResidenceDocNo) {',
'    $("#P17_VISUM").trigger(''apexrefresh'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170551549724907639)
,p_name=>'DA_CloseResidenceInformation'
,p_event_sequence=>980
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(170551301741907636)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170551640673907640)
,p_event_id=>wwv_flow_api.id(170551549724907639)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'closeModal(''DLG_RESIDENCE_INFORMATION'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170740608749646634)
,p_name=>'P17_AMPUR - Refresh: Set Ampur'
,p_event_sequence=>990
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_AMPUR'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170740685049646635)
,p_event_id=>wwv_flow_api.id(170740608749646634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ampur = apex.item("P17_TMP_AMPUR").getValue();',
'if (!!ampur) {',
'    apex.item("P17_AMPUR").setValue(ampur);',
'    apex.item("P17_TMP_AMPUR").setValue("");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(170740769442646636)
,p_name=>'P17_TAMBON - Refresh: Set Tambon'
,p_event_sequence=>1000
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_TAMBON'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(170740905394646637)
,p_event_id=>wwv_flow_api.id(170740769442646636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ampur = apex.item("P17_AMPUR").getValue();',
'let tambon = apex.item("P17_TMP_TAMBON").getValue();',
'if (!!ampur && !!tambon) {',
'    apex.item("P17_TAMBON").setValue(tambon);',
'    apex.item("P17_TMP_TAMBON").setValue("");',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172923619821506595)
,p_name=>'Visa Run: Close Dialog'
,p_event_sequence=>1010
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(172923452696506594)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172923714168506596)
,p_event_id=>wwv_flow_api.id(172923619821506595)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172924090907506600)
,p_name=>'P17_PROVINCE Change: Set Province ID'
,p_event_sequence=>1020
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PROVINCE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172924154146506601)
,p_event_id=>wwv_flow_api.id(172924090907506600)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentCode = $v(''P17_PROVINCE_ID'');',
'let newValue = $v(''P17_PROVINCE'');',
'let newCode = GET_PROVINCE_IDS[newValue] || currentCode;',
'',
'if (newCode != currentCode) {',
'    $(''#P17_PROVINCE_ID'').val(newCode).trigger("change");',
'}',
'',
'if (!newValue) {',
'    $("#P17_PROVINCE_ID,#P17_PROVINCE").val("");',
'}',
'',
'apexCustomEvent(''setLastProvinceID'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(172924224602506602)
,p_name=>'P17_PROVINCE_ID Change: Set Province'
,p_event_sequence=>1030
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_PROVINCE_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(172924338809506603)
,p_event_id=>wwv_flow_api.id(172924224602506602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentValue = $v(''P17_PROVINCE'');',
'let currentCode = GET_PROVINCE_IDS[currentValue];',
'let newCode = $v(''P17_PROVINCE_ID'');',
'let newValue = GET_PROVINCE_KEY_VALUES[newCode] || null;',
'',
'if (newValue != currentValue) {',
'    if (!newValue) {',
'        $("#P17_PROVINCE_ID,#P17_PROVINCE").val("");',
'        $("#P17_PROVINCE").trigger("change");',
'    } else {',
'        $(''#P17_PROVINCE'').val(newValue).trigger("change");',
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(165602064930467915)
,p_name=>'MOVEMENT_ENTRY_EXIT Change: Show / Hide Visa fields'
,p_event_sequence=>1040
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'MOVEMENT_ENTRY_EXIT'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'(!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val()))'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165602179366467916)
,p_event_id=>wwv_flow_api.id(165602064930467915)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_VISUM_4'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165602264680467917)
,p_event_id=>wwv_flow_api.id(165602064930467915)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_VISUM_4'
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165603047440467925)
,p_event_id=>wwv_flow_api.id(165602064930467915)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_VISUM_1,P17_VISUM,P17_VISUM_4,P17_VISA_TYPE_ID,P17_VISUM_5,P17_PERMIT_TYPE,P17_PERMIT_TYPE_ID,P17_PERMIT_EXPIRY'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165603209380467926)
,p_event_id=>wwv_flow_api.id(165602064930467915)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P17_VISUM_1,P17_VISUM,P17_VISUM_4,P17_VISA_TYPE_ID,P17_VISUM_5,P17_PERMIT_TYPE,P17_PERMIT_TYPE_ID,P17_PERMIT_EXPIRY'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(165604523751467940)
,p_name=>'Close Dialog Invalid MRZ'
,p_event_sequence=>1050
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(107618044672742909)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(165604690760467941)
,p_event_id=>wwv_flow_api.id(165604523751467940)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(this.triggeringElement).closest(".js-modal").dialog("close");',
'if ($v(''P17_MRZ_CORRECTION'').length > 0){',
'    acceptMRZCorrection($v(''P17_MRZ_CORRECTION''));',
'}  ',
''))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4687641547153952201)
,p_event_id=>wwv_flow_api.id(165604523751467940)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'PKG_BMBS_APEX_UTIL.p17_update_calc_mrz;'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(74667930770535669)
,p_name=>'ON CHANGE: EVENT-BASED'
,p_event_sequence=>1060
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input, select'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(74667963665535670)
,p_event_id=>wwv_flow_api.id(74667930770535669)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var item = this.triggeringElement.getAttribute("id");',
'let isArrival = !parseInt($v("MOVEMENT_ENTRY_EXIT"));',
'let hasVisaInformation = (!!$("#P17_VISUM_1").val() && !!$("#P17_VISUM").val()); // Visa Number and Visa Type',
'',
'p17.nationality.set("P17_NATIONALITY_ID", "P17_NATIONALITY");',
'p17.permitType.set("P17_PERMIT_TYPE_ID", "P17_PERMIT_TYPE");',
'p17.vehicleType.set("TRNSPRTUNITID_SEA", "P17_VEHICLE_TYPE_D");',
'p17.visaType.set("P17_VISA_TYPE_ID", "P17_VISUM");',
'p17.docClass.set("P17_DOC_CLASS_ID", "P17_DISPLAY_DOCCLASS");',
'',
'if(item === "TRNSPRTUNITID") {',
'    apexCustomEvent(''setLastFlightNum'');',
'    apexCustomEvent(''checkVehicleDetailTM2'');',
'    $(document).trigger("checkForCrewStatus");',
'    $(document).trigger("checkForFlightHealthCheck");',
'    apexCustomEvent("validateFlightNum");',
'}',
'else if(item === "P17_DISPLAY_LASTNAME") {',
'  //$(document).trigger("checkForCrewStatus");',
'}',
'else if(item === "P17_DISPLAY_MIDDLENAME") {',
'  //$(document).trigger("checkForCrewStatus");',
'}',
'else if(item === "P17_DISPLAY_FIRSTNAME") {',
'  //$(document).trigger("checkForCrewStatus");',
'    apexCustomEvent(''splitMiddleName'');',
'}',
'else if(item === "P17_DISPLAY_DOCNUMBER") {',
'  /*apexCustomEvent(''checkForCrewStatus'');apexCustomEvent(''loadResidentInformation'');apexCustomEvent(''validateDemographicInput'');*/',
'}',
'else if(item === "P17_VISUM_5") {',
'    console.log("visa changed to ", $("#P17_VISUM_5").val());',
'}',
'else if(item === "P17_MANUAL_EXPIRYDATE") {',
'  //apex.event.trigger(document, "validateDemographicInput");',
'    checkPassportExpiry();',
'}',
'else if(item === "P17_DISPLAY_EXPIRYDATE") {',
'  //apex.event.trigger(document, "validateDemographicInput");',
'    checkPassportExpiry();',
'}',
'else if(item === "P17_NATIONALITY") {',
'    apex.debug.log("Change Event for P17_NATIONALITY");',
'    p17.nationality.setIdItem();',
'    //apex.event.trigger("#P17_NATIONALITY", "checkNationality");//apex.event.trigger(document, "validateDemographicInput");',
'    if ($("#P17_NATIONALITY").val() == "THA") {',
'        $("#P17_TRAVELCARD_NO").val('''').trigger("change");',
'        $("#REG_LAYOUT_1_3,#REG_LAYOUT_1_2,#P17_TRAVELCARD_NO,#P17_TRAVELCARD_NO_LABEL,#P17_SHOW_TRAVEL_CARD").hide();',
'    } else {',
'        $("#REG_LAYOUT_1_3,#REG_LAYOUT_1_2,#P17_TRAVELCARD_NO,#P17_TRAVELCARD_NO_LABEL,#P17_SHOW_TRAVEL_CARD").show();',
'    }',
'}',
'else if(item === "P17_NATIONALITY_ID") {',
'    apex.debug.log("Change Event for P17_NATIONALITY_ID");',
'    p17.nationality.setSelectItem();    ',
'}',
'else if(item === "P17_PERMIT_TYPE") {',
'    p17.permitType.setIdItem();',
'    apex.event.trigger("P17_PERMIT_TYPE", "getPermitTypeInformation");',
'}',
'else if(item === "P17_PERMIT_TYPE_ID") {',
'    p17.permitType.setSelectItem();',
'}',
'else if(item === "P17_VEHICLE_TYPE_D") {',
'    p17.vehicleType.setIdItem();',
'    apexCustomEvent(''setLastVehicleType'');',
'}',
'else if(item === "TRNSPRTUNITID_SEA") {',
'    p17.vehicleType.setSelectItem();',
'}',
'else if(item === "P17_VISA_TYPE_ID") {',
'    p17.visaType.setSelectItem(); ',
'    (p17.visaType.getCheckIfRun() ? apex.event.trigger("#P17_VISUM", "change") : null);',
'}',
'else if(item === "P17_VISUM") {',
'    p17.visaType.setIdItem();',
'    //$("#P17_PERMIT_TYPE,#P17_PERMIT_TYPE_ID,#P17_PERMIT_EXPIRY").prop("disabled", !hasVisaInformation).removeClass("apex-disabled").addClass((hasVisaInformation) ? "" : "apex-disabled");',
'}',
'else if(item === "P17_VISUM_1") {',
'    null;',
'}',
'else if(item === "P17_DISPLAY_DOCCLASS") {',
'    p17.docClass.setIdItem();',
'    $("#P17_DISPLAY_DOCTYPE").val(GET_BC_DOC_TYPES[$("#P17_DISPLAY_DOCCLASS").val()]).trigger("change");',
'}',
'else if(item === "P17_DOC_CLASS_ID") {',
'    p17.docClass.setSelectItem();',
'    (p17.docClass.getCheckIfRun() ? apex.event.trigger("#P17_DISPLAY_DOCCLASS", "change") : null);',
'}',
'else if(item === "P17_DOCNUMBER_THAI") {',
'    p17.tools.setClass(!apex.item(item).isEmpty(), "#P17_SHOW_THAI_NAME","button-data-available");',
'}'))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54505049239889715)
,p_name=>'Initialize Keyboard Shortcuts'
,p_event_sequence=>1070
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54505128964889716)
,p_event_id=>wwv_flow_api.id(54505049239889715)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let noFunction = function(ev) {',
'    //console.log(ev);',
'    ev.preventDefault();',
'    return false;',
'};',
'',
'let buildNavigationFunction = function(pageId, appId, urlExt, isPopUp, name) {',
'    return function() {',
'        appId = appId || ''&APP_ID.'';',
'        urlExt = urlExt || '''';',
'        name = name || '''';',
'        let url = ''./f?p='' + appId +'':'' + pageId + '':&APP_SESSION.'' + urlExt;',
'        if (!isPopUp) {',
'            window.location = url;',
'        } else {',
'            window.open(url, name);',
'        }',
'    };',
'}',
'',
'let navigatePageTools = function() {',
'    return buildNavigationFunction(5900);',
'};',
'',
'let navigatePageDashboard = function() {',
'    return buildNavigationFunction(1, 1100);',
'}',
'',
'let navigatePageTravelHistory = function() {',
'    return buildNavigationFunction(8001, ''&APP_ID.'', ''::NO:RP,8001:P8001_INIT_LOAD:Y'', true, ''wBmBS_TH'');',
'}',
'',
'let snapFaceImage = resetFaceCapture;',
'',
'let keyboardFunctions = {',
'    "F1": navigatePageDashboard(),',
'    "F2": navigatePageTravelHistory(),',
'    "F3": snapFaceImage,',
'    "F4": noFunction,',
'    //"F5": Reload Page',
'    //"F5": resetWorkstation,',
'    "F6": noFunction,',
'    //"F7": Restart Passport Check ',
'    "F8": noFunction,',
'    "F9": navigatePageTools(),',
'    "F10": noFunction,',
'    //"F11": Toggle FullScreen',
'    "F12": noFunction,',
'}',
'',
'Object.keys(keyboardFunctions).slice().forEach((key) => {',
'    shortcut.add(key, keyboardFunctions[key], {',
'        ''type'': ''keydown'',',
'        ''propagate'': false,',
'        ''target'': document',
'    });',
'});',
'',
'',
'',
'// THA20675-2366',
'// M. Langer, 15.01.2019',
'// Add Shortcuts to control the camera',
'shortcut.add("left", function() {',
'   sendCmdLeft();',
'},{',
'            ''type'':''keydown'',',
'            ''propagate'':false,',
'            ''disable_in_input'':true,',
'            ''target'':document,',
'            ''keycode'':false',
'});',
'shortcut.add("right", function() {',
'   sendCmdRight();',
'},{',
'            ''type'':''keydown'',',
'            ''propagate'':false,',
'            ''disable_in_input'':true,',
'            ''target'':document,',
'            ''keycode'':false',
'});',
'shortcut.add("up", function() {',
'   sendCmdUp();',
'},{',
'            ''type'':''keydown'',',
'            ''propagate'':false,',
'            ''disable_in_input'':true,',
'            ''target'':document,',
'            ''keycode'':false',
'});',
'shortcut.add("down", function() {',
'   sendCmdDown();',
'},{',
'            ''type'':''keydown'',',
'            ''propagate'':false,',
'            ''disable_in_input'':true,',
'            ''target'':document,',
'            ''keycode'':false',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54505476656889719)
,p_name=>'Find Document Information'
,p_event_sequence=>1080
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'findDocumentInformation'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(201150221094677906)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*setStatusDiv("div_movement_status");',
'//apex.item("P17_AGE_DISPLAY").setValue($x("P17_AGE_MANUEL").value);',
'if ($("#P17_NATIONALITY").val() == "THA") {',
'    $("#REG_LAYOUT_1_3,#REG_LAYOUT_1_2").hide();',
'} else {',
'    $("#REG_LAYOUT_1_3,#REG_LAYOUT_1_2").show();',
'}',
'*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119107450539171038)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'    IF ',
'        :P17_TRAVELCARD_NO IS NOT NULL ',
'        OR',
'        (',
'            :P17_NATIONALITY IS NOT NULL ',
'            AND :P17_DISPLAY_DOCNUMBER IS NOT NULL',
'        )',
'    THEN',
'        BEGIN',
'        ',
'            SELECT /*+ leading(t) */',
'                b.issuectry',
'                , b.docno',
'                , b.expirydate',
'            INTO ',
'                :P17_NATIONALITY',
'                , :P17_DISPLAY_DOCNUMBER',
'                , :P17_DISPLAY_EXPIRYDATE',
'            FROM ',
'                dl_bordercontrol.borderdocuments b',
'                ,   (',
'                        SELECT ',
'                            d.brddocid',
'                            , m.mvmntid',
'                            , e.key_value',
'                            , e.form_no',
'                            , ROW_NUMBER() OVER (PARTITION BY e.form_no ORDER BY e.ins_at DESC) RN',
'                        FROM dl_bordercontrol.entry_forms e, dl_bordercontrol.movements m, dl_bordercontrol.borderdocuments d',
'                        WHERE e.form_no = :P17_TRAVELCARD_NO',
'                        AND m.entry_form = e.key_value ',
'                        AND m.is_finished = ''Y''',
'                        AND d.brddocid = m.brddocid',
'                        -- dummy',
'                        UNION ALL',
'                        SELECT NULL brddocid, NULL mvmntid, NULL key_value, NULL form_no, 1 RN FROM DUAL',
'                    ) t',
'            WHERE ',
'                t.RN = 1',
'                --',
'                AND CASE ',
'                    WHEN :P17_TRAVELCARD_NO IS NULL THEN 1 ',
'                    WHEN :P17_TRAVELCARD_NO IS NOT NULL AND b.brddocid = t.brddocid THEN 1 ',
'                END = 1',
'                --',
'                AND b.issuectry = NVL(:P17_NATIONALITY, b.issuectry)',
'                AND b.docno = NVL(:P17_DISPLAY_DOCNUMBER, b.docno)',
'                --AND b.expirydate = NVL(TO_DATE(:P17_DISPLAY_EXPIRYDATE, ''DD/MM/YYYY''), b.expirydate)',
'                AND CASE ',
'                    WHEN :P17_DISPLAY_EXPIRYDATE IS NULL THEN 1 ',
'                    WHEN :P17_DISPLAY_EXPIRYDATE IS NOT NULL AND b.expirydate = TO_DATE(:P17_DISPLAY_EXPIRYDATE, ''DD/MM/YYYY'') THEN 1 ',
'                END = 1',
'                --',
'                ;',
'                ',
'            -- reset',
'            :P17_FIND_MANUALLY_REPORT_LOAD := ''N'';',
'            ',
'        EXCEPTION',
'            WHEN TOO_MANY_ROWS THEN',
'                :P17_FIND_MANUALLY_REPORT_LOAD := ''Y'';',
'            WHEN NO_DATA_FOUND THEN',
'                :P17_FIND_MANUALLY_REPORT_LOAD := ''N'';',
'            WHEN OTHERS THEN',
'                :P17_FIND_MANUALLY_REPORT_LOAD := ''N'';',
'        END;',
'    END IF;',
'    ',
'END;'))
,p_attribute_02=>'P17_TRAVELCARD_NO,P17_NATIONALITY,P17_DISPLAY_DOCNUMBER,P17_DISPLAY_EXPIRYDATE'
,p_attribute_03=>'P17_NATIONALITY,P17_DISPLAY_DOCNUMBER,P17_DISPLAY_EXPIRYDATE,P17_FIND_MANUALLY_REPORT_LOAD'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'get DOC info if only TM6 is provided'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119107564544171039)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*if (!!$v("P17_TRAVELCARD_NO")) {',
'    $("#P17_NATIONALITY,#P17_DISPLAY_DOCNUMBER,#P17_DISPLAY_EXPIRYDATE").trigger("change");',
'}*/',
'$("#P17_NATIONALITY,#P17_DISPLAY_DOCNUMBER,#P17_DISPLAY_EXPIRYDATE").trigger("change");',
'',
'if ($v("P17_FIND_MANUALLY_REPORT_LOAD") == "Y") {',
'    apex.event.trigger("#id-ir-find-manually-report", "apexrefresh");',
'    openModal("dialogFindManuallyReport");',
'    //$(''[aria-describedby="dialogFindManuallyReport"]'').css("width", "");',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(133526454840270504)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//apexCustomEvent(''getThaiPassportInfo'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(201150042418677905)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//setStatusDiv("div_movement_status");',
'/*apex.item("P17_AGE_DISPLAY").setValue($x("P17_AGE_MANUEL").value);*/'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108032873322098001)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.event.trigger("#P17_DISPLAY_DOCNUMBER", "checkDisplayDocNumber");',
'',
'    apexCustomEvent(''checkForCrewStatus'');',
'    apexCustomEvent(''loadResidentInformation'');',
'    apexCustomEvent(''validateDemographicInput'');',
'    apexCustomEvent(''getThaiPassportInfo'');'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119103912076171003)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("CHECK_EDIT_LAST_MOVEMENT", ',
'{',
'    x01: 500',
'    , x02: 4020',
'    , x03: $v("P17_BRDDOC_IDENTITY")',
'    , x04: $v("P17_DISPLAY_DOCNUMBER")',
'    , x05: $v("P17_NATIONALITY")',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        console.log(''CHECK_EDIT_LAST_MOVEMENT Result: '', pData.is_mvmnt_editable + '' '' + pData.url);',
'        let v_url = pData.url.replace("modal:true", "modal:true,closeOnEscape:false");',
'        $("#CUSTOM_BTN_EDIT_LAST_MOVEMENT").attr("onclick", v_url);',
'        if (pData.is_mvmnt_editable == "Y") {',
'            $("#CUSTOM_BTN_EDIT_LAST_MOVEMENT").show();',
'        } else {',
'            $("#CUSTOM_BTN_EDIT_LAST_MOVEMENT").hide();',
'        }',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95455026451695401)
,p_event_id=>wwv_flow_api.id(54505476656889719)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(5173631053707838616)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54505671445889721)
,p_name=>'P17_FIND_MANUALLY'
,p_event_sequence=>1090
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(54505302250889718)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54505757511889722)
,p_event_id=>wwv_flow_api.id(54505671445889721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apexCustomEvent(''findDocumentInformation'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683851621920328609)
,p_name=>'Date of Birth Key Release'
,p_event_sequence=>1110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_DOB_TEXT'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683851847455328611)
,p_event_id=>wwv_flow_api.id(4683851621920328609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $dt = $("#P17_DISPLAY_DOB_TEXT"), dt = $dt.val().trim(), $isPartial = $("#P17_IS_DOB_PARTIAL"), isPartial, isValid = true;',
'',
'if (dt.length < 6) {',
'    return;',
'}',
'else if (!(dt.indexOf("<") >= 0 || dt.indexOf("X") >= 0 || dt.indexOf("00") >= 0)) {',
'    $isPartial.val("");',
'    validateDatePicker.call($dt);',
'    return;',
'} else {',
'    apex.server.process("GET_PARTIAL_DATE", ',
'    {',
'        x01: dt,',
'        x02: "DD/MM/YYYY",',
'        x03: "1",',
'        x04: "0",',
'        x05: "0",',
'        x06: "0"',
'    }, ',
'    {',
'        success: function(pData) ',
'        {',
'            console.log(''GET_PARTIAL_DATE Result: '', pData);',
'            isValid = (pData.status == "1" && pData.formatted_date.length > 0 ? true : false);',
'            isPartial = pData.is_partial;',
'            console.log(''isValid: '', isValid);',
'            console.log(''isPartial: '', isPartial);',
'            $isPartial.val(isPartial);',
'            if (dt != pData.formatted_date) {',
'                $dt.val(pData.formatted_date).trigger("change");',
'            }',
'        }',
'    });',
'}',
'',
'console.log(''isValid: '', isValid);',
'$dt.removeClass("autovalidatedatepicker_invalid autovalidatedatepicker_valid").addClass(!!isValid ? "autovalidatedatepicker_valid" : "autovalidatedatepicker_invalid");'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683851798913328610)
,p_event_id=>wwv_flow_api.id(4683851621920328609)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ageText = "";',
'let dob = $("#P17_DISPLAY_DOB_TEXT").val();',
'if (!!dob) {',
'    let dobDate = parseCambodianDate(dob);',
'    if (!!dobDate) {',
'        let now = new Date();',
'        let age = (new Date(now.getTime() - dobDate.getTime())).getFullYear() - 1970;',
'        ',
'        ageText = "Age " + age;',
'        if (age < 12) {',
'            let e_f_cnt = getEnabledFingerCount();',
'            //console.log("Enabled Finger Count: " + e_f_cnt);',
'            if (e_f_cnt == 10) toggleAllFingers();',
'        }',
'        ',
'        let dobDD = dobDate.getDate(), ',
'            dobMM = dobDate.getMonth() + 1, ',
'            dobDDMM = [(dobDD > 9 ? '''' : ''0'') + dobDD, (dobMM > 9 ? '''' : ''0'') + dobMM].join('''');',
'        ',
'        let nowDD = now.getDate(), ',
'            nowMM = now.getMonth() + 1, ',
'            nowDDMM = [(nowDD > 9 ? '''' : ''0'') + nowDD, (nowMM > 9 ? '''' : ''0'') + nowMM].join('''');',
'        ',
'        $("#P17_DISPLAY_DOB_TEXT").removeClass("cell-blink").addClass((dobDDMM == nowDDMM) ? "cell-blink" : "");',
'        $("#id-span-birthday-gift").removeClass("cl-hidden").addClass((dobDDMM == nowDDMM) ? "" : "cl-hidden");',
'    }',
'}',
'else {',
'    $("#P17_DISPLAY_DOB_TEXT").removeClass("cell-blink");',
'    $("#id-span-birthday-gift").addClass("cl-hidden");',
'}',
'',
'$("#P17_AGE_DISPLAY").text(ageText);',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54505887965889723)
,p_name=>'Date of Birth Change'
,p_event_sequence=>1120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_DOB_TEXT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683851508574328608)
,p_event_id=>wwv_flow_api.id(54505887965889723)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $dt = $("#P17_DISPLAY_DOB_TEXT"), dt = $dt.val().trim(), $isPartial = $("#P17_IS_DOB_PARTIAL"), isPartial, isValid = true;',
'',
'if (dt.length < 6) {',
'    return;',
'}',
'else if (!(dt.indexOf("<") >= 0 || dt.indexOf("X") >= 0 || dt.indexOf("00") >= 0)) {',
'    $isPartial.val("");',
'    validateDatePicker.call($dt);',
'    return;',
'} else {',
'    apex.server.process("GET_PARTIAL_DATE", ',
'    {',
'        x01: dt,',
'        x02: "DD/MM/YYYY",',
'        x03: "1",',
'        x04: "0",',
'        x05: "0",',
'        x06: "0"',
'    }, ',
'    {',
'        success: function(pData) ',
'        {',
'            console.log(''GET_PARTIAL_DATE Result: '', pData);',
'            isValid = (pData.status == "1" && pData.formatted_date.length > 0 ? true : false);',
'            isPartial = pData.is_partial;',
'            console.log(''isValid: '', isValid);',
'            console.log(''isPartial: '', isPartial);',
'            $isPartial.val(isPartial);',
'            if (dt != pData.formatted_date) {',
'                $dt.val(pData.formatted_date).trigger("change");',
'            }',
'        }',
'    });',
'}',
'',
'console.log(''isValid: '', isValid);',
'$dt.removeClass("autovalidatedatepicker_invalid autovalidatedatepicker_valid").addClass(!!isValid ? "autovalidatedatepicker_valid" : "autovalidatedatepicker_invalid");'))
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54505948318889724)
,p_event_id=>wwv_flow_api.id(54505887965889723)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let ageText = "";',
'let dob = $("#P17_DISPLAY_DOB_TEXT").val();',
'if (!!dob) {',
'    let dobDate = parseCambodianDate(dob);',
'    if (!!dobDate) {',
'        let now = new Date();',
'        let age = (new Date(now.getTime() - dobDate.getTime())).getFullYear() - 1970;',
'        ',
'        ageText = "Age " + age;',
'        if (age < 12) {',
'            let e_f_cnt = getEnabledFingerCount();',
'            //console.log("Enabled Finger Count: " + e_f_cnt);',
'            if (e_f_cnt == 10) toggleAllFingers();',
'        }',
'        ',
'        let dobDD = dobDate.getDate(), ',
'            dobMM = dobDate.getMonth() + 1, ',
'            dobDDMM = [(dobDD > 9 ? '''' : ''0'') + dobDD, (dobMM > 9 ? '''' : ''0'') + dobMM].join('''');',
'        ',
'        let nowDD = now.getDate(), ',
'            nowMM = now.getMonth() + 1, ',
'            nowDDMM = [(nowDD > 9 ? '''' : ''0'') + nowDD, (nowMM > 9 ? '''' : ''0'') + nowMM].join('''');',
'        ',
'        $("#P17_DISPLAY_DOB_TEXT").removeClass("cell-blink").addClass((dobDDMM == nowDDMM) ? "cell-blink" : "");',
'        $("#id-span-birthday-gift").removeClass("cl-hidden").addClass((dobDDMM == nowDDMM) ? "" : "cl-hidden");',
'    }',
'}',
'else {',
'    $("#P17_DISPLAY_DOB_TEXT").removeClass("cell-blink");',
'    $("#id-span-birthday-gift").addClass("cl-hidden");',
'}',
'',
'$("#P17_AGE_DISPLAY").text(ageText);',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(159276620267564126)
,p_name=>'Search Travel ABIS'
,p_event_sequence=>1120
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'searchTravelAbis'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(159276700180564127)
,p_event_id=>wwv_flow_api.id(159276620267564126)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("SEARCH_TRAVEL_ABIS",',
'                    null ',
'                    , {',
'                        success: function(pData) ',
'                        {',
'                            console.log("Search Travel ABIS: ", pData);',
'                            /*if(pData.status == ''success'')',
'                            {',
'                                if (pData.image != null)',
'                                {',
'',
'                                //livestreamEnabled = false;',
'                                $(''#recent_photo'').attr(''src'', ''data:image/jpg;base64,'' + pData.image);',
'                                v_photoDatabase = pData.image;',
'                                //$(''#video'').css(''width'',''180px'');',
'                                }',
'                            }*/',
'                        }',
'                    }',
');',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(38453637869068621)
,p_name=>'Permit Info: Close Dialog'
,p_event_sequence=>1130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(38453440440068619)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(38453723716068622)
,p_event_id=>wwv_flow_api.id(38453637869068621)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43028256638716807)
,p_name=>'TEMP_ONLY_INFO'
,p_event_sequence=>1140
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43028327905716808)
,p_event_id=>wwv_flow_api.id(43028256638716807)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*BEGIN',
'	:P17_TEMP_TERMINAL_IP := :AI_TERMINAL_IP;',
'    SELECT substr(regexp_replace(utl_inaddr.get_host_name(:AI_TERMINAL_IP), ''\.[^0-9].*$''), 1, 15) into :P17_TEMP_TERMINAL_NAME FROM dual;',
'EXCEPTION WHEN OTHERS THEN',
'	IF sqlcode = -29257 THEN',
'		-- Could not resolve host name for IP',
'		:P17_TEMP_TERMINAL_NAME := :AI_TERMINAL_IP;',
'	END IF;',
'END;',
'*/',
'',
'declare',
'    x varchar2(4000):=null;',
'begin',
'    FOR i IN 1..owa.num_cgi_vars LOOP',
'        x := x || owa.cgi_var_name(i)||'' : ''||owa.cgi_var_val(i) || CHR(10) || CHR(13);',
'    END LOOP;',
'    :P17_TEMP_ONLY_VAR_INFO := x;',
'exception when others then',
'    null;',
'end;'))
,p_attribute_02=>'P17_TEMP_ONLY_VAR_INFO'
,p_attribute_03=>'P17_TEMP_ONLY_VAR_INFO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>'TEMP ONLY'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43028802098716813)
,p_event_id=>wwv_flow_api.id(43028256638716807)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'//openModal(''dialogTempOnly'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43028974015716814)
,p_name=>'Temp Only: Close Dialog'
,p_event_sequence=>1150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(43028689557716811)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43029013157716815)
,p_event_id=>wwv_flow_api.id(43028974015716814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(43029432844716819)
,p_name=>'DA_ShowTempOnly'
,p_event_sequence=>1160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(43029342729716818)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(43029558599716820)
,p_event_id=>wwv_flow_api.id(43029432844716819)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal(''dialogTempOnly'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(95456215890695413)
,p_name=>'DA_CLOSEBLACKLISTDIALOG'
,p_event_sequence=>1170
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "120"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95456322066695414)
,p_event_id=>wwv_flow_api.id(95456215890695413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
' NULL;',
'END;'))
,p_attribute_03=>'P17_BLACKLIST_CANCEL_REASON,P17_BLACKLISTALERT_ACTION,P17_BLACKLIST_INCIDENT_ID,P17_BLACKLIST_ALLOW_PASS,P17_ICPO_INCIDENT_ID'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(95456591735695416)
,p_event_id=>wwv_flow_api.id(95456215890695413)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let vBLAction = $v("P17_BLACKLISTALERT_ACTION"), vBLPass = $v("P17_BLACKLIST_ALLOW_PASS");',
'',
'((vBLAction == "A" && vBLPass == "Y") ? vBLPass = " (Pass Allowed)" : ((vBLPass == "N") ? vBLPass = " (Pass Denied)" : vBLPass = ""));',
'((vBLAction == "A") ? vBLAction = "APPROVED" : ((vBLAction == "C") ? vBLAction = "CANCELLED" : vBLAction = ""));',
'',
'if (vBLAction != "") {',
'    mes5 = v_translation["Workflow_js/5"];',
'    mes5 = mes5 + '' : <span class="action-blacklist-check" title="View Details">'' + vBLAction + vBLPass + ''</span>'';',
'}',
'',
'setStatusDiv("div_movement_status");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119104258283171006)
,p_name=>'DA_CLOSE_EDIT_LAST_MVMNT'
,p_event_sequence=>1180
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "4020"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119104351399171007)
,p_event_id=>wwv_flow_api.id(119104258283171006)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'resetWorkstation();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504467466124245924)
,p_name=>'DA_CLOSE_VEHICLE_DETAIL_TM2'
,p_event_sequence=>1190
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent != "load" && this.data.dialogPageId == "14"'
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504467660955245926)
,p_event_id=>wwv_flow_api.id(504467466124245924)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("TRNSPRTUNITID"))',
'    $("#TRNSPRTUNITID").val("").trigger("change");',
'',
'$("#TRNSPRTUNITID").focus();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119107269898171036)
,p_name=>'DA_Submit_CHECK_BLACKLISTALERT'
,p_event_sequence=>1200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'CHECK_BLACKLISTALERT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119107368936171037)
,p_event_id=>wwv_flow_api.id(119107269898171036)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_bl_incident_id    incidents.id%TYPE := :P17_BLACKLIST_INCIDENT_ID;',
'    l_icpo_incident_id  incidents.id%TYPE := :P17_ICPO_INCIDENT_ID;',
'    l_sex               VARCHAR2(1);',
'BEGIN',
'    IF :CHECK_BLACKLISTALERT = 0 OR (:CHECK_BLACKLISTALERT = 1 AND :P17_BLACKLISTALERT_ACTION IN (''A'', ''C'')) THEN',
'        RETURN;',
'    END IF;',
'    ',
'    SELECT DECODE(:P17_DISPLAY_GENDER, 1, ''M'', 2, ''F'', ''X'')',
'    INTO l_sex',
'    FROM DUAL;',
'    ',
'    IF l_bl_incident_id IS NULL AND (:CHECK_BLACKLISTALERT_DEMO = 1 OR :CHECK_BLACKLISTALERT_BIO = 1) THEN',
'        pkg_incidents.create_incident(',
'            p_TYPE => 10',
'            ,p_INS_TERMINAL => :AI_TERMINAL_ID',
'            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'            ,p_DOCNO => :P17_DISPLAY_DOCNUMBER',
'            ,p_ISSUINGCOUNTRY => :P17_NATIONALITY',
'            ,p_LASTNAME => :P17_DISPLAY_LASTNAME',
'            ,p_GIVENNAME => :P17_DISPLAY_FIRSTNAME',
'            ,p_GENDER => l_sex',
'            ,p_DOB => :P17_DISPLAY_DOB_TEXT',
'            ,p_BRDDOCID => :P17_BRDDOCID',
'            ,p_MVMNTID => :P17_MVMNTID',
'            ,p_BL_STATUS => ''A'' -- ACTIVE',
'            ,p_BL_ACTION => ''F'' -- FOUND',
'            ,p_OFFICER => :APP_USER',
'            ,p_CLIENT_IP => :AI_TERMINAL_IP',
'            ,p_ID => l_bl_incident_id',
'        );',
'        ',
'        :P17_BLACKLIST_INCIDENT_ID := l_bl_incident_id;',
'    END IF;',
'',
'    IF l_icpo_incident_id IS NULL AND :CHECK_ICPO_ALERT = 1 THEN',
'        pkg_incidents.create_incident(',
'            p_TYPE => 30',
'            ,p_INS_TERMINAL => :AI_TERMINAL_ID',
'            ,p_INS_BORDERPOST => :AI_BORDERPOST_ID',
'            ,p_DOCNO => :P17_DISPLAY_DOCNUMBER',
'            ,p_ISSUINGCOUNTRY => :P17_NATIONALITY',
'            ,p_LASTNAME => :P17_DISPLAY_LASTNAME',
'            ,p_GIVENNAME => :P17_DISPLAY_FIRSTNAME',
'            ,p_GENDER => l_sex',
'            ,p_DOB => :P17_DISPLAY_DOB_TEXT',
'            ,p_BRDDOCID => :P17_BRDDOCID',
'            ,p_MVMNTID => :P17_MVMNTID',
'            ,p_BL_STATUS => ''A'' -- ACTIVE',
'            ,p_BL_ACTION => ''F'' -- FOUND',
'            ,p_OFFICER => :APP_USER',
'            ,p_CLIENT_IP => :AI_TERMINAL_IP',
'            ,p_ID => l_icpo_incident_id',
'        );',
'        ',
'        :P17_ICPO_INCIDENT_ID := l_icpo_incident_id;',
'    END IF;',
'END;'))
,p_attribute_02=>'CHECK_BLACKLISTALERT,CHECK_BLACKLISTALERT_DEMO,CHECK_BLACKLISTALERT_BIO,CHECK_ICPO_ALERT,P17_BLACKLIST_INCIDENT_ID,P17_ICPO_INCIDENT_ID,P17_BLACKLISTALERT_ACTION'
,p_attribute_03=>'P17_BLACKLIST_INCIDENT_ID,P17_ICPO_INCIDENT_ID'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792671422373460137)
,p_event_id=>wwv_flow_api.id(119107269898171036)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("CHECK_BLACKLISTALERT") == "1" && !parseInt($v("P17_BLACKLISTALERT_ACTION"))) {',
'    mes5 = v_translation["Workflow_js/5"];',
'    mes5 = mes5 + '' : <span class="action-blacklist-check" title="View Details">View</span>'';',
'}',
'',
'setStatusDiv("div_movement_status");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119107643038171040)
,p_name=>'Refresh Date of Entry'
,p_event_sequence=>1210
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'refreshDateOfEntry'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119107763066171041)
,p_event_id=>wwv_flow_api.id(119107643038171040)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>':P17_DATE_OF_ENTRY := TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'');'
,p_attribute_02=>'P17_DATE_OF_ENTRY'
,p_attribute_03=>'P17_DATE_OF_ENTRY'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(119107819843171042)
,p_name=>'Refresh Departure Visa/TM6 image'
,p_event_sequence=>1220
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'refreshVisaTM6Image'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(119107977720171043)
,p_event_id=>wwv_flow_api.id(119107819843171042)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("PROC_GET_COLL_COUNT", ',
'{',
'    x01: "VISA_IMAGE"',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        //console.log(''PROC_GET_COLL_COUNT Result: '', pData.coll_name + '' '' + pData.coll_count);',
'        if ((parseInt(pData.coll_count, 10) || 0) > 0) {',
'            //$(''#P17_SHOW_VISUM'').css(''background-color'', ''green'');',
'            RefreshImage("#P17_VISA_PHOTO");',
'            $("#P17_SHOW_VISUM").addClass("button-data-available");',
'        }',
'        else {',
'            $(''#P17_SHOW_VISUM'').removeClass("button-data-available");',
'        }',
'    }',
'});',
'',
'apex.server.process("PROC_GET_COLL_COUNT", ',
'{',
'    x01: "LANDINGCARD_IMAGE"',
'}, ',
'{',
'    success: function(pData) ',
'    {',
'        //console.log(''PROC_GET_COLL_COUNT Result: '', pData.coll_name + '' '' + pData.coll_count);',
'        if ((parseInt(pData.coll_count, 10) || 0) > 0) {',
'            //$(''#P17_SHOW_TRAVEL_CARD'').css(''background-color'', ''green'');',
'            RefreshImage("#P17_LANDINGCARD_PHOTO");',
'            $("#P17_SHOW_TRAVEL_CARD").addClass("button-data-available");',
'        }',
'        else {',
'            $(''#P17_SHOW_TRAVEL_CARD'').removeClass("button-data-available");',
'        }',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(441446184642127535)
,p_name=>'DA_ViewBlacklistActionDetails'
,p_event_sequence=>1230
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.action-blacklist-check'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#CELL5WORKFLOW'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(441446269997127536)
,p_event_id=>wwv_flow_api.id(441446184642127535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//if ($v("P17_BLACKLISTALERT_ACTION") == "C" || $v("P17_BLACKLISTALERT_ACTION") == "A")',
'if ($v("CHECK_BLACKLISTALERT") == "1")',
'openBlackListDiag();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(441446826696127542)
,p_name=>'P17_CREW_ADD_REDUCE: Change'
,p_event_sequence=>1240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_CREW_ADD_REDUCE'
,p_condition_element=>'P17_CREW_ADD_REDUCE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(441446902637127543)
,p_event_id=>wwv_flow_api.id(441446826696127542)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#P17_CREW_ADD_REDUCE>label:first'
,p_attribute_01=>'field-warn'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(441447033625127544)
,p_event_id=>wwv_flow_api.id(441446826696127542)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'JQUERY_SELECTOR'
,p_affected_elements=>'#P17_CREW_ADD_REDUCE>label:first'
,p_attribute_01=>'field-warn'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(441447197576127545)
,p_event_id=>wwv_flow_api.id(441446826696127542)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(441446335424127537)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(441447222415127546)
,p_event_id=>wwv_flow_api.id(441446826696127542)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(441446335424127537)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504465324543245903)
,p_name=>'P17_TM5_INSTYPE: Change'
,p_event_sequence=>1250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_TM5_INSTYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504465470125245904)
,p_event_id=>wwv_flow_api.id(504465324543245903)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let insType = $v("P17_TM5_INSTYPE"), vSpeed = "fast";',
'',
'//console.log("insType: " + insType);',
'',
'$(".cl-crew-tm5-ins").hide();',
'',
'switch(insType) {',
'  case "D":',
'    $(".cl-crew-tm5-ins-dept").show(vSpeed);',
'    break;',
'  case "B":',
'    $(".cl-crew-tm5-ins-bank").show(vSpeed);',
'    break;',
'  case "C":',
'    $(".cl-crew-tm5-ins-cash").show(vSpeed);',
'    break;',
'  case "A":',
'    $(".cl-crew-tm5-ins-air").show(vSpeed);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504467790849245927)
,p_name=>'Check Vehicle Detail TM2'
,p_event_sequence=>1260
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkVehicleDetailTM2'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504467854108245928)
,p_event_id=>wwv_flow_api.id(504467790849245927)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("TRNSPRTUNITID") == "" || $v("P17_IS_CREW_MEMBER") != ''Y'') {',
'    $s("P17_CHECK_VEHICLE_DETAIL_TM2", "");',
'    $s("P17_VEHICLE_DETAIL_TM2_SEQNO", "");',
'    return false;',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504467916727245929)
,p_event_id=>wwv_flow_api.id(504467790849245927)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' l_exists     VARCHAR2(1) := ''N'';',
' l_tm2_seqno  NUMBER;',
' l_conv_seqno NUMBER;',
'BEGIN',
'',
' IF TRIM(:TRNSPRTUNITID) IS NULL THEN',
'  RETURN;',
' END IF;',
'',
' BEGIN',
'  SELECT TO_NUMBER(NVL(notice$dlc, notice))',
'  INTO l_conv_seqno',
'  FROM dl_common.trans_vehicles$lc',
'  WHERE num_value = :TRNSPRTUNITID_SEA;',
' EXCEPTION',
'  WHEN NO_DATA_FOUND THEN',
'   NULL;',
' END;',
'',
' -- servapp.mscs_tm2',
' BEGIN',
'  SELECT ''Y'', pibicspk',
'  INTO l_exists, l_tm2_seqno',
'  FROM dl_bordercontrol.mscs_tm2',
'  WHERE UPPER(flightno) = UPPER(:TRNSPRTUNITID)',
'  AND cardtype = DECODE(:MOVEMENT_ENTRY_EXIT, 0, 1, 1, 2, :MOVEMENT_ENTRY_EXIT)',
'  AND conv_seqno = l_conv_seqno',
'  --AND TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''yyyymmdd'')',
'  AND ',
'  CASE ',
'      WHEN TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''yyyymmdd'')',
'      THEN 1',
'      WHEN TO_NUMBER(TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''HH24MI'')) <= 200 AND TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:'
||'MI'')), ''DD/MM/YYYY HH24:MI'') - 1, ''yyyymmdd'')',
'      THEN 1',
'  END = 1',
'  AND ROWNUM = 1;',
' EXCEPTION',
'  WHEN NO_DATA_FOUND THEN',
'   NULL;',
' END;',
'',
' IF l_exists = ''N'' THEN',
'  -- pibicsdm2.tm2',
'  BEGIN',
'   SELECT ''Y'', tm2_seqno',
'   INTO l_exists, l_tm2_seqno',
'   FROM dl_bordercontrol.v_tm2',
'   WHERE convregno = UPPER(:TRNSPRTUNITID)',
'   AND cardtype = DECODE(:MOVEMENT_ENTRY_EXIT, 0, 1, 1, 2, :MOVEMENT_ENTRY_EXIT)',
'   AND conv_seqno = l_conv_seqno',
'   --AND TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''yyyymmdd'')',
'   AND',
'   CASE ',
'       WHEN TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''yyyymmdd'')',
'       THEN 1',
'       WHEN TO_NUMBER(TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''HH24MI'')) <= 200 AND TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24'
||':MI'')), ''DD/MM/YYYY HH24:MI'') - 1, ''yyyymmdd'')',
'       THEN 1',
'   END = 1',
'   AND ROWNUM = 1;',
'  EXCEPTION',
'   WHEN NO_DATA_FOUND THEN',
'    NULL;',
'  END;',
' END IF;',
'',
' IF l_exists = ''N'' AND :P17_CHECK_PIBICS_CONN = 1 THEN',
'  -- pibicsdm2.v_tm2_prod',
'  BEGIN',
'   SELECT ''Y'', tm2_seqno',
'   INTO l_exists, l_tm2_seqno',
'   FROM dl_bordercontrol.v_tm2_prod',
'   WHERE convregno = UPPER(:TRNSPRTUNITID)',
'   AND cardtype = DECODE(:MOVEMENT_ENTRY_EXIT, 0, 1, 1, 2, :MOVEMENT_ENTRY_EXIT)',
'   AND conv_seqno = l_conv_seqno',
'   --AND TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''yyyymmdd'')',
'   AND',
'   CASE ',
'       WHEN TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''yyyymmdd'')',
'       THEN 1',
'       WHEN TO_NUMBER(TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''), ''HH24MI'')) <= 200 AND TO_CHAR(iodte, ''yyyymmdd'') = TO_CHAR(TO_DATE(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24'
||':MI'')), ''DD/MM/YYYY HH24:MI'') - 1, ''yyyymmdd'')',
'       THEN 1',
'   END = 1',
'   AND ROWNUM = 1;',
'  EXCEPTION',
'   WHEN NO_DATA_FOUND THEN',
'    NULL;',
'  END;',
' END IF;',
'',
' CASE l_exists',
'  WHEN ''Y'' THEN',
'   :P17_CHECK_VEHICLE_DETAIL_TM2 := 1;',
'   :P17_VEHICLE_DETAIL_TM2_SEQNO := l_tm2_seqno;',
'  ELSE',
'   :P17_CHECK_VEHICLE_DETAIL_TM2 := 0;',
'   :P17_VEHICLE_DETAIL_TM2_SEQNO := NULL;',
' END CASE;',
'',
'END;'))
,p_attribute_02=>'MOVEMENT_ENTRY_EXIT,TRNSPRTUNITID_SEA,TRNSPRTUNITID,P17_DATE_OF_ENTRY,P17_CHECK_VEHICLE_DETAIL_TM2,P17_CHECK_PIBICS_CONN'
,p_attribute_03=>'P17_CHECK_VEHICLE_DETAIL_TM2,P17_VEHICLE_DETAIL_TM2_SEQNO'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504468020941245930)
,p_event_id=>wwv_flow_api.id(504467790849245927)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'console.log("TM2: " + $v("P17_CHECK_VEHICLE_DETAIL_TM2"));',
'',
'if ($v("P17_CHECK_VEHICLE_DETAIL_TM2") != 1) {',
'    $("#VEHICLE_DETAIL_TM2").trigger("click");',
'    $("#TRNSPRTUNITID").val("").trigger("change");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504468112432245931)
,p_name=>'P17_INSDEPT_GUART_SEQNO: Change'
,p_event_sequence=>1270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_INSDEPT_GUART_SEQNO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504468293509245932)
,p_event_id=>wwv_flow_api.id(504468112432245931)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    SELECT comnm, amountleft',
'    INTO :P17_INSDEPT_GUART_COMNM, :P17_INSDEPT_GUART_AMOUNTLEFT',
'    FROM dl_bordercontrol.v_guartdept',
'    WHERE actflag = ''Y''',
'    AND guartdept_seqno = :P17_INSDEPT_GUART_SEQNO;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        :P17_INSDEPT_GUART_COMNM := NULL;',
'        :P17_INSDEPT_GUART_AMOUNTLEFT := NULL;',
'END;'))
,p_attribute_02=>'P17_INSDEPT_GUART_SEQNO'
,p_attribute_03=>'P17_INSDEPT_GUART_COMNM,P17_INSDEPT_GUART_AMOUNTLEFT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(504468385634245933)
,p_name=>'ON CHANGE: EVENT-BASED CREW TM5'
,p_event_sequence=>1280
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input.cl-crew-tm5-lookup, select.cl-crew-tm5-lookup'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(504468406145245934)
,p_event_id=>wwv_flow_api.id(504468385634245933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let item = this.triggeringElement.getAttribute("id");',
'',
'//',
'if(item === "P17_TM5_INDEPT_SEQNO_LOOKUP") {',
'    p17.deptType.set("P17_TM5_INDEPT_SEQNO", "P17_TM5_INDEPT_SEQNO_LOOKUP");',
'    p17.deptType.setIdItem();',
'}',
'else if(item === "P17_TM5_INDEPT_SEQNO") {',
'    p17.deptType.set("P17_TM5_INDEPT_SEQNO", "P17_TM5_INDEPT_SEQNO_LOOKUP");',
'    p17.deptType.setSelectItem();',
'}',
'//',
'else if(item === "P17_TM5_CHKDEPT_SEQNO_LOOKUP") {',
'    p17.deptType.set("P17_TM5_CHKDEPT_SEQNO", "P17_TM5_CHKDEPT_SEQNO_LOOKUP");',
'    p17.deptType.setIdItem();',
'}',
'else if(item === "P17_TM5_CHKDEPT_SEQNO") {',
'    p17.deptType.set("P17_TM5_CHKDEPT_SEQNO", "P17_TM5_CHKDEPT_SEQNO_LOOKUP");',
'    p17.deptType.setSelectItem();',
'}',
'//',
'else if(item === "P17_INSAIR_DEPT_AIR_LOOKUP") {',
'    p17.departmentType.set("P17_INSAIR_DEPT_AIR", "P17_INSAIR_DEPT_AIR_LOOKUP");',
'    p17.departmentType.setIdItem();',
'}',
'else if(item === "P17_INSAIR_DEPT_AIR") {',
'    p17.departmentType.set("P17_INSAIR_DEPT_AIR", "P17_INSAIR_DEPT_AIR_LOOKUP");',
'    p17.departmentType.setSelectItem();',
'}',
'//'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(792668181072460104)
,p_name=>'Find Manually Report: Close Dialog'
,p_event_sequence=>1290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(792668093511460103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792668295087460105)
,p_event_id=>wwv_flow_api.id(792668181072460104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(792669450516460117)
,p_name=>'Reset Find Manually Report Selection'
,p_event_sequence=>1300
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'resetFindManualReportSelection'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792669529162460118)
,p_event_id=>wwv_flow_api.id(792669450516460117)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//all elements',
'$("#id-ir-find-manually-report span.cl-span-find-manually-report")',
'.data("selection-status", "N")',
'.removeClass("fa-circle-o fa-dot-circle-o")',
'.addClass("fa-circle-o")',
'.prop("title", "Click to Select");',
'',
'//set selected identity',
'$("#P17_DISPLAY_EXPIRYDATE").val("").trigger("change");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(792669609119460119)
,p_name=>'Toggle Find Manually Report Selection'
,p_event_sequence=>1310
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.cl-span-find-manually-report'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#dialogFindManuallyReport'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792669753027460120)
,p_event_id=>wwv_flow_api.id(792669609119460119)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $el = $(this.triggeringElement), isSelected = $el.data("selection-status"), vData = $el.data("selection");',
'',
'console.log(this.triggeringElement.id + ":" + isSelected);',
'',
'//reset',
'$(document).trigger("resetFindManualReportSelection");',
'',
'//this element',
'$el',
'.data("selection-status", (isSelected == "Y") ? "N" : "Y")',
'.removeClass("fa-circle-o fa-dot-circle-o")',
'.addClass((isSelected == "Y") ? "fa-circle-o" : "fa-dot-circle-o")',
'.prop("title", (isSelected == "Y") ? "Click to Select" : "Click to Un-Select");',
'',
'//set selected identity',
'$("#P17_DISPLAY_EXPIRYDATE").val($el.data("selection-status") == "Y" ? vData.split(":")[2] : "").trigger("change");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(792671093032460133)
,p_name=>'CHECK_BLACKLISTALERT_DEMO: Change'
,p_event_sequence=>1320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'CHECK_BLACKLISTALERT_DEMO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792671166662460134)
,p_event_id=>wwv_flow_api.id(792671093032460133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $demo = $("#CHECK_BLACKLISTALERT_DEMO"), ',
'    demo = $demo.val(), ',
'    $bio = $("#CHECK_BLACKLISTALERT_BIO"), ',
'    bio = $bio.val(), ',
'    $icpo = $("#CHECK_ICPO_ALERT"), ',
'    icpo = $icpo.val(),',
'    $bl = $("#CHECK_BLACKLISTALERT");',
'',
'if ((demo != "0") && (demo != "1")) $demo.val("");',
'else if (demo == "1") $bl.val("1").trigger("change");',
'else if ((demo == "0") && (bio == "0") && (icpo == "0")) $bl.val("0").trigger("change");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(792671204951460135)
,p_name=>'CHECK_BLACKLISTALERT_BIO: Change'
,p_event_sequence=>1330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'CHECK_BLACKLISTALERT_BIO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(792671308983460136)
,p_event_id=>wwv_flow_api.id(792671204951460135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $demo = $("#CHECK_BLACKLISTALERT_DEMO"), ',
'    demo = $demo.val(), ',
'    $bio = $("#CHECK_BLACKLISTALERT_BIO"), ',
'    bio = $bio.val(), ',
'    $icpo = $("#CHECK_ICPO_ALERT"),',
'    icpo = $icpo.val(),',
'    $bl = $("#CHECK_BLACKLISTALERT");',
'if ((bio != "0") && (bio != "1")) $bio.val("");',
'else if (bio == "1") $bl.val("1").trigger("change");',
'else if ((bio == "0") && (demo == "0") && (icpo == "0")) $bl.val("0").trigger("change");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729913512054547133)
,p_name=>'Check Session Status'
,p_event_sequence=>1340
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkSessionStatus'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729913697605547134)
,p_event_id=>wwv_flow_api.id(2729913512054547133)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v("pInstance").trim().length > 0) {',
'    // check if the session is still active',
'    apex.server.process("CHECK_SESSION_STATUS", ',
'    {',
'        x01: $v("pInstance")',
'    }, ',
'    {',
'        success: function(pRes) ',
'        {',
'            //console.log(pRes);',
'        },',
'        error: function(pRes){',
'            let e = pRes.responseJSON.error;',
'            console.log(e);',
'            if (e == "Your session has expired") {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([',
'                    {',
'                        type: apex.message.TYPE.ERROR,',
'                        location: ["page"],',
'                        message: e + ". Redirecting in 5 seconds..",',
'                        unsafe: false',
'                    }',
'                ]);',
'                setTimeout(function() {window.location = "./f?p=99999:LOGIN_DESKTOP:0::NO:RP,111:P111_REFERING_APP:500";}, 4000);',
'            }',
'        }',
'    });',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729914133059547139)
,p_name=>'P17_STATELESS_TRIG: Change'
,p_event_sequence=>1350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_STATELESS_TRIG'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729914240096547140)
,p_event_id=>wwv_flow_api.id(2729914133059547139)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let isDeparture = !!parseInt($("#MOVEMENT_ENTRY_EXIT").val());',
'',
'//last movement, permit and overstay',
'$("#P17_TOGGLE_STATELESS").prop("disabled", true).addClass("apex_disabled");',
'if (isDeparture) {',
'    apexCustomEvent(''getLastMovementInfoWithArrData'');',
'}',
'else {',
'    apexCustomEvent(''getLastMovementInfo'');',
'}',
'apexCustomEvent(''getPermitInfo'');',
'apexCustomEvent(''getOverstayInfo'');',
'$("#P17_TOGGLE_STATELESS").prop("disabled", false).removeClass("apex_disabled");',
'',
'//demo BL',
'demographicDates2();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729914398388547141)
,p_event_id=>wwv_flow_api.id(2729914133059547139)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(51444855158222514)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729914524756547143)
,p_name=>'DA_ToggleStatelessOption'
,p_event_sequence=>1360
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2729914449084547142)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729914660898547144)
,p_event_id=>wwv_flow_api.id(2729914524756547143)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.event.trigger(document, "toggleStatelessOption");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729914789582547145)
,p_name=>'P17_STATELESS_ID: Change'
,p_event_sequence=>1370
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_STATELESS_ID'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729914807064547146)
,p_event_id=>wwv_flow_api.id(2729914789582547145)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'p17.nationality.set("P17_STATELESS_ID", "P17_STATELESS");',
'p17.nationality.setSelectItem();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729914984825547147)
,p_name=>'P17_STATELESS: Change'
,p_event_sequence=>1380
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_STATELESS'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2729915058908547148)
,p_event_id=>wwv_flow_api.id(2729914984825547147)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//lookup',
'p17.nationality.set("P17_STATELESS_ID", "P17_STATELESS");',
'p17.nationality.setIdItem();',
'',
'//set trigger',
'let currVal = $("#P17_STATELESS").val();',
'',
'if (currVal != $("#P17_STATELESS_TRIG").val()) {',
'    $("#P17_STATELESS_TRIG").val(currVal).trigger("change");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2729915217696547150)
,p_name=>'MANDATORY: P17_VISUM'
,p_event_sequence=>1390
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_VISUM'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.triggeringElement.value == "" && $v("P17_NATIONALITY") != "THA" && (!!parseInt($("#P17_PASS_DETECTED").val()) || !!parseInt($("#P17_MANUAL_PASSPORT").val()))'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811515132901452601)
,p_event_id=>wwv_flow_api.id(2729915217696547150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811515247475452602)
,p_event_id=>wwv_flow_api.id(2729915217696547150)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'apex-page-item-error'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811515336350452603)
,p_name=>'Toggle Stateless Option'
,p_event_sequence=>1400
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'toggleStatelessOption'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811515459608452604)
,p_event_id=>wwv_flow_api.id(2811515336350452603)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $btn = $("#P17_TOGGLE_STATELESS"), $s = $("#P17_STATELESS"), $sc = $("#P17_STATELESS_CONTAINER"), $sid = $("#P17_STATELESS_ID"), $sidc = $("#P17_STATELESS_ID_CONTAINER"), $nat = $("#P17_NATIONALITY_CONTAINER"), $natId = $("#P17_NATIONALITY_ID_CON'
||'TAINER");',
'let actClass = "cl-stateless-active", hideClass = "cl-hidden", flashClass = "cl-flash";',
'let isActive = $btn.hasClass(actClass);',
'let lastStateless = $v("P17_LAST_STATELESS");',
'',
'if (isActive) {',
'    $s.removeClass(flashClass);',
'    $s.val("").trigger("change"); $sid.val("");',
'    $sidc.addClass(hideClass);',
'    $sc.addClass(hideClass);',
'    $natId.removeClass(hideClass);',
'    $nat.removeClass(hideClass);',
'    $btn.removeClass(actClass);',
'}',
'else {',
'    $btn.addClass(actClass);',
'    $nat.addClass(hideClass);',
'    $natId.addClass(hideClass);',
'    $sc.removeClass(hideClass);',
'    $sidc.removeClass(hideClass);',
'    $s.val(lastStateless).trigger("change");',
'    $s.addClass(flashClass);',
'}',
'',
'setStatusDiv("div_movement_status");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811515567160452605)
,p_name=>'Get Permit Information'
,p_event_sequence=>1410
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getPermitInfo'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811515661739452606)
,p_event_id=>wwv_flow_api.id(2811515567160452605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'  pkg_bmbs_apex_util.p17_get_permit_info();',
'  ',
'end;'))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_EXPIRYDATE,P17_NATIONALITY,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_STATELESS'
,p_attribute_03=>'P17_RE_TM8_SEQNO,P17_RE_DOCTYPE,P17_RE_ENDPERMIT_DATE,P17_EXT_LIST_SEQNO,P17_EXT_PERMIT_DATE,P17_IS_PERMIT_INFO,P17_PERMIT_TYPE,P17_PERMIT_EXPIRY,P17_RQS_PERSON_SEQNO,P17_RQS_PERMIT_DATE,P17_ENDQ_RESIDENCE_NO,P17_ENDQ_RESIDENCE_TYPE,P17_ENDQ_THAI_FIR'
||'STNAME,P17_ENDQ_THAI_FAMILYNAME,P17_ENDQ_THAI_MIDDLENAME,P17_ENDQ_RESIDENCE_BOOK_NO,P17_ENDQ_ENDORSEMENT_NO,P17_ENDQ_ISSUE_PLACE,P17_ENDQ_EXPIRED_DATE,P17_CHNG_PERSON_SEQNO,P17_CHNG_EXPIRED_DATE,P17_CHNG_VISA_TYPE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811517268414452622)
,p_event_id=>wwv_flow_api.id(2811515567160452605)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!!$("#P17_IS_PERMIT_INFO").val()) {',
'    let regions = [',
'        "#REG_REENTRY",',
'        "#REG_EXTENDSTAY",',
'        "#REG_REQ4RESIDENCE",',
'        "#REG_ENDORSEMENT",',
'        "#REG_CHANGEVISA"',
'    ];',
'    let permits = $("#P17_IS_PERMIT_INFO").val().split(",");',
'    $(regions.join(",")).hide();',
'    for (let i = 0; i < permits.length; ++i) {',
'        $("#" + permits[i]).show();',
'    }',
'    $("#P17_SHOW_PERMIT_INFO").removeClass("button-data-available apex_disabled").addClass("button-data-available");',
'    //openModal(''dialogPermitInfo'');',
'} ',
'else {',
'    $("#P17_SHOW_PERMIT_INFO").removeClass("button-data-available apex_disabled").addClass("apex_disabled").prop("disabled", true);',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811515798712452607)
,p_name=>'Get Overstay Information'
,p_event_sequence=>1420
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getOverstayInfo'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811515831796452608)
,p_event_id=>wwv_flow_api.id(2811515798712452607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'  pkg_bmbs_apex_util.p17_get_overstay_info();',
'  ',
'end;'))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_EXPIRYDATE,P17_NATIONALITY,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_STATELESS'
,p_attribute_03=>'P17_OVERSTAY_INFO_TRAVEL_DATE,P17_OVERSTAY_INFO_TODAY,P17_OVERSTAY_INFO_EXPIRY_DATE,P17_OVERSTAY_INFO_DAYS,P17_OVERSTAY_VISA_TYPE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811517368112452623)
,p_event_id=>wwv_flow_api.id(2811515798712452607)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let extendStayDate = $("#P17_EXTENDSTAY_UNTIL").val(); //P17_EXTENDSTAY_UNTIL  P17_EXT_PERMIT_DATE',
'let hasExtendStay = !!extendStayDate;',
'let extendStayUntil = parseCambodianDate(extendStayDate);',
'let extendStayOverstay = ((86400 * 1000 + (+extendStayUntil)) - (+new Date()));',
'let extendStayOkay = extendStayOverstay > 0;',
'let overstayDays = parseInt($("#P17_OVERSTAY_INFO_DAYS").val());',
'let hasOverstay = !!overstayDays;',
'let extendStayOverstayDays = Math.abs(Math.floor(((86400 * 1000 + (+parseCambodianDate($("#P17_EXTENDSTAY_UNTIL").val()))) - (+new Date())) / 86400 / 1000));',
'',
'$("#ALERT_OVERSTAY,#ALERT_OVERSTAY_EXTENDSTAY,#OVERSTAY_EXTENDSTAY_INFO").hide();',
'$("#P17_EXTENDSTAY_EXPIRY_DATE").val(extendStayDate);',
'$("#P17_EXTENDSTAY_OVERSTAY_DAYS").val(extendStayOverstayDays);',
'',
'if (hasOverstay) {',
'    if (hasExtendStay) {',
'        $("#P17_VISUM_5").val(toCambodianDateString(extendStayUntil)).trigger("change");',
'        if (!extendStayOkay) {',
'            $("#ALERT_OVERSTAY_EXTENDSTAY,#OVERSTAY_EXTENDSTAY_INFO").show();',
'            openModal("showOverstayInformation");',
'            $(''[aria-describedby="showOverstayInformation"]'').css("width", "");',
'        }',
'    } else {',
'        $("#ALERT_OVERSTAY").show();',
'        openModal("showOverstayInformation");',
'        $(''[aria-describedby="showOverstayInformation"]'').css("width", "");',
'    }',
'}',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811515983791452609)
,p_name=>'Get Last Movement Information'
,p_event_sequence=>1430
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getLastMovementInfo'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811516080577452610)
,p_event_id=>wwv_flow_api.id(2811515983791452609)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'  pkg_bmbs_apex_util.p17_get_last_movement_info();',
'  ',
'end;'))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,P17_NATIONALITY,P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_GENDER,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_STATELESS,P17_CHECK_PIBICS_CONN'
,p_attribute_03=>'P17_LAST_DIRECTION,P17_LAST_MVMNT_SRC,P17_LAST_MVMNT_SRC_SEC,P17_LAST_MVMNT_SRC_SEC_PK_VAL,P17_LAST_MVMNT_TRAVEL_DATE,P17_LAST_MVMNT_DOCNO,P17_LAST_MVMNT_DOCNO_EXP_DATE,P17_LAST_MVMNT_VISA_TYPE,P17_LAST_MVMNT_VISA_EXP_DATE'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811517494654452624)
,p_event_id=>wwv_flow_api.id(2811515983791452609)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#MOVEMENT_ENTRY_EXIT").trigger("change");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2811516190221452611)
,p_name=>'Get Last Movement Information w Arrival Data'
,p_event_sequence=>1440
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getLastMovementInfoWithArrData'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811516249960452612)
,p_event_id=>wwv_flow_api.id(2811516190221452611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  ',
'  pkg_bmbs_apex_util.p17_get_last_movement_info (p_load_data_on_departure => ''Y'');',
'  ',
'end;'))
,p_attribute_02=>'P17_DISPLAY_DOCNUMBER,P17_NATIONALITY,P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_DISPLAY_GENDER,P17_DISPLAY_DOB_TEXT,P17_DISPLAY_LASTNAME,P17_DISPLAY_FIRSTNAME,P17_DISPLAY_MIDDLENAME,P17_STATELESS,P17_CHECK_PIBICS_CONN'
,p_attribute_03=>'P17_LAST_DIRECTION,P17_LAST_MVMNT_SRC,P17_LAST_MVMNT_SRC_SEC,P17_LAST_MVMNT_SRC_SEC_PK_VAL,P17_LAST_MVMNT_TRAVEL_DATE,P17_LAST_MVMNT_DOCNO,P17_LAST_MVMNT_DOCNO_EXP_DATE,P17_LAST_MVMNT_VISA_TYPE,P17_LAST_MVMNT_VISA_EXP_DATE,P17_VISUM_1,P17_VISA_TYPE_I'
||'D,P17_VISUM,P17_VISUM_4,P17_VISUM_5,P17_PERMIT_TYPE,P17_PERMIT_EXPIRY,P17_TRAVELCARD_NO,P17_PROVINCE,P17_TMP_AMPUR,P17_TMP_TAMBON,P17_LC_ADDRESS'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2811517523143452625)
,p_event_id=>wwv_flow_api.id(2811516190221452611)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#MOVEMENT_ENTRY_EXIT").trigger("change");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2842096129625083621)
,p_name=>'Insert into Travel ABIS'
,p_event_sequence=>1450
,p_bind_type=>'bind'
,p_bind_event_type=>'apexbeforepagesubmit'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2842096268534083622)
,p_event_id=>wwv_flow_api.id(2842096129625083621)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var request = this.data;',
'',
'if (request === ''REQUEST_PROCESSBORDERDOCUMENT'') {',
'    console.log(''Triggering Travel ABIS Insert'');',
'    executePageProcess(''Insert_Travel_ABIS'', [$v("P17_MVMNTID"), $v("P17_BRDDOCID")]);',
'} else {',
'    console.log(''Skip Travel ABIS Insert'');',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2842097583598083635)
,p_name=>'Check PIBICS Connection'
,p_event_sequence=>1460
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'checkPibicsConn'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2842097694456083636)
,p_event_id=>wwv_flow_api.id(2842097583598083635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// check if PIBICS PRD Connection is active',
'',
'if (lastPibicsConnRequest) {',
'  lastPibicsConnRequest.abort();',
'  lastPibicsConnRequest = null;',
'}',
'',
'lastPibicsConnRequest = ',
'  apex.server.process("CHECK_PIBICS_CONN", ',
'  {',
'    x01: $v("pInstance")',
'  }, ',
'  {',
'    beforeSend: function() ',
'    {',
'        $("#P17_CHECK_PIBICS_CONN").val("0");',
'    },',
'    success: function(pData) ',
'    {',
'        console.log(''CHECK_PIBICS_CONN Result: '', pData);',
'        $("#P17_CHECK_PIBICS_CONN").val(pData.is_conn_active);',
'    },',
'    error: function(pData) ',
'    {',
'        console.log(''CHECK_PIBICS_CONN Error Result: '', pData.responseJSON.error);',
'    }',
'  }).done(function(pData) {lastPibicsConnRequest = null;});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173632438662838630)
,p_name=>'Movements Dyn: Colorize row after refresh'
,p_event_sequence=>1470
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(5173631053707838616)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterrefresh'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173632563638838631)
,p_event_id=>wwv_flow_api.id(5173632438662838630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$("span.my_yellow").closest("tr").addClass("cell-warn").find("td").css("background-color", "inherit");',
'$("#TH_DOCUMENT_NUMBER").val($("#P17_DISPLAY_DOCNUMBER").val());',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173632768160838633)
,p_name=>'P17_TOGGLE_REMARK_LANG: Click'
,p_event_sequence=>1480
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5173632605450838632)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173632847745838634)
,p_event_id=>wwv_flow_api.id(5173632768160838633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'toggleMaskLang();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173632911508838635)
,p_event_id=>wwv_flow_api.id(5173632768160838633)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$("#"+this.triggeringElement.id + " span.cl-mask-lang-disp").removeClass("cl-mask-lang-en cl-mask-lang-th").addClass("cl-mask-lang-" + v_mask_curr_lang.substr(0, 2));'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173633122546838637)
,p_name=>'P17_TRNSPRTUNITID_EXISTS: Change'
,p_event_sequence=>1490
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_TRNSPRTUNITID_EXISTS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'''&AI_TRANSPORT_MODE.'' == 0 && !parseInt(this.triggeringElement.value) && $v("TRNSPRTUNITID").trim().length > 0'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173633229933838638)
,p_event_id=>wwv_flow_api.id(5173633122546838637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'TRNSPRTUNITID'
,p_attribute_01=>'cell-blink-danger'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173633321948838639)
,p_event_id=>wwv_flow_api.id(5173633122546838637)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'TRNSPRTUNITID'
,p_attribute_01=>'cell-blink-danger'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173633634434838642)
,p_name=>'Validate Flight Num'
,p_event_sequence=>1500
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'validateFlightNum'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173633779077838643)
,p_event_id=>wwv_flow_api.id(5173633634434838642)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// check if the flight exists',
'// current src: flights',
'',
'// return if trans mode is not air border ',
'if (''&AI_TRANSPORT_MODE.'' != 0) {',
'    console.log("Trans Mode: " + ''&AI_TRANSPORT_MODE.'');',
'    $("#P17_TRNSPRTUNITID_EXISTS").val("1").trigger("change");',
'    return false;',
'}',
'',
'if ($v("TRNSPRTUNITID").trim().length > 0) {',
'    apex.server.process("CHECK_FLIGHT_NUM", ',
'    {',
'        x01: $v("TRNSPRTUNITID"),',
'        x02: $v("MOVEMENT_ENTRY_EXIT"),',
'        x03: ''&AI_BORDERPOST_ID.''',
'    }, ',
'    {',
'        success: function(pData) ',
'        {',
'            //console.log(''CHECK_FLIGHT_NUM Result: '', pData.flight_num + '' '' + pData.flight_num_exists);',
'            //$("#TRNSPRTUNITID").removeClass("cl-red").addClass(pData.flight_num_exists != "Y" ? "cl-red" : "");',
'            $("#P17_TRNSPRTUNITID_EXISTS").val(pData.flight_num_exists != "Y" ? "0" : "1").trigger("change");',
'        }',
'    });',
'}',
'else {',
'    //$("#TRNSPRTUNITID").removeClass("cl-red");',
'    $("#P17_TRNSPRTUNITID_EXISTS").val("").trigger("change");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423524912202821444)
,p_name=>'Reset Find Resident Report Selection'
,p_event_sequence=>1510
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'resetFindResidentReportSelection'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423525092350821445)
,p_event_id=>wwv_flow_api.id(21423524912202821444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//all elements',
'$("#id-ir-find-resident-report span.cl-span-find-resident-report")',
'.data("selection-status", "N")',
'.removeClass("fa-circle-o fa-dot-circle-o")',
'.addClass("fa-circle-o")',
'.prop("title", "Click to Select");',
'',
'//set selected resident number',
'$("#P17_RI_RCNO_PVCD,#P17_RI_RCNO_RUNNINGNO,#P17_RI_RCNO_YEAR,#P17_RI_RESIDENT_TYPE_CODE,#P17_RI_RESIDENT_TYPE,#P17_RI_LAST_NAME,#P17_RI_FIRST_NAME,#P17_RI_MIDDLE_NAME").val("");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5173634197955838647)
,p_name=>'CHECK_ICPO_ALERT: Change'
,p_event_sequence=>1520
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'CHECK_ICPO_ALERT'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5173634239791838648)
,p_event_id=>wwv_flow_api.id(5173634197955838647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $icpo = $("#CHECK_ICPO_ALERT"), ',
'    icpo = $icpo.val(),',
'    $demo = $("#CHECK_BLACKLISTALERT_DEMO"), ',
'    demo = $demo.val(), ',
'    $bio = $("#CHECK_BLACKLISTALERT_BIO"), ',
'    bio = $bio.val(), ',
'    $bl = $("#CHECK_BLACKLISTALERT");',
'',
'if ((icpo != "0") && (icpo != "1")) $icpo.val("");',
'else if (icpo == "1") $bl.val("1").trigger("change");',
'else if ((icpo == "0") && (bio == "0") && (demo == "0")) $bl.val("0").trigger("change");',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423521035961821405)
,p_name=>'P17_RI_SEARCH_BTN: Click'
,p_event_sequence=>1530
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(21423520917287821404)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423521121647821406)
,p_event_id=>wwv_flow_api.id(21423521035961821405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apexCustomEvent(''findResidentInformation'');'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423521365442821408)
,p_name=>'P17_RI_RESIDENT_TYPE_CODE: Change'
,p_event_sequence=>1540
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_RI_RESIDENT_TYPE_CODE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423521451165821409)
,p_event_id=>wwv_flow_api.id(21423521365442821408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentCode = $v(''P17_RI_RESIDENT_TYPE'');',
'let newCode = $v(''P17_RI_RESIDENT_TYPE_CODE'');',
'',
'if (newCode != currentCode) {',
'    if (!($("#P17_RI_RESIDENT_TYPE option[value=''"+newCode+"'']").length > 0)) {',
'        $("#P17_RI_RESIDENT_TYPE_CODE,#P17_RI_RESIDENT_TYPE").val("");',
'        $("#P17_RI_RESIDENT_TYPE").trigger("change");',
'    } else {',
'        $(''#P17_RI_RESIDENT_TYPE'').val(newCode).trigger("change");',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423521519186821410)
,p_name=>'P17_RI_RESIDENT_TYPE: Change'
,p_event_sequence=>1550
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_RI_RESIDENT_TYPE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423521610285821411)
,p_event_id=>wwv_flow_api.id(21423521519186821410)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let currentCode = $v(''P17_RI_RESIDENT_TYPE_CODE'');',
'let newCode = $v(''P17_RI_RESIDENT_TYPE'');',
'',
'if (newCode != currentCode) {',
'    $(''#P17_RI_RESIDENT_TYPE_CODE'').val(newCode).trigger("change");',
'}',
'',
'if (!newCode) {',
'    $("#P17_RI_RESIDENT_TYPE_CODE,#P17_RI_RESIDENT_TYPE").val("");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423522373115821418)
,p_name=>'Find Resident Report: Close Dialog'
,p_event_sequence=>1560
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(21423522209596821417)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423522487506821419)
,p_event_id=>wwv_flow_api.id(21423522373115821418)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(this.triggeringElement).closest(".js-modal").dialog("close");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21423525101420821446)
,p_name=>'Toggle Find Resident Report Selection'
,p_event_sequence=>1570
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'span.cl-span-find-resident-report'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#dialogFindResidentReport'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21423525213225821447)
,p_event_id=>wwv_flow_api.id(21423525101420821446)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $el = $(this.triggeringElement), isSelected = $el.data("selection-status"), vData = $el.data("selection");',
'',
'console.log(this.triggeringElement.id + ":" + isSelected);',
'',
'//reset',
'$(document).trigger("resetFindResidentReportSelection");',
'',
'//this element',
'$el',
'.data("selection-status", (isSelected == "Y") ? "N" : "Y")',
'.removeClass("fa-circle-o fa-dot-circle-o")',
'.addClass((isSelected == "Y") ? "fa-circle-o" : "fa-dot-circle-o")',
'.prop("title", (isSelected == "Y") ? "Click to Select" : "Click to Un-Select");',
'',
'//set selected resident number',
'if ($el.data("selection-status") == "Y") {',
'    $("#P17_RI_RCNO_PVCD").val(vData.split(":")[0]);',
'    $("#P17_RI_RCNO_RUNNINGNO").val(vData.split(":")[1]);',
'    $("#P17_RI_RCNO_YEAR").val(vData.split(":")[2]);',
'    $("#P17_RI_RESIDENT_TYPE_CODE").val(vData.split(":")[3]);',
'    $("#P17_RI_RESIDENT_TYPE").val(vData.split(":")[3]);',
'    $("#P17_RI_LAST_NAME").val(vData.split(":")[4]);',
'    $("#P17_RI_FIRST_NAME").val(vData.split(":")[5]);',
'    $("#P17_RI_MIDDLE_NAME").val(vData.split(":")[6]);',
'}',
'else {',
'    $("#P17_RI_RCNO_PVCD,#P17_RI_RCNO_RUNNINGNO,#P17_RI_RCNO_YEAR,#P17_RI_RESIDENT_TYPE_CODE,#P17_RI_RESIDENT_TYPE,#P17_RI_LAST_NAME,#P17_RI_FIRST_NAME,#P17_RI_MIDDLE_NAME").val("");',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31426989057676704902)
,p_name=>'Get Thai Passport Info'
,p_event_sequence=>1580
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'getThaiPassportInfo'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31426989119218704903)
,p_event_id=>wwv_flow_api.id(31426989057676704902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'	l_expirydate      DATE;',
'	l_extexpirydate   DATE;',
'	l_last_entry_form dl_bordercontrol.movements.entry_form%TYPE;',
'	l_note            dl_bordercontrol.entry_forms.note%TYPE;',
'BEGIN',
'',
'	IF :P17_NATIONALITY = ''THA'' AND TO_NUMBER(NVL(:P17_DISPLAY_DOCCLASS, 1)) = 1 THEN',
'',
'		-- get thai passport information',
'		BEGIN',
'			SELECT tfamilynm, tfirstnm, tmiddlenm, citizenid, typedpassport',
'			INTO :P17_LASTNAME_THAI, :P17_GIVEN_NAME_THAI, :P17_MIDDLE_NAME_THAI, :P17_CITIZENID_THAI, :P17_TYPEDPASSPORT',
'			FROM dl_bordercontrol.v_thaipassport',
'			WHERE :P17_NATIONALITY = ''THA'' ',
'			AND passportno = :P17_DISPLAY_DOCNUMBER;',
'		',
'			:P17_DOCNUMBER_THAI := :P17_DISPLAY_DOCNUMBER;',
'		EXCEPTION ',
'			WHEN no_data_found THEN',
'				:P17_LASTNAME_THAI := NULL;',
'				:P17_GIVEN_NAME_THAI := NULL;',
'				:P17_MIDDLE_NAME_THAI := NULL;',
'				:P17_DOCNUMBER_THAI := NULL;',
'				:P17_CITIZENID_THAI := NULL;',
'				:P17_TYPEDPASSPORT := NULL;',
'		END;',
'',
'		-- in case of arrival, get note from last departure entry form',
'		IF :MOVEMENT_ENTRY_EXIT = 0 THEN',
'			BEGIN',
'				l_expirydate := COALESCE(dl_bordercontrol.pkg_common.parse_date(v(''P17_DISPLAY_EXPIRYDATE''), 0, 1, 20, 1)',
'								,dl_bordercontrol.pkg_common.parse_date(v(''P17_DISPLAY_EXPIRYDATE''), 1, 0, 0, 1)',
'								,dl_bordercontrol.pkg_common.tolerant_to_date(v(''P17_DISPLAY_EXPIRYDATE''), ''DD/MM/YYYY''));',
'	',
'				l_extexpirydate := COALESCE(dl_bordercontrol.pkg_common.parse_date(v(''P17_MANUAL_EXPIRYDATE''), 0, 1, 20, 1)',
'								,dl_bordercontrol.pkg_common.parse_date(v(''P17_MANUAL_EXPIRYDATE''), 1, 0, 0, 1)',
'								,dl_bordercontrol.pkg_common.tolerant_to_date(v(''P17_MANUAL_EXPIRYDATE''), ''DD/MM/YYYY''));',
'						',
'				-- last departure with this borderdocument',
'				l_last_entry_form := dl_bordercontrol.dl_movementhandling.get_last_movement(',
'										p_DOCNO          => :P17_DISPLAY_DOCNUMBER',
'										, p_ISSUECTRY    => :P17_NATIONALITY',
'										, p_EXPIRYDATE   => NVL(l_extexpirydate, l_expirydate) ',
'										, p_VALUE        => ''ENTRY_FORM'' -- LAST_MOVEMENT:INS_AT:ENTRY_FORM',
'										, p_EXITFLG      => 1 -- 0:arrival; 1:departure;',
'									);',
'									',
'				IF l_last_entry_form IS NOT NULL THEN',
'					SELECT note',
'					INTO l_note',
'					FROM dl_bordercontrol.entry_forms',
'					WHERE key_value = l_last_entry_form;',
'				END IF;',
'				',
'				IF TRIM(l_note) IS NOT NULL AND TRIM(:P17_LC_ADD_INFO) IS NULL THEN',
'					:P17_LC_ADD_INFO := l_note;',
'				END IF;',
'			EXCEPTION ',
'				WHEN others THEN',
'					:P17_LC_ADD_INFO := NULL;',
'			END;',
'		END IF;',
'	ELSE',
'		:P17_LASTNAME_THAI := NULL;',
'		:P17_GIVEN_NAME_THAI := NULL;',
'		:P17_MIDDLE_NAME_THAI := NULL;',
'		:P17_DOCNUMBER_THAI := NULL;',
'		:P17_CITIZENID_THAI := NULL;',
'		:P17_TYPEDPASSPORT := NULL;',
'	END IF;',
'',
'END;'))
,p_attribute_02=>'P17_NATIONALITY,P17_DISPLAY_DOCNUMBER,P17_DISPLAY_EXPIRYDATE,P17_MANUAL_EXPIRYDATE,P17_LC_ADD_INFO,P17_DISPLAY_DOCCLASS'
,p_attribute_03=>'P17_LASTNAME_THAI ,P17_GIVEN_NAME_THAI,P17_DOCNUMBER_THAI,P17_RESIDENT_TYPE,P17_RESIDENT_NUMBER,P17_LAST_NAME_RI,P17_FIRST_NAME_RI,P17_MIDDLE_NAME_RI,P17_CITIZENID_THAI,P17_MIDDLE_NAME_THAI,P17_LC_ADD_INFO,P17_TYPEDPASSPORT'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
,p_da_action_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'wait for result : Yes',
'Reason: Citizen ID (idCard) is used in BL Demographic request'))
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31426989215354704904)
,p_event_id=>wwv_flow_api.id(31426989057676704902)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let $btn = $("#P17_SHOW_THAI_NAME"), ',
'    isThai = $("#P17_DOCNUMBER_THAI").val() != "", ',
'    typedpassport = $("#P17_TYPEDPASSPORT").val(), ',
'    isInvalid = isThai && $.inArray(typedpassport, ["C", "D", "L"]) != -1;',
'',
'$btn.removeClass("button-data-available alert");',
'',
'$btn',
'.addClass(isThai ? "button-data-available" : "")',
'.addClass(isInvalid ? "alert" : "");',
'',
'if (isInvalid) {',
'    openModal("DIALOG_THAI_INFORMATION");',
'    $("#P17_TYPEDPASSPORT").trigger("change");',
'}',
'',
'setStatusDiv("div_movement_status");'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(31426989348636704905)
,p_name=>'P17_TYPEDPASSPORT: Change'
,p_event_sequence=>1590
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_TYPEDPASSPORT'
,p_condition_element=>'P17_TYPEDPASSPORT'
,p_triggering_condition_type=>'IN_LIST'
,p_triggering_expression=>'C,D,L'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31426989455761704906)
,p_event_id=>wwv_flow_api.id(31426989348636704905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ADD_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'cell-blink-danger cl-bold'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(31426989513281704907)
,p_event_id=>wwv_flow_api.id(31426989348636704905)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'TRIGGERING_ELEMENT'
,p_attribute_01=>'cell-blink-danger cl-bold'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4683851997101328612)
,p_name=>'P17_DISPLAY_DOB: Change'
,p_event_sequence=>1600
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P17_DISPLAY_DOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4683852003312328613)
,p_event_id=>wwv_flow_api.id(4683851997101328612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'let dob = $("#P17_DISPLAY_DOB").val();',
'',
'if (dob.length > 0)',
'$("#P17_DISPLAY_DOB_TEXT").val(dob).trigger("change");'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670353207460126)
,p_process_sequence=>5
,p_process_point=>'AFTER_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint04'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint04'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670474718460127)
,p_process_sequence=>5
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint05'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint05'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670152465460124)
,p_process_sequence=>5
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint02'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint02'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(187700595063290990)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Load Visa and TM6 on Departure'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DL_MOVEMENTHANDLING.Load_Visa_Data_On_Departure(:DG_DOCUMENTNUMBER, :AI_TRANSPORT_MODE, :DG_ENTERMANUAL_NATIONALITY);',
'DL_MOVEMENTHANDLING.Load_Entry_Form_On_Departure(:DG_DOCUMENTNUMBER, :AI_TRANSPORT_MODE, :DG_ENTERMANUAL_NATIONALITY);'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670644496460129)
,p_process_sequence=>5
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint07a'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint07a'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(843325177279446243)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'TAKEOVERMANUALDATA'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    VAR_PASS_VISUAL_FACE BLOB;',
'    VAR_PASS_ICAO_FACE BLOB;',
'    VAR_PASS_VISUALPAGE BLOB;',
'    v_docid varchar2(255);',
'',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - Page '' || v(''APP_PAGE_ID'') || '' PageProcess: TAKEOVERMANUALDATA'';',
'    l_params logger.tab_param;',
'    ',
'begin',
'',
'    -- Logging',
'    logger.log(''START'', l_scope, null, l_params);',
'',
'',
'    -- take over manual entered data',
'    :DG_LASTNAME := :DG_ENTERMANUAL_LASTNAME;',
'    :DG_GIVENNAME := :DG_ENTERMANUAL_FIRSTNAME;',
'    :DG_DOCUMENTNUMBER := :DG_ENTERMANUAL_PASSNUMBER;',
'    :DG_GENDER := :DG_ENTERMANUAL_GENDER;',
'    :DG_ISSUINGSTATECODE := :DG_ENTERMANUAL_ISSUINGCODE;',
'    --SELECT CTRYNAME INTO :DG_ISSUINGSTATENAME FROM ICAOCOUNTRIES WHERE CTRYCD = :DG_ENTERMANUAL_ISSUINGCODE;',
'',
'',
'    select to_char(to_date(:DG_ENTERMANUAL_EXPIRYDATE), ''RRMMDD'') into :DG_EXPIRATIONDATE from dual;',
'    select to_char(to_date(:DG_ENTERMANUAL_DOB), ''RRMMDD'') into :DG_DATEOFBIRTH from dual;',
'',
'    :DG_DOCUMENTCLASSCODE := :DG_ENTERMANUAL_DOCTYPE;',
'',
'',
'',
'    -- manage images from this particular document',
'    v_docid := PKG_BORDERDOCUMENTS.Get_Document(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, to_date(:DG_EXPIRATIONDATE, ''RRMMDD''));',
'    IF (NOT v_docid IS NULL) THEN ',
'        BEGIN',
'            --select PASS_VISUAL_FACE into VAR_PASS_VISUAL_FACE FROM V_BORDEROCUMENTS WHERE BRDDOCID= GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE);',
'            --select PASS_ICAO_FACE into VAR_PASS_ICAO_FACE FROM V_BORDEROCUMENTS WHERE BRDDOCID= GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE);',
'            --select PASS_VISUALPAGE into VAR_PASS_VISUALPAGE FROM V_BORDEROCUMENTS WHERE BRDDOCID= GBD(:DG_DOCUMENTNUMBER, :DG_ISSUINGSTATECODE, :DG_EXPIRATIONDATE);',
'            select PASS_VISUAL_FACE, PASS_ICAO_FACE, PASS_VISUALPAGE into VAR_PASS_VISUAL_FACE, VAR_PASS_ICAO_FACE, VAR_PASS_VISUALPAGE FROM V_BORDEROCUMENTS WHERE BRDDOCID = v_docid;',
'',
'            if PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE'') is null then',
'                APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''PASS_VISUAL_FACE'', p_seq => 1, p_blob001 => VAR_PASS_VISUAL_FACE);',
'            end if;',
'            if PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_ICAO_FACE'') is null then',
'                APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''PASS_ICAO_FACE'',p_seq => 1, p_blob001 => VAR_PASS_ICAO_FACE);',
'            end if;',
'            if PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUALPAGE'') is null then',
'                APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''PASS_VISUALPAGE'',p_seq => 1, p_blob001 => VAR_PASS_VISUALPAGE);',
'            end if;',
'        END;',
'    END IF;',
'',
'',
'    -- Logging',
'    logger.log(''END'', l_scope, null, l_params);',
'',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REQUEST_MANUALPASSPORT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(553285434381444991)
,p_process_sequence=>21
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATEBORDERMOVEMENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
' ret_add number;',
' --trnsport VARCHAR(20);',
' child_lastname VARCHAR(256);',
' child_firstname VARCHAR(256);',
' child_nationality VARCHAR2(256);',
' child_observation VARCHAR(256);',
' child_dob DATE;',
' child_face BLOB;',
' child_sex number;',
' Lcntr NUMBER;',
' l_dummy_bool boolean;',
' l_date date;',
' l_person_type number;',
' l_nationality VARCHAR2(20);',
' l_visa_type VARCHAR2(32);',
' ',
' -- Logger',
' l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - Page '' || v(''APP_PAGE_ID'') || '' PageProcess: CREATEBORDERMOVEMENT'';',
' l_params logger.tab_param;',
' ',
' BEGIN',
' ',
'     -- Logging',
'     logger.log(''START'', l_scope, null, l_params);',
'',
' ',
'     -- M. Langer, 05.11.2018, START Logging added',
'     logger.append_param(l_params, '':P17_MVMNTID'', :P17_MVMNTID);',
'     logger.append_param(l_params, '':P17_BRDDOCID'', :P17_BRDDOCID);',
'     logger.log(''P17 - START Create Border Movement Process'', ''Page Process'', null, l_params);',
'     ',
'     ',
' --select decode(:AI_TRANSPORT_MODE, 0, :TRNSPRTUNITID, 1, :TRNSPRTUNITID_SEA, 2, :TRNSPRTUNITID_LAND, ''n.a.'') into trnsport from dual;',
' ',
' select decode(:P17_IS_CREW_MEMBER, ''Y'', 2, 1) into l_person_type from dual;',
' ',
' BEGIN',
'    SELECT issuectry --nat  /*nat is also being used for stateless*/',
'    INTO l_nationality',
'    FROM dl_bordercontrol.borderdocuments',
'    WHERE brddocid = :P17_BRDDOCID;',
' EXCEPTION',
'    WHEN OTHERS THEN',
'        l_nationality := NULL;',
' END;',
' ',
' select DECODE(l_nationality, ''THA'', DECODE(l_person_type, 2, ''0023'', ''0022''), :P17_VISUM) into l_visa_type from dual;',
' ',
' DL_MOVEMENTHANDLING.Update_Movement(',
'                                p_MVMNTID           => :P17_MVMNTID,',
'                                p_DOCNO             => :DG_DOCUMENTNUMBER,',
'                                p_ISSUECTRY         => :DG_ISSUINGSTATECODE,',
'                                p_EXPIRYDATE        => to_date(:DG_EXPIRATIONDATE,''RRMMDD''),',
'                                p_EXITFLG           => :MOVEMENT_ENTRY_EXIT,',
'                                p_MAX_STAY_DT       => to_date(:P17_VISUM_5,''DD/MM/YYYY''),',
'                                p_OBSERVATION       => :MVT_OBSERVATION,',
'                                p_FACEMATCH         => :P17_FACE_OKAY,',
'                                p_FINGERMATCH       => :P17_FINGERS_OKAY,',
'                                --p_TRNSPRTUNITID     => :TRNSPRTUNITID,    -- M. Langer, 31.10.2018, Anstatt der Flight No muss die Vehicle No übergeben werden',
'                                p_TRNSPRTUNITID     => :TRNSPRTUNITID_SEA,',
'                                p_PERSON_TYPE       => l_person_type, --:P17_TRAVELER_TYPES,',
'                                p_VISA_TYPE         => l_visa_type,',
'                                p_VISA              => null,',
'                                p_INS_TERMINAL      => :AI_TERMINAL_ID,',
'                                p_INS_BORDERPOST    => :AI_BORDERPOST_ID,',
'                                p_DATE_OF_ENTRY     => to_date(NVL(:P17_DATE_OF_ENTRY, TO_CHAR(SYSDATE, ''DD/MM/YYYY HH24:MI'')), ''DD/MM/YYYY HH24:MI''),',
'                                p_VISA_NUMBER       => :P17_VISUM_1,',
'                                p_EXPIRY_DATE_VISA  => :P17_VISUM_5, ',
'                                p_ISSUING_DATE       => :P17_VISUM_3,',
'                                p_ISSUING_PLACE    => :P17_VISUM_2,',
'                                p_ADDITIONAL_INFO   => :P17_VISUM_ADD_INFO,',
'                                p_PERMIT_TYPE       => :P17_PERMIT_TYPE,',
'                                p_PERMIT_EXPIRY_DATE => :P17_PERMIT_EXPIRY,',
'                                p_ENTRY_FORM_NO     => CASE WHEN l_person_type = 2 THEN ''0000000'' ELSE nvl(:P17_TRAVELCARD_NO,:P17_TRAVELCARD_NO_DISPLAY) END,',
'                                p_PROVINCE          => :P17_PROVINCE,',
'                                p_DISTRICT          => :P17_AMPUR,',
'                                p_SUBDISTRICT       => :P17_TAMBON,',
'                                p_ADDRESS           => :P17_LC_ADDRESS,',
'                                p_NOTE              => :P17_LC_ADD_INFO,',
'                                p_FORM_NO_APPROVED  => :P17_PARING_TM_NO,',
'                                p_VISA_MRZ          => NULL,',
'                             --',
'                                p_LIVE_PHOTO        => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''MOVEMENT_PHOTO''),',
'                                p_WSQ_LL            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_LL''),',
'                                p_WSQ_LR            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_LR''),',
'                                p_WSQ_LM            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_LM''),',
'                                p_WSQ_LI            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_LI''),',
'                                p_WSQ_LT            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_LT''),',
'                                p_WSQ_RL            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_RL''),',
'                                p_WSQ_RR            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_RR''),',
'                                p_WSQ_RM            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_RM''),',
'                                p_WSQ_RI            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_RI''),',
'                                p_WSQ_RT            => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_WSQ_RT''),',
'                                p_VISA_IMAGE        => PKG_APEX_UTIL.COLL_Get_BLOB001(''VISA_IMAGE''),',
'                                p_ENTRY_FORM_IMAGE  => PKG_APEX_UTIL.COLL_Get_BLOB001(''LANDINGCARD_IMAGE''),',
'                                p_SCANNED_FLIGHT    => UPPER(:TRNSPRTUNITID), --trnsport,',
'                             --   ',
'                                p_PS_1              => null,                -- PS1 VARCHAR2',
'                                p_PS_2              => null,                -- PS2 VARCHAR2',
'                                p_PS_3              => :P17_SUPERVISOR_NAME,-- PS3 VARCHAR2',
'                                p_PS_4              => NVL(:P17_SUPERVISOR_REASON, :P17_BLACKLIST_CANCEL_REASON), --null, --:P17_SUPERVISOR_REASON,-- PS4 VARCHAR2',
'                                p_PS_5              => :CHECK_BLACKLISTALERT,-- PS5 NUMBER',
'                                p_PS_6              => NULL,                -- PS6 NUMBER',
'                                p_PS_7              => NULL,                -- PS7 NUMBER',
'                                p_PS_8              => NULL,                -- PS8 NUMBER',
'                                p_PS_9              => NULL,                -- PS9 NUMBER',
'                                p_PS_10             => NULL,                -- PS10 NUMBER',
'                                p_PSBLOB_1          => PKG_APEX_UTIL.COLL_Get_BLOB001(''PASS_VISUAL_FACE''),        -- PSBLOB1',
'                                p_PSBLOB_2          => NULL,                -- PSBLOB2',
'                                p_PSBLOB_3          => NULL,                -- PSBLOB3',
'                                p_PSBLOB_4          => NULL,                -- PSBLOB4',
'                                p_PSBLOB_5          => NULL,                -- PSBLOB5',
'                                p_PSBLOB_6          => NULL,                -- PSBLOB6',
'                                p_PSBLOB_7          => NULL,                -- PSBLOB7',
'                                p_PSBLOB_8          => NULL,                -- PSBLOB8',
'                                p_PSBLOB_9          => NULL,                -- PSBLOB9',
'                                p_PSBLOB_10         => NULL,                -- PSBLOB10',
'                                p_TEMPLATE_LL       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LL''),',
'                                p_TEMPLATE_LR       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LR''),',
'                                p_TEMPLATE_LM       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LM''),',
'                                p_TEMPLATE_LI       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LI''),',
'                                p_TEMPLATE_LT       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_LT''),',
'                                p_TEMPLATE_RL       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RL''),',
'                                p_TEMPLATE_RR       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RR''),',
'                                p_TEMPLATE_RM       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RM''),',
'                                p_TEMPLATE_RI       => NULL,                --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RI''),',
'                                p_TEMPLATE_RT       => NULL                 --PKG_APEX_UTIL.COLL_Get_BLOB001(''P17_FP_TEMPLATE_RT'')',
'                                --',
'                                );',
'                                ',
'    if to_char(dl_bordercontrol.pkg_common.Parse_Date( p_DATETEXT => :DG_EXPIRATIONDATE',
'                                                      ,p_MUST_BE_PAST  => 0',
'                                                      ,p_MUST_BE_FUTURE => 1',
'                                                      ,p_YEARLIMIT     => 0',
'                                                      ,p_REVERSEDATE   => 1), ''DD/MM/RRRR'') != :P17_DISPLAY_EXPIRYDATE',
'    then update dl_bordercontrol.borderdocuments ',
'         set MANUAL_EXPIRY_DATE = :P17_DISPLAY_EXPIRYDATE',
'         where BRDDOCID = :P17_BRDDOCID;',
'         commit;',
'   end if;',
'   if :P17_BRDDOCID is not null then',
'       begin',
'           l_date := to_date(:P17_MANUAL_EXPIRYDATE, ''DD/MM/YYYY'');',
'       exception when others then',
'           null;',
'       end;',
'       update',
'           borderdocuments',
'       set',
'           docclass = :P17_DISPLAY_DOCCLASS',
'           , nat = NVL(:P17_STATELESS, issuectry)',
'           , sub_nationality = :P17_SUBNATIONALITY',
'           , manual_expiry_date = l_date',
'       where',
'           brddocid = :P17_BRDDOCID',
'       ;',
'   end if;',
'   if :P17_PERMIT_TYPE is not null then',
'        l_dummy_bool := PKG_REENTRY.INCREASE_REENTRY_USED(:P17_PERMIT_TYPE);',
'   end if;',
'   ',
'    IF TO_NUMBER(NVL(:P17_OVERSTAY_INFO_DAYS, 0)) > 0 THEN',
'       -- insert movement overstay entry',
'       INSERT INTO DL_BORDERCONTROL.MSCS_MOVEMENTS_OVERSTAY',
'       (',
'           MVMNTID,',
'           EXTOVS_DATE,',
'           FLAGOVERSTAY,',
'           FINDOVERSTAYDAYS,',
'           FINDOVERSTAYAMOUNT,',
'           INS_TERMINAL,',
'           INS_BORDERPOST',
'       )',
'       VALUES',
'       (',
'           :P17_MVMNTID --MVMNTID',
'           , (TO_DATE(:P17_OVERSTAY_INFO_EXPIRY_DATE, ''DD/MM/YYYY'') + 1) --EXTOVS_DATE,',
'           , ''Y'' --FLAGOVERSTAY,',
'           , :P17_OVERSTAY_INFO_DAYS --FINDOVERSTAYDAYS,',
'           , LEAST(20000, TO_NUMBER(NVL(:P17_OVERSTAY_INFO_DAYS, 0) * 500)) --FINDOVERSTAYAMOUNT,',
'           , :AI_TERMINAL_ID --INS_TERMINAL,',
'           , :AI_BORDERPOST_ID --INS_BORDERPOST ',
'       );',
'    END IF;',
'   ',
'   -- Merge identities if there were Travel Abis hits and some were marked for merging',
'   pkg_bmbs_apex_util.p17_merge_identities;',
'',
'',
'    -- Logging',
'    logger.log(''END'', l_scope, null, l_params);',
'',
'END;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REQUEST_PROCESSBORDERDOCUMENT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(504468570680245935)
,p_process_sequence=>31
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE_TM5'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - Page '' || v(''APP_PAGE_ID'') || '' PageProcess: CREATE_TM5'';',
'    l_params logger.tab_param;',
'    ',
'    l_tm5_seqno mscs_tm5.tm5_seqno%TYPE;',
'BEGIN',
'    ',
'     -- Logging',
'     logger.log(''START'', l_scope, null, l_params);',
'',
'',
'    IF :P17_IS_CREW_MEMBER = ''Y'' AND :P17_CREW_ADD_REDUCE = ''Y'' THEN',
'    ',
'        logger.append_param(l_params, '':P17_MVMNTID'', :P17_MVMNTID);',
'        logger.append_param(l_params, '':P17_BRDDOCID'', :P17_BRDDOCID);',
'        logger.append_param(l_params, '':MOVEMENT_ENTRY_EXIT'', :MOVEMENT_ENTRY_EXIT);',
'        logger.log(''P17 - START Create TM5 Process'', ''Page Process'', null, l_params);',
'        ',
'        INSERT INTO mscs_tm5',
'        (',
'            indept_seqno, ',
'            instype, ',
'            insstatus, ',
'            flag, ',
'            amount, ',
'            tm2_seqno, ',
'            version, ',
'            actflag, ',
'            chkdept_seqno, ',
'            note, ',
'            guarantor, ',
'            mvmntid, ',
'            ins_terminal, ',
'            ins_borderpost',
'        )',
'        VALUES',
'        (',
'            :P17_TM5_INDEPT_SEQNO_LOOKUP, --indept_seqno, ',
'            :P17_TM5_INSTYPE, --instype, ',
'            ''O'', --insstatus, ',
'            :MOVEMENT_ENTRY_EXIT, --flag; 0 = Decrease , 1 = Increase;',
'            :P17_TM5_AMOUNT, --amount, ',
'            :P17_VEHICLE_DETAIL_TM2_SEQNO, --tm2_seqno, ',
'            0, --version, ',
'            ''Y'', --actflag, ',
'            :P17_TM5_CHKDEPT_SEQNO_LOOKUP, --chkdept_seqno, ',
'            :P17_TM5_NOTE, --note, ',
'            :P17_TM5_GUARANTOR, --guarantor, ',
'            :P17_MVMNTID, --mvmntid, ',
'            :AI_TERMINAL_ID, --ins_terminal, ',
'            :AI_BORDERPOST_ID --ins_borderpost',
'        )',
'        RETURNING TM5_SEQNO INTO l_tm5_seqno;',
'        ',
'        CASE :P17_TM5_INSTYPE',
'            WHEN ''D'' THEN',
'                INSERT INTO mscs_insdept',
'                (',
'                    TM5_SEQNO, GUART_SEQNO, VERSION, ACTFLAG, INS_TERMINAL, INS_BORDERPOST',
'                )',
'                VALUES',
'                (',
'                    l_tm5_seqno, :P17_INSDEPT_GUART_SEQNO, 0, ''Y'', :AI_TERMINAL_ID, :AI_BORDERPOST_ID',
'                );',
'            WHEN ''C'' THEN',
'                INSERT INTO mscs_inscash',
'                (',
'                    TM5_SEQNO, VERSION, ACTFLAG, INS_TERMINAL, INS_BORDERPOST',
'                )',
'                VALUES',
'                (',
'                    l_tm5_seqno, 0, ''Y'', :AI_TERMINAL_ID, :AI_BORDERPOST_ID',
'                );',
'            WHEN ''B'' THEN',
'                INSERT INTO mscs_insbank',
'                (',
'                    TM5_SEQNO, BANKNM, VERSION, ACTFLAG, INS_TERMINAL, INS_BORDERPOST',
'                )',
'                VALUES',
'                (',
'                    l_tm5_seqno, :P17_INSBANK_BANKNM, 0, ''Y'', :AI_TERMINAL_ID, :AI_BORDERPOST_ID',
'                );',
'            WHEN ''A'' THEN',
'                INSERT INTO mscs_insair',
'                (',
'                    TM5_SEQNO, DEPT_AIR, FLIGHTNO, VERSION, ACTFLAG, INS_TERMINAL, INS_BORDERPOST',
'                )',
'                VALUES',
'                (',
'                    l_tm5_seqno, :P17_INSAIR_DEPT_AIR_LOOKUP, :P17_INSAIR_FLIGHTNO, 0, ''Y'', :AI_TERMINAL_ID, :AI_BORDERPOST_ID',
'                );',
'        END CASE;',
'        ',
'        logger.log(''P17 - DONE Create TM5 Process'', ''Page Process'', null, l_params);',
'    ',
'    END IF;',
'    ',
'',
'     -- Logging',
'     logger.log(''END'', l_scope, null, l_params);',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'REQUEST_PROCESSBORDERDOCUMENT'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(570971457216568693)
,p_process_sequence=>41
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear_Page_Items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when_type=>'NEVER'
,p_process_success_message=>'Juhu'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(570971910058589087)
,p_process_sequence=>51
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear_Session_Bag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'',
'    Lcntr number;',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - Page '' || v(''APP_PAGE_ID'') || '' PageProcess: Clear_Session_Bag'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'     -- Logging',
'     logger.log(''START'', l_scope, null, l_params);',
'',
'',
'-- apex_collection.delete_all_collections_session();',
'PKG_APEX_UTIL.COLL_Init(''PASS_AXIAL_IMAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUAL_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_ICAO_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUALPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_UVPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_IRPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_0'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_1'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T1'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T2'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T3'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T4'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T5'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T6'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T7'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T8'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T9'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T10'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''MOVEMENT_PHOTO'');',
'PKG_APEX_UTIL.COLL_Init(''VISA_IMAGE'');',
'PKG_APEX_UTIL.COLL_Init(''LANDINGCARD_IMAGE'');',
'',
'dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''TRAVEL_ABIS_RESULTS'');',
'dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''P17_MERGE_ABIS_IDS'');',
'',
'FOR Lcntr IN 1..20',
'LOOP',
'BEGIN',
'    PKG_APEX_UTIL.COLL_Init(''CHILD_'' || to_char(Lcntr));    ',
'    APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''CHILD_'' || to_char(Lcntr),p_seq => ''1'',p_c050 => ''CHILD_'' || to_char(Lcntr), p_n001 => Lcntr);    ',
'  END;',
'END LOOP;',
'',
'',
'     -- Logging',
'     logger.log(''END'', l_scope, null, l_params);',
'',
'',
'end;'))
,p_process_error_message=>'error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670746615460130)
,p_process_sequence=>61
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint07b'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint07b'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670246925460125)
,p_process_sequence=>5
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint03'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint03'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670054551460123)
,p_process_sequence=>5
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint01'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint01'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792672037738460143)
,p_process_sequence=>7
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear_Session_Blobs'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    Lcntr number;',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - Page '' || v(''APP_PAGE_ID'') || '' PageProcess: '' || ''Clear_Session_Blobs'';',
'    l_params logger.tab_param;',
'   ',
'begin',
' ',
'    -- Logging',
'    logger.log(''START'', l_scope, null, l_params);',
' ',
'    -- apex_collection.delete_all_collections_session();',
'    PKG_APEX_UTIL.COLL_Init(''PASS_AXIAL_IMAGE'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_VISUAL_FACE'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_ICAO_FACE'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_VISUALPAGE'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_UVPAGE'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_IRPAGE'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG3_0'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG3_1'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T1'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T2'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T3'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T4'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T5'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T6'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T7'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T8'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T9'');',
'    PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T10'');',
' ',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
' ',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LL'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LR'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LM'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LI'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LT'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RL'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RR'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RM'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RI'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RT'');',
' ',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LL'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LR'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LM'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LI'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LT'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RL'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RR'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RM'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RI'');',
'    PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RT'');',
' ',
'    PKG_APEX_UTIL.COLL_Init(''MOVEMENT_PHOTO'');',
'    PKG_APEX_UTIL.COLL_Init(''VISA_IMAGE'');',
'    PKG_APEX_UTIL.COLL_Init(''LANDINGCARD_IMAGE'');',
' ',
'    dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''TRAVEL_ABIS_RESULTS'');',
'    dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''P17_MERGE_ABIS_IDS'');',
' ',
'    /*FOR Lcntr IN 1..20',
'    LOOP',
'    BEGIN',
'        PKG_APEX_UTIL.COLL_Init(''CHILD_'' || to_char(Lcntr));   ',
'        APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''CHILD_'' || to_char(Lcntr),p_seq => ''1'',p_c050 => ''CHILD_'' || to_char(Lcntr), p_n001 => Lcntr);   ',
'      END;',
'    END LOOP;*/',
'    ',
'    -- added to avoid deadlock',
'    COMMIT;',
'    ',
'    -- Logging',
'    logger.log(''END'', l_scope, null, l_params);',
'   ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185707899171174909)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set MOVEMENT_ENTRY_EXIT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_mvmntid MOVEMENTS.MVMNTID%type;',
'begin',
'  :MOVEMENT_ENTRY_EXIT := NVL(:AI_LAST_DIRECTION, :AI_DEFAULT_DIRECTION);',
'  if :DG_DOCUMENTNUMBER is not null then',
'  if NVL(:AI_LAST_DIRECTION, :AI_DEFAULT_DIRECTION) = 1 then',
'    begin',
'      select mvmntid',
'      into l_mvmntid',
'      from (select mvmntid',
'              from dl_bordercontrol.movements',
'             where brddocid in (select brddocid',
'                                  from dl_bordercontrol.borderdocuments',
'                                  where docno = :DG_DOCUMENTNUMBER)',
'                and exitflg = 0',
'                order by INS_AT desc)',
'         where ROWNUM = 1;',
'      apex_util.set_session_state(''P17_MISSING_ARIVAL'',0);',
'    exception',
'        when NO_DATA_FOUND',
'        then apex_util.set_session_state(''P17_MISSING_ARIVAL'',1);',
'    end;',
'  else',
'    apex_util.set_session_state(''P17_MISSING_ARIVAL'',0);',
'  end if;',
'  end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(155988067391829742)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear Fellow Passengers Collection'
,p_process_sql_clob=>'PKG_COLLECTIVE_PASSPORT.INIT_TEMP_TABLE(true);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(179719424332037855)
,p_process_sequence=>11
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert_Travel_ABIS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_scope logger_logs.scope%TYPE := ''APEX BmBS (500) - Page '' || v(''APP_PAGE_ID'') || '' PageProcess: '' || ''Insert_Travel_ABIS'';',
'    l_params logger.tab_param;',
'    l_mvmnt_id varchar2(255) := apex_application.g_x01; -- v(''P17_MVMNTID'');',
'    l_brddoc_id varchar2(255) := apex_application.g_x02; -- v(''P17_BRDDOCID'');',
'    l_abis_id number;',
'    l_doc_abis_id number;',
'begin',
'    logger.append_param(l_params, ''l_mvmnt_id'', l_mvmnt_id);',
'    logger.append_param(l_params, ''l_brddoc_id'', l_brddoc_id);',
'    logger.log(''P17 - START Insert Travel ABIS Process'', ''Page Process'', null, l_params);',
'',
'    select max(afisid)',
'      into l_doc_abis_id',
'      from borderdocuments',
'     where brddocid = l_brddoc_id',
'       and afisid is not null;',
'',
'    logger.append_param(l_params, ''l_doc_abis_id'', l_doc_abis_id);',
'    logger.log(''P17 - START Insert Travel ABIS Process - existing abis id'', ''Page Process'', null, l_params);',
'',
'    if l_doc_abis_id is null then',
'        l_abis_id := dl_bordercontrol.pkg_bmbs_apex_util.bmbs_insert_travel_abis_movement(l_mvmnt_id);',
'    end if;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181665868487336798)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LOAD_LIVE_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_status VARCHAR2(300) := ''error'';',
'    l_exp date;',
'    l_datestr varchar2(255 char) := apex_application.g_x02;',
'BEGIN',
'    apex_json.open_object();',
'    ',
'    if length(l_datestr) = 10 then',
'        l_exp := to_date(l_datestr, ''DD/MM/YYYY'');',
'    else',
'        l_exp := nvl(pkg_common.parse_date(l_datestr, 0, 1, 20, 1), pkg_common.parse_date(l_datestr, 1, 0, 0, 1));',
'    end if;',
'    ',
'    DECLARE',
'        l_image DL_BORDERCONTROL.PERSON.IMAGE%type;',
'    BEGIN',
'        select dl_bordercontrol.DL_MOVEMENTHANDLING.GET_LAST_MOVEMENT_BLOB(apex_application.g_x01, l_exp/*to_date(apex_application.g_x02, ''RRMMDD'')*/, apex_application.g_x03, ''LIVE_PHOTO'' ) q ',
'        into l_image',
'        from dual;',
'            ',
'        l_status := ''success'';',
'        if l_image is not null then',
'            apex_json.write(''image'', dl_common.pkg_util.encode_base64(l_image) );',
'        end if;',
'',
'        EXCEPTION when no_data_found then',
'            null;',
'            --No Image Present',
'        when others then',
'            l_status := ''error: '' || sqlerrm;',
'            ',
'    END;',
'',
'    apex_json.write(''status'', l_status);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(181666685742336806)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_BC_DOC_TYPE_IDS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    --apex_json.open_object();',
'    apex_json.open_array();',
'    ',
'    --Doc Types',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.BC_DOC_CLASS) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.BC_DOC_CLASS) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    --Vehicle Type',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.TRANS_VEHICLES) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.TRANS_VEHICLES) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    --Nationality',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.icao_doc_codes) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.icao_doc_codes) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    --Visa Type',
'    apex_json.open_object();',
'    FOR i_type in (SELECT SUBSTR(key_value, -2, 2) AS NUM_VALUE, KEY_VALUE FROM dl_common.VISA_TYPES WHERE is_active = ''Y'') LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT SUBSTR(key_value, -2, 2) AS NUM_VALUE, KEY_VALUE FROM dl_common.VISA_TYPES WHERE is_active = ''Y'') LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    --Permit Type',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.PERMIT_TYPES) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NUM_VALUE, KEY_VALUE FROM dl_common.PERMIT_TYPES) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    -- Provinces',
'    apex_json.open_object();',
'    FOR i_type in (SELECT display_code num_value, KEY_VALUE FROM adm_class_province$lc) LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value)  );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.open_object();',
'    FOR i_type in (SELECT display_code num_value, KEY_VALUE FROM adm_class_province$lc) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value);',
'    END LOOP;',
'    apex_json.close_object();',
'    ',
'    --Nationality with PIBICS country code',
'    apex_json.open_object();',
'    FOR i_type in (SELECT NOTICE$DLC AS NUM_VALUE, KEY_VALUE FROM dl_common.ICAO_DOC_CODES$LC WHERE is_active = ''Y'' AND NOTICE$DLC IS NOT NULL) LOOP',
'        apex_json.write(i_type.num_value, i_type.key_value);',
'    END LOOP;',
'    FOR i_type in (SELECT COUNTRY AS NUM_VALUE, ICAO_CODE AS KEY_VALUE FROM dl_common.COUNTRIES_ICAO_DOC_CODES c WHERE NOT EXISTS (SELECT NULL FROM dl_common.ICAO_DOC_CODES$LC WHERE is_active = ''Y'' AND NOTICE$DLC = c.country)) LOOP',
'        apex_json.write(i_type.num_value, i_type.key_value);',
'    END LOOP;',
'    apex_json.close_object();',
'    ',
'    -- Departments with PIBICS dept code',
'    apex_json.open_object();',
'    FOR i_type in (SELECT dept_seqno AS NUM_VALUE, SUBSTR(deptcd, 3) AS KEY_VALUE FROM dl_bordercontrol.v_department WHERE actflag = ''Y'' AND checkpoint = ''Y'') LOOP',
'        apex_json.write(i_type.key_value, to_char(i_type.num_value));',
'    END LOOP;',
'    apex_json.close_object();',
'    ',
'    apex_json.open_object();',
'    FOR i_type in (SELECT dept_seqno AS NUM_VALUE, SUBSTR(deptcd, 3) AS KEY_VALUE FROM dl_bordercontrol.v_department WHERE actflag = ''Y'' AND checkpoint = ''Y'') LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value);',
'    END LOOP;',
'    apex_json.close_object();',
'    ',
'    --Doc Types',
'    apex_json.open_object();',
'    FOR i_type in (SELECT num_value, notice AS KEY_VALUE FROM dl_common.BC_DOC_CLASS) LOOP',
'        apex_json.write(to_char(i_type.num_value), i_type.key_value );',
'    END LOOP;',
'    apex_json.close_object();',
'',
'    apex_json.close_array();',
'    --apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(185690369440633004)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE_URL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_url      VARCHAR2(2056);  ',
'    l_appid    VARCHAR2(128); -- x01 -- use current app id if null',
'    l_pageid   VARCHAR2(128); -- x02',
'    l_collname VARCHAR2(255); -- x03 -- not in use',
'',
'    -- Currently supporting 2 values: ',
'    -- ABIS (or NULL); ',
'    -- ICPO;',
'    l_url_name VARCHAR2(255); -- x04',
'',
'    l_params   VARCHAR2(500);',
'BEGIN   ',
'',
'    -- get app ID',
'    l_appid := apex_application.g_x01;',
'    IF l_appid IS NULL THEN',
'        l_appid := ''&APP_ID.'';',
'    END IF;',
'',
'    -- get page ID',
'    l_pageid := apex_application.g_x02;',
'',
'    -- get url name',
'    l_url_name := apex_application.g_x04;',
'',
'    IF NVL(l_url_name, ''ABIS'') = ''ABIS'' THEN',
'        l_params := '':P120_BL_INCIDENT_ID,P120_ICPO_INCIDENT_ID:&P17_BLACKLIST_INCIDENT_ID.,&P17_ICPO_INCIDENT_ID.'' ;',
'    END IF;',
'',
'    -- create URL',
'    l_url := APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || l_appid || '':'' || l_pageid || '':&APP_SESSION.::&DEBUG.:RP,'' || l_pageid || l_params, p_checksum_type => ''SESSION'') ;',
'',
'    apex_json.open_object();',
'    apex_json.write(''url'', l_url);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119103838453171002)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_EDIT_LAST_MOVEMENT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'',
'    l_url               VARCHAR2(2056) := ''javascript:void(0);'';  ',
'    l_appid             VARCHAR2(128);',
'    l_pageid            VARCHAR2(128);',
'    l_brddoc_identity   VARCHAR2(32);',
'    l_display_docnumber VARCHAR2(15);',
'    l_nationality       VARCHAR2(20);',
'    l_mvmntid           VARCHAR2(32);',
'    l_is_mvmnt_editable VARCHAR2(1) := ''N'';',
'    ',
'    l_is_page_allowed   BOOLEAN := FALSE;',
'    l_is_supervisor     VARCHAR2(1) := ''N'';',
'    ',
'BEGIN   ',
'',
'    l_appid := apex_application.g_x01;',
'    IF l_appid IS NULL then',
'        l_appid := ''&APP_ID.'';',
'    END IF;',
'    ',
'    l_pageid := apex_application.g_x02;',
'    l_is_page_allowed := USER_MANAGEMENT.pkg_authorization.APEX_IS_PAGE_ALLOWED(i_app_name => v(''APP_ALIAS''), i_page_id => l_pageid);',
'    ',
'    IF NOT l_is_page_allowed THEN',
'        GOTO p17_lbl_page_not_allowed;',
'    ELSE',
'        BEGIN',
'            SELECT ''Y''',
'            INTO l_is_supervisor',
'            FROM dual',
'            WHERE EXISTS ',
'            (',
'                SELECT 1',
'                FROM user_management.role_object_grant_rel rogr',
'                JOIN USER_MANAGEMENT.USER_ROLE_REL urr on rogr.role_id = urr.role_id',
'                JOIN user_management.users u on u.id = user_id',
'                JOIN user_management.OBJECT_GRANT_REL ogr on ogr.id = rogr.OBJECT_GRANT_REL_ID',
'                WHERE u.username = UPPER(:APP_USER)',
'                AND urr.role_id = ''BMBS_SUP''',
'            );',
'        EXCEPTION',
'            WHEN OTHERS THEN',
'                NULL;',
'        END;',
'    END IF;',
'    ',
'    l_brddoc_identity := apex_application.g_x03;',
'    l_display_docnumber := apex_application.g_x04;',
'    l_nationality := apex_application.g_x05;',
'    ',
'    BEGIN',
'        SELECT ',
'            CASE ',
'                WHEN ',
'                    source_system = 1',
'                    AND date_of_entry BETWEEN SYSDATE - 1 AND SYSDATE',
'                    AND ',
'                    (',
'                        TRIM(SUBSTR(ins_by, 1, INSTR(ins_by, '' '') - 1)) = UPPER(:APP_USER)',
'                        OR',
'                        l_is_supervisor = ''Y''',
'                    )',
'                    --AND ins_terminal = :AI_TERMINAL_ID',
'                    AND ins_borderpost = :AI_BORDERPOST_ID',
'                    THEN mvmntid',
'                ELSE NULL',
'            END',
'        INTO l_mvmntid',
'        FROM ',
'        (',
'            SELECT *',
'            FROM dl_bordercontrol.movements',
'            WHERE brddocid IN ',
'            (',
'                SELECT bd.brddocid ',
'                FROM dl_bordercontrol.borderdocuments bd, dl_bordercontrol.identities i',
'                WHERE bd.brddocid = i.brddocid',
'                AND ',
'                (',
'                    (',
'                        l_brddoc_identity IS NULL ',
'                        AND bd.docno = l_display_docnumber',
'                        AND bd.issuectry = l_nationality',
'                    )',
'                    OR ',
'                    (',
'                        l_brddoc_identity IS NOT NULL',
'                        AND i.identity = l_brddoc_identity',
'                    )',
'                )',
'            )',
'            AND is_finished = ''Y''',
'            ORDER BY date_of_entry DESC NULLS LAST',
'        )',
'        WHERE ROWNUM = 1;',
'    EXCEPTION',
'        WHEN OTHERS THEN',
'            l_mvmntid := NULL;',
'    END;',
'    ',
'    IF l_mvmntid IS NOT NULL THEN',
'        l_is_mvmnt_editable := ''Y'';',
'        l_url := APEX_UTIL.PREPARE_URL(p_url => ''f?p=''|| l_appid || '':'' || l_pageid || '':&APP_SESSION.::&DEBUG.:RP,'' || l_pageid || '':P4020_FP,P4020_MVMNTID:&APP_PAGE_ID.,'' || l_mvmntid, p_checksum_type => ''SESSION''); ',
'    ELSE',
'        l_is_mvmnt_editable := ''N'';',
'    END IF;',
'    ',
'    <<p17_lbl_page_not_allowed>>',
'    apex_json.open_object();',
'    apex_json.write(''is_mvmnt_editable'', l_is_mvmnt_editable);',
'    apex_json.write(''url'', l_url);',
'    apex_json.close_object();',
'    ',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(119108037102171044)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_GET_COLL_COUNT'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_coll_name         VARCHAR2(200);',
'    l_coll_count        NUMBER := 0;',
'BEGIN   ',
'    l_coll_name := apex_application.g_x01;',
'',
'    IF l_coll_name IS NOT NULL AND APEX_COLLECTION.COLLECTION_EXISTS(l_coll_name) THEN',
'        IF UPPER(l_coll_name) IN (''VISA_IMAGE'', ''LANDINGCARD_IMAGE'') THEN',
'            BEGIN',
'                SELECT NVL(dbms_lob.getlength(t.BLOB001), 0)',
'                INTO l_coll_count',
'                FROM APEX_COLLECTIONS t',
'                WHERE t.COLLECTION_NAME = l_coll_name;',
'            EXCEPTION',
'                WHEN OTHERS THEN',
'                    NULL;',
'            END;',
'        ELSE',
'            l_coll_count := APEX_COLLECTION.COLLECTION_MEMBER_COUNT(l_coll_name);',
'        END IF;',
'    END IF;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''coll_name'', l_coll_name);',
'    apex_json.write(''coll_count'', l_coll_count);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(504468758767245937)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_FLIGHT_NUM'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_flight_num    VARCHAR2(50) := UPPER(TRIM(apex_application.g_x01));',
'    l_direction     VARCHAR2(50) := apex_application.g_x02;',
'    l_borderpost    VARCHAR2(50) := apex_application.g_x03;',
'    l_flight_exists VARCHAR2(1) := ''N'';',
'BEGIN       ',
'    IF l_flight_num IS NOT NULL THEN',
'        SELECT ',
'            CASE',
'                WHEN EXISTS',
'                (',
'                    SELECT NULL',
'                    FROM flights',
'                    WHERE active = 1',
'                    AND flightnum = l_flight_num',
'                    AND ins_borderpost = NVL(l_borderpost, ins_borderpost)',
'                    AND directionflg = NVL(l_direction, directionflg)',
'                )',
'                THEN ''Y''',
'                ELSE ''N''',
'            END',
'        INTO l_flight_exists',
'        FROM DUAL;',
'    END IF;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''flight_num'', l_flight_num);',
'    apex_json.write(''flight_num_exists'', l_flight_exists);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792671519786460138)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_BLACKLIST_DEMOGRAPHIC'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_request_clob       CLOB := apex_application.g_x01;',
'    l_mvmntid            VARCHAR2(32) := apex_application.g_x02;',
'    l_user               VARCHAR2(50) := apex_application.g_x03;',
'    l_is_pib_conn_active NUMBER := TO_NUMBER(NVL(apex_application.g_x04, 0));',
'    --',
'    l_response_clob      CLOB := empty_clob();',
'    l_js_status          JSON_OBJECT_T;',
'    -- logger',
'    l_scope              logger_logs.scope%TYPE := ''APEX BmBS (500) - Page 17 AjaxCallback: CHECK_BLACKLIST_DEMOGRAPHIC'';',
'    l_params             logger.tab_param;',
'BEGIN',
'    IF l_request_clob IS NOT NULL /*AND l_is_pib_conn_active = 1*/ THEN',
'        l_response_clob := DL_INTERFACE.pkg_webservices_blacklist.search_BLDemographic_system(',
'                                p_request_clob  => l_request_clob',
'                                ,p_user         => l_user',
'                                ,p_system       => ''BmBS - DEMOGRAPHIC''',
'                                ,p_object_id    => l_mvmntid);',
'    /*ELSIF l_is_pib_conn_active != 1 THEN',
'        -- custom output',
'        l_js_status := JSON_OBJECT_T();',
'        l_js_status.put(''code'', ''ERROR'');',
'        l_js_status.put(''message'', ''PIBICS not accessible.'');',
'        l_js_status.put(''stack'', ''PIBICS not accessible. Custom check checkPibicsConn on BmBS P17.'');',
'        l_response_clob :=  ''{''',
'                            || ''"status":'' || l_js_status.Stringify() ',
'                            || '',"candidates":[]'' ',
'                            || ''}'';',
'',
'        -- logging',
'        logger.append_param(l_params, ''l_mvmntid'', l_mvmntid);',
'        logger.append_param(l_params, ''l_user'', l_user);',
'        logger.append_param(l_params, ''l_is_pib_conn_active'', l_is_pib_conn_active);',
'        logger.append_param(l_params, ''l_request_clob'', DBMS_LOB.SUBSTR(l_request_clob, 4000, 1));',
'        logger.append_param(l_params, ''l_response_clob'', DBMS_LOB.SUBSTR(l_response_clob, 4000, 1));',
'        logger.log(''SEARCH BLDEMOGRAPHIC SYSTEM: ALERT'', l_scope, NULL, l_params);*/',
'    END IF;',
'',
'    htp.prn(l_response_clob);',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2729913451716547132)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_SESSION_STATUS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_sysdate DATE;',
'BEGIN       ',
'    SELECT SYSDATE ',
'    INTO l_sysdate',
'    FROM DUAL;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''sysdate'', l_sysdate);',
'    apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2842097448405083634)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'__CHECK_PIBICS_CONN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE  ',
'    l_count NUMBER;',
'    l_pibics_prod_enabled NUMBER := 0;',
'BEGIN       ',
'    l_pibics_prod_enabled := TO_NUMBER(NVL(dl_bordercontrol.pkg_common.Get_Parameter(''PIBICS_PROD_ENABLED''), 0));',
'    ',
'    IF l_pibics_prod_enabled = 1 THEN',
'        EXECUTE IMMEDIATE ''SELECT COUNT(1) FROM dl_bordercontrol.v_pibics_conn_prod'' INTO l_count;',
'    END IF;',
'    ',
'    apex_json.open_object();',
'    apex_json.write(''is_pibics_prod_enabled'', l_pibics_prod_enabled);',
'    apex_json.write(''is_conn_active'', CASE WHEN l_pibics_prod_enabled = 1 THEN 1 ELSE 0 END);',
'    apex_json.close_object();',
'EXCEPTION',
'    -- for all TNS errors',
'    WHEN OTHERS THEN',
'        apex_json.open_object();',
'        apex_json.write(''is_pibics_prod_enabled'', l_pibics_prod_enabled);',
'        apex_json.write(''is_conn_active'', 0);',
'        apex_json.close_object();',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(861694604178449857)
,p_process_sequence=>110
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CLEAR_FINGERPRINTS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RT'');',
'',
':P17_FP_CAPTURED := 0;',
':P17_FP_QUALITY_RT := NULL;',
':P17_FP_QUALITY_RI := NULL;',
':P17_FP_QUALITY_RM := NULL;',
':P17_FP_QUALITY_RR := NULL;',
':P17_FP_QUALITY_RL := NULL;',
':P17_FP_QUALITY_LT := NULL;',
':P17_FP_QUALITY_LI := NULL;',
':P17_FP_QUALITY_LM := NULL;',
':P17_FP_QUALITY_LR := NULL;',
':P17_FP_QUALITY_LL := NULL;'))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(883938213294125582)
,p_process_sequence=>120
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CLEAR_VISA_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''VISA_IMAGE'');',
''))
,p_process_error_message=>'error'
,p_process_success_message=>'success'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(884732325685720597)
,p_process_sequence=>130
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CLEAR_LC_IMAGE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''LANDINGCARD_IMAGE'');',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(951323563819419441)
,p_process_sequence=>140
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_CLEAR_SCANPHOTO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUAL_FACE'');',
''))
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(186861380796161696)
,p_process_sequence=>150
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PROC_LOAD_RECENT_FINGERS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_fp01 blob;',
'  v_fp02 blob;',
'  v_fp03 blob;',
'  v_fp04 blob;',
'  v_fp05 blob;',
'  v_fp06 blob;',
'  v_fp07 blob;',
'  v_fp08 blob;',
'  v_fp09 blob;',
'  v_fp10 blob;',
'  v_ret01 clob;',
'  v_ret02 clob;',
'  v_ret03 clob;',
'  v_ret04 clob;',
'  v_ret05 clob;',
'  v_ret06 clob;',
'  v_ret07 clob;',
'  v_ret08 clob;',
'  v_ret09 clob;',
'  v_ret10 clob;',
'  cursor c_movements is ',
'    select',
'        template_rt fp01',
'      , template_ri fp02',
'      , template_rm fp03',
'      , template_rr fp04',
'      , template_rl fp05',
'      , template_lt fp06',
'      , template_li fp07',
'      , template_lm fp08',
'      , template_lr fp09',
'      , template_ll fp10',
'    from',
'      v_movements',
'    where',
'      brddocid = :P17_BRDDOCID',
'      and is_finished = ''Y''',
'    order by',
'      ins_at desc;',
'  v_cnt number;',
'  FUNCTION base64encode(p_blob IN BLOB)',
'    RETURN CLOB',
'  IS',
'    l_clob CLOB;',
'    l_step PLS_INTEGER := 12000; -- make sure you set a multiple of 3 not higher than 24573',
'    l_temp VARCHAR2(32000);',
'    l_size NUMBER;',
'    l_pos NUMBER;',
'    l_remaining NUMBER;',
'    l_read NUMBER;',
'    l_outsize NUMBER;',
'  BEGIN',
'    IF p_blob IS NULL THEN',
'      RETURN NULL;',
'    END IF;',
'    l_size := dbms_lob.getlength(p_blob);',
'    l_pos := 0;',
'    while l_pos < l_size loop',
'      l_read := l_size - l_pos;',
'      if l_read > l_step then',
'        l_read := l_step;',
'      end if;',
'      l_clob := l_clob || replace(replace(utl_raw.cast_to_varchar2(utl_encode.base64_encode(dbms_lob.substr(p_blob, l_read, l_pos + 1))), chr(13)), chr(10));',
'      l_outsize := dbms_lob.getlength(l_clob);',
'      l_pos := l_pos + l_read;',
'    end loop;',
'    RETURN l_clob;',
'  END;',
'begin',
'  v_cnt := 0;',
'  open c_movements;',
'  loop',
'    fetch c_movements into v_fp01, v_fp02, v_fp03, v_fp04, v_fp05, v_fp06, v_fp07, v_fp08, v_fp09, v_fp10;',
'    exit when c_movements%notfound;',
'    if v_fp01 is not null and v_ret01 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret01 := base64encode(v_fp01);',
'    end if;',
'    if v_fp02 is not null and v_ret02 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret02 := base64encode(v_fp02);',
'    end if;',
'    if v_fp03 is not null and v_ret03 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret03 := base64encode(v_fp03);',
'    end if;',
'    if v_fp04 is not null and v_ret04 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret04 := base64encode(v_fp04);',
'    end if;',
'    if v_fp05 is not null and v_ret05 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret05 := base64encode(v_fp05);',
'    end if;',
'    if v_fp06 is not null and v_ret06 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret06 := base64encode(v_fp06);',
'    end if;',
'    if v_fp07 is not null and v_ret07 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret07 := base64encode(v_fp07);',
'    end if;',
'    if v_fp08 is not null and v_ret08 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret08 := base64encode(v_fp08);',
'    end if;',
'    if v_fp09 is not null and v_ret09 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret09 := base64encode(v_fp09);',
'    end if;',
'    if v_fp10 is not null and v_ret10 is null then',
'      v_cnt := v_cnt + 1;',
'      v_ret10 := base64encode(v_fp10);',
'    end if;',
'    if v_cnt > 9 then',
'      exit;',
'    end if;',
'  end loop;',
'  close c_movements;',
'  apex_json.open_object;',
'  apex_json.write(''fp01'', v_ret01);',
'  apex_json.write(''fp02'', v_ret02);',
'  apex_json.write(''fp03'', v_ret03);',
'  apex_json.write(''fp04'', v_ret04);',
'  apex_json.write(''fp05'', v_ret05);',
'  apex_json.write(''fp06'', v_ret06);',
'  apex_json.write(''fp07'', v_ret07);',
'  apex_json.write(''fp08'', v_ret08);',
'  apex_json.write(''fp09'', v_ret09);',
'  apex_json.write(''fp10'', v_ret10);',
'  apex_json.close_object;',
'exception when others then',
'  close c_movements;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(108034095441098013)
,p_process_sequence=>160
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_NEED_LANDCARD'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'',
'  dl_bordercontrol.dl_movementhandling.check_need_landcard(p_nationality => apex_application.g_x01',
'                                                          ,p_direction => :MOVEMENT_ENTRY_EXIT);',
'',
'END;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(133526796898270507)
,p_process_sequence=>170
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_ACTIVE_CASES'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    apex_json.open_array();',
'    for c_row in (select',
'        DISTINCT ci.identity',
'    from',
'        JSON_TABLE(apex_application.g_x01, ''$[*]''',
'                   columns',
'                   id varchar2(512 char) path ''$.id''',
'                  ) jt',
'        join blacklist_case_identities ci on ci.identity = jt.id',
'        join blacklist_cases bc ON bc.id = ci.blacklist_case and bc.is_active = ''Y''',
'        join dl_blacklist.identities i ON i.key_value = ci.identity and i.is_active = ''Y''',
'        left join dl_blacklist.travel_docs d on d.identity = ci.identity',
'        where ',
'            nvl(bc.reason, ''~'') != ''76'' -- 76: LOST PASSPORT',
'            or ',
'            (',
'                bc.reason = ''76'' ',
'                and ',
'                (d.doc_number = :P17_DISPLAY_DOCNUMBER or INSTR(i.notice, :P17_DISPLAY_DOCNUMBER) > 0)',
'            )',
'    ) loop',
'        apex_json.write(c_row.identity);',
'    end loop;',
'    apex_json.close_array();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(170741365918646642)
,p_process_sequence=>180
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CHECK_VISA_RUN'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_year number := 2018;',
'  v_docno varchar2(255) := apex_application.g_x01;--''EX30DEV'';',
'  v_issuingcountry varchar2(3) := apex_application.g_x02;--''D'';',
'  v_expirydate varchar2(6) := apex_application.g_x03;--''210101'';',
'  v_expiry_dt date := to_date(v_expirydate, ''RRMMDD'');',
'  v_brddocid varchar2(32) := pkg_borderdocuments.get_document(v_docno, v_issuingcountry, v_expiry_dt);',
'  v_visa_name varchar2(255);',
'  ',
'  function is_visa_run(p_brddocid in varchar2, p_visa_keyvalue in varchar2) return number as',
'    v_prev_movement varchar2(32);',
'    v_prev_exitflg number := 0;',
'    v_prev_movement_dt date;',
'    v_prev_visa_type number := 0;',
'    v_span number := 0;',
'    v_overstay_each_cnt number := 0;',
'    v_stay_cnt number := 0;',
'    v_stay_sum number := 0;',
'    v_stay_excluded_sum number := 0;',
'    v_overstay_days number := 0;',
'    v_span_excluded_overstay number := 0;',
'    v_overstay_excluded_each_cnt number := 0;',
'    v_visa_run boolean := false;',
'    ',
'    function get_prev_movement(p_mvmntid in varchar2) return varchar2 as',
'      v_mvmntid varchar2(32) := null;',
'    begin',
'      select max(mvmntid) into v_mvmntid from (',
'        select mvmntid from (',
'          select',
'            m2.mvmntid',
'          from',
'            movements m1',
'            , movements m2',
'          where',
'            m1.mvmntid = p_mvmntid',
'            and m1.brddocid = m2.brddocid',
'            and m2.ins_at < m1.ins_at',
'            and m2.is_finished = ''Y''',
'          order by m2.ins_at desc nulls last',
'        )',
'        where rownum < 2',
'      );',
'      return v_mvmntid;',
'    end;',
'    ',
'  begin',
'    if v_issuingcountry = ''THA'' then',
'      return 0;',
'    end if;',
'    for c_visa in (select * from x_visarun_rules where visa_keyvalue = p_visa_keyvalue) loop',
'      v_span := 0;',
'      v_overstay_each_cnt := 0;',
'      v_stay_cnt := 0;',
'      v_stay_sum := 0;',
'      v_stay_excluded_sum := 0;',
'      v_overstay_days := 0;',
'      v_span_excluded_overstay := 0;',
'      v_overstay_excluded_each_cnt := 0;',
'      v_visa_run := false;',
'      for c_departures in (',
'        select',
'          *',
'        from',
'          movements',
'        where',
'          movements.brddocid = v_brddocid',
'          and is_finished = ''Y''',
'          and movement_dt >= to_date(''01/01/'' || v_year, ''DD/MM/YYYY'')',
'          and movement_dt < to_date(''01/01/'' || (v_year + 1), ''DD/MM/YYYY'')',
'          and movements.exitflg = 1',
'        order by',
'          movement_dt asc nulls last',
'      ) loop',
'        --dbms_output.put_line(chr(13) || chr(10) || ''got movement - '' || to_char(c_departures.movement_dt, ''DD/MM/YYYY HH24:MI:SS''));',
'        v_visa_run := true;',
'        v_prev_movement := get_prev_movement(c_departures.mvmntid);',
'        if length(v_prev_movement) > 0 then',
'          select exitflg, movement_dt, visa_type into v_prev_exitflg, v_prev_movement_dt, v_prev_visa_type from movements where mvmntid = v_prev_movement;',
'          --dbms_output.put_line(chr(13) || chr(10) || ''got prev movement - '' || v_prev_visa_type);',
'          if v_prev_exitflg = 0 and v_prev_visa_type = p_visa_keyvalue then',
'            --dbms_output.put_line(chr(13) || chr(10) || ''got arrival'');',
'            select greatest(0, (trunc(c_departures.max_stay_dt) - trunc(v_prev_movement_dt) - vt.permit_days)) into v_overstay_days from dl_common.visa_types vt where key_value = c_visa.visa_keyvalue;',
'            v_stay_cnt := v_stay_cnt + 1;',
'            v_span := ceil(c_departures.movement_dt - v_prev_movement_dt);',
'            v_span_excluded_overstay := /*v_span_excluded_overstay +*/ v_span - v_overstay_days;',
'            --dbms_output.put_line(''Arrival: '' || to_char(v_prev_movement_dt, ''DD/MM/YYYY'') || '' | Departure: '' || to_char(c_departures.date_of_entry, ''DD/MM/YYYY'') || '' | '' || v_span || '' day(s)'');',
'            v_stay_sum := v_stay_sum + v_span;',
'            v_stay_excluded_sum := v_stay_excluded_sum + v_span_excluded_overstay;',
'            if v_span > c_visa.max_days_each then',
'              v_overstay_each_cnt := v_overstay_each_cnt + 1;',
'            end if;',
'            if v_span_excluded_overstay > c_visa.max_days_each then',
'              v_overstay_excluded_each_cnt := v_overstay_excluded_each_cnt + 1;',
'            end if;',
'          end if;',
'        end if;',
'      end loop;',
'      /*dbms_output.put_line(chr(13) || chr(10) || ''v_stay_cnt: '' || v_stay_cnt);',
'      dbms_output.put_line(''v_overstay_each_cnt: '' || v_overstay_each_cnt);',
'      dbms_output.put_line(''include extended stay each: '' || c_visa.include_extstay_each);',
'      dbms_output.put_line(''v_overstay_excluded_each_cnt: '' || v_overstay_excluded_each_cnt);',
'      dbms_output.put_line(''max use year: '' || c_visa.max_use_per_year);',
'      dbms_output.put_line(''max days per year: '' || c_visa.max_days_total);',
'      dbms_output.put_line(''v_stay_sum: '' || v_stay_sum);',
'      dbms_output.put_line(''v_stay_excluded_sum: '' || v_stay_excluded_sum);*/',
'      v_visa_run := v_visa_run and (v_stay_cnt > c_visa.max_use_per_year);',
'      v_visa_run := v_visa_run and (',
'             (c_visa.include_extstay_each = 1 and v_overstay_each_cnt > 0 and v_overstay_each_cnt = v_stay_cnt)',
'          or (c_visa.include_extstay_each = 0 and v_overstay_excluded_each_cnt > 0 and v_overstay_excluded_each_cnt = v_stay_cnt)',
'          or (c_visa.include_extstay_total = 1 and v_stay_sum > c_visa.max_days_total)',
'          or (c_visa.include_extstay_total = 0 and v_stay_excluded_sum > c_visa.max_days_total)',
'      );',
'    end loop;',
'    ',
'    if v_visa_run then',
'      return 1;',
'    else',
'      return 0;',
'    end if;',
'  end;',
'begin',
'  apex_json.open_array();',
'  /*apex_json.write(v_docno);',
'  apex_json.write(v_issuingcountry);',
'  apex_json.write(v_expirydate);*/',
'      /*apex_json.open_object();',
'      apex_json.write(''visa_type'', 11);',
'      apex_json.write(''visa_name'', ''EX30'');',
'      apex_json.close_object();*/',
'  for c_visa in (',
'    select',
'      *',
'    from',
'      x_visarun_rules',
'  ) loop',
'    if is_visa_run(v_brddocid, c_visa.visa_keyvalue) > 0 then',
'      select max(display_value) into v_visa_name from visa_name where key_value = c_visa.visa_keyvalue and rownum < 2;',
'      apex_json.open_object();',
'      apex_json.write(''visa_type'', c_visa.visa_keyvalue);',
'      apex_json.write(''visa_name'', v_visa_name);',
'      apex_json.close_object();',
'      --dbms_output.put_line(''VISA RUN!'');',
'    end if;',
'  end loop;',
'  apex_json.close_array();',
'end;',
'',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(165602886836467923)
,p_process_sequence=>190
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear_All_Page_Items'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(165602936002467924)
,p_process_sequence=>200
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Clear_All_Session_Bag'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'Lcntr number;',
'begin',
'-- apex_collection.delete_all_collections_session();',
'PKG_APEX_UTIL.COLL_Init(''PASS_AXIAL_IMAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUAL_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_ICAO_FACE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_VISUALPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_UVPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_IRPAGE'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_0'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG3_1'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T1'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T2'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T3'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T4'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T5'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T6'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T7'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T8'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T9'');',
'PKG_APEX_UTIL.COLL_Init(''PASS_DG13_T10'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_IMAGE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_WSQ_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_LT'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RL'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RR'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RM'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RI'');',
'PKG_APEX_UTIL.COLL_Init(''P17_FP_TEMPLATE_RT'');',
'',
'PKG_APEX_UTIL.COLL_Init(''MOVEMENT_PHOTO'');',
'PKG_APEX_UTIL.COLL_Init(''VISA_IMAGE'');',
'PKG_APEX_UTIL.COLL_Init(''LANDINGCARD_IMAGE'');',
'',
'FOR Lcntr IN 1..20',
'LOOP',
'BEGIN',
'    PKG_APEX_UTIL.COLL_Init(''CHILD_'' || to_char(Lcntr));    ',
'    APEX_COLLECTION.UPDATE_MEMBER(p_collection_name => ''CHILD_'' || to_char(Lcntr),p_seq => ''1'',p_c050 => ''CHILD_'' || to_char(Lcntr), p_n001 => Lcntr);    ',
'  END;',
'END LOOP;',
'end;'))
,p_process_error_message=>'error'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(159276491154564124)
,p_process_sequence=>210
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SEARCH_TRAVEL_ABIS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_mvmnt_id varchar2(255) := v(''P17_MVMNTID'');',
'    l_brddoc_id varchar2(255) := v(''P17_BRDDOCID'');',
'    ',
'    l_face blob := null;',
'    ',
'    l_fp01 blob := null;',
'    l_fp02 blob := null;',
'    l_fp03 blob := null;',
'    l_fp04 blob := null;',
'    l_fp05 blob := null;',
'    l_fp06 blob := null;',
'    l_fp07 blob := null;',
'    l_fp08 blob := null;',
'    l_fp09 blob := null;',
'    l_fp10 blob := null;',
'    ',
'    l_request_abisid number := null;',
'    ',
'    l_found_abisid   wwv_flow_global.n_arr;',
'    l_found_score    wwv_flow_global.n_arr;',
'    l_found_type     wwv_flow_global.vc_arr2;',
'    l_found_percent  wwv_flow_global.n_arr;',
'    l_found_expected wwv_flow_global.n_arr;',
'begin',
'    null;',
'    if l_brddoc_id is not null then',
'        select afisid into l_request_abisid from borderdocuments where brddocid = l_brddoc_id;',
'    end if;',
'    apex_json.open_object;',
'    begin',
'        select LIVE_PHOTO',
'             , WSQ_RT',
'             , WSQ_RI',
'             , WSQ_RM',
'             , WSQ_RR',
'             , WSQ_RL',
'             , WSQ_LT',
'             , WSQ_LI',
'             , WSQ_LM',
'             , WSQ_LR',
'             , WSQ_LL',
'          into l_face',
'             , l_fp01',
'             , l_fp02',
'             , l_fp03',
'             , l_fp04',
'             , l_fp05',
'             , l_fp06',
'             , l_fp07',
'             , l_fp08',
'             , l_fp09',
'             , l_fp10',
'          from movements_blob',
'         where mvmnt_id = l_mvmnt_id;',
'    exception when NO_DATA_FOUND then',
'        apex_json.write(''error'', ''No biometric data found for movement ID '' || l_mvmnt_id);',
'        apex_json.close_object;',
'        return;',
'    end;',
'    ',
'    -- Clear existing decision for merging of identities',
'    dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''P17_MERGE_ABIS_IDS'');',
'    COMMIT;',
'    ',
'    with',
'    request_doc_id as (',
'      select l_brddoc_id brddocid from dual',
'    ),',
'    request_identity as (',
'      select i.identity from identities i, request_doc_id rdi where i.brddocid = rdi.brddocid',
'    ),',
'    expected_doc_id as (',
'      select i.brddocid from identities i, request_identity ri where i.identity = ri.identity',
'    ),',
'    expected_abis_ids as (',
'      select bd.afisid abis_id from borderdocuments bd, expected_doc_id edi where bd.brddocid = edi.brddocid',
'    ),',
'    abis_results as (',
'      select abisid',
'           , score',
'           , score_percentage',
'           , score_type',
'        from table(pkg_abis_util.abis_search(',
'          l_face, l_fp01, l_fp02, l_fp03, l_fp04, l_fp05, l_fp06, l_fp07, l_fp08, l_fp09, l_fp10',
'        ))',
'    )',
'    select ar.abisid',
'         , ar.score',
'         , ar.score_percentage',
'         , ar.score_type',
'         , nvl((select 1 from expected_abis_ids eai where eai.abis_id = ar.abisid), 0) is_expected',
'      bulk collect into',
'          l_found_abisid',
'        , l_found_score',
'        , l_found_percent',
'        , l_found_type',
'        , l_found_expected',
'      from abis_results ar',
'      join borderdocuments bd on ar.abisid = bd.afisid;',
'    ',
'    dl_common.pkg_apex_util.create_empty_collection(p_collection_name => ''TRAVEL_ABIS_RESULTS'');',
'    COMMIT;',
'    ',
'    if l_found_abisid.count > 0 then',
'        APEX_COLLECTION.ADD_MEMBERS(',
'            p_collection_name  => ''TRAVEL_ABIS_RESULTS''',
'          , p_c001             => l_found_type',
'          , p_n001             => l_found_abisid',
'          , p_n002             => l_found_score',
'          , p_n003             => l_found_percent',
'          , p_n004             => l_found_expected',
'        );',
'        COMMIT;',
'        for i in 1..l_found_expected.count loop',
'            if l_found_expected(i) < 1 then',
'                apex_json.write(''dialogUrl'', APEX_UTIL.PREPARE_URL(p_url => ''f?p=&APP_ID.:140:&APP_SESSION.::NO::'',p_checksum_type => ''SESSION''));',
'                exit;',
'            end if;',
'        end loop;',
'    end if;',
'    ',
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(792670510974460128)
,p_process_sequence=>5
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'LogMeasurementPoint06'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    -- Logger',
'    l_scope logger_logs.scope%TYPE := ''LogMeasurementPoint06'';',
'    l_params logger.tab_param;',
'',
'begin',
'',
'   -- Logging',
'   logger.append_param(l_params, ''APEX_REQUEST'', apex_application.g_request);',
'   logger.log(''LogMeasurementPoint'', l_scope, null, l_params);',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
