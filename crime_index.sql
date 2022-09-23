SELECT * FROM Capstone.crime_nc;

ALTER TABLE `Capstone`.`crime_nc` 
CHANGE COLUMN `Area Name` `area_name` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Type` `type` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Variable` `variable` TEXT NULL DEFAULT NULL ,
CHANGE COLUMN `Year` `year` INT NULL DEFAULT NULL ,
CHANGE COLUMN `Value` `value` INT NULL DEFAULT NULL ;

SELECT * FROM Capstone.crime_nc;

SELECT area_name, year, SUM(value) # inspecting Wake county
FROM Capstone.crime_nc
WHERE area_name = 'Wake County' AND variable = 'Crime Index'
GROUP BY area_name, year
ORDER BY year;

SELECT distinct variable, SUM(value) AS sum_value # list of violetions and sum
FROM Capstone.crime_nc
GROUP BY variable
ORDER BY sum_value DESC;

SELECT area_name, variable, year, SUM(value) # Crime Index
FROM Capstone.crime_nc
WHERE variable = 'Crime Index' 
GROUP BY area_name, year
ORDER BY year;



