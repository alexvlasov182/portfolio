up: #Containers start
	docker-compose up -d

down: #Stop
	docker-compose stop

ps:
	docker ps

connect_ruby:
	docker exec -it ded3727f043e bash

connect_db:
	docker exec -it 18147fc26662 bash