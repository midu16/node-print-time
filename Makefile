
# Name of the image
IMAGE_NAME = time-monitor
TAG = latest

# Dockerfile path
DOCKERFILE = Dockerfile

# Build context (typically current directory)
CONTEXT = .

.PHONY: all build clean run

# Default target
all: build

# Build the image using Podman
build:
	podman build -t $(IMAGE_NAME):$(TAG) -f $(DOCKERFILE) $(CONTEXT)

# Clean up the image
clean:
	podman rmi -f $(IMAGE_NAME):$(TAG) || true

# Run the container interactively with full privileges
run:
	podman run --rm -it --privileged --name $(IMAGE_NAME) $(IMAGE_NAME):$(TAG)

