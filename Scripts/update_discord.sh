#!/bin/bash

# Get the current installed version of Discord
installed_version=$(dpkg -l | grep discord | awk '{print $3}')

# Get the latest version of Discord from the website
latest_version=$( curl -s https://discord.com/api/download\?platform\=linux\&format\=deb | grep -oP 'discord-[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)

# Check if there is a new version available
if [[ $installed_version != "discord-$latest_version" ]]; then
    echo "Downloading Discord $latest_version..."
    # Download the latest version
    sudo wget -O ~/Downloads/$latest_version.deb https://discord.com/api/download\?platform\=linux\&format\=deb 
    
    # Install the latest version
    sudo dpkg -i ~/Downloads/$latest_version.deb
    
    # Clean up downloaded file
    rm -f ~/Downloads/discord-*.deb
    
    echo "Discord $latest_version installed successfully."
else
    echo "Discord is up to date."
    # Remove the downloaded file if versions match
    rm -f ~/Downloads/discord-*.deb
fi
