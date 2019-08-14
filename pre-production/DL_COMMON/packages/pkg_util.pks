CREATE OR REPLACE EDITIONABLE PACKAGE "DL_COMMON"."PKG_UTIL" authid current_user is
  --
  --
  /*******************************************************************************
  ???


  Author    Date        Description
  --------  ----------  -------------------------------------------------------*
  WWirns    05.10.2017  Added
  *******************************************************************************/
  --
  --
  --
  function Is_Equal(p_Value_0 in varchar2
                   ,p_Value_1 in varchar2
                    --
                    ) return boolean deterministic;
  --
  function Is_Equal_(p_Value_0 in varchar2
                    ,p_Value_1 in varchar2
                     --
                     ) return pls_integer deterministic;
  --
  function Is_Equal(p_Value_0 in number
                   ,p_Value_1 in number
                    --
                    ) return boolean deterministic;
  --
  function Is_Equal_(p_Value_0 in number
                    ,p_Value_1 in number
                     --
                     ) return pls_integer deterministic;
  --
  function Is_Equal(p_Value_0 in date
                   ,p_Value_1 in date
                    --
                    ) return boolean deterministic;
  --
  function Is_Equal_(p_Value_0 in date
                    ,p_Value_1 in date
                     --
                     ) return pls_integer deterministic;
  --
  function Is_Equal(p_Value_0 in timestamp
                   ,p_Value_1 in timestamp
                    --
                    ) return boolean deterministic;
  --
  function Is_Equal_(p_Value_0 in timestamp
                    ,p_Value_1 in timestamp
                     --
                     ) return pls_integer deterministic;
  --
  --
  --
  function BIT_OR(p_Value_1 in number
                 ,p_Value_2 in number
                  --
                  ) return number deterministic;
  --
  --
  --
  function BIT_XOR(p_Value_1 in number
                  ,p_Value_2 in number
                   --
                   ) return number deterministic;
  --
  --
  --
  function BIT_NOT(p_Value in number
                   --
                   ) return number deterministic;
  --
  --
  --
  function Escape4SQL(p_Value in varchar2
                      --
                      ) return varchar2 deterministic;
  --
  --
  --
  procedure FormatErrMsg(p_SQLCODE             in out nocopy number
                        ,p_SQLERRM             in out nocopy varchar2
                        ,p_Replacement_SQLCODE in number default -20000
                         --
                         );
  --
  --
  --
  function ShortErrMsg(p_SQLERRM             in varchar2
                      ,p_Is_Only_Topmost_Msg in pls_integer default 1
                       --
                       ) return varchar2;
  --
  --
  --
  procedure FreeTempLOB(p_LOB          in out nocopy blob
                       ,p_Set_NULL     in boolean default false
                       ,p_Prevent_EXCE in boolean default false
                        --
                        );
  --
  procedure FreeTempLOB(p_LOB          in out nocopy clob character set ANY_CS
                       ,p_Set_NULL     in boolean default false
                       ,p_Prevent_EXCE in boolean default false
                        --
                        );
  --
  --
  --
  function SizeByMultipleOfChunk(p_Chunksize    in integer
                                ,p_Maxsize      in integer default 32767
                                ,p_Divisible_by in integer default 1
                                 --
                                 ) return integer;
  --
  --
  --
  function BestLobBuffersize(p_LOB           in blob
                            ,p_MaxBuffersize in integer default 32767
                            ,p_Divisible_by  in integer default 1
                             --
                             ) return integer;
  --
  function BestLobBuffersize(p_LOB           in clob character set ANY_CS
                            ,p_MaxBuffersize in integer default 32767
                            ,p_Divisible_by  in integer default 1
                             --
                             ) return integer;
  --
  --
  --
  procedure BLOB2CLOB(p_LOB          in blob
                     ,p_LOB_Result   in out nocopy clob character set ANY_CS
                     ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                     ,p_Dest_Offset  in out integer
                     ,p_Src_Offset   in out integer
                     ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                     ,p_Lang_Context in out integer
                     ,p_Warning      out integer
                      --
                      );
  --
  function BLOB2CLOB(p_LOB          in blob
                    ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                    ,p_Dest_Offset  in integer default 1
                    ,p_Src_Offset   in integer default 1
                    ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                    ,p_Lang_Context in integer default DBMS_LOB.DEFAULT_LANG_CTX
                     --
                     ) return clob;
  --
  --
  --
  function HEX2BLOB(p_LOB in clob character set ANY_CS
                    --
                    ) return blob;
  --
  --
  --
  function BLOB2HEX(p_LOB in blob
                    --
                    ) return clob;
  --
  --
  --
  procedure CLOB2BLOB(p_LOB          in clob character set ANY_CS
                     ,p_LOB_Result   in out nocopy blob
                     ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                     ,p_Dest_Offset  in out integer
                     ,p_Src_Offset   in out integer
                     ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                     ,p_Lang_Context in out integer
                     ,p_Warning      out integer
                      --
                      );
  --
  function CLOB2BLOB(p_LOB          in clob character set ANY_CS
                    ,p_Amount       in integer default DBMS_LOB.LOBMAXSIZE
                    ,p_Dest_Offset  in integer default 1
                    ,p_Src_Offset   in integer default 1
                    ,p_Blob_Csid    in number default DBMS_LOB.DEFAULT_CSID
                    ,p_Lang_Context in integer default DBMS_LOB.DEFAULT_LANG_CTX
                     --
                     ) return blob;
  --
  --
  --
  function Encode_Base64(p_LOB in blob
                         --
                         ) return clob;
  --
  function Encode_Base64(p_LOB in clob character set ANY_CS
                         --
                         ) return clob;
  --
  --
  --
  function Decode_Base64(p_LOB in clob character set ANY_CS
                         --
                         ) return blob;
  --
  function Decode_Base64$CL(p_LOB in clob character set ANY_CS
                            --
                            ) return clob;
  --
  --
  --
  procedure FreeHttpRequest(p_Request      in out nocopy UTL_HTTP.req
                           ,p_Set_NULL     in boolean default false
                           ,p_Prevent_EXCE in boolean default false
                            --
                            );
  --
  procedure FreeHttpRequest(p_Response     in out nocopy UTL_HTTP.resp
                           ,p_Set_NULL     in boolean default false
                           ,p_Prevent_EXCE in boolean default false
                            --
                            );
  --
  procedure FreeHttpRequest(p_Request      in out nocopy UTL_HTTP.req
                           ,p_Response     in out nocopy UTL_HTTP.resp
                           ,p_Set_NULL     in boolean default false
                           ,p_Prevent_EXCE in boolean default false
                            --
                            );
  --
  --
  --
  procedure HttpPostBody(p_Request      in out nocopy UTL_HTTP.req
                        ,p_LOB          in blob
                        ,p_Content_Type in varchar2 default 'application/octet-stream'
                        ,p_Prevent_EXCE in boolean default false
                         --
                         );
  --
  --
  --
  function Compare(p_Value_0 in varchar2
                  ,p_Value_1 in varchar2
                   --
                   ) return pls_integer deterministic;
  --
  function Compare(p_Value_0 in number
                  ,p_Value_1 in number
                   --
                   ) return pls_integer deterministic;
  --
  function Compare(p_Value_0 in date
                  ,p_Value_1 in date
                   --
                   ) return pls_integer deterministic;
  --
  function Compare(p_Value_0 in timestamp
                  ,p_Value_1 in timestamp
                   --
                   ) return pls_integer deterministic;
  --
  --
  --
  function to_Number(p_Value        in varchar2
                    ,p_Format_Model in varchar2 default null
                    ,p_NLS_Param    in varchar2 default null
                    ,p_NVL_Value    in number default null
                    ,p_Prevent_EXCE in boolean default false
                     --
                     ) return number deterministic;
  --
  function to_Number_(p_Value        in varchar2
                     ,p_Format_Model in varchar2 default null
                     ,p_NLS_Param    in varchar2 default null
                     ,p_NVL_Value    in number default null
                     ,p_Prevent_EXCE in pls_integer default 0
                      --
                      ) return number deterministic;
  --
  function to_Number_(p_Value        in varchar2
                     ,p_Format_Model in varchar2 default null
                     ,p_Prevent_EXCE in pls_integer default 0
                      --
                      ) return number deterministic;
  --
  function to_Number_(p_Value        in varchar2
                     ,p_Prevent_EXCE in pls_integer default 0
                      --
                      ) return number deterministic;
  --
  --
  --
  function to_Date(p_Value        in varchar2
                  ,p_Format_Model in varchar2 default null
                  ,p_NLS_Param    in varchar2 default null
                  ,p_NVL_Value    in date default null
                  ,p_Prevent_EXCE in boolean default false
                   --
                   ) return date deterministic;
  --
  function to_Date_(p_Value        in varchar2
                   ,p_Format_Model in varchar2 default null
                   ,p_NLS_Param    in varchar2 default null
                   ,p_NVL_Value    in date default null
                   ,p_Prevent_EXCE in pls_integer default 0
                    --
                    ) return date deterministic;
  --
  --
  --
  function get_client_ip return varchar2;
  --
  --
  --
  function Multi_Replace(p_Value              in clob character set ANY_CS
                        ,p_SEARCH_DEFINITIONs in VT_SEARCH_DEFINITION
                         --
                         ) return clob;
  --
  function Multi_Replace(p_Value              in varchar2
                        ,p_SEARCH_DEFINITIONs in VT_SEARCH_DEFINITION
                         --
                         ) return varchar2;
  --
  --
  --
  function hash(p_Value in raw
               ,p_Typ   in pls_integer default DBMS_CRYPTO.HASH_SH1
                --
                ) return raw deterministic;
  --
  function hash(p_Value in blob
               ,p_Typ   in pls_integer default DBMS_CRYPTO.HASH_SH1
                --
                ) return raw deterministic;
  --
  function hash(p_Value in clob character set ANY_CS
               ,p_Typ   in pls_integer default DBMS_CRYPTO.HASH_SH1
                --
                ) return raw deterministic;
  --
  --
  --
  procedure LOB2DIRECTORY(p_LOB       in clob
                         ,p_DIRECTORY in varchar2
                         ,p_Filename  in varchar2
                          --
                          );
  --
  procedure LOB2DIRECTORY(p_LOB       in blob
                         ,p_DIRECTORY in varchar2
                         ,p_Filename  in varchar2
                          --
                          );
  --
  --
  --
  procedure Init_PACKAGE;
  --
  procedure Check_OBJECT_DEPENDENCE;
  --
  function Get_PACKAGE_ID return simple_integer deterministic;
  --
  function Get_OBJECT_NAME return varchar2 deterministic;
  --
  function Get_OBJECT_COPYRIGHT return varchar2 deterministic;
  --
  function Get_OBJECT_VERSION$VC return varchar2 deterministic;
  --
end PKG_UTIL;
/
