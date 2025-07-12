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


### Step 1: Transfer the Script to the iPhone

Use `scp` to securely copy the script to your jailbroken iOS device:

scp frida_downgrade.sh root@<DEVICE_IP>:/var/root/

### Step 2: Connect via SSH to the iPhone

ssh root@<DEVICE_IP>

### Step 3: Make the Script Executable

chmod +x /var/root/frida_downgrade.sh

### Step 4: Run the Script with the Desired Frida Version

./frida_downgrade.sh <frida_version>

./frida_downgrade.sh 15.1.17
