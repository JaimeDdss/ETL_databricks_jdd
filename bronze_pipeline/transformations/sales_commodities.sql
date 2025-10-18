-- Creating streaming table
CREATE OR REFRESH STREAMING LIVE TABLE sales_commodities
TBLPROPERTIES ('quality' = 'bronze')
AS
-- Reading table from postgres_public schema
SELECT 
      *,
      current_timestamp() AS ingestion_ts
FROM STREAM (lakehouse.postgres_public.sales_commodities);
