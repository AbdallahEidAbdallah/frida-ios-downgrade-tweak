#!/bin/bash
# Frida iOS Downgrade Script by Abdallah Eid
# Usage: ./frida_downgrade.sh <frida_version>
# Example: ./frida_downgrade.sh 15.1.17

FRIDA_VER=$1

if [ -z "$FRIDA_VER" ]; then
    echo "Usage: $0 <frida_version>"
    echo "Example: $0 15.1.17"
    exit 1
fi

# Try to find the actual plist location
PLIST_PATH=$(find / -name "re.frida.server.plist" 2>/dev/null | head -1)

if [ -z "$PLIST_PATH" ]; then
    echo "Error: Could not find re.frida.server.plist"
    exit 1
fi

# Extract directory and filename
PLIST_DIR=$(dirname "$PLIST_PATH")
PLIST_FILE=$(basename "$PLIST_PATH")

# Unload service if loaded
launchctl unload "$PLIST_PATH" 2>/dev/null

# Backup plist
cp "$PLIST_PATH" "${PLIST_PATH}.backup"

# Download and install new Frida version
wget -O /tmp/frida_${FRIDA_VER}_iphoneos-arm64.deb https://github.com/frida/frida/releases/download/${FRIDA_VER}/frida_${FRIDA_VER}_iphoneos-arm64.deb
dpkg -i /tmp/frida_${FRIDA_VER}_iphoneos-arm64.deb

# Restore original plist
mv "${PLIST_PATH}.backup" "$PLIST_PATH"

# Load service
launchctl load "$PLIST_PATH"

# Cleanup
rm /tmp/frida_${FRIDA_VER}_iphoneos-arm64.deb

echo "✅ Frida downgraded to version ${FRIDA_VER}"
