FROM golang:1.17

# Set the current working directory inside the container
WORKDIR /go/src/app

# Copy everything from the current directory to the 
# PWD (Present Working Directory) inside the container
COPY . .

RUN go mod init

# Download all the dependencies
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# This container exposes port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD ["app"]