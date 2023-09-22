ECHO.
ECHO [[== Load dev.bat
CALL :%*
EXIT /b %errorlevel%

:global_config
ECHO - Executing :global_config
CALL :define_symbols ds
CALL :namespace ns
SET "%~1=%ds% %ns%"
GOTO :EOF

:define_symbols
ECHO - Executing :define_symbols
SET "%~1=-scriptingDefineSymbols BUILD_DEV,ENABLE_LOG"
GOTO :EOF

:namespace
ECHO - Executing :namespace
SET "%~1=-namespace com.minhnh.autobuild"
GOTO :EOF