DROP DATABASE IF EXISTS mine_operation;
CREATE  DATABASE mine_operation;

USE mine_operation;

-- Creating tables to load data for data analyis of mine operations
-- 1. Cycle Table
-- 2. Movement Master Table
-- 3. Location Master Table
-- 4. Location Type Master Table
-- 5. Equipment Master Table
-- 6. Equipment Type Master Table
-- 7. Delay Table

-- Cycle Table
DROP TABLE IF EXISTS cycle_data;
CREATE TABLE cycle_data 
(
   `Cycle Type` varchar(100) , 
   `Crew OI` varchar(100), 
   `Primary Machine Category Name` varchar(200),
   `Primary Machine Class Name` varchar(200), 
   `Primary Machine Name` varchar(200),
   `Secondary Machine Category Name` varchar(200), 
   `Secondary Machine Class Name` varchar(200),
   `Secondary Machine Name` varchar(100), 
   `PREVIOUSSECONDARYMACHINE` varchar(100) default null, 
   `Available Time` mediumint, 
   `Cycle Start Timestamp (GMT8)` datetime,
   `Cycle End Timestamp (GMT8)` datetime, 
   `Cycle Duration`  mediumint, 
   `Completed Cycle Count` varchar(20),
   `COMPLETEDCYCLEDURATION`  mediumint, 
   `TOTALTIME (CAT)`  mediumint, 
   `OPERATINGTIME (CAT)`  mediumint,
   `WORKINGDURATION` mediumint, 
   `Idle Duration` mediumint, 
   `Down Time` mediumint, 
   `SD_SCHEDULEDDOWNTIME`mediumint,
   `UNSCHEDULEDDOWNTIME` mediumint, 
   `DTE Down Time Equipment` mediumint default null,
   `UNSCHEDULEDDOWNCOUNT` mediumint default null, 
   `Available SMU Time`mediumint default null, 
   `Cycle SMU Duration`mediumint default null,
   `Destination Queuing Start Timestamp (GMT8)` datetime default null,
   `Destination Queuing End Timestamp (GMT8)` datetime default null,
   `Queuing at Sink Duration` double default null, 
   `Source Queuing Start Timestamp (GMT8)` datetime default null,
   `Source Queuing End Timestamp (GMT8)` datetime default null,
   `Queuing at Source Duration` double default null,
   `Queuing Duration` double default null, 
   `WAITFORDUMPDURATION` double default null, 
   `WAITFORLOADDURATION` double default null,
   `Destination Dumping Start Timestamp (GMT8)` double default null,
   `Destination Dumping End Timestamp (GMT8)` double default null,
   `Dumping Duration` double default null, 
   `Dumping SMU Duration` double default null,
   `Source Loading Start Timestamp (GMT8)` datetime default null,
   `Source Loading End Timestamp (GMT8)` datetime default null,
   `Loading Duration` double default null,
   `Loading Count` double default null, 
   `Loading Efficiency` double default null, 
   `Payload (kg)` double default null, 
   `Payload (t)`double default null, 
   `ASSOCPAYLOADNOMINAL`double default null,
   `TRUCKQUEUEATSOURCEDURATION` double default null, 
   `Empty Travel Duration` double default null,
   `Full Travel Duration` double default null, 
   `Source Location Name` varchar(200) default null,
   `Destination Location Name` varchar(200) default null, 
   `PREVIOUSSINKDESTINATION` varchar(200) default null,
   `Source Location is Source Flag` varchar(20) default null, 
   `Source Location is Active Flag` varchar(20) default null,
   `Destination Location is Active Flag` varchar(20) default null,
   `Destination Location is Source Flag` varchar(20) default null,
   `Destination Location Description` varchar(200) default null, 
   `Fuel Used` double default null, 
   `TMPH` double default null,
   `Empty EFH Distance` double default null, 
   `Empty Slope Distance` double default null, 
   `Day Hours`  varchar(100) default null,                                  
   `Day-DayName`   varchar(100) default null,                       
   `Number of Trucks Traveling Empty` smallint default null,           
   `Number of Trucks Traveling with Load` smallint default null,           
   `Truck at Dumping` varchar(100) default null,                             
   `Truck at Loading` varchar(100) default null,                                
   `Source_loc_ava` varchar(100) default null, 
   `Source Latitude` double default null,
   `Source Longitude` double default null, 
   `Destination_loc_ava` varchar(100) default null, 
   `Destination Latitude` double default null,
   `Destination Longitude` double default null
);

