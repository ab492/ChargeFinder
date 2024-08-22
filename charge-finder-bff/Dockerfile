# Step 1: Use an official Golang runtime as a parent image
FROM golang:1.23-alpine

# Step 2: Set the Current Working Directory inside the container
WORKDIR /app

# Step 3: Copy the go.mod and go.sum files to the container
# COPY go.mod go.sum ./
COPY go.mod ./

# Step 4: Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
RUN go mod download

# Step 5: Copy the source code into the container
COPY . .

# Step 6: Build the Go app
RUN go build -o main .

# Step 7: Expose port 8080 to the outside world
EXPOSE 8080

# Step 8: Command to run the executable
CMD ["./main"]