LOAD DATA LOCAL INPATH '/media/sf_Downloads/scripts/Data/covid19.csv' INTO TABLE covid19_general;


SELECT COUNT(countrycode) FROM covid19_general;

LOAD DATA LOCAL INPATH '/media/sf_Downloads/scripts/Data/time_series_covid_19.csv' INTO TABLE covid19_timeseries;


SELECT COUNT(DISTINCT country) FROM covid19_timeseries;
