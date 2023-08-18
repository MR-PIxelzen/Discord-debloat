# Define the base directory for Discord
$baseDir = "$env:LOCALAPPDATA\Discord"

# Function to safely remove files
function Remove-Files {
    param (
        [string]$path,
        [string[]]$fileNames
    )
    
    foreach ($fileName in $fileNames) {
        $filePath = Join-Path -Path $path -ChildPath $fileName
        if (Test-Path $filePath) {
            Remove-Item -Path $filePath -Force -ErrorAction SilentlyContinue
        }
    }
}

# Close Discord
Write-Host "Closing Discord!"
Stop-Process -Name discord -Force

# Define files to delete
$filesToDelete = @(
    "discord_game_sdk_x64.dll",
    "discord_game_sdk_x86.dll"
)

$updatesToDelete = @(
    "Update.exe",
    "SquirrelSetup.log",
    "Squirrel.exe"
)

# Set Discord paths for updates file
$discordPath = "$env:USERPROFILE\AppData\Local\Discord"

# Delete specified files
Remove-Files -path $discordPath -fileNames $filesToDelete -Force -ErrorAction SilentlyContinue

# Ask if user wants to disable updates
$disableUpdatesChoice = Read-Host "Would you like to disable updates completely? (Y/N)"

if ($disableUpdatesChoice -eq "Y") {
    # Delete update-related files
    Remove-Files -path $discordPath -fileNames $updatesToDelete -Force -ErrorAction SilentlyContinue
    Write-Host "Updates disabled!"
}

# Ask if user wants to debloat Discord
$debloatChoice = Read-Host "Would you like to debloat your Discord? (Y/N)"

if ($debloatChoice -eq "Y") {
    Write-Host "Removing bloat!"

    # List of directories to process also uses to find discord path in the script
    $directoriesToProcess = @(
        "app-1.0.9001",
        "app-1.0.9002",
        "app-1.0.9003",
        "app-1.0.9004",
        "app-1.0.9005",
        "app-1.0.9006",
        "app-1.0.9007",
        "app-1.0.9008",
        "app-1.0.9010",
        "app-1.0.9011",
        "app-1.0.9012",
        "app-1.0.9013",
        "app-1.0.9014",
        "app-1.0.9015",
        "app-1.0.9016",
        "app-1.0.9017",
        "app-1.0.9018"
        # ... (add other directories)
    )

    foreach ($directory in $directoriesToProcess) {
        $modulePath = Join-Path -Path $baseDir -ChildPath "$directory\modules"

        # Delete specified files quietly
        $filesToRemove = @(
            "discord_cloudsync-1",
            "discord_dispatch-1",
            "discord_erlpack-1",
            "discord_game_utils-1",
            "discord_media-1",
            "discord_spellcheck-1",
            "discord_krisp-1",
            "discord_Spellcheck-1"
            # ... (add other module files)
        )

        Remove-Files -path $modulePath -fileNames $filesToRemove -Force -ErrorAction SilentlyContinue
    }

    # Delete specified DLL files
    $dllFilesToDelete = @(
        "discord_game_sdk_x64.dll",
        "discord_game_sdk_x86.dll"
    )

    Remove-Files -path $discordPath -fileNames $dllFilesToDelete -Force -ErrorAction SilentlyContinue

    Write-Host "Bloat removed!"
}

# Ask if user wants to remove overlay
$removeOverlayChoice = Read-Host "Would you like to remove overlay? (Y/N)"

if ($removeOverlayChoice -eq "Y") {
    Write-Host "Removing overlay!"

    foreach ($directory in $directoriesToProcess) {
        $modulePath = Join-Path -Path $baseDir -ChildPath "$directory\modules"

        # Delete specified overlay files quietly
        $overlayFilesToRemove = @(
            "discord_rpc-1",
            "discord_overlay2-1"
        )

        Remove-Files -path $modulePath -fileNames $overlayFilesToRemove -Force -ErrorAction SilentlyContinue
    }

    Write-Host "Overlay removed!"
}

# Open Discord executable location in Explorer
$directoriesToProcess | ForEach-Object {
    $discordExePath = Join-Path -Path (Join-Path -Path $baseDir -ChildPath $_) -ChildPath "Discord.exe"
    if (Test-Path $discordExePath) {
        Start-Process -FilePath "explorer.exe" -ArgumentList "/select, `"$discordExePath`""
    }
}

Write-Host "Everything done!"
Write-Host "WARNING!"
Write-Host "AFTER RUNNING THE SCRIPT YOU HAVE TO CREATE A DISCORD SHORTCUT"
Write-Host "FROM $($env:HOMEPATH)\AppData\Local\discord\app-0.0.(your version)!"
Write-Host "Credit goes to: Chrometastic and Velo!"
Write-Host "Created by: Matekoo!"
Write-Host "Krisp command created by iiiKariFPS!"
Write-Host "Go to $env:LOCALAPPDATA then your Discord folder and make a shortcut of your"
Pause
