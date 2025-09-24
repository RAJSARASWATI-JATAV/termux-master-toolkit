#!/bin/bash

# Termux Master Toolkit Setup Script
# Created by: Rajsaraswati Jatav
# GitHub: https://github.com/RAJSARASWATI-JATAV

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner
echo -e "${CYAN}"
echo "  ████████╗███████╗██████╗ ███╗   ███╗██╗   ██╗██╗  ██╗"
echo "  ╚══██╔══╝██╔════╝██╔══██╗████╗ ████║██║   ██║╚██╗██╔╝"
echo "     ██║   █████╗  ██████╔╝██╔████╔██║██║   ██║ ╚███╔╝ "
echo "     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║██║   ██║ ██╔██╗ "
echo "     ██║   ███████╗██║  ██║██║ ╚═╝ ██║╚██████╔╝██╔╝ ██╗"
echo "     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝ ╚═════╝ ╚═╝  ╚═╝"
echo -e "${NC}"
echo -e "${PURPLE}        Master Toolkit by Rajsaraswati Jatav${NC}"
echo -e "${CYAN}        Location: Shikarpura, MP${NC}"
echo ""

# Check if running on Termux
if [[ ! -d "/data/data/com.termux" ]]; then
    echo -e "${RED}⚠️  This script is designed for Termux environment${NC}"
    echo -e "${YELLOW}Please run this script in Termux app${NC}"
    exit 1
fi

echo -e "${GREEN}🚀 Starting Termux Master Toolkit Setup...${NC}"
echo ""

# Update packages
echo -e "${BLUE}📦 Updating package lists...${NC}"
pkg update -y

echo -e "${BLUE}📦 Upgrading existing packages...${NC}"
pkg upgrade -y

# Install essential packages
echo -e "${BLUE}📦 Installing essential packages...${NC}"
packages=(
    "curl"
    "wget"
    "git"
    "python"
    "nodejs"
    "vim"
    "nano"
    "htop"
    "tree"
    "zip"
    "unzip"
    "ffmpeg"
    "imagemagick"
    "openssh"
    "rsync"
    "screen"
    "tmux"
)

for package in "${packages[@]}"; do
    echo -e "${YELLOW}Installing $package...${NC}"
    pkg install -y "$package"
done

# Create directory structure
echo -e "${BLUE}📁 Creating project directories...${NC}"
mkdir -p ~/termux-toolkit/{courses,scripts,resources,projects}
mkdir -p ~/termux-toolkit/courses/{chapter-01-basics,chapter-02-advanced,chapter-03-programming,chapter-04-automation,chapter-05-projects}
mkdir -p ~/termux-toolkit/scripts/{interactive,automation,utilities}
mkdir -p ~/termux-toolkit/resources/{cheatsheets,presentations,videos}
mkdir -p ~/termux-toolkit/projects/{beginner,intermediate,advanced}

# Set up storage permissions
echo -e "${BLUE}📱 Setting up storage permissions...${NC}"
termux-setup-storage

# Create welcome script
cat > ~/termux-toolkit/welcome.sh << 'EOF'
#!/bin/bash
echo -e "\033[0;36m"
echo "🎓 Welcome to Termux Master Toolkit!"
echo "Created by: Rajsaraswati Jatav"
echo "Location: Shikarpura, MP"
echo ""
echo "Available Commands:"
echo "  ./start_course.sh  - Start interactive course"
echo "  ./practice.sh      - Practice exercises"
echo "  ./projects.sh      - View available projects"
echo "  ./help.sh          - Get help and support"
echo -e "\033[0m"
EOF

chmod +x ~/termux-toolkit/welcome.sh

# Create course starter script
cat > ~/start_course.sh << 'EOF'
#!/bin/bash
cd ~/termux-toolkit
./welcome.sh
echo ""
echo "Select a chapter to begin:"
echo "1. Basics & Setup"
echo "2. Advanced Commands"
echo "3. Programming"
echo "4. Automation"
echo "5. Advanced Projects"
echo ""
read -p "Enter chapter number (1-5): " chapter
case $chapter in
    1) echo "Starting Chapter 1: Basics & Setup..."; cd courses/chapter-01-basics ;;
    2) echo "Starting Chapter 2: Advanced Commands..."; cd courses/chapter-02-advanced ;;
    3) echo "Starting Chapter 3: Programming..."; cd courses/chapter-03-programming ;;
    4) echo "Starting Chapter 4: Automation..."; cd courses/chapter-04-automation ;;
    5) echo "Starting Chapter 5: Advanced Projects..."; cd courses/chapter-05-projects ;;
    *) echo "Invalid selection. Please choose 1-5." ;;
esac
EOF

chmod +x ~/start_course.sh

echo -e "${GREEN}✅ Setup completed successfully!${NC}"
echo ""
echo -e "${CYAN}🎯 Next Steps:${NC}"
echo -e "${YELLOW}1. Run: ./start_course.sh${NC}"
echo -e "${YELLOW}2. Follow the interactive tutorials${NC}"
echo -e "${YELLOW}3. Practice with provided exercises${NC}"
echo ""
echo -e "${PURPLE}📞 Support: GitHub @RAJSARASWATI-JATAV${NC}"
echo -e "${PURPLE}🎬 Tutorials: YouTube @rajsaraswatijatav${NC}"
echo ""
echo -e "${GREEN}Happy Learning! 🚀${NC}"