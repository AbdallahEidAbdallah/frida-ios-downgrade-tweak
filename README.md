# Frida iOS Downgrade Tweak Script

A bash script to downgrade the Frida version on a jailbroken iOS device.

## 📋 Features

- Automatically locates and backs up `re.frida.server.plist`
- Unloads and reloads the Frida service
- Downloads and installs a specified Frida version from GitHub
- Restores the service cleanly after installation

## 🛠️ Requirements

- Jailbroken iOS device
- SSH or terminal access to the device
- `wget`, `dpkg`, and `launchctl` installed

## 🧪 Tested On

- iOS 16.7.11
- Frida versions 15.1.17 and 16.x

## 🚀 Usage

```bash
chmod +x frida_downgrade.sh
./frida_downgrade.sh <frida_version>

./frida_downgrade.sh 15.1.17
