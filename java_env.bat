@echo off  
echo 在为您配置环境变量之前，请您输入您的Java sdk的安装路径！  
SET /p JavaSDK_Dir=请输入java sdk的安装路径(如C:\Java\j2sdk1.5.0):  
  
::*****************************************************************************************************  
::                              ENVIRONMENT - 系统环境设置管理(全局)                                  *  
::获取temp环境变量                                                                                    *  
::wmic ENVIRONMENT where "name='temp'" get UserName,VariableValue                                     *  
::更改path环境变量值,新增e:\tools                                                                     *  
::wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;e:\tools"    *  
::新增系统环境变量home,值为%HOMEDRIVE%%HOMEPATH%                                                      *  
::wmic ENVIRONMENT create name="home",username="<system>",VariableValue="%HOMEDRIVE%%HOMEPATH%"       *  
::删除home环境变量                                                                                    *  
::wmic ENVIRONMENT where "name='home'" delete                                                         *  
::*****************************************************************************************************  
  
echo 正在设置JAVA环境变量...  
echo 新建JAVA_HOME：%JavaSDK_Dir%  
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%JavaSDK_Dir%"  
echo 增加PATH：;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin  
wmic ENVIRONMENT where  "name='path' and username='<system>'" set VariableValue="%PATH%;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin"   
echo 新建CLASSPATH：.;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;  
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;"  
  
pause  

