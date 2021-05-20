REM Turn the echo off to hide command prompt lines
ECHO OFF

REM Generate current date
set CUR_YYYY=%date:~10,4%
set CUR_MM=%date:~4,2%
set CUR_DD=%date:~7,2%
set SUBFILENAME=%CUR_YYYY%%CUR_MM%%CUR_DD%

REM Map the remote server drive to use it in destination path
net use s: \\server.contoso.corp\backups

REM Notify the user that file copy has started
ECHO "File copy in progress…"
robocopy "C:\Backup" "S:\remote\" /e /is /it /tee /eta /log:"S:\logs\log_%SUBFILENAME%.txt"

REM Notify the user that file copy is completed
ECHO "File copy completed. Press ENTER to end"

REM pause switch prevents command prompt to close
PAUSE