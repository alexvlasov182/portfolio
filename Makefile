up: #Containers start
	docker-compose up -d

down: #Stop
	docker-compose stop

ps:
	docker ps

connect_ruby:
	docker exec -it 709aaf0f4080 bash

connect_db:
	docker exec -it 14efcc23c27c bash