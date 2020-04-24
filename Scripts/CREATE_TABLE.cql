create keyspace covid19 with replication = {'class':'SimpleStrategy','replication_factor':3};

create table covid19.covid19_general(
countryid int, country string,countrycode string,confirmed int,deaths int,recovered int,firstreportedon string,firstschoolclosedon string,daystakentoclose int,population int, medianage int, urbanpopulation int, gdp int, age0to14 float, age15to64 float, ageover65 float, sexratiobirth float, sexratioage0to14 float, sexratioage15to24 float, sexratioage25to54 float, sexratioage55to64 float, sexratioover65 float, sexratiooverall float, hospitalbedsper1000HAB float,primary key(countryid));


create table covid19.covid19_timeseries(id,countryid int,country string,dateseries string,confirmed int,deaths int,recovered int,primary key(id));


copy covid19.covid19_general(
countryid int, country string,countrycode string,confirmed int,deaths int,recovered int,firstreportedon string,firstschoolclosedon string,daystakentoclose int,population int, medianage int, urbanpopulation int, gdp int, age0to14 float, age15to64 float, ageover65 float, sexratiobirth float, sexratioage0to14 float, sexratioage15to24 float, sexratioage25to54 float, sexratioage55to64 float, sexratioover65 float, sexratiooverall float, hospitalbedsper1000HAB float) from 'covid19.csv' with header=false;

copy covid19.covid19_general(
countryid int, country string,countrycode string,confirmed int,deaths int,recovered int,firstreportedon string,firstschoolclosedon string,daystakentoclose int,population int, medianage int, urbanpopulation int, gdp int, age0to14 float, age15to64 float, ageover65 float, sexratiobirth float, sexratioage0to14 float, sexratioage15to24 float, sexratioage25to54 float, sexratioage55to64 float, sexratioover65 float, sexratiooverall float, hospitalbedsper1000HAB float) to 'covid19.csv' with header=false and delimiter=',' and NULL='0';

copy covid19.covid19_general(
countryid int, country string,countrycode string,confirmed int,deaths int,recovered int,firstreportedon string,firstschoolclosedon string,daystakentoclose int,population int, medianage int, urbanpopulation int, gdp int, age0to14 float, age15to64 float, ageover65 float, sexratiobirth float, sexratioage0to14 float, sexratioage15to24 float, sexratioage25to54 float, sexratioage55to64 float, sexratioover65 float, sexratiooverall float, hospitalbedsper1000HAB float) from 'covid19.csv' with header=false;


copy covid19.covid19_timeseries(id,countryid int,country string,dateseries string,confirmed int,deaths int,recovered int) from 'time_series_covid_19.csv' with header=false;

copy covid19.covid19_timeseries(id,countryid int,country string,dateseries string,confirmed int,deaths int,recovered int) to 'time_series_covid_19.csv' with header=false and delimiter=',' and NULL='0';

copy covid19.covid19_timeseries(id,countryid int,country string,dateseries string,confirmed int,deaths int,recovered int) from 'time_series_covid_19.csv' with header=false;
