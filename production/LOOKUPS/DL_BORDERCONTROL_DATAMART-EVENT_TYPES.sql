
REM INSERTING into DL_BORDERCONTROL_DATAMART.EVENT_TYPES
SET DEFINE OFF;
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIMS','Start updating dimensions');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_BORDERPOSTS','Start updating borderposts dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_OFFICERS','Start updating officers dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('END_INIT_DIMS','End initialize dimensions');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_TRANSPORT_MODES','Start updating transport modes dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_INIT_DIMS','Start initialize dimensions');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('END_UPDATE_DIMS','End updating dimensions');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_MOVEMENT_TYPES','Start updating movement types dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('DIM_TIME_MISSING','Time is not in the time dimension - cannot import this record');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('END_IMPORT_RUN','End of data mart load run');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_IMPORT_RUN','Start of data mart load run');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_GENDER','Start updating gender dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_AGENTS','Start updating agents dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_NATIONALITIES','Start updating nationalities dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_DOCUMENTS_TYPES','Start updating document types dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_DIM_VISA_TYPES','Start updating visa types dimension');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('END_UPDATE_FACT_TABLE','End update of fact table');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_INIT_CALC_DIMS','Start initialize calculated dimensions');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_UPDATE_FACT_TABLE','Start update of fact table');
Insert into DL_BORDERCONTROL_DATAMART.EVENT_TYPES (ID,DESCRIPTION) values ('START_INIT_DIM_EMPTY_VALUES','Start initialize empty values in dimensions');

20 rows selected. 

