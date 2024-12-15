#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored messages
print_message() {
    echo -e "${2}${1}${NC}"
}

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Function to check if running as root
check_root() {
    if [ "$(id -u)" != "0" ]; then
        print_message "This script must be run as root" "$RED"
        exit 1
    fi
}

# Function to update package lists
update_packages() {
    print_message "Updating package lists..." "$YELLOW"
    apt-get update
    if [ $? -ne 0 ]; then
        print_message "Failed to update package lists" "$RED"
        exit 1
    fi
}

# Function to install required packages
install_dependencies() {
    print_message "Installing required packages..." "$YELLOW"
    apt-get install -y git python3-pip python3-numpy python3-scipy python3-matplotlib
    if [ $? -ne 0 ]; then
        print_message "Failed to install required packages" "$RED"
        exit 1
    fi
}

# Function to install Python packages
install_python_packages() {
    print_message "Installing Python packages..." "$YELLOW"
    pip3 install numpy scipy matplotlib
    if [ $? -ne 0 ]; then
        print_message "Failed to install Python packages" "$RED"
        exit 1
    fi
}

# Function to clone and install seeed-voicecard
install_voicecard() {
    print_message "Cloning seeed-voicecard repository..." "$YELLOW"
    if [ -d "seeed-voicecard" ]; then
        rm -rf seeed-voicecard
    fi
    
    git clone https://github.com/respeaker/seeed-voicecard
    if [ $? -ne 0 ]; then
        print_message "Failed to clone repository" "$RED"
        exit 1
    fi
    
    cd seeed-voicecard
    print_message "Installing seeed-voicecard..." "$YELLOW"
    ./install.sh
    if [ $? -ne 0 ]; then
        print_message "Failed to install seeed-voicecard" "$RED"
        exit 1
    fi
}

main() {
    print_message "Starting ReSpeaker Voice Card Setup" "$GREEN"
    
    # Check if running as root
    check_root
    
    # Update package lists
    update_packages
    
    # Install dependencies
    install_dependencies
    
    # Install Python packages
    install_python_packages
    
    # Install seeed-voicecard
    install_voicecard
    
    print_message "Setup completed successfully!" "$GREEN"
    print_message "Please reboot your system to apply changes." "$YELLOW"
}

# Run main function
main
