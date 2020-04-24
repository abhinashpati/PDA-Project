use default;

DROP TABLE covid19_general;

CREATE TABLE IF NOT EXISTS covid19_general(countryid int, country string,countrycode string,confirmed int,deaths int,recovered int,firstreportedon string,firstschoolclosedon string,daystakentoclose int,population int, medianage int, urbanpopulation int, gdp int, age0to14 float, age15to64 float, ageover65 float, sexratiobirth float, sexratioage0to14 float, sexratioage15to24 float, sexratioage25to54 float, sexratioage55to64 float, sexratioover65 float, sexratiooverall float, hospitalbedsper1000HAB float) STORED BY 'org.apache.hadoop.hive.cassandra.CassandraStorageHandler'
WITH SERDEPROPERTIES (
"cassandra.host" = "127.0.0.1",
"cassandra.port" = "9042",
"cassandra.ks.name" = "covid19",
"cassandra.cf.name" = "covid19_general" ,
"cassandra.columns.mapping" = "countryid,country,countrycode,confirmed,deaths,recovered,firstreportedon,firstschoolclosedon,daystakentoclose,population,medianage,urbanpopulation,gdp,age0to14,age15to64,aageover65,sexratiobirth,sexratioage0to14,sexratioage15to24,sexratioage25to54,sexratioage55to64,sexratioover65,sexratiooverall,hospitalbedsper1000HAB");

DESCRIBE covid19_general;

DROP TABLE covid19_timeseries;

CREATE TABLE IF NOT EXISTS covid19_timeseries(id int,countryid int,country string,dateseries string,confirmed int,deaths int,recovered int) STORED BY 'org.apache.hadoop.hive.cassandra.CassandraStorageHandler'
WITH SERDEPROPERTIES (
"cassandra.host" = "127.0.0.1",
"cassandra.port" = "9042",
"cassandra.ks.name" = "covid19",
"cassandra.cf.name" = "covid19_timeseries" ,
"cassandra.columns.mapping" = "id,countryid,country,dateseries,confirmed,deaths,recovered");

DESCRIBE covid19_timeseries;
