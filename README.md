# Ansible Docker Builder

This image has the dependencies to run Ansible playbooks for building and push images to any container registry.

Once you have this image ready, you can use it to run your playbooks like this:
```shell
docker run --rm -it \
  -v ".:/workspace" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e IMAGE_TAG="latest" \
  -e DOCKER_REGISTRY_URL="[YOUR_REGISTRY_URL]" \
  -e DOCKER_REGISTRY_NAME="[YOUR_REGISTRY_NAMESPACE]" \
  -e DOCKER_IMAGE_NAME="[YOUR_DOCKER_IMAGE_NAME]" \
  -e DOCKER_REGISTRY_USERNAME="[YOUR_REGISTRY_USER]" \
  -e DOCKER_REGISTRY_PASSWORD="[YOUR_REGISTRY_TOKEN]" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ghcr.io/lsapp/ansible-docker:latest \
  ansible-playbook [YOUR_PLAYBOOK].yml
```

Sample playbook: [sample](build_and_push.yml)
