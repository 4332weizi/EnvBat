@echo off  
echo 在为您配置环境变量之前，请您输入您的Tomcat的安装路径！  
SET /p Tomcat_Dir=请输入Tomcat的安装路径(如C:\apache-tomcat-7.0.42):  
  
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
  
echo 正在设置Tomcat环境变量...  
echo 新建TOMCAT_HOME：%Tomcat_Dir%  
wmic ENVIRONMENT create name="TOMCAT_HOME",username="<system>",VariableValue="%Tomcat_Dir%"  
echo 新建CATALINA_HOME：%Tomcat_Dir%  
wmic ENVIRONMENT create name="CATALINA_HOME",username="<system>",VariableValue="%Tomcat_Dir%"  
echo 新建CATALINA_BASE：%Tomcat_Dir%  
wmic ENVIRONMENT create name="CATALINA_BASE",username="<system>",VariableValue="%Tomcat_Dir%"  
echo 增加PATH：;%Tomcat_Dir%\lib;%Tomcat_Dir%\bin  
wmic ENVIRONMENT where  "name='path' and username='<system>'" set VariableValue="%PATH%;%%CATALINA_HOME%%\lib;%%CATALINA_HOME%%\bin"   
  
pause  