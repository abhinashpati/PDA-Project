use default;

DROP TABLE covid19_general;

CREATE TABLE IF NOT EXISTS covid19_general(countryid int, country string,countrycode string,confirmed int,deaths int,recovered int,firstreportedon string,firstschoolclosedon string,daystakentoclose int,population int, medianage int, urbanpopulation int, gdp int, age0to14 float, age15to64 float, ageover65 float, sexratiobirth float, sexratioage0to14 float, sexratioage15to24 float, sexratioage25to54 float, sexratioage55to64 float, sexratioover65 float, sexratiooverall float, hospitalbedsper1000HAB float) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

DESCRIBE covid19_general;

LOAD DATA LOCAL INPATH '/media/sf_Downloads/scripts/Data/covid19.csv' INTO TABLE covid19_general;

SELECT COUNT(countrycode) FROM covid19_general;

DROP TABLE covid19_timeseries;

CREATE TABLE IF NOT EXISTS covid19_timeseries(countryid int,country string,dateseries string,confirmed int,deaths int,recovered int) ROW FORMAT DELIMITED FIELDS TERMINATED BY ',';

DESCRIBE covid19_timeseries;

LOAD DATA LOCAL INPATH '/media/sf_Downloads/scripts/Data/time_series_covid_19.csv' INTO TABLE covid19_timeseries;

SELECT COUNT(DISTINCT country) FROM covid19_timeseries;