-- Movement Master Table
DROP TABLE IF EXISTS movement_master;
CREATE	TABLE movement_master
(
 `Primary Machine Name` varchar(200), 
 `Source Location Name` varchar(200),
 `Destination Location Name` varchar(200), 
 `Payload (t)` double,
 `Cycle Start Timestamp (GMT8)` datetime, 
 `Cycle End Timestamp (GMT8)` datetime
);

-- Location Master Table
DROP TABLE IF EXISTS location_master;
CREATE	TABLE location_master
( 
 `Cycle Type` varchar(100) , 
 `Primary Machine Name` varchar(200),
 `Source Location Name` varchar(200) default null, 
 `Destination Location Name` varchar(20) default null,
 `Payload (t)` double default null,
 `Dumping Duration` double default null,
 `Loading Duration` double default null,
 `Queuing at Sink Duration` double default null,
 `Queuing at Source Duration` double default null, 
 `Queuing Duration` double default null, 
 `WAITFORDUMPDURATION` double default null,
 `WAITFORLOADDURATION` double default null, 
 `Source Location is Source Flag` varchar(20) default null, 
 `Source Location is Active Flag` varchar(20) default null,
 `Destination Location is Active Flag` varchar(20) default null,
 `Destination Location is Source Flag` varchar(20) default null,
 `Destination Location Description` varchar(300) default null
);

-- Location Type Master Table
DROP TABLE IF EXISTS location_type_master;
CREATE	TABLE location_type_master
( 
 `Cycle Type` varchar(100) , 
 `Primary Machine Name` varchar(200),
 `Source_loc_ava` varchar(200) default null, 
 `Source Latitude` double default null,
 `Source Longitude` double default null,
 `Destination_loc_ava` varchar(200) default null,
 `Destination Latitude` double default null,
 `Destination Longitude` double default null
);

-- Equipment Master
DROP TABLE IF EXISTS equipment_master;
CREATE TABLE eqipment_master 
(
   `Cycle Type` varchar(100) , 
   `Cycle Duration`  mediumint, 
   `Available Time` mediumint, 
   `Completed Cycle Count` varchar(20),
   `Primary Machine Name` varchar(200),
   `Primary Machine Category Name` varchar(200),
   `Secondary Machine Name` varchar(100), 
   `Secondary Machine Category Name` varchar(200), 
   `Payload (t)`double default null, 
   `ASSOCPAYLOADNOMINAL`double default null,
   `Fuel Used` double default null, 
   `TMPH` double default null,
   `Empty EFH Distance` double default null, 
   `TOTALTIME (CAT)`  mediumint, 
   `OPERATINGTIME (CAT)`  mediumint,
   `WORKINGDURATION` mediumint, 
   `Idle Duration` mediumint, 
   `Down Time` mediumint, 
   `Queuing Duration` double default null, 
   `DTE Down Time Equipment` mediumint default null,
   `Dumping Duration` double default null, 
   `Loading Duration` double default null,
   `Loading Count` double default null, 
   `Loading Efficiency` double default null, 
   `Available SMU Time`mediumint default null, 
   `Cycle SMU Duration`mediumint default null
);

