# Set the base directory
$baseDir = "$env:USERPROFILE\AppData\Local\Discord"

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

foreach ($dir in $directories) {
    $discordExePath = Join-Path -Path "$baseDir\$dir" -ChildPath "Discord.exe"
    if (Test-Path $discordExePath) {
        Start-Process -FilePath "explorer.exe" -ArgumentList "/select, `"$discordExePath`""
    }
}

Pause
