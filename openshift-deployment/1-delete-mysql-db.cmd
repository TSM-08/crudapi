rem ================================================================================================================================
rem  Delete MySql DB 
rem ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   
rem =================================================================================================================================

call login.cmd
oc project %APP_PROJ%

oc delete all -l app=mysqldb
oc delete secret -l app=mysqldb 

pause