-- Equipment Type Master
DROP TABLE IF EXISTS equipment_type_master;
CREATE TABLE eqipment_type_master 
(
   `Cycle Type` varchar(100) , 
   `Cycle Duration`  mediumint, 
   `Primary Machine Category Name` varchar(200),
   `Primary Machine Class Name` varchar(200),
   `Secondary Machine Category Name` varchar(100), 
   `Secondary Machine Class Name` varchar(200), 
   `Payload (t)`double default null, 
   `OPERATINGTIME (CAT)`  mediumint,
   `WORKINGDURATION` mediumint, 
   `Idle Duration` mediumint, 
   `Down Time` mediumint, 
   `Dumping Duration` double default null, 
   `Loading Duration` double default null
);

-- Delay Data 
DROP TABLE IF EXISTS delay_data;
CREATE TABLE delay_data 
(
  `Delay OID` varchar(100), 
  `Engine Stopped Flag` varchar(10), 
  `Field Notification Required Flag` varchar(10),
  `Production Reporting Only Flag` varchar(10), 
  `Delay Class Name`  varchar(1000),
  `Delay Class Category Name`  varchar(1000), 
  `Target Machine Name`  varchar(200),
  `Target Machine Class Name`   varchar(200), 
  `Target Machine Class Description` varchar(200), 
  `Target Machine Class Category Name`  varchar(200), 
  `Delay Start Timestamp (GMT8)`   datetime ,
  `Delay Finish Timestamp (GMT8)` datetime    
);



-- LOADING CYCLE DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\cycle_data.csv"
INTO TABLE cycle_data
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 

-- LOADING Delay DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\delay_df.csv"
INTO TABLE delay_data
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 

-- LOADING Location_Master DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\Location_Master.csv"
INTO TABLE location_master
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 

-- LOADING Location_Type_Master DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\Location_Type_Master.csv"
INTO TABLE location_type_master
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 

-- LOADING Equipment_Master DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\Equipment_Master.csv"
INTO TABLE equipment_master
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 

-- LOADING Equipment_Type_Master DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\Equipment_Type_Master.csv"
INTO TABLE equipment_type_master
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 

-- LOADING Movement_Master DATA
LOAD DATA INFILE "C:\Users\91810\OneDrive\Desktop\AAA\Movement_Master.csv"
INTO TABLE movement_master
FIELDS TERMINATED BY ',' 
LINES TERMINATED BY '\n'; 
-- --------------------------------------------------------------------------------------
-- OPERATIIONAL ANALYSIS- PART

-- check datatypes of each cycle
SELECT column_name, data_type
FROM information_schema.columns
WHERE table_schema = 'mine_operation'
AND table_name = 'cycle_data';


# Operational Analysis
-- NUMBER OF MACHINES

-- 1) Total Number of UNIQUE equipment in the field.
select count( distinct `Primary Machine Name`) as `Total Operating Machines`
from cycle_data;

-- 2) Total Number of UNIQUE equipment in the EACH cycle.
SELECT 		`Cycle Type`,
			COUNT( DISTINCT `Primary Machine Name`) AS `Total Operating Machines`
FROM 		cycle_data
GROUP BY 	`Cycle Type`
ORDER BY 	COUNT( DISTINCT `Primary Machine Name`) DESC;

-- 3) Total Number of UNIQUE equipment in the EACH cycle and machine category
SELECT 		`Cycle Type`,`Primary Machine Category Name`,
			COUNT( DISTINCT `Primary Machine Name`) AS `Total Operating Machines`
FROM 		cycle_data
GROUP BY 	`Cycle Type`,`Primary Machine Category Name`
ORDER BY 	`Cycle Type`, COUNT( DISTINCT `Primary Machine Name`) DESC;


-- ------------------------------------------------------------------------------------------------------------------------------

-- Equipment Utilisation Rate = (Working Time/ Total Time)*100  if a machine is being utlilies less than 65% then it is under maintenece

-- 4) Total machines under maintainence

