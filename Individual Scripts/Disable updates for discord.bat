@echo off

REM Define files to delete
set "filesToDelete=discord_game_sdk_x64.dll discord_game_sdk_x86.dll"
set "updatesToDelete=Update.exe SquirrelSetup.log Squirrel.exe"

REM Set Discord path
set "discordPath=%USERPROFILE%\AppData\Local\Discord"

REM Delete specified files
for %%F in (%filesToDelete%) do (
    for /R "%discordPath%" %%A in (%%F) do (
        del /F /Q "%%A"
    )
)

REM Delete update-related files
for %%F in (%updatesToDelete%) do (
    for /R "%discordPath%" %%A in (%%F) do (
        del /F /Q "%%A"
    )
)

pause
