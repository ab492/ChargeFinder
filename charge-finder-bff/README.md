Run the backend locally with `go run .`.

## Helpful Debugging Tips
- Before doing anything, verify the issue with curl: `curl -v http://www.bramblytech.co.uk/pages/home`. I spent an hour debugging an issue that actually related to my setup in the PAW app.
- To verify the app is running on the AWS instance, you can use `curl http://localhost:${HOST_PORT}/pages/home` to get a response.
- Confirm the app is listening on port 80 (for HTTP) by using: `netstat -tuln | grep ':80'`