SELECT		`Cycle Type`,
			count(  `Primary Machine Name`) as `Total Machines`,
			sum( IF(WORKINGDURATION/`TOTALTIME (CAT)`<=0.6, 1, 0)) AS `Machines under Maintence`
FROM 		cycle_data
GROUP BY 	`Cycle Type`
ORDER BY 	sum( IF(WORKINGDURATION/`TOTALTIME (CAT)`<=0.6, 1, 0)) DESC;

-- 5) Total number of machines in each cycle
SELECT 		`Cycle Type`,
			COUNT(  `Primary Machine Name`) AS `Total Machines`
FROM 		cycle_data
GROUP BY 	`Cycle Type`
ORDER BY 	COUNT(  `Primary Machine Name`) DESC;

-- 6) Total Number of equipment under maintainence in the field.
SELECT 		`Primary Machine Category Name`, 
			sum( IF(WORKINGDURATION/`TOTALTIME (CAT)`<=0.6, 1, 0)) AS `Machines under Maintence`
FROM 		cycle_data
GROUP BY 	`Primary Machine Category Name`
ORDER BY 	sum( IF(WORKINGDURATION/`TOTALTIME (CAT)`<=0.6, 1, 0)) DESC;




-- 7) show results in parallel
WITH MACHINE_SUMMARY AS
(
SELECT		`Cycle Type`,`Primary Machine Category Name`,
			count(  `Primary Machine Name`) as `Total Machines`,
			sum( IF(WORKINGDURATION/`TOTALTIME (CAT)`<=0.6, 1, 0)) AS `Machines under Maintence`
FROM 		cycle_data
GROUP BY 	`Cycle Type`, `Primary Machine Category Name`
ORDER BY 	 count(  `Primary Machine Name`) desc, `Cycle Type`
) 
	SELECT 		`Cycle Type`,
				`Primary Machine Category Name`, 
                `Total Machines`,
				`Total Machines` - `Machines under Maintence` as `Machines Operating`,
				`Machines under Maintence`
	FROM 		MACHINE_SUMMARY;

-- --------------------------------------------------------------------------------------------------------------------------------
-- 8) Number of cycles completed by machine

SELECT `Completed Cycle Count`, count(`Primary Machine Class Name`) AS `Number of cycle Completed`
FROM `cycle_data`
GROUP BY `Completed Cycle Count`;

-- 9) NUMBER OF COMPLETE CYCLE IN EACH MACHINE CLASS AND CYCLE
SELECT `Cycle Type`,`Primary Machine Class Name`, 
		count(`Primary Machine Class Name`) AS `Number of cycle Completed`,
        sum(if(`Completed Cycle Count` = 'Yes',1,0)) as `Number of cycle completed`,
        sum(if(`Completed Cycle Count` = 'No',1,0)) as `Number of cycle not completed`
FROM `cycle_data`
GROUP BY `Cycle Type`, `Primary Machine Class Name`
order by count(`Primary Machine Class Name`) desc limit 10;

-- 10) TOP 5 MACHINE WHICH HAS DOME THE COMPLETE THE MOST NUMBER OF CYCLES in all cycle type

WITH loader_truck_completed_summary AS
(
	SELECT `Cycle Type`, `Primary Machine Name`, count(`Primary Machine Name`) AS `Number of cycle Completed`
	FROM `cycle_data`
	where  `Completed Cycle Count` = 'Yes'
	GROUP BY `Cycle Type`, `Primary Machine Name`
), PARTITION_SUMMARY
AS(
		SELECT *, row_number() OVER( PARTITION BY `Cycle Type` ORDER BY `Number of cycle Completed` DESC) AS row_num
        FROM loader_truck_completed_summary
        order by `Cycle Type` desc
 )
			SELECT `Cycle Type`, `Primary Machine Name`, `Number of cycle Completed`
            FROM PARTITION_SUMMARY
            WHERE row_num <=5;

