REM T: is hard coded directory path set in the other script
REM domain\ is hard coded user domain

REM usage: fix_perms.bat %username%
REM Recursively assign ownership to Administrators.  Answer prompts with "Y".
takeown /R /A /F t:\%1 /D Y
REM Grant Full permissions on folder and subfolders to Administrators, SYSTEM, and the user
cacls t:\%1 /T /E /P "Administrators":F
cacls t:\%1 /T /E /P SYSTEM:F
cacls t:\%1 /T /E /P domain\%1:F
REM Set owner back to UserName
subinacl.exe /noverbose /subdirectories t:\%1\*.* /setowner=domain\%1