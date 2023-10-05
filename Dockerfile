# syntax=docker/dockerfile:1

FROM golang

# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod go.sum ./
COPY main.go ./
RUN go mod download

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY . ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /irannicholas-goapi

EXPOSE 9080

# Run
#CMD [ "/irannicholas-goapi" ]
ENTRYPOINT ["/irannicholas-goapi"]