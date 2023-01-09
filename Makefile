up: #Containers start
	docker-compose up -d

down: #Stop
	docker-compose stop

ps:
	docker ps

connect_ruby:
	docker exec -it d29901f8892a bash

connect_db:
	docker exec -it f64be3815e7c bash