package main

import data.dockerfile_scanner

# Define the allowed base images
allowedBaseImages = {
  "ubuntu",
  "alpine",
}

# Rule to check the base image used in the Dockerfile
deny {
  input.kind == "Dockerfile"
  not allowedBaseImages[input.baseImage]
}

# Rule to check for COPY or ADD statements
deny {
  input.kind == "Dockerfile"
  input.contents[i].instruction == "COPY" || input.contents[i].instruction == "ADD"
  not dockerfile_scanner.fileExists(input.contents[i].source)
}


