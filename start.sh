#!/usr/bin/bash

apps=("impressivebathandkitchen" "realsiter" "weby-tech")

for i in "${apps[@]}"
do
	cd /root/${i}/prisma && docker-compose up -d
	cd /root/${i}/prisma && prisma deploy
	cd /root/${i}/prisma && yarn
	cd /root/${i}/prisma &&  pm2 start pm2.json

	cd /root/${i}/client && yarn
	cd /root/${i}/client && yarn semantic:build
	cd /root/${i}/client && pm2 start pm2.json

done










