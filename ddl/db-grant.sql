tee log\db-grant.log

grant all privileges on nbudb.* to 'devadm'@'%';
grant super on *.* to 'devadm'@'%';
show grants for 'devadm'@'%';
