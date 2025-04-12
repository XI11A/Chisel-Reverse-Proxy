# Use a lightweight base image
FROM alpine:latest

# Install wget and ca-certificates
RUN apk add --no-cache wget ca-certificates && \
    update-ca-certificates

# Download chisel
RUN wget -O /usr/local/bin/chisel https://github.com/jpillora/chisel/releases/download/v1.10.1/chisel_1.10.1_linux_amd64.apk && \
    chmod +x /usr/local/bin/chisel

# Expose the chisel server port (change if needed)
EXPOSE 8080

# Run chisel server in reverse mode on port 8080
CMD ["chisel", "server", "--reverse", "--port", "8080"]