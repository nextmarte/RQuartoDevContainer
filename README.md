# RQuartoDevContainer

A Docker container for development in R and Quarto.

[![License](https://img.shields.io/github/license/mashape/apistatus.svg)](https://opensource.org/licenses/MIT)
[![Docker Pulls](https://img.shields.io/docker/pulls/marcusramalho/rquartodevcontainer)](https://hub.docker.com/r/marcusramalho/rquartodevcontainer)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/marcusramalho/rquartodevcontainer)](https://hub.docker.com/r/marcusramalho/rquartodevcontainer)

## Description

This repository contains a Docker container configured for development in R and Quarto, ideal for data science projects. The container includes all the necessary dependencies to start working with R, Quarto, and various popular data science libraries.

## Features

- Based on the `rocker/verse:latest` image
- Installation of Quarto and its dependencies
- Support for RStudio Server on port 8787
- Installation of essential R packages and additional libraries
- Configuration of `renv` for dependency management
- Support for TinyTeX and Chromium via Quarto

## How to Use

### Prerequisites

- Docker
- Docker Compose

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/your-username/RQuartoDevContainer.git
   cd RQuartoDevContainer
   ```

2. Build and start the container:

   ```sh
   docker-compose up --build
   ```

3. Access RStudio Server in your browser:
   ```
   http://localhost:8787
   ```

## Repository Structure

- `.devcontainer/`: Configurations for containerized development in Visual Studio Code.
- `.dockerignore`: Files and directories to be ignored by Docker.
- `docker-compose.yml`: Docker Compose configuration for the container.
- `Dockerfile`: Docker image definition.
- `packages.r`: R script for package installation.
- `LICENSE`: MIT License.
- `README.md`: This file.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## Author

Marcus Ramalho
