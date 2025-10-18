-- Creating streaming table
CREATE OR REFRESH STREAMING LIVE TABLE yfinance
TBLPROPERTIES ('quality' = 'bronze')
AS
-- Reading JSON from volume and set map of options
SELECT * 
FROM cloud_files('/Volumes/lakehouse/raw_public/yfinance/commodities/latest_prices/'
, 'json',
 map(
      'cloudFiles.inferColumnTypes', 'true',
      'cloudFiles.includeExistingFiles', 'false',
      'cloudFiles.schemaEvolutionMode','addNewColumns')
);