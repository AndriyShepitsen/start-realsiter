#!/usr/bin/bash

export GOROOT=/root/go

apps=("impressivebathandkitchen" "realsiter")


for i in "${apps[@]}"
do
	cd /root/go/src/github.com/AndriyShepitsen/${i}/prisma && docker-compose up -d
	cd /root/go/src/github.com/AndriyShepitsen/${i}/prisma && prisma deploy
	cd /root/go/src/github.com/AndriyShepitsen/${i}/prisma && yarn
	cd /root/go/src/github.com/AndriyShepitsen/${i}/prisma &&  pm2 start pm2.json
	cd /root/go/src/github.com/AndriyShepitsen/${i}/client && yarn
	cd /root/go/src/github.com/AndriyShepitsen/${i}/client && yarn semantic:build
	cd /root/go/src/github.com/AndriyShepitsen/${i}/client && pm2 start pm2.json

done










