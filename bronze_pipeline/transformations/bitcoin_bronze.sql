-- Creating streaming table
CREATE OR REFRESH STREAMING LIVE TABLE bitcoin
TBLPROPERTIES ('quality' = 'bronze')
AS
-- Read JSON from volume and set map of options
SELECT * 
FROM cloud_files('/Volumes/lakehouse/raw_public/coinbase/coinbase/bitcoin_spot/'
, 'json',
 map(
      'cloudFiles.inferColumnTypes', 'true',
      'cloudFiles.includeExistingFiles', 'false',
      'cloudFiles.schemaEvolutionMode','addNewColumns')
);