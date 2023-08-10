@echo off
TITLE Matekoo's discord debloat.
@echo Closing discord!
REM Closing Discord for you
TASKKILL /T /F /IM  discord.exe
CLS!
REM Define files to delete
set "filesToDelete=discord_game_sdk_x64.dll discord_game_sdk_x86.dll"
set "updatesToDelete=Update.exe SquirrelSetup.log Squirrel.exe"
REM Set Discord paths for updates file
set "discordPath=%USERPROFILE%\AppData\Local\Discord"
CLS
REM Delete specified files
for %%F in (%filesToDelete%) do (
    for /R "%discordPath%" %%A in (%%F) do (
        del /F /Q "%%A"
    )
)
CLS
CHOICE /C YN /M "Would you like to disable updates completely?"
IF %ERRORLEVEL% EQU 1 (
    REM Delete update-related files
    for %%F in (%updatesToDelete%) do (
        for /R "%discordPath%" %%A in (%%F) do (
            del /F /Q "%%A"
        )
    )
    echo Updates disabled!
)
CLS
CHOICE /C YN /M "Would you like to debloat your Discord?"
IF %ERRORLEVEL% EQU 1 (
    echo Removing bloat!

    REM List of directories to process
    for %%b in (
        "app-1.0.9001"
        "app-1.0.9002"
        "app-1.0.9003"
        "app-1.0.9004"
        "app-1.0.9005"
        "app-1.0.9006"
        "app-1.0.9007"
        "app-1.0.9008"
        "app-1.0.9010"
        "app-1.0.9011"
        "app-1.0.9012"
        "app-1.0.9013"
        "app-1.0.9014"
        "app-1.0.9015"
        "app-1.0.9016"
        "app-1.0.9017"
        "app-1.0.9018"
    ) do (
        rem Change to the directory
        pushd "%LocalAppData%\Discord\%%~b\modules"

        rem Delete the specified files quietly
        for %%F in (
            "discord_cloudsync-1"
            "discord_dispatch-1"
            "discord_erlpack-1"
            "discord_game_utils-1"
            "discord_media-1"
            "discord_spellcheck-1"
            "discord_krisp-1"
            "discord_media-1"
            "discord_Spellcheck-1"
        ) do (
            del /q "%%~F"
        )
        popd
    )

    REM Delete specified DLL files
    for %%F in (
        "discord_game_sdk_x64.dll"
        "discord_game_sdk_x86.dll"
    ) do (
        for /r "%USERPROFILE%\AppData\Local\Discord" %%A in (%%F) do (
            del /f /q "%%A"
        )
    )

    echo Bloat removed!
)
CLS
CHOICE /C YN /M "Would you like to remove overlay?"
IF %ERRORLEVEL% EQU 1 (
    echo Removing overlay!

    REM List of directories to process
    for %%b in (
        "app-1.0.9001"
        "app-1.0.9002"
        "app-1.0.9003"
        "app-1.0.9004"
        "app-1.0.9005"
        "app-1.0.9006"
        "app-1.0.9007"
        "app-1.0.9008"
        "app-1.0.9010"
        "app-1.0.9011"
        "app-1.0.9012"
        "app-1.0.9013"
        "app-1.0.9014"
        "app-1.0.9015"
        "app-1.0.9016"
        "app-1.0.9017"
        "app-1.0.9018"
    ) do (
        rem Change to the directory
        pushd "%LocalAppData%\Discord\%%~b\modules"

        rem Delete the specified files quietly
        for %%F in (
            "discord_rpc-1"
            "discord_overlay2-1"
        ) do (
            del /q "%%~F"
        )
        popd
    )

    echo Overlay removed!
)
CLS
echo Everything done!
echo WARNING!
echo AFTER RUNNING THE BATCH FILE YOU HAVE TO CREATE A DISCORD SHORTCUT
cd %~dp0\_Files
powershell -File "%~dp0\_Files\locatediscord.ps1"
echo FROM %HOMEPATH%\appdata\Local\discord\app-0.0.(your version)!
echo Credit goes to: Chrometastic and Velo!
echo Created by: Matekoo!
echo Krisp command created by iiiKariFPS!
echo Go to %localappdata% then your discord folder and make a shortcut of your discord.exe
REM Iterate through the list of directories
rem discord location detected
rem :: Run a PowerShell script file
pause
