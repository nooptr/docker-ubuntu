Ubuntu trusty docker image with SSH access
============

**This image built from the docker official image:** https://hub.docker.com/_/ubuntu/

Usage
-----

To create the image `thangnvbkhn/ubuntu`, execute the following commands:

	docker build -t thangnvbkhn/ubuntu:latest .

Running thangnvbkhn/ubuntu
--------------------

To run a container from the image you created earlier with the `latest` tag
binding it to port 2222 in all interfaces, execute:

	docker run -d -p 0.0.0.0:2222:22 thangnvbkhn/ubuntu:latest

The first time that you run your container, a random password will be generated
for user `root`. To get the password, check the logs of the container by running:

	docker logs <CONTAINER_ID>

You will see an output like the following:

	========================================================================
	Password for root: Wooc7ahpeing
	========================================================================

In this case, `Wooc7ahpeing` is the password allocated to the `root` user.

Done!


Setting a specific password for the root account
------------------------------------------------

If you want to use a preset password instead of a random generated one, you can
set the environment variable `ROOT_PASS` to your specific password when running the container:

	docker run -d -p 2222:22 -e ROOT_PASS="mypass" thangnvbkhn/ubuntu:latest


Adding SSH authorized keys
--------------------------

If you want to use your SSH key to login, you can use `AUTHORIZED_KEYS` environment variable. You can add more than one public key separating them by `,`:

    docker run -d -p 2222:22 -e AUTHORIZED_KEYS="`cat ~/.ssh/id_rsa.pub`" thangnvbkhn/ubuntu:trusty
