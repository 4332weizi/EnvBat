@echo off  
echo ��Ϊ�����û�������֮ǰ��������������Android sdk�İ�װ·����  
SET /p AndroidSDK_Dir=������android sdk�İ�װ·��(��D:\Android\sdk):  
  
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

echo ��������Android��������...  
echo �½�ANDROID_HOME��%AndroidSDK_Dir%  
wmic ENVIRONMENT create name="ANDROID_HOME",username="<system>",VariableValue="%AndroidSDK_Dir%"  
echo �½�ANDROID_SDK_HOME��%AndroidSDK_Dir%  
wmic ENVIRONMENT create name="ANDROID_SDK_HOME",username="<system>",VariableValue="%AndroidSDK_Dir%"  
echo ����PATH��;%%ANDROID_SDK_HOME%%\tools;%%ANDROID_SDK_HOME%%\platform-tools  
wmic ENVIRONMENT where  "name='path' and username='<system>'" set VariableValue="%PATH%;%%ANDROID_SDK_HOME%%\tools;%%ANDROID_SDK_HOME%%\platform-tools"     

pause  