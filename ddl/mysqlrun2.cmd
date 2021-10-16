@echo off
echo =======================================================
echo RUN  DDL, DML from  MySQL CLI
echo ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

set path="C:\Program Files\MySQL\MySQL Server 8.0\bin";%path%
@echo on
copy db-build.sql + db-grant.sql + db-idata.sql mysqlpkg.tmp
mysql.exe  -uroot -p22 --default-character-set=utf8mb4 -v --port 13306 < mysqlpkg.tmp
del mysqlpkg.tmp


