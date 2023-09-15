@echo off
:: Define the base directory for Discord
set baseDir=%LOCALAPPDATA%\Discord

:: Function to safely remove files and folders
function Remove-Files {
    :: Parameters
    setlocal enabledelayedexpansion
    set path=%~1
    set fileNames=%~2
    for %%i in (%fileNames%) do (
        set filePath=!path!\%%i
        if exist "!filePath!" (
            del /q /s /f "!filePath!"
        )
    )
    endlocal
}
cls
:: Close Discord
echo Closing Discord!
taskkill /im discord.exe /f

:: Define files to delete
set filesToDelete=discord_game_sdk_x64.dll discord_game_sdk_x86.dll

:: Set Discord paths for updates file
set discordPath=%USERPROFILE%\AppData\Local\Discord
cls
:: Ask if the user wants to disable updates completely
set /p disableUpdatesChoice=Would you like to disable updates completely? (Y/N)
if /i "%disableUpdatesChoice%"=="Y" (
    :: Delete update-related files
    set updatesToDelete=Update.exe SquirrelSetup.log Squirrel.exe
    call :Remove-Files "%discordPath%" "%updatesToDelete%"
    echo Updates disabled!
)
cls
:: Ask if the user wants to debloat Discord
set /p debloatChoice=Would you like to debloat your Discord? (Y/N)
if /i "%debloatChoice%"=="Y" (
    echo Removing bloat!

    :: Directories to search in
    set "directoriesToSearch=C:\Path\To\Search" "%LOCALAPPDATA%\Discord"

    :: Search for and delete the specified files in each directory
    for %%d in (%directoriesToSearch%) do (
        echo Searching in directory: %%d
        for %%f in (%filesToDelete%) do (
            if exist "%%~d\%%f" (
                echo File '%%f' found at: %%~d\%%f
                del /q /s /f "%%~d\%%f"
                echo File deleted.
            ) else (
                echo File '%%f' not found in %%d.
            )
        )
    )

    :: List of directories to process
    set "directoriesToProcess=app-1.0.9001 app-1.0.9002 app-1.0.9003"  :: Add other directories here
    set "moduleFilesToRemove=discord_cloudsync-1 discord_dispatch-1"  :: Add other module files here

    for %%d in (%directoriesToProcess%) do (
        set "modulePath=!baseDir!\%%d\modules"
        call :Remove-Files "!modulePath!" "%moduleFilesToRemove%"
    )

    echo Bloat removed!
)
cls
:: Ask if the user wants to remove overlay
set /p removeOverlayChoice=Would you like to remove overlay? (Y/N)
if /i "%removeOverlayChoice%"=="Y" (
    echo Removing overlay!

    for %%d in (%directoriesToProcess%) do (
        set "modulePath=!baseDir!\%%d\modules"

        :: Delete specified overlay files quietly
        set "overlayFilesToRemove=discord_rpc-1 discord_overlay2-1"
        call :Remove-Files "!modulePath!" "%overlayFilesToRemove%"
    )

    echo Overlay removed!
)
cls

REM Open Discord executable location in Explorer using powersshell script
(
cd "%~dp0\_Files"
powershell.exe -ExecutionPolicy Bypass -File "locating discord for you.ps1"
)


echo Everything done!
echo WARNING!
echo AFTER RUNNING THE SCRIPT will use a powershell script to find the location of your discord and open it for you or
echo FROM %LOCALAPPDATA% then your Discord folder and make a shortcut of your
pause
exit /b
cls
:Remove-Files
:: Batch version of Remove-Files function
setlocal enabledelayedexpansion
set path=%~1
set fileNames=%~2
for %%i in (%fileNames%) do (
    set filePath=!path!\%%i
    if exist "!filePath!" (
        del /q /s /f "!filePath!"
    )
)
endlocal
exit /b
