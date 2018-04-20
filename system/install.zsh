# Install ShadowFox
profile_directory=$(find ~/.mozilla/firefox -maxdepth 1 -name '*.default' 2> /dev/null | head -1)

if [ ! -z $profile_directory ]; then
  latest_url=$(curl -s https://api.github.com/repos/overdodactyl/ShadowFox/releases/latest | jq -r '.assets[] | select(.name == "ShadowFox_updater_linux.sh") | .browser_download_url')
  wget $latest_url -O $profile_directory/ShadowFox_updater_linux.sh
  chmod +x $profile_directory/ShadowFox_updater_linux.sh
  yes Y | $profile_directory/ShadowFox_updater_linux.sh
else
  echo "Firefox profile directory not found" > /dev/stderr
  exit 1
fi
