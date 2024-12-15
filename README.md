# movatalk install

![movatalk.svg](movatalk.svg)



Start script that will handle the installation of dependencies for the ReSpeaker voice card project. 

1. Make the script executable:
```bash
chmod +x setup_respeaker.sh
```

2. Run the script with sudo:
```bash
sudo ./setup_respeaker.sh
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
