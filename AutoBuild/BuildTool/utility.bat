ECHO.
ECHO [[== Execute utility.bat
CALL :%*
EXIT /b %errorlevel%

:zip_file
ECHO Running zip file
GOTO EOF

:validate_file
ECHO Running verify file
GOTO EOF

:EOF
ECHO End of utility.bat ==]]
ECHO.

EXIT /b 0