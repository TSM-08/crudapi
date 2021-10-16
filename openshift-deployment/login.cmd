@echo off

echo **************************************************************
echo * oc login --server%OC_URL% --token=%OC_TOKEN%
echo * oc login --server%OC_URL% -u %OC_USER% -p %OC_PSW%
echo * HOW TO GET API URL:
echo * oc config view --minify -o jsonpath='{.clusters[*].cluster.server}'
echo **************************************************************

  set OC_URL=https://api.sandbox.x8i5.p1.openshiftapps.com:6443
  set OC_TOKEN=sha256~aUwkqtsLUZ4VxpLvIZ9p2inTxaz_dT8-akJ93HDlwnE


  set APP_DNS=apps.sandbox.x8i5.p1.openshiftapps.com
  set APP_PROJ=stseluiko-dev

if "%OC_URL%" == "" (
   echo ===========================================
   echo Undefined cluster URL
   echo set env variable OC_URL
   echo ===========================================
   pause
   goto l_exit
)   


if "%OC_TOKEN%" == "" (
   echo ===========================================
   echo Undefined opensshift login token
   echo set env variable OC_TOKEN
   echo ===========================================
   pause
   goto l_exit
)   


echo oc login --token=%OC_TOKEN% --server=%OC_URL%
oc login --token=%OC_TOKEN% --server=%OC_URL%


:l_exit  

