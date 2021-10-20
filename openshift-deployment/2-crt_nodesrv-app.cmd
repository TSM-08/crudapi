echo ****************************************
echo *    create Node.js application
echo * 
echo ****************************************

call login.cmd

oc project %APP_PROJ%
pause

echo *****************************************************************************
echo *    create  application
echo * 
echo ****************************************

oc new-app https://github.com/TSM-08/crudapi#main --context-dir=/node-server  --name="nodesrv" -e IDB_HOST=mysql -e IDB_DB=test4 -e IDB_USR=devadm -e IDB_PSW="**" --strategy=source"

pause

echo ****************************************
echo *    create  Router
echo * 
echo ****************************************
oc expose svc/nodesrv --hostname="nodesrv-%APP_PROJ%.%APP_DNS%" --name="nodesrv-%APP_PROJ%.%APP_DNS%" --port 8080



pause

