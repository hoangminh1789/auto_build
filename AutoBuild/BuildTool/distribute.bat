ECHO.
ECHO [[= Load distribute.bat
ECHO %OUTPUT_PATH%

SET BUCKET=demo-421214

gcloud storage cp %OUTPUT_PATH% gs://%BUCKET%

ECHO End of distribute.bat