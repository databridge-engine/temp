set stop=0

net stop "QlikSenseProxyService"
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop "QlikSensePrintingService"
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop "QlikSenseSchedulerService"
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop "QlikSenseEngineService"
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop "QlikSenseServiceDispatcher"
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop "QlikSenseRepositoryService"
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop QlikLoggingService
IF %ERRORLEVEL% NEQ 0 set stop=4
net stop "QlikSenseRepositoryDatabase"
IF %ERRORLEVEL% NEQ 0 set stop=4

rem cause a ~10 seconds sleep before checking the service state

ping 127.0.0.1 -n 10 -w 1000 > nul

net start "QlikSenseRepositoryDatabase"
IF %ERRORLEVEL% NEQ 0 set stop=5
net start "QlikSenseRepositoryService"
IF %ERRORLEVEL% NEQ 0 set stop=5
net start "QlikSenseServiceDispatcher"
IF %ERRORLEVEL% NEQ 0 set stop=5
net start QlikLoggingService
IF %ERRORLEVEL% NEQ 0 set stop=5
net start "QlikSenseEngineService"
IF %ERRORLEVEL% NEQ 0 set stop=5
net start "QlikSenseSchedulerService"
IF %ERRORLEVEL% NEQ 0 set stop=5
net start "QlikSensePrintingService"
IF %ERRORLEVEL% NEQ 0 set stop=5
net start "QlikSenseProxyService"
IF %ERRORLEVEL% NEQ 0 set stop=5

exit %stop%
