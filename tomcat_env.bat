@echo off  
echo ��Ϊ�����û�������֮ǰ��������������Tomcat�İ�װ·����  
SET /p Tomcat_Dir=������Tomcat�İ�װ·��(��C:\apache-tomcat-7.0.42):  
  
::*****************************************************************************************************  
::                              ENVIRONMENT - ϵͳ�������ù���(ȫ��)                                  *  
::��ȡtemp��������                                                                                    *  
::wmic ENVIRONMENT where "name='temp'" get UserName,VariableValue                                     *  
::����path��������ֵ,����e:\tools                                                                     *  
::wmic ENVIRONMENT where "name='path' and username='<system>'" set VariableValue="%path%;e:\tools"    *  
::����ϵͳ��������home,ֵΪ%HOMEDRIVE%%HOMEPATH%                                                      *  
::wmic ENVIRONMENT create name="home",username="<system>",VariableValue="%HOMEDRIVE%%HOMEPATH%"       *  
::ɾ��home��������                                                                                    *  
::wmic ENVIRONMENT where "name='home'" delete                                                         *  
::*****************************************************************************************************  
  
echo ��������Tomcat��������...  
echo �½�TOMCAT_HOME��%Tomcat_Dir%  
wmic ENVIRONMENT create name="TOMCAT_HOME",username="<system>",VariableValue="%Tomcat_Dir%"  
echo �½�CATALINA_HOME��%Tomcat_Dir%  
wmic ENVIRONMENT create name="CATALINA_HOME",username="<system>",VariableValue="%Tomcat_Dir%"  
echo �½�CATALINA_BASE��%Tomcat_Dir%  
wmic ENVIRONMENT create name="CATALINA_BASE",username="<system>",VariableValue="%Tomcat_Dir%"  
echo ����PATH��;%Tomcat_Dir%\lib;%Tomcat_Dir%\bin  
wmic ENVIRONMENT where  "name='path' and username='<system>'" set VariableValue="%PATH%;%%CATALINA_HOME%%\lib;%%CATALINA_HOME%%\bin"   
  
pause  