build:
	docker build --build-arg version=4.2.4 . -t justmiles/warzone2100:latest
	docker tag justmiles/warzone2100:latest justmiles/warzone2100:4.2.4