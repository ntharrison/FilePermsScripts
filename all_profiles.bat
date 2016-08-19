rem set t: to path for profile directories
set profilepath t:

for /F %x in ('dir /B/D %profilepath%') do (fix_perms.bat %x)