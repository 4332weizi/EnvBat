@echo off  
echo ��Ϊ�����û�������֮ǰ��������������Java sdk�İ�װ·����  
SET /p JavaSDK_Dir=������java sdk�İ�װ·��(��C:\Java\j2sdk1.5.0):  
  
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

echo ��������JAVA��������...  
echo �½�JAVA_HOME��%JavaSDK_Dir%  
wmic ENVIRONMENT create name="JAVA_HOME",username="<system>",VariableValue="%JavaSDK_Dir%"  
echo ����PATH��;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin  
wmic ENVIRONMENT where  "name='path' and username='<system>'" set VariableValue="%PATH%;%%JAVA_HOME%%\bin;%%JAVA_HOME%%\jre\bin"   
echo �½�CLASSPATH��.;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;  
wmic ENVIRONMENT create name="CLASSPATH",username="<system>",VariableValue=".;%%JAVA_HOME%%\lib;%%JAVA_HOME%%\lib\dt.jar;%%JAVA_HOME%%\lib\tools.jar;"  

pause  

