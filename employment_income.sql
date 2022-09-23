SELECT * FROM Capstone.employment_income;

select count(*)   #shape 5 x 1152794
from Capstone.employment_income;

#rename columns

ALTER TABLE `Capstone`.`employment_income` 
CHANGE COLUMN `Area Name` `area_name` TEXT NOT NULL ,
CHANGE COLUMN `Area Type` `type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Year` `year` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Variable` `variable` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Value` `value` TEXT NULL DEFAULT NULL
;

# checking Wake County
SELECT area_name, year, variable, SUM(value)
FROM Capstone.employment_income
WHERE area_name = 'Wake County'
GROUP BY year, variable
ORDER BY year;

# checking Wake County 2021
SELECT area_name, year, variable, value
FROM Capstone.employment_income
WHERE area_name = 'Wake County' AND year = 2021
ORDER BY year;

# what I do need: Unemployment Rate by Place of Residence (Percent)
	   # Estimated Median Family Income(HUD)

# Unemployment Rate for Wake County
SELECT area_name, year, variable, value
FROM Capstone.employment_income
WHERE area_name = 'Wake County' AND variable LIKE '%Unemployment Rate by Place of Residence (Percent)%'
ORDER BY year;

# Unemployment Rate for NC

SELECT area_name, year, variable, value
FROM Capstone.employment_income
WHERE variable LIKE '%Unemployment Rate by Place of Residence (Percent)%'
ORDER BY year;

# Estimated Median Family Income(HUD)
 
SELECT area_name, year, variable, value
FROM Capstone.employment_income
WHERE variable LIKE '%Estimated Median Family Income(HUD)%'
ORDER BY year;





