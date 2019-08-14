CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_ABIS_UTIL" as

type search_result is record (
    abisid number
  , score number
  , score_percentage number
  , score_type varchar2(255)
);

type tbl_search_result is table of search_result;

type search_row is record (
    abisid number
  , score number
);

type tbl_search_row is table of search_row;

function abis_insert_images(
                p_face in blob
              , p_fp01 in blob
              , p_fp02 in blob
              , p_fp03 in blob
              , p_fp04 in blob
              , p_fp05 in blob
              , p_fp06 in blob
              , p_fp07 in blob
              , p_fp08 in blob
              , p_fp09 in blob
              , p_fp10 in blob
              , p_error in out nocopy clob
            ) return number;

procedure abis_update_images(
                p_abisid in number
              , p_face in blob
              , p_fp01 in blob
              , p_fp02 in blob
              , p_fp03 in blob
              , p_fp04 in blob
              , p_fp05 in blob
              , p_fp06 in blob
              , p_fp07 in blob
              , p_fp08 in blob
              , p_fp09 in blob
              , p_fp10 in blob
            );

procedure abis_delete(
                p_abisid in number
            );

function abis_search(
                p_face in blob
              , p_fp01 in blob
              , p_fp02 in blob
              , p_fp03 in blob
              , p_fp04 in blob
              , p_fp05 in blob
              , p_fp06 in blob
              , p_fp07 in blob
              , p_fp08 in blob
              , p_fp09 in blob
              , p_fp10 in blob
            ) return tbl_search_result pipelined;

function abis_parse_result(p_result in clob) return tbl_search_row pipelined;


  -- m. Langer, 24.11.2018 - for test cases declared build_biometric_json
    function build_biometric_json(
                                    p_face in blob
                                  , p_fp01 in blob
                                  , p_fp02 in blob
                                  , p_fp03 in blob
                                  , p_fp04 in blob
                                  , p_fp05 in blob
                                  , p_fp06 in blob
                                  , p_fp07 in blob
                                  , p_fp08 in blob
                                  , p_fp09 in blob
                                  , p_fp10 in blob
                              ) return clob;

end;
/
