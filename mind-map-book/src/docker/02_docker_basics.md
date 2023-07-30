# Docker Basics

## Checking Docker Version & Info

`docker version`: Installed Docker Version

`docker info`: Detailed Information about docker. (Including active container etc)

## Images vs Containers

- An Image is the application we want to run
- A container is a instance of that image running as a process.
- We can have multiple container of the same image

## Docker Hub

Docker Hub is a public repo of Docker Images. 

**To pull an image from the Docker Hub**

`docker pull image`

For Example: `docker pull redis`

## Basic Commands

Recent version of docker introduced a new format to write commands earlier it was

```jsx
docker <command> (options)
```

Now, We have

```jsx
docker <command> <subcommand> (options)
```

Docker is backward compatible so both formats works.

 

- Checking Installed Images: `docker images`
- **Creating** and running a new container: `docker container run redis`
- Creating a detached container: `docker container run -detach redis` (Detached basically means it will run in background)
- **Creating** and running a new container with a name: `docker container run v`
- To list running containers: `docker container ls`
- To **list** all container: `docker container ls -a`
- To **exec** a Docker container inside a terminal: `docker exec <containerid> /bin/bash -it`
- To **start** a container: `dockerx start <dockerid>`   (Will not create a new container)
- **Stopping** a container: `docker container stop <container-id>`

## Managing Environment Variables

To pass in Environment variables while starting a container we do

`docker container run --env PASSWORD=123 mongodb`