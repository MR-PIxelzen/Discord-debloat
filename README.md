Discord Debloat
Discord Debloat is a PowerShell and batch script designed to help you remove unnecessary and potentially annoying features from the Discord desktop application. If you find Discord to be bloated with features you don't use or dislike, this script can help you streamline your Discord experience.

Disclaimer: Before using this script, be aware that it may violate Discord's Terms of Service. Use it at your own risk, and consider the potential consequences, including account suspension or banning.

Features
Removes unwanted UI elements and features from Discord.
Customizable configuration to tailor the debloating process to your preferences.
Quick and easy to use.
Prerequisites
Before using Discord Debloat, make sure you have the following prerequisites:

Windows operating system.
PowerShell and batch scripting knowledge.
Discord desktop application installed and logged in.
Installation
Download the Discord Debloat script to your local machine.

Place the script in a directory of your choice.

Usage
Open PowerShell with administrator privileges.

Navigate to the directory where you placed the script using the cd command:

bash
Copy code
cd path\to\script\directory
Run the script:

Copy code
.\discord_debloat.ps1
Follow the on-screen instructions to select the features you want to remove from Discord.

The script will make the necessary changes to your Discord installation, and you'll see a summary of the debloating process.

Restart Discord for the changes to take effect.

Configuration
You can customize the debloating process by editing the config.bat file. This batch file allows you to enable or disable specific debloat options according to your preferences.

batch
Copy code
@echo off
set disable_gif_picker=true
set disable_trending=true
set disable_discover=true
set disable_activity_feed=true
set disable_games_tab=true
Simply set the values to true or false to enable or disable each option.

Contributions
Contributions to this project are welcome. If you have ideas for additional debloat options or improvements to the script, please open an issue or submit a pull request.

Disclaimer
This project is not affiliated with or endorsed by Discord. Use it responsibly and be aware of potential violations of Discord's Terms of Service.

License
This project is licensed under the MIT License - see the LICENSE file for details.
