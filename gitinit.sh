#!/bin/bash

# Initialize Git repository in the current directory
git init

# Set up main branch
git branch -M main

# Create .gitignore from ~/gitignore-example.txt if it exists, otherwise create a default one
GITIGNORE_FILE=".gitignore"
GITIGNORE_EXAMPLE="$HOME/gitignore-example.txt"

if [ -f "$GITIGNORE_EXAMPLE" ]; then
    cp "$GITIGNORE_EXAMPLE" "$GITIGNORE_FILE"
else
    echo -e ".DS_Store\n.env" > "$GITIGNORE_FILE"
fi

echo "Created or updated .gitignore"

# Check if .env exists, if not, try to copy from ~/.env
ENV_FILE=".env"
ENV_SOURCE="$HOME/.env"

if [ ! -f "$ENV_FILE" ]; then
    if [ -f "$ENV_SOURCE" ]; then
        cp "$ENV_SOURCE" "$ENV_FILE"
        echo "Copied .env from home directory"
    else
        echo ".env file not found in home directory, skipping copy"
    fi
else
    echo ".env file already exists"
fi

# Check if start.sh exists, if not, try to copy from ~/start.sh
START_FILE="start.sh"
START_SOURCE="$HOME/start.sh"

if [ ! -f "$START_FILE" ]; then
    if [ -f "$START_SOURCE" ]; then
        cp "$START_SOURCE" "$START_FILE"
        chmod +x "$START_FILE"
        echo "Copied start.sh from home directory and made it executable"
    else
        echo "start.sh file not found in home directory, skipping copy"
    fi
else
    echo "start.sh already exists"
fi

echo "Git initialization completed."

# Set up main branch
git add -A
git commit -m "Initial commit"

# git push -u origin main
