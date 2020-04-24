use default;
INSERT OVERWRITE DIRECTORY 'pda/q1' row format delimited fields terminated by ',' SELECT country,confirmed,deaths, deaths/confirmed AS ratio FROM covid19_general SORT BY ratio DESC LIMIT 20;
INSERT OVERWRITE DIRECTORY 'pda/q2' row format delimited fields terminated by ',' SELECT country,confirmed,deaths, deaths/confirmed AS ratio FROM covid19_general SORT BY ratio LIMIT 20;
INSERT OVERWRITE DIRECTORY 'pda/q3' row format delimited fields terminated by ',' SELECT country,confirmed,recovered, recovered/confirmed AS ratio FROM covid19_general SORT BY ratio DESC LIMIT 20;
INSERT OVERWRITE DIRECTORY 'pda/q4' row format delimited fields terminated by ',' SELECT country,confirmed,recovered, recovered/confirmed AS ratio FROM covid19_general SORT BY ratio LIMIT 20;
INSERT OVERWRITE DIRECTORY 'pda/q5' row format delimited fields terminated by ',' SELECT CG.country,CT.confirmed,CT.deaths,CG.medianage FROM covid19_general CG JOIN covid19_timeseries CT WHERE dateseries LIKE '%20-04-2020%' AND CG.countryid = CT.countryid SORT BY CG.medianage,CT.deaths DESC LIMIT 10;
INSERT OVERWRITE DIRECTORY 'pda/q6' row format delimited fields terminated by ',' SELECT CG.country,CT.confirmed,CT.deaths,CG.medianage FROM covid19_general CG JOIN covid19_timeseries CT WHERE dateseries LIKE '%20-04-2020%' AND CG.countryid = CT.countryid SORT BY CT.deaths DESC LIMIT 10;

INSERT OVERWRITE DIRECTORY 'pda/q7' row format delimited fields terminated by ',' SELECT CG.country,CG.ageover65,CT.confirmed,CT.deaths FROM covid19_general CG JOIN covid19_timeseries CT WHERE dateseries LIKE '%20-04-2020%' AND CG.countryid=CT.countryid SORT BY CG.ageover65 DESC LIMIT 10;

INSERT OVERWRITE DIRECTORY 'pda/q8' row format delimited fields terminated by ',' SELECT CG.country,CG.hospitalbedsper1000hab, CT.confirmed, (CT.confirmed-CT.recovered-CT.deaths) AS active, (((CT.confirmed-CT.recovered-CT.deaths)/1000)/CG.hospitalbedsper1000hab) FROM covid19_general CG JOIN covid19_timeseries CT WHERE CT.dateseries LIKE '%20-04-2020%' AND (CT.confirmed-CT.recovered-CT.deaths >=1000) AND CG.countryid = CT.countryid SORT BY active DESC LIMIT 10;

INSERT OVERWRITE DIRECTORY 'pda/q9'  row format delimited fields terminated by ',' SELECT firstreportedon,country FROM covid19_general GROUP BY firstreportedon,country SORT BY firstreportedon;
INSERT OVERWRITE DIRECTORY 'pda/q10' row format delimited fields terminated by ',' SELECT firstschoolclosedon,country FROM covid19_general GROUP BY firstschoolclosedon,country SORT BY firstschoolclosedon;
INSERT OVERWRITE DIRECTORY 'pda/q11' row format delimited fields terminated by ',' SELECT country,firstreportedon,MAX(daystakentoclose) AS timetaken FROM covid19_general GROUP BY country,firstreportedon SORT BY timetaken DESC;
INSERT OVERWRITE DIRECTORY 'pda/q12' row format delimited fields terminated by ',' SELECT firstreportedon, COUNT(firstreportedon) as cou  FROM covid19_general GROUP BY firstreportedon,country SORT BY cou DESC LIMIT 10;
INSERT OVERWRITE DIRECTORY 'pda/q13' row format delimited fields terminated by ',' SELECT country,firstreportedon FROM covid19_general WHERE firstreportedon LIKE '%14-03-2020%' SORT BY country;


INSERT OVERWRITE DIRECTORY 'pda/q14' row format delimited fields terminated by ',' SELECT AVG(daystakentoclose) AS timetaken FROM covid19_general;
INSERT OVERWRITE DIRECTORY 'pda/q15' row format delimited fields terminated by ',' SELECT country,firstreportedon,MIN(daystakentoclose) AS timetaken FROM covid19_general GROUP BY country,firstreportedon SORT BY timetaken LIMIT 10;
INSERT OVERWRITE DIRECTORY 'pda/q16' row format delimited fields terminated by ',' SELECT COUNT(country) FROM covid19_general WHERE daystakentoclose <= 7 LIMIT 10;

INSERT OVERWRITE DIRECTORY 'pda/q17' row format delimited fields terminated by ',' SELECT country, confirmed,collect_set(deaths)[0] FROM covid19_timeseries WHERE dateseries LIKE '%22-01-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;
INSERT OVERWRITE DIRECTORY 'pda/q18' row format delimited fields terminated by ',' SELECT country, confirmed,collect_set(deaths)[0] FROM covid19_timeseries WHERE dateseries LIKE '%22-02-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;
INSERT OVERWRITE DIRECTORY 'pda/q19' row format delimited fields terminated by ',' SELECT country, confirmed,collect_set(deaths)[0] FROM covid19_timeseries WHERE dateseries LIKE '%22-03-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;
INSERT OVERWRITE DIRECTORY 'pda/q20' row format delimited fields terminated by ',' SELECT country, confirmed,collect_set(deaths)[0] FROM covid19_timeseries WHERE dateseries LIKE '%20-04-2020%' GROUP BY country,confirmed SORT BY confirmed DESC LIMIT 10;

INSERT OVERWRITE DIRECTORY 'pda/q21' row format delimited fields terminated by ',' SELECT SUM(confirmed),SUM(deaths),SUM(recovered) FROM covid19_timeseries  WHERE dateseries LIKE '%22-01-2020%';
INSERT OVERWRITE DIRECTORY 'pda/q22' row format delimited fields terminated by ',' SELECT SUM(confirmed),SUM(deaths),SUM(recovered) FROM covid19_timeseries  WHERE dateseries LIKE '%22-02-2020%';
INSERT OVERWRITE DIRECTORY 'pda/q23' row format delimited fields terminated by ',' SELECT SUM(confirmed),SUM(deaths),SUM(recovered) FROM covid19_timeseries WHERE dateseries LIKE '%22-03-2020%';
INSERT OVERWRITE DIRECTORY 'pda/q24' row format delimited fields terminated by ',' SELECT SUM(confirmed),SUM(deaths),SUM(recovered) FROM covid19_timeseries WHERE dateseries LIKE '%20-04-2020%';
INSERT OVERWRITE DIRECTORY 'pda/q25' row format delimited fields terminated by ',' SELECT AVG(confirmed),AVG(deaths),AVG(recovered) FROM covid19_general;
