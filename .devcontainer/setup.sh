#!/bin/bash
set -e

# Install DITA-OT for DitaCraft's local preview and validation
DITA_OT_VERSION="4.2.1"
echo "Installing DITA-OT ${DITA_OT_VERSION} for DitaCraft..."
wget -q "https://github.com/dita-ot/dita-ot/releases/download/${DITA_OT_VERSION}/dita-ot-${DITA_OT_VERSION}.zip" -O /tmp/dita-ot.zip
sudo unzip -q /tmp/dita-ot.zip -d /opt
sudo mv /opt/dita-ot-${DITA_OT_VERSION} /opt/dita-ot
sudo chmod +x /opt/dita-ot/bin/dita
rm /tmp/dita-ot.zip

echo "✅ DITA-OT installed at /opt/dita-ot"
echo ""
echo "ℹ️  Note: EPUB publishing is handled by the ditac GitHub Actions workflow."
echo "   DITA-OT is available here for DitaCraft's local HTML5 preview only."
```

---

### Step 2: Update `.gitignore`

Your existing `.gitignore` probably already excludes build artifacts, but add this line to cover DitaCraft's local preview output:
```
out/