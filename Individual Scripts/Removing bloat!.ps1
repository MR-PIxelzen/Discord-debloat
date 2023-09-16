Write-Host "Closing discord!"
TASKKILL /T /F /IM discord.exe
CLS

# List of directories to process
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

foreach ($dir in $directories) {
    # Change to the directory
    Set-Location -Path "$env:LocalAppData\Discord\$dir\modules"

    # Delete the specified files quietly
    $filesToDelete = @(
        "discord_cloudsync-1",
        "discord_dispatch-1",
        "discord_erlpack-1",
        "discord_game_utils-1",
        "discord_media-1",
        "discord_spellcheck-1",
        "discord_krisp-1",
        "discord_media-1",
        "discord_rpc-1",
        "discord_Spellcheck-1",
        "discord_overlay2-1"
    )

    foreach ($file in $filesToDelete) {
        Remove-Item -Path $file -Force -ErrorAction SilentlyContinue
    }
}


$filesToDelete = @(
    "discord_game_sdk_x64.dll",
    "discord_game_sdk_x86.dll"
)

$discordPath = Join-Path $env:USERPROFILE "AppData\Local\Discord"

foreach ($file in $filesToDelete) {
    $files = Get-ChildItem -Path $discordPath -Recurse -Filter $file -File

    foreach ($fileToDelete in $files) {
        Remove-Item -Path $fileToDelete.FullName -Force -ErrorAction SilentlyContinue
    }
}


Read-Host "Press Enter to exit."
