use default;

INSERT OVERWRITE DIRECTORY 'pda/q19' row format delimited fields terminated by ',' SELECT firstreportedon, country FROM covid19_general GROUP BY firstreportedon,country SORT BY firstreportedon;
