FROM golang:1.17 as builder

// Set the working directory

WORKDIR /app

// Copy the go.mod and go.sum files

COPY go.mod go.sum ./


// Download the dependencies

RUN go.mod download


// Copy the source code

COPY main.go ./


// Set the working directory

WORKDIR /root/

// Copy the binary from the builder stage

COPY -from=builder /app/donkey .

// Expose port 8080

EXPOSE 8080

// Run the application

CMD ["./donkey"]
