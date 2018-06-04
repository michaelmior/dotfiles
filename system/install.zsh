# Install ShadowFox
>&2 echo "Installing ShadowFox..."
profile_directory=$(find ~/.mozilla/firefox -maxdepth 1 -name '*.default' 2> /dev/null | head -1)

if [ ! -z $profile_directory ]; then
  latest_url=$(curl -s https://api.github.com/repos/SrKomodo/shadowfox-updater/releases/latest | jq -r '.assets[] | select(.name == "shadowfox_linux_amd64") | .browser_download_url')
  wget -q $latest_url -O $profile_directory/shadowfox_linux_amd64
  chmod +x $profile_directory/shadowfox_linux_amd64
  yes 0 | TERM= $profile_directory/shadowfox_linux_amd64
else
  echo "Firefox profile directory not found" > /dev/stderr
  exit 1
fi
