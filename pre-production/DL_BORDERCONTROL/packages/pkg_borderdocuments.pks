CREATE OR REPLACE EDITIONABLE PACKAGE "DL_BORDERCONTROL"."PKG_BORDERDOCUMENTS" AUTHID DEFINER is
  --
  --
  /*******************************************************************************
  ???


  * Author    Date        Description
  * --------  ----------  -------------------------------------------------------*
  * MSCS      19.07.2019  Added Partial DOB capability to Create_Document
  * M.Bock    27.05.2019  Added procedure Update_CALC_MRZ
  * CHageman  18.10.2018  Added function get_similar_documents to merge documents
  * CHageman  18.10.2018  Added override function with out parameter x_identity
  * CHageman  14.09.2018  Added function get_document_rec
  * CHageman  01.06.2018  Added column docclass to create_document function
  * WWirns    13.11.2017  Added
  *******************************************************************************/
  --
  --
  TYPE t_borderdocuments_tab IS TABLE OF borderdocuments%ROWTYPE;
  --
  --
  function Get_IMG_SEQ_VISUAL_FACE# return simple_integer deterministic;
  --
  function Get_IMG_SEQ_ICAO_FACE# return simple_integer deterministic;
  --
  function Get_IMG_SEQ_VISUAL_PAGE# return simple_integer deterministic;
  --
  function Get_IMG_SEQ_UV_PAGE# return simple_integer deterministic;
  --
  function Get_IMG_SEQ_IR_PAGE# return simple_integer deterministic;
  --
  function Get_IMG_SEQ_DG3_0# return simple_integer deterministic;
  --
  function Get_IMG_SEQ_DG3_1# return simple_integer deterministic;
  --
  --
  --
  function Get_Document(p_DOCNO          in BORDERDOCUMENTS.DOCNO%type
                       ,p_ISSUECTRY      in BORDERDOCUMENTS.ISSUECTRY%type
                       ,p_EXPIRYDATE     in BORDERDOCUMENTS.EXPIRYDATE%type
                       ,p_INS_BORDERPOST in BORDERDOCUMENTS.INS_BORDERPOST%type default null
                        --
                        ) return BORDERDOCUMENTS.BRDDOCID%type;
  --
  --
  --
  FUNCTION get_document_rec(p_docno           IN BORDERDOCUMENTS.DOCNO%type
                           ,p_issuectry       IN BORDERDOCUMENTS.ISSUECTRY%type
                           ,p_expirydate      IN BORDERDOCUMENTS.EXPIRYDATE%type
                           ,p_ins_borderpost  IN BORDERDOCUMENTS.INS_BORDERPOST%type default null)
  RETURN BORDERDOCUMENTS%ROWTYPE;
  --
  --
  /**
   * Searches for similar entries in the borderdocuments table and returns a table of
   * borderdocuments
   * The function searches in table BORDERDOCUMENTS:
   *  - issuing country (issuectry)
   *  - nationality (nat)
   *  - date of birth (dob)
   *  - givenname (first name)
   *  - surname (last name)
   *  - middlename
   *
   * If the document already exists, the most important information is the identity
   * !! Only datasets with an identity column will be returned !!
   *
   * This function is used to merge multiple borderdocuments to one identity
   *
   * @param p_issuectry   Issuing country of the document
   * @param p_nat         Nationality of the person / document
   * @param p_dob         Date of birth of the person / document
   * @param p_givenname   Givenname (first name) of the person / document
   * @param p_surname     Surname (last name) of the person / document
   * @param p_middlename  Middlename of the person / document
   * @return t_borderdocuments_tab Table of borderdocuments that could be found
   */
  FUNCTION get_similar_documents (p_issuectry   IN borderdocuments.issuectry%TYPE
                                 ,p_nat         IN borderdocuments.nat%TYPE
                                 ,p_dob         IN borderdocuments.dob%TYPE
                                 ,p_givenname   IN borderdocuments.givenname%TYPE
                                 ,p_surname     IN borderdocuments.surname%TYPE
                                 ,p_middlename  IN borderdocuments.middlename%TYPE)
  RETURN t_borderdocuments_tab PIPELINED;
  --
  --
  function Create_Document(p_DOCNO               in BORDERDOCUMENTS.DOCNO%type
                          ,p_DOCTYPE             in BORDERDOCUMENTS.DOCTYPE%type
                          ,p_ISSUECTRY           in BORDERDOCUMENTS.ISSUECTRY%type
                          ,p_EXPIRYDATE          in BORDERDOCUMENTS.EXPIRYDATE%type
                          ,p_SURNAME             in BORDERDOCUMENTS.SURNAME%type
                          ,p_MIDDLENAME          in BORDERDOCUMENTS.MIDDLENAME%type
                          ,p_GIVENNAME           in BORDERDOCUMENTS.GIVENNAME%type
                          ,p_SEX                 in BORDERDOCUMENTS.SEX%type
                          ,p_DOB                 in BORDERDOCUMENTS.DOB%type -- varchar2(10 char)
                          ,p_MRZDG1              in BORDERDOCUMENTS.MRZDG1%type
                          ,p_INS_TERMINAL        in BORDERDOCUMENTS.INS_TERMINAL%type
                          ,p_INS_BORDERPOST      in BORDERDOCUMENTS.INS_BORDERPOST%type
                          ,p_Img_VISUAL_FACE     in blob
                          ,p_Img_ICAO_FACE       in blob
                          ,p_Img_VISUALPAGE      in blob
                          ,p_Img_UVPAGE          in blob
                          ,p_Img_IRPAGE          in blob
                          ,p_Img_DG3_0           in blob
                          ,p_Img_DG3_1           in blob
                          ,p_MANUAL_EXPIRY_DATE  in date default null
                          ,p_MANUAL_ISSUING_DATE in date default null
                          ,p_MANUAL_NATIONALITY  in varchar2 default null
                          ,p_MANUAL_PLACEOFBIRTH in varchar2 default null
                          ,p_docclass            in BORDERDOCUMENTS.docclass%TYPE DEFAULT NULL
                          ,x_identity           OUT identities.identity%TYPE
                           --
                          ) return BORDERDOCUMENTS.BRDDOCID%type;
  --
  --
  --
  function Create_Document(p_DOCNO               in BORDERDOCUMENTS.DOCNO%type
                          ,p_DOCTYPE             in BORDERDOCUMENTS.DOCTYPE%type
                          ,p_ISSUECTRY           in BORDERDOCUMENTS.ISSUECTRY%type
                          ,p_EXPIRYDATE          in BORDERDOCUMENTS.EXPIRYDATE%type
                          ,p_SURNAME             in BORDERDOCUMENTS.SURNAME%type
                          ,p_MIDDLENAME          in BORDERDOCUMENTS.MIDDLENAME%type
                          ,p_GIVENNAME           in BORDERDOCUMENTS.GIVENNAME%type
                          ,p_SEX                 in BORDERDOCUMENTS.SEX%type
                          ,p_DOB                 in BORDERDOCUMENTS.DOB%type -- varchar2(10 char)
                          ,p_MRZDG1              in BORDERDOCUMENTS.MRZDG1%type
                          ,p_INS_TERMINAL        in BORDERDOCUMENTS.INS_TERMINAL%type
                          ,p_INS_BORDERPOST      in BORDERDOCUMENTS.INS_BORDERPOST%type
                          ,p_Img_VISUAL_FACE     in blob
                          ,p_Img_ICAO_FACE       in blob
                          ,p_Img_VISUALPAGE      in blob
                          ,p_Img_UVPAGE          in blob
                          ,p_Img_IRPAGE          in blob
                          ,p_Img_DG3_0           in blob
                          ,p_Img_DG3_1           in blob
                          ,p_MANUAL_EXPIRY_DATE  in date default null
                          ,p_MANUAL_ISSUING_DATE in date default null
                          ,p_MANUAL_NATIONALITY  in varchar2 default null
                          ,p_MANUAL_PLACEOFBIRTH in varchar2 default null
                          ,p_docclass            in BORDERDOCUMENTS.docclass%TYPE DEFAULT NULL
                           --
                           ) return BORDERDOCUMENTS.BRDDOCID%type;
  --
  procedure Create_Document(p_DOCNO               in BORDERDOCUMENTS.DOCNO%type
                           ,p_DOCTYPE             in BORDERDOCUMENTS.DOCTYPE%type
                           ,p_ISSUECTRY           in BORDERDOCUMENTS.ISSUECTRY%type
                           ,p_EXPIRYDATE          in BORDERDOCUMENTS.EXPIRYDATE%type
                           ,p_SURNAME             in BORDERDOCUMENTS.SURNAME%type
                           ,p_MIDDLENAME          in BORDERDOCUMENTS.MIDDLENAME%type
                           ,p_GIVENNAME           in BORDERDOCUMENTS.GIVENNAME%type
                           ,p_SEX                 in BORDERDOCUMENTS.SEX%type
                           ,p_DOB                 in BORDERDOCUMENTS.DOB%type -- varchar2(10 char)
                           ,p_MRZDG1              in BORDERDOCUMENTS.MRZDG1%type
                           ,p_INS_TERMINAL        in BORDERDOCUMENTS.INS_TERMINAL%type
                           ,p_INS_BORDERPOST      in BORDERDOCUMENTS.INS_BORDERPOST%type
                           ,p_Img_VISUAL_FACE     in blob
                           ,p_Img_ICAO_FACE       in blob
                           ,p_Img_VISUALPAGE      in blob
                           ,p_Img_UVPAGE          in blob
                           ,p_Img_IRPAGE          in blob
                           ,p_Img_DG3_0           in blob
                           ,p_Img_DG3_1           in blob
                           ,p_MANUAL_EXPIRY_DATE  in date default null
                           ,p_MANUAL_ISSUING_DATE in date default null
                           ,p_MANUAL_NATIONALITY  in varchar2 default null
                           ,p_MANUAL_PLACEOFBIRTH in varchar2 default null
                           ,p_docclass            in BORDERDOCUMENTS.docclass%TYPE DEFAULT NULL
                            --
                            );
  --
  --
  --
  /*
  function Is_On_Blacklist(p_DOCNO             in BORDERDOCUMENTS.DOCNO%type
                          ,p_ISSUECTRY         in BORDERDOCUMENTS.ISSUECTRY%type default null
                          ,p_EXPIRYDATE        in BORDERDOCUMENTS.EXPIRYDATE%type default null
                          ,p_SURNAME           in BORDERDOCUMENTS.SURNAME%type default null
                          ,p_GIVENNAME         in BORDERDOCUMENTS.GIVENNAME%type default null
                          ,p_SEX               in BORDERDOCUMENTS.SEX%type default null
                          ,p_DOB               in BORDERDOCUMENTS.DOB%type default null -- varchar2(10 char)
                          ,p_Do_Write_Incident in number default 1
                          ,p_INS_TERMINAL      in BORDERDOCUMENTS.INS_TERMINAL%type default null
                          ,p_INS_BORDERPOST    in BORDERDOCUMENTS.INS_BORDERPOST%type default null
                           --
                           ) return number;
  */
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
  procedure Update_CALC_MRZ (p_BRDDOCID in BORDERDOCUMENTS.BRDDOCID%type
                            ,p_CALC_MRZDG1 in BORDERDOCUMENTS.CALC_MRZDG1%type);
  --
end PKG_BORDERDOCUMENTS;
/
