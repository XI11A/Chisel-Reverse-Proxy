# Start from Alpine Linux
FROM alpine:latest

# Copy chisel .apk package into the container
# You should place the .apk file in the same directory as the Dockerfile before building
COPY chisel_1.10.1_linux_amd64.apk /tmp/chisel.apk

# Install the package
RUN apk add --no-cache /tmp/chisel.apk && rm /tmp/chisel.apk

# Expose the port Chisel will listen on (can be changed)
EXPOSE 8080

# Run Chisel server in reverse mode
CMD ["chisel", "server", "--reverse", "--port", "8080"]
