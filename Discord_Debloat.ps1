# Define the base directory
$baseDir = "$env:USERPROFILE\AppData\Local\Discord"

# Define files to delete
$filesToDelete = @(
    "discord_game_sdk_x64.dll",
    "discord_game_sdk_x86.dll"
)

# Define updates-related files to delete
$updatesToDelete = @(
    "Update.exe",
    "SquirrelSetup.log",
    "Squirrel.exe"
)

# Define bloat-related files to delete
$bloatFilesToDelete = @(
    "discord_cloudsync-1",
    "discord_dispatch-1",
    "discord_erlpack-1",
    "discord_game_utils-1",
    "discord_media-1",
    "discord_spellcheck-1",
    "discord_krisp-1",
    "discord_Spellcheck-1"
)

# Define overlay-related files to delete
$overlayFilesToDelete = @(
    "discord_rpc-1",
    "discord_overlay2-1"
)

# Search for Discord.exe and open its location in Windows Explorer
$directories = @(
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
)

# Close Discord
Stop-Process -Name discord -Force -ErrorAction SilentlyContinue

# Delete specified files
$filesToDelete | ForEach-Object {
    Get-ChildItem -Path $baseDir -Recurse -File -Filter $_ | Remove-Item -Force -ErrorAction SilentlyContinue
}

# Delete updates-related files
$updatesToDelete | ForEach-Object {
    Get-ChildItem -Path $baseDir -Recurse -File -Filter $_ | Remove-Item -Force -ErrorAction SilentlyContinue
}

# Delete bloat-related files
$directories | ForEach-Object {
    $dirPath = Join-Path -Path $baseDir -ChildPath $_
    $bloatFilesToDelete | ForEach-Object {
        Get-ChildItem -Path $dirPath -Recurse -File -Filter $_ | Remove-Item -Force -ErrorAction SilentlyContinue
    }
}

# Delete overlay-related files
$directories | ForEach-Object {
    $dirPath = Join-Path -Path $baseDir -ChildPath $_
    $overlayFilesToDelete | ForEach-Object {
        Get-ChildItem -Path $dirPath -Recurse -File -Filter $_ | Remove-Item -Force -ErrorAction SilentlyContinue
    }
}

# Open Discord executable location in Explorer
$directories | ForEach-Object {
    $discordExePath = Join-Path -Path (Join-Path -Path $baseDir -ChildPath $_) -ChildPath "Discord.exe"
    if (Test-Path $discordExePath) {
        Start-Process -FilePath "explorer.exe" -ArgumentList "/select, `"$discordExePath`""
    }
}

Write-Host "Everything done!"
Write-Host "WARNING!"
Write-Host "AFTER RUNNING THE SCRIPT YOU HAVE TO CREATE A DISCORD SHORTCUT"
Write-Host "FROM %HOMEPATH%\appdata\Local\discord\app-0.0.(your version)!"
Write-Host "Credit goes to: Chrometastic and Velo!"
Write-Host "Created by: Matekoo!"
Write-Host "Krisp command created by iiiKariFPS!"
Write-Host "Go to %localappdata% then your discord folder and make a shortcut of your discord.exe"
Read-Host -Prompt "Press Enter to exit."
