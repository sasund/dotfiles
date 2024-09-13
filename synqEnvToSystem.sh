#!/bin/bash

Green='\033[0;32m'
NC='\033[0m'


cd ~/dotfiles/.config/staleas/

dotenvx decrypt -f .env


cat .env | grep -v '^#\|DOTENV_PUBLIC_KEY' | xargs -I {} echo "export {}" > .env.system
echo -e "${Green}✔ .env.system OK ${NC}"

dotenvx encrypt -f .env
