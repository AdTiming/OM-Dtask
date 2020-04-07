CREATE EXTERNAL TABLE IF NOT EXISTS lr (
         ts bigint,
         fit int,
         flt int,
         zo int,
         session string,
         uid string,
         did string,
         dtype int,
         lang string,
         langname string,
         jb int,
         bundle string,
         make string,
         brand string,
         model string,
         osv string,
         appv string,
         width int,
         height int,
         contype int,
         carrier string,
         lip string,
         lcountry string,
         fm int,
         battery int,
         btch int,
         ip string,
         country string,
         region string,
         city string,
         plat int,
         sdkv string,
         apiv int,
         req_id string,
         server_ts bigint,
         ua string,
         abt int,
         dcenter int,
         snode int,
         publisher_id int,
         pub_app_id int,
         type int,
         pid int,
         mid int,
         iid int,
         act int,
         scene int,
         status int,
         msg string
) PARTITIONED BY (
         y string,
         m string,
         d string,
         h string
)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH
    SERDEPROPERTIES (
        'serialization.format' = '1',
        'ColumnToJsonKeyMappings' = {
            "publisher_id": "publisherId",
            "pub_app_id": "pubAppId"
        }
    )
    LOCATION 's3://[(${s3Bucket})]/[(${tableDataPath})]/[(${tableName})]/'
    TBLPROPERTIES ('has_encrypted_data'='false')
;