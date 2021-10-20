tee log\db-build.log

drop database IF EXISTS nbudb;

create database nbudb;

show databases;

use nbudb;

CREATE TABLE nbu_ccy
(
    ccy_irec   int AUTO_INCREMENT,
    ccy_code   varchar(3),
    ccy_isoc   varchar(3),
    ccy_name   varchar(255),
    CONSTRAINT nbu_ccy_pk PRIMARY KEY (ccy_irec),
    CONSTRAINT nbu_ccy_code_unq UNIQUE(ccy_code),
    CONSTRAINT nbu_ccy_isoc_unq UNIQUE(ccy_isoc)
);

CREATE TABLE nbu_rates
(
    rat_irec   int AUTO_INCREMENT,
    rep_date   date,
    ccy_irec   int, 
    ccy_rate   numeric(10,6),
    CONSTRAINT nbu_rates_pk PRIMARY KEY (rat_irec),
    CONSTRAINT nbu_rates_date_nnl CHECK(rep_date IS NOT NULL),
    CONSTRAINT nbu_rates_crec_nnl CHECK(ccy_irec IS NOT NULL),
    CONSTRAINT nbu_rates_rate_nnl CHECK(ccy_rate IS NOT NULL),
    CONSTRAINT nbu_rates_cdrt_unq UNIQUE(rep_date, ccy_irec)
);

SHOW TABLES;
