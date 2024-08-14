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