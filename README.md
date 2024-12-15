# movatalk install

![movatalk.svg](movatalk.svg)



## Install the ReSpeaker voice 

Just copy and paste these commands in your Raspberry Pi terminal:

```bash
# Clone the repository
git clone https://github.com/respeaker/seeed-voicecard.git

# Go into the directory
cd seeed-voicecard

# Run the installation script
sudo ./install.sh

# Reboot after installation
sudo reboot
```


After reboot, verify the installation:
```bash
# Check if sound card is recognized
arecord -l
```


## 2. Start script that will handle the installation of dependencies for the ReSpeaker voice card project. 


```bash
# Clone the repository
git clone https://github.com/movatalk/rpizero2w.git

# Go into the directory
cd rpizero2w

# Run the installation script
sudo ./install.sh

# Reboot after installation
sudo reboot
```



OR


1. Make the script executable:
```bash
chmod +x install.sh
```

2. Run the script with sudo:
```bash
sudo ./install.sh
```

The script will:
- Check if it's running with root privileges
- Update package lists
- Install required system packages
- Install Python packages using pip3
- Clone and install the seeed-voicecard repository
- Provide colored output for better visibility
- Handle errors appropriately

After the script completes successfully, you'll need to reboot your Raspberry Pi for the changes to take effect:
```bash
sudo reboot
```

Would you like me to modify anything in the script or explain any part in more detail?
