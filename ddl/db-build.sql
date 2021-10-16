tee log\db-build.log

drop database IF EXISTS nbudb;

create database nbudb;

show databases;

use nbudb;

CREATE TABLE nbu_ccy
(
    ccy_code varchar(3),
    ccy_isoa varchar(3),
    ccy_name varchar(255),
    CONSTRAINT nbu_ccy_pk PRIMARY KEY (ccy_code),
    CONSTRAINT nbu_ccy_pk UNIQUE(ccy_isoa)
);

CREATE TABLE nbu_rates
(
    idrec    int AUTO_INCREMENT,
    rep_date date,
    ccy_code varchar(3), 
    ccy_rate numeric(10,6),
    CONSTRAINT nbu_rates_pk PRIMARY KEY (idrec),
    CONSTRAINT nbu_rates_date_nnl CHECK(rep_date IS NOT NULL),
    CONSTRAINT nbu_rates_code_nnl CHECK(ccy_code IS NOT NULL),
    CONSTRAINT nbu_rates_rate_nnl CHECK(ccy_rate IS NOT NULL),
    CONSTRAINT nbu_rates_cdrt_uq  UNIQUE(rep_date, ccy_code)
);

SHOW TABLES;
tee log\db-grant.log

grant all privileges on nbudb.* to 'devadm'@'%';
grant super on *.* to 'devadm'@'%';
show grants for 'devadm'@'%';
tee log\db-grant.log

grant all privileges on nbudb.* to 'devadm'@'%';
grant super on *.* to 'devadm'@'%';
show grants for 'devadm'@'%';
