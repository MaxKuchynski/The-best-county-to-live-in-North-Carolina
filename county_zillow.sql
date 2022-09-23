SELECT * FROM Capstone.`county_zhvi_uc_sfrcondo_tier_0.33_0.67_sm_sa_month`;

# droping some columns we don't need 
ALTER TABLE Capstone.`county_zhvi_uc_sfrcondo_tier_0.33_0.67_sm_sa_month`
DROP COLUMN RegionID,
DROP COLUMN SizeRank,
DROP COLUMN StateName,
DROP COLUMN StateCodeFIPS,
DROP COLUMN MunicipalCodeFIPS;

#checking dataset:
SELECT * FROM Capstone.`county_zhvi_uc_sfrcondo_tier_0.33_0.67_sm_sa_month`;

#droping RegionType
ALTER TABLE Capstone.`county_zhvi_uc_sfrcondo_tier_0.33_0.67_sm_sa_month`
DROP COLUMN RegionType;

#checking dataset:
SELECT * FROM Capstone.`county_zhvi_uc_sfrcondo_tier_0.33_0.67_sm_sa_month`;

# extracting NC
SELECT *
FROM Capstone.`county_zhvi_uc_sfrcondo_tier_0.33_0.67_sm_sa_month`
WHERE State = 'NC';

# save the dtaset as county_zillow_rank
SELECT * 
FROM Capstone.county_zillow_rank;

# to find housing affordability join to tables county_zillow_rank and median_family_income_rank
SELECT a.RegionName, a.avg_price, b.value AS median_income
FROM Capstone.county_zillow_rank a
LEFT JOIN Capstone.median_family_income_rank b ON a.RegionName = b.area_name
ORDER BY avg_price DESC;

# colculate housing affordability 
SELECT a.RegionName, a.avg_price, b.value AS median_income, ROUND(a.avg_price / b.value, 2) AS afford_index, dense_rank() OVER (order by a.avg_price / b.value) AS afford_rank
FROM Capstone.county_zillow_rank a
LEFT JOIN Capstone.median_family_income_rank b ON a.RegionName = b.area_name
ORDER BY 4;