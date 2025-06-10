FROM alpine/ansible:latest

LABEL org.opencontainers.image.description="Ansible image with community.docker module installed."
LABEL org.opencontainers.image.source="https://github.com/lsapp/docker-ansible-builder.git"

# Install system dependencies
RUN apk add --no-cache \
    sshpass \
    git \
    build-base \
    libffi-dev \
    openssl-dev \
    python3-dev \
    py3-pip \
    docker-cli \
    && rm -rf /var/cache/apk/* # Clean up apk cache

# Install Python dependencies required by community.docker collection
# Use --break-system-packages to allow pip to install into the system Python
RUN pip install --no-cache-dir requests docker --break-system-packages

# Install Ansible community.docker collection
RUN ansible-galaxy collection install community.docker --upgrade

WORKDIR /workspace
