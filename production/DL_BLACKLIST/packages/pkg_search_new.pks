CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BLACKLIST"."PKG_SEARCH_NEW" is
  --
  --
  --
  procedure Check_QRY_Values4Search(p_QRY_SURNAME                 in varchar2
                                   ,p_QRY_MIDDLE_NAME             in varchar2
                                   ,p_QRY_GIVEN_NAME              in varchar2
                                   ,p_QRY_SEX                     in varchar2
                                   ,p_QRY_DATE_OF_BIRTH_F         in varchar2
                                   ,p_QRY_DATE_OF_BIRTH_T         in varchar2
                                   ,p_QRY_NATIONALITY             in varchar2
                                   ,p_QRY_TDT_DOC_NUMBER          in varchar2
                                   ,p_QRY_TDT_DATE_OF_EXPIRY_F    in varchar2
                                   ,p_QRY_TDT_DATE_OF_EXPIRY_T    in varchar2
                                   ,p_QRY_TDT_ISSUING_COUNTRY     in varchar2
                                   ,p_Result_Msg                  out nocopy varchar2
                                   ,p_Result_DATE_OF_BIRTH_F      out nocopy date
                                   ,p_Result_DATE_OF_BIRTH_T      out nocopy date
                                   ,p_Result_TDT_DATE_OF_EXPIRY_F out nocopy date
                                   ,p_Result_TDT_DATE_OF_EXPIRY_T out nocopy date
                                    --
                                    );
  --
  function Check_QRY_Values4Search(p_QRY_SURNAME              in varchar2
                                  ,p_QRY_MIDDLE_NAME          in varchar2
                                  ,p_QRY_GIVEN_NAME           in varchar2
                                  ,p_QRY_SEX                  in varchar2
                                  ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                                  ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                                  ,p_QRY_NATIONALITY          in varchar2
                                  ,p_QRY_TDT_DOC_NUMBER       in varchar2
                                  ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                                  ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                                  ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                                   --
                                   ) return varchar2;
  --
  --
  --
  procedure To_Arguments4Search(p_Req_JSON                 in clob
                               ,p_QRY_SURNAME              out nocopy varchar2
                               ,p_QRY_MIDDLE_NAME          out nocopy varchar2
                               ,p_QRY_GIVEN_NAME           out nocopy varchar2
                               ,p_QRY_SEX                  out nocopy varchar2
                               ,p_QRY_DATE_OF_BIRTH_F      out nocopy varchar2
                               ,p_QRY_DATE_OF_BIRTH_T      out nocopy varchar2
                               ,p_QRY_NATIONALITY          out nocopy varchar2
                               ,p_QRY_TDT_DOC_NUMBER       out nocopy varchar2
                               ,p_QRY_TDT_DATE_OF_EXPIRY_F out nocopy varchar2
                               ,p_QRY_TDT_DATE_OF_EXPIRY_T out nocopy varchar2
                               ,p_QRY_TDT_ISSUING_COUNTRY  out nocopy varchar2
                               ,p_RES_MAX_ROWS             out nocopy pls_integer
                               ,p_RES_MSCORE_ALGORITHM     out nocopy varchar2
                               ,p_RES_SHOW_ROW_NUM         out nocopy pls_integer
                               ,p_RES_SHOW_ROW_CNT         out nocopy pls_integer
                               ,p_RES_SHOW_EXTENDED        out nocopy pls_integer
                               ,p_Query_Type4Where         out nocopy varchar2
                               ,p_Use_Index_Hints          out nocopy pls_integer
                                --
                                );
  --
  --
  --
  function Where4SearchSimple(p_Part                       in pls_integer -- [0..1]
                             ,p_PPQRY_SURNAME              in varchar2
                             ,p_PPQRY_MIDDLE_NAME          in varchar2
                             ,p_PPQRY_GIVEN_NAME           in varchar2
                             ,p_PPQRY_SEX                  in varchar2
                             ,p_PPQRY_DATE_OF_BIRTH_F      in date
                             ,p_PPQRY_DATE_OF_BIRTH_T      in date
                             ,p_PPQRY_NATIONALITY          in varchar2
                             ,p_PPQRY_TDT_DOC_NUMBER       in varchar2
                             ,p_PPQRY_TDT_DATE_OF_EXPIRY_F in date
                             ,p_PPQRY_TDT_DATE_OF_EXPIRY_T in date
                             ,p_PPQRY_TDT_ISSUING_COUNTRY  in varchar2
                             ,p_Query_Type4Where           in varchar2
                             ,p_Use_Index_Hints            in boolean
                              --
                              ) return clob;
  --
  --
  --
  function Where4SearchCandidates(p_Part                       in pls_integer
                                 ,p_PPQRY_SURNAME              in varchar2
                                 ,p_PPQRY_MIDDLE_NAME          in varchar2
                                 ,p_PPQRY_GIVEN_NAME           in varchar2
                                 ,p_PPQRY_SEX                  in varchar2
                                 ,p_PPQRY_DATE_OF_BIRTH_F      in date
                                 ,p_PPQRY_DATE_OF_BIRTH_T      in date
                                 ,p_PPQRY_NATIONALITY          in varchar2
                                 ,p_PPQRY_TDT_DOC_NUMBER       in varchar2
                                 ,p_PPQRY_TDT_DATE_OF_EXPIRY_F in date
                                 ,p_PPQRY_TDT_DATE_OF_EXPIRY_T in date
                                 ,p_PPQRY_TDT_ISSUING_COUNTRY  in varchar2
                                 ,p_Query_Type4Where           in varchar2
                                 ,p_Use_Index_Hints            in boolean
                                  --
                                  ) return clob;
  --
  --
  --
  function SQL4Search(p_Search_Type              in varchar2 -- [SIMPLE|CANDIDATES]
                     ,p_QRY_SURNAME              in varchar2
                     ,p_QRY_MIDDLE_NAME          in varchar2
                     ,p_QRY_GIVEN_NAME           in varchar2
                     ,p_QRY_SEX                  in varchar2
                     ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                     ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                     ,p_QRY_NATIONALITY          in varchar2
                     ,p_QRY_TDT_DOC_NUMBER       in varchar2
                     ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                     ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                     ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                     ,p_RES_MAX_ROWS             in pls_integer default null
                     ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                     ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                     ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                     ,p_RES_SHOW_EXTENDED        in pls_integer default 0 -- on null 0
                     ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                     ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                      --
                      ) return clob;
  --
  --
  --
  function SQL4SearchSimple(p_QRY_SURNAME              in varchar2
                           ,p_QRY_MIDDLE_NAME          in varchar2
                           ,p_QRY_GIVEN_NAME           in varchar2
                           ,p_QRY_SEX                  in varchar2
                           ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                           ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                           ,p_QRY_NATIONALITY          in varchar2
                           ,p_QRY_TDT_DOC_NUMBER       in varchar2
                           ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                           ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                           ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                           ,p_RES_MAX_ROWS             in pls_integer default null
                           ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                           ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                           ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                           ,p_RES_SHOW_EXTENDED        in pls_integer default 0 -- on null 0
                           ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                           ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                            --
                            ) return clob;
  --
  --
  --
  function SearchSimple(p_QRY_SURNAME              in varchar2
                       ,p_QRY_MIDDLE_NAME          in varchar2
                       ,p_QRY_GIVEN_NAME           in varchar2
                       ,p_QRY_SEX                  in varchar2
                       ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                       ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                       ,p_QRY_NATIONALITY          in varchar2
                       ,p_QRY_TDT_DOC_NUMBER       in varchar2
                       ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                       ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                       ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                       ,p_RES_MAX_ROWS             in pls_integer default 1 -- on null 1
                       ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                       ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                       ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                       ,p_RES_SHOW_EXTENDED        in pls_integer default 0 -- on null 0
                       ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                       ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                       ,p_Use_Implementation       in varchar2 default 'DYNAMIC' -- [DYNAMIC|STATIC] on null 'DYNAMIC'
                        --
                        ) return OT_BLT_SEARCH_RESULT;
  --
  --
  --
  function SearchSimple$JSON(p_QRY_SURNAME              in varchar2
                            ,p_QRY_MIDDLE_NAME          in varchar2
                            ,p_QRY_GIVEN_NAME           in varchar2
                            ,p_QRY_SEX                  in varchar2
                            ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                            ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                            ,p_QRY_NATIONALITY          in varchar2
                            ,p_QRY_TDT_DOC_NUMBER       in varchar2
                            ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                            ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                            ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                            ,p_RES_MAX_ROWS             in pls_integer default null
                            ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                            ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                            ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                            ,p_RES_SHOW_EXTENDED        in pls_integer default 0 -- on null 0
                            ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                            ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                             --
                             ) return clob;
  --
  function SearchSimple$JSON(p_Req_JSON in clob
                             --
                             ) return clob;
  --
  --
  --
  function SQL4SearchCandidates(p_QRY_SURNAME              in varchar2
                               ,p_QRY_MIDDLE_NAME          in varchar2
                               ,p_QRY_GIVEN_NAME           in varchar2
                               ,p_QRY_SEX                  in varchar2
                               ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                               ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                               ,p_QRY_NATIONALITY          in varchar2
                               ,p_QRY_TDT_DOC_NUMBER       in varchar2
                               ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                               ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                               ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                               ,p_RES_MAX_ROWS             in pls_integer default null
                               ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                               ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                               ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                               ,p_RES_SHOW_EXTENDED        in pls_integer default 1 -- on null 1
                               ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                               ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                                --
                                ) return clob;
  --
  --
  --
  function SearchCandidates$PL(p_QRY_SURNAME              in varchar2
                              ,p_QRY_MIDDLE_NAME          in varchar2
                              ,p_QRY_GIVEN_NAME           in varchar2
                              ,p_QRY_SEX                  in varchar2
                              ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                              ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                              ,p_QRY_NATIONALITY          in varchar2
                              ,p_QRY_TDT_DOC_NUMBER       in varchar2
                              ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                              ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                              ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                              ,p_RES_MAX_ROWS             in pls_integer default null
                              ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                              ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                              ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                              ,p_RES_SHOW_EXTENDED        in pls_integer default 1 -- on null 1
                              ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                              ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                               --
                               ) return TT_BLT_SEARCH_RESULT
    pipelined;
  --
  --
  --
  function SearchCandidates$JSON(p_QRY_SURNAME              in varchar2
                                ,p_QRY_MIDDLE_NAME          in varchar2
                                ,p_QRY_GIVEN_NAME           in varchar2
                                ,p_QRY_SEX                  in varchar2
                                ,p_QRY_DATE_OF_BIRTH_F      in varchar2
                                ,p_QRY_DATE_OF_BIRTH_T      in varchar2
                                ,p_QRY_NATIONALITY          in varchar2
                                ,p_QRY_TDT_DOC_NUMBER       in varchar2
                                ,p_QRY_TDT_DATE_OF_EXPIRY_F in varchar2
                                ,p_QRY_TDT_DATE_OF_EXPIRY_T in varchar2
                                ,p_QRY_TDT_ISSUING_COUNTRY  in varchar2
                                ,p_RES_MAX_ROWS             in pls_integer default null
                                ,p_RES_MSCORE_ALGORITHM     in varchar2 default 'EDIT_DISTANCE' -- [EDIT_DISTANCE|JARO_WINKLER] on null 'EDIT_DISTANCE'
                                ,p_RES_SHOW_ROW_NUM         in pls_integer default 1 -- on null 1
                                ,p_RES_SHOW_ROW_CNT         in pls_integer default 1 -- on null 1
                                ,p_RES_SHOW_EXTENDED        in pls_integer default 1 -- on null 1
                                ,p_Query_Type4Where         in varchar2 default 'LOWER_TRIM' -- [LOWER_TRIM|SOUNDEX_TRIM] on null 'LOWER_TRIM'
                                ,p_Use_Index_Hints          in pls_integer default 0 -- on null 0
                                 --
                                 ) return clob;
  --
  function SearchCandidates$JSON(p_Req_JSON in clob
                                 --
                                 ) return clob;
  --
  --
  --
  procedure Init_PACKAGE;
  --
  procedure Check_OBJECT_DEPENDENCE;
  --
  function Get_PACKAGE_ID return simple_integer;
  --
  function Get_OBJECT_NAME return varchar2;
  --
  function Get_OBJECT_COPYRIGHT return varchar2;
  --
  function Get_OBJECT_VERSION$VC return varchar2;
  --
end PKG_SEARCH_NEW;
/
