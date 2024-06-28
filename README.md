# Sync Image to Docker Hub or Aliyun Example

This repository contains a GitHub Actions workflow to synchronize Docker images to Docker Hub or Aliyun Container Registry. The workflow can be triggered on pushes to the `main` branch or pull requests to the `main` branch.

## Workflow Details

### Triggers

- **push**: Triggered on pushes to the `main` branch.
- **pull_request**: Triggered on pull requests to the `main` branch.

### Jobs

#### Build and Sync Job

This job performs the following steps:

1. **Git pull**: Check out the repository to the runner.
2. **Set up Docker Buildx**: Set up Docker Buildx for building multi-platform images.
3. **Install updated Skopeo**: Install an updated version of Skopeo, a tool for manipulating container images and container image repositories.
4. **Log in to Aliyun Hub**: Log in to the Aliyun Container Registry using credentials stored in GitHub Secrets.
5. **Sync Image to Docker Hub using Skopeo**: Run a script to synchronize images using Skopeo.

## How to Use

### Prerequisites

1. **GitHub Secrets**: Ensure that you have added the necessary secrets to your GitHub repository:
   - `DOCKER_ALIYUN_USER`: Your Aliyun Container Registry username.
   - `DOCKER_ALIYUN_PW`: Your Aliyun Container Registry password.

2. **Script**: Ensure that the `script/sysnc-images.sh` script is present in your repository. This script should contain the commands to synchronize images using Skopeo.

### Example `workflow_dispatch` Inputs

The workflow does not currently use `workflow_dispatch` inputs, but you can extend it to support manual triggers and custom inputs.
