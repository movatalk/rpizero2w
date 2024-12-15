# movatalk install

![movatalk.svg](movatalk.svg)

+ [Download sample-wav-files-sample3.wav](https://toolsfairy.com/audio-test/sample-wav-files#)
+ [http://www2.cs.uic.edu/~i101/SoundFiles/taunt.wav](http://www2.cs.uic.edu/~i101/SoundFiles/taunt.wav)

```bash
wget http://www2.cs.uic.edu/~i101/SoundFiles/taunt.wav
curl http://www2.cs.uic.edu/~i101/SoundFiles/taunt.wav -o test.wav
```

## 1. Install the ReSpeaker voice 

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


### 1. Make the script executable:
```bash
chmod +x install.sh
```

### 2. Run the script with sudo:
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


## 3. Test

[respeaker/seeed-voicecard: 2 Mic Hat, 4 Mic Array, 6-Mic Circular Array Kit, and 4-Mic Linear Array Kit for Raspberry Pi](https://github.com/respeaker/seeed-voicecard)

### Coherence
Estimate the magnitude squared coherence using Welch’s method. [![4-mics-linear-array-kit coherence](https://user-images.githubusercontent.com/3901856/37277486-beb1dd96-261f-11e8-898b-84405bfc7cea.png)](https://user-images.githubusercontent.com/3901856/37277486-beb1dd96-261f-11e8-898b-84405bfc7cea.png)  
Note: 'CO 1-2' means the coherence between channel 1 and channel 2.

# How to get the coherence of the captured audio(a.wav for example).
sudo apt install python-numpy python-scipy python-matplotlib
python tools/coherence.py a.wav

# Requirement of the input audio file:
- format: WAV(Microsoft) signed 16-bit PCM
- channels: >=2
