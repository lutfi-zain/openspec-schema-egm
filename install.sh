#!/usr/bin/env bash
# ==============================================================================
# OpenSpec EGM Schema Installer
# Installs Google Elephant-Goldfish Model (EGM) schema for OpenSpec globally
# ==============================================================================

set -euo pipefail

CYAN='\033[0;36m'
GREEN='\033[0;32m'
AMBER='\033[0;33m'
RED='\033[0;31m'
BOLD='\033[1m'
NC='\033[0m' # No Color

REPO_RAW_URL="https://raw.githubusercontent.com/lutfi-zain/openspec-schema-egm/main"
SCHEMA_NAME="egm"

echo -e "${CYAN}${BOLD}"
echo "   ____                   ____                    ______ _____ __  __ "
echo "  / __ \____  ___  ____  / ___/____  ___  _____  / ____// ____//  |/  /"
echo " / / / / __ \/ _ \/ __ \ \__ \/ __ \/ _ \/ ___/ / __/  / / __ / /|_/ / "
echo "/ /_/ / /_/ /  __/ / / /___/ / /_/ /  __/ /__  / /___ / /_/ // /  / /  "
echo "\____/ .___/\___/_/ /_//____/ .___/\___/\___/ /_____/ \____//_/  /_/   "
echo "    /_/                    /_/                                         "
echo -e "${NC}"
echo -e "${BOLD}Installing Google Elephant-Goldfish Model (EGM) Schema for OpenSpec...${NC}\n"

# Detect OS and target installation directory
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" || "$OSTYPE" == "win32" ]]; then
    TARGET_DIR="${LOCALAPPDATA:-$USERPROFILE/AppData/Local}/openspec/schemas/${SCHEMA_NAME}"
else
    TARGET_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/openspec/schemas/${SCHEMA_NAME}"
fi

echo -e "Target directory: ${CYAN}${TARGET_DIR}${NC}"
mkdir -p "${TARGET_DIR}/templates"

# Files to install
FILES=(
    "schema.yaml"
    "templates/proposal.md"
    "templates/spec.md"
    "templates/design.md"
    "templates/review.md"
    "templates/tasks.md"
)

# If running locally from cloned repo, copy directly; otherwise curl from GitHub
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" 2>/dev/null && pwd || echo "")"
if [[ -n "$SCRIPT_DIR" && -f "${SCRIPT_DIR}/schema.yaml" ]]; then
    echo -e "Copying from local repository files..."
    cp "${SCRIPT_DIR}/schema.yaml" "${TARGET_DIR}/schema.yaml"
    cp -r "${SCRIPT_DIR}/templates/"* "${TARGET_DIR}/templates/"
else
    echo -e "Downloading latest schema from GitHub..."
    for file in "${FILES[@]}"; do
        echo -e "  - Fetching ${file}..."
        curl -fsSL "${REPO_RAW_URL}/${file}" -o "${TARGET_DIR}/${file}"
    done
fi

echo -e "\n${GREEN}✓ Schema successfully installed to:${NC} ${TARGET_DIR}"

# Verify with openspec CLI if available
if command -v openspec &> /dev/null; then
    echo -e "\nVerifying schema with OpenSpec CLI..."
    if openspec schema validate "${SCHEMA_NAME}" &> /dev/null; then
        echo -e "${GREEN}✓ Schema '${SCHEMA_NAME}' is valid and ready to use!${NC}"
    else
        echo -e "${AMBER}Note: openspec schema validation reported warnings, but files are in place.${NC}"
    fi
else
    echo -e "${AMBER}Note: 'openspec' command not found in PATH. Install OpenSpec via: npm i -g @fission-ai/openspec${NC}"
fi

echo -e "\n${BOLD}Quickstart Usage:${NC}"
echo -e "  1. Start a new change with EGM workflow:"
echo -e "     ${CYAN}openspec new change <feature-name> --schema egm${NC}"
echo -e "  2. Or set EGM as default for your project in ${CYAN}openspec/config.yaml${NC}:"
echo -e "     ${CYAN}schema: egm${NC}\n"
echo -e "${GREEN}${BOLD}Happy Spec-Driven Engineering! 🚀${NC}\n"
