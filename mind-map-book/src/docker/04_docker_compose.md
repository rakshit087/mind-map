# Docker Compose

* Docker compose is used to take care of automating Docker Run command, i.e it can automate creating Docker Containers from pre-existing images.
* It is written in a `yaml` file.


```bash
docker run -d\
	--name mongodb \
	-p 27017:27127 \
	-e MONGO_INITDB_ROOT_USERNAME \
	 = admin \
	-e MONGO_INITDB_ROOT_PASSWORD \
	 = password \
	--net mongo-network \
mongodb
```
This 👆 can be written as:
```yaml
version:'3'
services:
	mongodb:
		image:mongo
		ports:
			-27017:27017
		environment:
			-MONGO_INITDB_ROOT_USERNAME:admin
	mongo-express:
		image:express
		ports:
			-3000:3000
			- 
```

- The given docker compose file will create two containers - express and mongo
- Docker Composers will take care of creating a common network
- To run the docker compose: `docker -compose -f mongo.yaml up`
- To stop all the containers in compose: `docker -compose -f mongo.yaml down`