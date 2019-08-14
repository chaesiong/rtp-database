CREATE OR REPLACE FORCE EDITIONABLE VIEW "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" ("Year", "Month", "Day", "Cal.week", "Weekday", "Hour", "Agent", "Age", "Borderpost", "Document Type", "Gender", "Movement type", "Nationality", "Officer", "Transport Mode", "Visa Type", "Count Incidents", "Count Movements") AS 
  select
dim_times.year_numeric"Year",
dim_times.month_numeric"Month",
dim_times.day_numeric"Day",
dim_times.calweek_numeric"Cal.week",
dim_times.weekday_numeric"Weekday",
dim_times.hour24_numeric"Hour",
dim_agents.name"Agent",
dim_ages.id"Age",
dim_borderposts.name"Borderpost",
dim_document_types.name"Document Type",
dim_genders.Shortcode"Gender",
dim_movement_types.name"Movement type",
dim_nationalities.name"Nationality",
dim_officers.username"Officer",
dim_transport_modes.name"Transport Mode",
dim_visa_types.name"Visa Type",
fact.count_incidents"Count Incidents",
fact.count_movements"Count Movements"
from dl_bordercontrol_datamart.fact_border_movements fact
inner join dl_bordercontrol_datamart.dim_agents dim_agents on fact.dimension_agents_id = dim_agents.id
inner join dl_bordercontrol_datamart.dim_ages dim_ages on dim_ages.id = fact.dimension_ages_id
inner join dl_bordercontrol_datamart.dim_borderposts dim_borderposts on dim_borderposts.id = fact.DIMENSION_BORDER_POSTS_ID
inner join dl_bordercontrol_datamart.dim_document_types dim_document_types on dim_document_types.id = fact.dimension_document_types_id
inner join dl_bordercontrol_datamart.dim_genders dim_genders on dim_genders.id = fact.DIMENSION_GENDER_ID
inner join dl_bordercontrol_datamart.dim_movement_types dim_movement_types on dim_movement_types.id = fact.DIMENSION_MOVEMENT_TYPES_ID
inner join dl_bordercontrol_datamart.dim_nationalities dim_nationalities on dim_nationalities.ID = fact.DIMENSION_NATIONALITIES_ID
inner join dl_bordercontrol_datamart.dim_officers dim_officers on dim_officers.id = fact.dimension_officers_id
inner join dl_bordercontrol_datamart.dim_times dim_times on dim_times.ID = fact.DIMENSION_TIME_ID
inner join dl_bordercontrol_datamart.dim_transport_modes dim_transport_modes on dim_transport_modes.ID = fact.DIMENSION_TRANSPORT_MODES_ID
inner join dl_bordercontrol_datamart.dim_visa_types dim_visa_types on dim_visa_types.id = fact.DIMENSION_VISA_TYPES_ID
inner join dl_bordercontrol_datamart.dim_borderposts dim_borderposts on dim_borderposts.id = fact.dimension_border_posts_id;
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" TO "BIO_BD";
  GRANT DELETE ON "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" TO "DERMALOG_PROXY";
  GRANT INSERT ON "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" TO "DERMALOG_PROXY";
  GRANT UPDATE ON "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" TO "DERMALOG_PROXY";
  GRANT SELECT ON "DL_BORDERCONTROL_DATAMART"."PIVOT_ANALYSIS" TO "TESTADM";
