# Use slim Debian base
FROM debian:bullseye-slim

# Install dependencies to allow .deb installation
RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Copy chisel .deb package into container
COPY chisel_1.10.1_linux_amd64.deb /tmp/chisel.deb

# Install the .deb package
RUN apt-get update && apt-get install -y /tmp/chisel.deb && rm /tmp/chisel.deb

# Expose port Chisel server listens on
EXPOSE 8080

# Start Chisel reverse server
CMD ["chisel", "server", "--reverse", "--port", "8080"]
