#!/bin/bash

# SPARC2 Deno Installation Script
# This script installs Deno, which is required for SPARC2 to function properly

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== SPARC2 Deno Installation Script ===${NC}"
echo -e "This script will install Deno, which is required for SPARC2."

# Check if Deno is already installed
if command -v deno &> /dev/null; then
    DENO_VERSION=$(deno --version | head -n 1)
    echo -e "${GREEN}✓ Deno is already installed: ${DENO_VERSION}${NC}"
    exit 0
fi

echo -e "${YELLOW}Deno is not installed. Installing now...${NC}"

# Detect OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    OS="windows"
else
    echo -e "${RED}Unsupported operating system: $OSTYPE${NC}"
    echo -e "Please install Deno manually from https://deno.land/#installation"
    exit 1
fi

# Install Deno based on OS
case $OS in
    linux|macos)
        echo -e "${YELLOW}Installing Deno for $OS...${NC}"
        curl -fsSL https://deno.land/install.sh | sh
        
        # Add Deno to PATH for the current session
        export DENO_INSTALL="$HOME/.deno"
        export PATH="$DENO_INSTALL/bin:$PATH"
        
        # Check if .bashrc or .zshrc exists and add Deno to PATH
        if [ -f "$HOME/.bashrc" ]; then
            echo -e "${YELLOW}Adding Deno to PATH in .bashrc${NC}"
            echo "" >> "$HOME/.bashrc"
            echo 'export DENO_INSTALL="$HOME/.deno"' >> "$HOME/.bashrc"
            echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> "$HOME/.bashrc"
        fi
        
        if [ -f "$HOME/.zshrc" ]; then
            echo -e "${YELLOW}Adding Deno to PATH in .zshrc${NC}"
            echo "" >> "$HOME/.zshrc"
            echo 'export DENO_INSTALL="$HOME/.deno"' >> "$HOME/.zshrc"
            echo 'export PATH="$DENO_INSTALL/bin:$PATH"' >> "$HOME/.zshrc"
        fi
        ;;
    windows)
        echo -e "${YELLOW}For Windows, please run the following command in PowerShell:${NC}"
        echo -e "${BLUE}irm https://deno.land/install.ps1 | iex${NC}"
        echo -e "${YELLOW}Alternatively, you can install Deno using one of these methods:${NC}"
        echo -e "  - Chocolatey: ${BLUE}choco install deno${NC}"
        echo -e "  - Scoop: ${BLUE}scoop install deno${NC}"
        exit 1
        ;;
esac

# Verify installation
if command -v deno &> /dev/null; then
    DENO_VERSION=$(deno --version | head -n 1)
    echo -e "${GREEN}✓ Deno installed successfully: ${DENO_VERSION}${NC}"
    echo -e "${YELLOW}NOTE: You may need to restart your terminal or run 'source ~/.bashrc' (or ~/.zshrc) for the PATH changes to take effect.${NC}"
    echo -e "${GREEN}You can now use SPARC2 with the 'sparc2' command.${NC}"
else
    echo -e "${RED}Failed to install Deno automatically.${NC}"
    echo -e "${YELLOW}Please install Deno manually from https://deno.land/#installation${NC}"
    exit 1
fi
