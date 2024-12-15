# Makefile for ReSpeaker Voice Card Setup

# Variables
PYTHON := python3
PIP := pip3
SUDO := sudo
INSTALL_DIR := /usr/local
REPO_URL := https://github.com/respeaker/seeed-voicecard.git
REPO_DIR := seeed-voicecard

# Colors for output
RED := \033[0;31m
GREEN := \033[0;32m
YELLOW := \033[1;33m
NC := \033[0m

# Check if running as root
CHECK_ROOT := $(shell id -u)

.PHONY: all check-root install clean update deps python-deps help

# Default target
all: check-root deps install

# Check if script is run as root
check-root:
	@if [ "$(CHECK_ROOT)" != "0" ]; then \
		echo -e "$(RED)This Makefile must be run as root$(NC)"; \
		exit 1; \
	fi

# Update system packages
update:
	@echo -e "$(YELLOW)Updating package lists...$(NC)"
	apt-get update

# Install system dependencies
deps: update
	@echo -e "$(YELLOW)Installing system dependencies...$(NC)"
	apt-get install -y git $(PYTHON) $(PYTHON)-pip $(PYTHON)-numpy $(PYTHON)-scipy $(PYTHON)-matplotlib

# Install Python packages
python-deps:
	@echo -e "$(YELLOW)Installing Python packages...$(NC)"
	$(PIP) install numpy scipy matplotlib

# Clone and install seeed-voicecard
install: deps python-deps
	@echo -e "$(YELLOW)Cloning and installing seeed-voicecard...$(NC)"
	@if [ -d "$(REPO_DIR)" ]; then \
		rm -rf $(REPO_DIR); \
	fi
	git clone $(REPO_URL)
	cd $(REPO_DIR) && ./install.sh
	@echo -e "$(GREEN)Installation completed!$(NC)"
	@echo -e "$(YELLOW)Please reboot your system to apply changes.$(NC)"

# Clean up installation files
clean:
	@echo -e "$(YELLOW)Cleaning up...$(NC)"
	rm -rf $(REPO_DIR)
	@echo -e "$(GREEN)Cleanup completed.$(NC)"

# Help target
help:
	@echo "Available targets:"
	@echo "  all          - Install everything (default)"
	@echo "  check-root   - Verify root privileges"
	@echo "  update       - Update package lists"
	@echo "  deps         - Install system dependencies"
	@echo "  python-deps  - Install Python packages"
	@echo "  install      - Install seeed-voicecard"
	@echo "  clean        - Remove installation files"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Usage:"
	@echo "  sudo make [target]"
