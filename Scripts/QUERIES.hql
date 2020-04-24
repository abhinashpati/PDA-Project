use default;
SELECT country,confirmed,deaths, deaths/confirmed AS ratio FROM covid19_general SORT BY ratio DESC LIMIT 20;
SELECT country,confirmed,deaths, deaths/confirmed AS ratio FROM covid19_general SORT BY ratio LIMIT 20;
SELECT country,confirmed,recovered, recovered/confirmed AS ratio FROM covid19_general SORT BY ratio DESC LIMIT 20;
SELECT country,confirmed,recovered, recovered/confirmed AS ratio FROM covid19_general SORT BY ratio LIMIT 20;
SELECT CG.country,CT.confirmed,CT.deaths,CG.medianage FROM covid19_general CG JOIN covid19_timeseries CT WHERE dateseries LIKE '%20-04-2020%' AND CG.countryid = CT.countryid SORT BY CG.medianage,CT.deaths DESC LIMIT 10;
SELECT CG.country,CT.confirmed,CT.deaths,CG.medianage FROM covid19_general CG JOIN covid19_timeseries CT WHERE dateseries LIKE '%20-04-2020%' AND CG.countryid = CT.countryid SORT BY CT.deaths DESC LIMIT 10;

SELECT CG.country,CG.ageover65,CT.confirmed,CT.deaths FROM covid19_general CG JOIN covid19_timeseries CT WHERE dateseries LIKE '%20-04-2020%' AND CG.countryid=CT.countryid SORT BY CG.ageover65 DESC LIMIT 10;

DESCRIBE covid19_general;
DESCRIBE covid19_timeseries;


use default;

SELECT CG.country,CG.hospitalbedsper1000hab, CT.confirmed, (CT.confirmed-CT.recovered-CT.deaths) AS active, (((CT.confirmed-CT.recovered-CT.deaths)/1000)/CG.hospitalbedsper1000hab) FROM covid19_general CG JOIN covid19_timeseries CT WHERE CT.dateseries LIKE '%20-04-2020%' AND (CT.confirmed-CT.recovered-CT.deaths >=1000) AND CG.countryid = CT.countryid SORT BY active DESC LIMIT 10;

Set hive.support.concurrency = true
Set hive.enforce.bucketing = true
set hive.exec.dynamic.partition.mode = nonstrict
set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager
set hive.compactor.initiator.on = true
set hive.compactor.worker.threads =1

UPDATE covid19_timeseries SET deaths=24114 WHERE countryid=72 AND dateseries LIKE '%20-04-2020%'

FROM covid19_general SELECT firstreportedon,country GROUP BY firstreportedon,country SORT BY firstreportedon;
FROM covid19_general SELECT firstschoolclosedon,country GROUP BY firstschoolclosedon,country SORT BY firstschoolclosedon;
FROM covid19_general SELECT country,firstreportedon,MAX(daystakentoclose) AS timetaken GROUP BY country,firstreportedon SORT BY timetaken DESC LIMIT 10;
FROM covid19_general SELECT firstreportedon, COUNT(firstreportedon) as cou GROUP BY firstreportedon,country SORT BY cou DESC LIMIT 10;
FROM covid19_general SELECT country,firstreportedon WHERE firstreportedon LIKE '%14-03-2020%' SORT BY country;


FROM covid19_general SELECT AVG(daystakentoclose) AS timetaken;
FROM covid19_general SELECT country,firstreportedon,MIN(daystakentoclose) AS timetaken GROUP BY country,firstreportedon SORT BY timetaken LIMIT 10;
FROM covid19_general SELECT COUNT(country) WHERE daystakentoclose <= 7 LIMIT 10;

FROM covid19_timeseries SELECT country, confirmed,collect_set(deaths)[0] WHERE dateseries LIKE '%22-01-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;
FROM covid19_timeseries SELECT country, confirmed,collect_set(deaths)[0] WHERE dateseries LIKE '%22-02-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;
FROM covid19_timeseries SELECT country, confirmed,collect_set(deaths)[0] WHERE dateseries LIKE '%22-03-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;
FROM covid19_timeseries SELECT country, confirmed,collect_set(deaths)[0] WHERE dateseries LIKE '%20-04-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;

FROM covid19_timeseries SELECT SUM(confirmed),SUM(deaths),SUM(recovered) WHERE dateseries LIKE '%22-01-2020%';
FROM covid19_timeseries SELECT SUM(confirmed),SUM(deaths),SUM(recovered) WHERE dateseries LIKE '%22-02-2020%';
FROM covid19_timeseries SELECT SUM(confirmed),SUM(deaths),SUM(recovered) WHERE dateseries LIKE '%22-03-2020%';
FROM covid19_timeseries SELECT SUM(confirmed),SUM(deaths),SUM(recovered) WHERE dateseries LIKE '%20-04-2020%';
