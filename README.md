## tinyos-docker
## Author: Namya Malik

Instructions to install and run TinyOS within a docker container. I used MacOSX but should work on other systems.

### How I generated the dockerfile
* Create `Dockerfile` and add instructions to it  
Helpful link: https://www.youtube.com/watch?v=LQjaJINkQXY  

### How to run the dockerfile

#### Prerequisites
* Docker-desktop should be installed on your system. Make sure it is running.

#### Commands to run the repo
* Clone the repo: `git clone https://github.com/namyamalik/tinyos-docker.git`
* Navigate to the directory that contains the Dockerfile
* Build the image: `docker build -t <provide name of image> .`

* Option 1: Run the image in foreground (you will immediately see a bash terminal and you are ready to develop): `docker run -it <name of your image> /bin/bash` OR `docker run -v /local/path/to/docker-directory/volume:/app -it <name of your image> /bin/bash`.  
The -v option here allows `volume` (local) to be mapped to /app (docker). So you can build and run the image, copy the code contents from /root (docker) to `volume`, and then simply develop locally in `volume`. Docker is stateless so once the docker bash is closed, all changes are lost. However, `volume` has state and any changes are retained (and also mapped to /app). So the next time you open the docker bash, navigate to /app for the most updated code.

* Option 2: Run the image detached in background (bash will wait in background): `docker run -it <name of your image> -d /bin/bash` OR `docker run -v /path/to/your/code/volume:/app -it -d <name of your image> /bin/bash`.  
Then if you want to go into the code: `docker exec -it <containerId> /bin/bash`.

#### Helpful commands:
* Check running containers (and get info such as container id or name of container): `docker ps`

* Check all past containers: `docker ps -a`

* Copy from docker container to local: `docker cp containerId:docker/path/to/source local/path/to/destination`

* Stop a running container: `docker stop <containerId>`

* Remove a container: `docker rm <containerId>`

* Force remove all containers and free space: `docker system prune --force`

* Remove images and free space: `docker rmi imageID [imageID]`
