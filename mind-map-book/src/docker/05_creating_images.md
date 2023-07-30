# Creating docker Images

```docker
#Base Image
FROM node
#Setting Environment Variables
ENV MONGO_DB_USERNAME=admin
		MONGO_DB_PWD=pass
#Running Commands
RUN mkdir /home/app
#Copying files from host to container
COPY . /home/app
#Initial Command
CMD ["npm","home/app/app.js"]
```

- We have to save this file as Dockerfile
- To build a docker file: `docker build -t my-app:1.0 <location>`