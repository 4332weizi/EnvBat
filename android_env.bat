@echo off  
echo 在为您配置环境变量之前，请您输入您的Android sdk的安装路径！  
SET /p AndroidSDK_Dir=请输入android sdk的安装路径(如D:\Android\sdk):  
  
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

echo 正在设置Android环境变量...  
echo 新建ANDROID_HOME：%AndroidSDK_Dir%  
wmic ENVIRONMENT create name="ANDROID_HOME",username="<system>",VariableValue="%AndroidSDK_Dir%"  
echo 新建ANDROID_SDK_HOME：%AndroidSDK_Dir%  
wmic ENVIRONMENT create name="ANDROID_SDK_HOME",username="<system>",VariableValue="%AndroidSDK_Dir%"  
echo 增加PATH：;%%ANDROID_SDK_HOME%%\tools;%%ANDROID_SDK_HOME%%\platform-tools  
wmic ENVIRONMENT where  "name='path' and username='<system>'" set VariableValue="%PATH%;%%ANDROID_SDK_HOME%%\tools;%%ANDROID_SDK_HOME%%\platform-tools"     

pause  