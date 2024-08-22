# How to Deploy
1. Ensure you have ssh access to the charge-finder-dev user for the server.
2. Duplicate the `.env.template` file and fill out the correct information.
3. Run `./deploy.sh`.

# Debugging on the Instance
`docker ps -a`
`docker logs <container_id>`
`docker inspect <container_id> --format='{{.State.ExitCode}}'`
`docker restart <container_id>`

## Exit Codes
- 137: out of memory

docker inspect c56a7ca5798d --format='{{.State.ExitCode}}'

	4.	Monitor Container Resource Usage:
	•	Use tools like docker stats to monitor the memory usage of your container in real-time. This can help identify patterns or specific actions that cause memory spikes.

Connect to the docker instance:
1. docker exec -it c56a7ca5798d /bin/sh
2. Find memory usage: cat /proc/meminfo | grep MemTotal

	2.	Upgrade Your Lightsail Instance:
	•	Consider upgrading your Lightsail instance to one with more RAM, such as 1 GB or 2 GB. This will give your application more breathing room and reduce the likelihood of OOM issues.
	•	Upgrading will also give the JVM and Docker more memory to manage your application more efficiently.