-- ----------------------------------------------------------------------------------------------------------------------------
-- 11) amount of paylod load or excavated done by each machine
SELECT `Cycle Type`, `Primary Machine Name`, round(sum(`Payload (t)`),2) AS `Total Payload in tonnes`
FROM `cycle_data`
where `Cycle Type` in ( 'TruckCycle', "LoaderCycle")
GROUP BY `Cycle Type`,`Primary Machine Name`
order by round(sum(`Payload (t)`),2) desc;

-- 12) amount of total payload load or excavated by trucks and loaders or shovels respectively
SELECT `Cycle Type`,  round(sum(`Payload (t)`),2) AS `Total Payload in tonnes`
FROM `cycle_data`
where `Cycle Type` in ( 'TruckCycle', "LoaderCycle")
GROUP BY `Cycle Type`
order by round(sum(`Payload (t)`),2) desc;

-- 13) Top 5 loaders and Trucks
WITH loader_truck_payload_summary AS
(
	SELECT `Cycle Type`, `Primary Machine Name`, round(sum(`Payload (t)`),2) AS `Total Payload in tonnes`
	FROM `cycle_data`
	WHERE `Payload (t)`>0
	GROUP BY `Cycle Type`,`Primary Machine Name`
	ORDER BY round(sum(`Payload (t)`),2) desc
), LOADER_PARTITION_SUMMARY
AS(
		SELECT *, row_number() OVER( PARTITION BY `Cycle Type` ORDER BY `Total Payload in tonnes` DESC) AS row_num
        FROM loader_truck_payload_summary
 )
			SELECT `Cycle Type`, `Primary Machine Name`, `Total Payload in tonnes`
            FROM LOADER_PARTITION_SUMMARY
            WHERE row_num <=5;
        
-- ----------------------------------------------------------------------------------------------------------------------------
-- 14) Shovels class vs Loader class in loading

select `Primary Machine Category Name`,  `Secondary Machine Category Name`,
		count(`Primary Machine Category Name`) as "total_machines",
        round(sum(`Payload (t)`),2) as 'total payload',
        round(sum(`Payload (t)`)/sum(`Loading Count`),2) as Loading_capacity,
        round(avg(`Loading Efficiency`),2) as avg_loading_efficiency,
        sum(`Loading Count`) as total_loading_count
from `cycle_data`
where `Cycle Type` = "LoaderCycle" and `Secondary Machine Category Name` <> "unknown"
group by `Primary Machine Category Name`,  `Secondary Machine Category Name`;



-- 15) Truck Loading qty, loading Capacity, efficiency and count
select `Primary Machine Category Name`,  `Secondary Machine Category Name`,
		count(`Primary Machine Category Name`) as "total_machines",
        round(sum(`Payload (t)`),2) as 'total payload',
        round(sum(`Payload (t)`)/sum(`Loading Count`),2) as Loading_capacity,
        sum(`Loading Count`)
from `cycle_data`
where `Cycle Type` = "TruckCycle"
group by `Primary Machine Category Name`,  `Secondary Machine Category Name`;

-- ----------------------------------------------------------------------------------------------------------------------------

-- 16) Payload per cycle

SELECT `Cycle Type`,
    ROUND(SUM(`payload (t)`) / count(`completed cycle count`),2) AS payload_per_cycle
FROM
    `cycle_data`
WHERE  `completed cycle count` = 'Yes'

group by `Cycle Type`;


-- ----------------------------------------------------------------------------------------------------------------------------

-- 17) Actual vs planned rate
select  *
from actual_planned_metrics_view;

-- 18) Top 5 trucks with best average truck mileage

select *
from fuel_metrics_view
order by `Avg Truck Mileage in Total` desc limit 5;

-- 19) Top 5 trucks with poor average truck mileage

select *
from fuel_metrics_view
order by `Avg Truck Mileage in Total` asc limit 5;

-- 20) Top 5 trucks with best average truck mileage

select *
from fuel_metrics_view
order by `Avg Truck Mileage in Total` desc limit 5;





