postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=your_user_name -e POSTGRES_PASSWORD=your_password -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=your_user_name --owner=your_user_name simple_bank

dropdb:
	docker exec -it postgres12 dropdb simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://your_user_name:your_password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://your_user_name:your_password@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate
	
.PHONY: postgres createdb dropdb migrateup migratedown sqlc
