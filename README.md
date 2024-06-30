# Specification document editor with VSCode Server provided by Docker Compose

This Editor provides a specification document creation environment by VSCode(Asciidoc).

The repository contains the setup files for running VS Code Server using Docker Compose with a Debian Bookworm Slim base image. This allows you to develop in a remote environment using VS Code Server. Additionally, this setup is ideal for creating specifications with Asciidoc in VS Code.

## Prerequisites

- Docker installed on your machine
- Docker Compose installed on your machine
- VS Code with Asciidoc, PlantUML, Draw.io(Diagram.io) extension installed

## Directory Structure
The project structure should look like this:

```
directory
├── Dockerfile
├── docker-compose.yml
└── workspace/
```

## Getting Started

Dockerfile: Dockerfile to build the VS Code Server image.
docker-compose.yml: Docker Compose configuration file.
workspace/: Host directory for your project files.

### Build and Run the Container

1. Build and start the VS Code Server container:

```sh
docker-compose up -d
```

2. Open your browser and go to http://localhost:8080.

3. Enter the password specified in the docker-compose.yml file (default: password).

### Generate a document file

1. Open Terminal in VSCode.

2. Execute the followin command in Terminal, and then a document is generated in output and archive directory.

```sh
rpm run build
```

## Configuration

### Dockerfile
The Dockerfile sets up a Debian Bookworm Slim base image and installs VS Code Server along with some essential tools.

### docker-compose.yml
The docker-compose.yml file defines the service configuration.

## Asciidoc in VS Code
VS Code is a powerful editor for Asciidoc files. With the Asciidoc extension, you can preview and check your Asciidoc files in real-time. This makes it an ideal environment for creating and editing specification documents.