tee log\db-idata.log

use nbudb;

delete from nbu_ccy;
delete from nbu_rates;

insert into nbu_ccy (ccy_code, ccy_isoc, ccy_name) values ('840', 'USD', 'Dollar USA');
insert into nbu_ccy (ccy_code, ccy_isoc, ccy_name) values ('978', 'EUR', 'EURO');


select a.* from  nbu_ccy a;