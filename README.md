# CI / CD Pipeline Github Actions to Google Kubernetes Engine

![alt](img/ci-cd-github-actions.jpg)

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

## Introduction

This repository provides an example CI/CD pipeline using GitHub Actions to deploy applications to Google Kubernetes Engine (GKE). The pipeline automates the build, test, and deployment processes, enabling you to efficiently deliver your applications to GKE.

By following the instructions in this repository, you can set up a robust CI/CD pipeline that integrates with GKE, enabling you to easily deploy and manage your applications in a Kubernetes environment.

## Features

- **GitHub Actions**: Leverage the power of GitHub Actions to automate your CI/CD pipeline. Easily define workflows to build, test, and deploy your applications to GKE.

- **Google Kubernetes Engine**: Deploy your applications to GKE, a managed Kubernetes service provided by Google Cloud. Benefit from the scalability, reliability, and ease of use of GKE for running your Kubernetes workloads.

## Getting Started

Follow these steps to set up the CI/CD pipeline using GitHub Actions to deploy applications to GKE:

1. **Prerequisites**: Make sure you have the following prerequisites in place:
   - A Google Cloud Platform (GCP) account with billing enabled
   - A GKE cluster provisioned in your GCP project
   - Access to the GCP project with appropriate IAM permissions

2. **Configuration**: Configure the necessary settings in your repository:
   - Set up a service account in GCP with the necessary permissions to interact with GKE and generate a JSON key file.
   - Store the service account key file securely as a repository secret in GitHub.
   - Update the `.github/workflows/ci.yml` and `.github/workflows/cd.yml` file with your GKE cluster details, Docker image information, and other deployment configurations.

3. **Workflow**: Customize the GitHub Actions workflow to fit your project requirements:
   - Define the build steps, including compiling code, running tests, and building Docker images.
   - Configure the deployment steps, including pushing the Docker image to a container registry and deploying the application to GKE.
   - Optionally, set up additional steps for environment-specific configurations or post-deployment tasks.

4. **Execution**: Trigger the CI/CD pipeline by committing and pushing changes to your repository. GitHub Actions will automatically execute the defined workflow and deploy your application to GKE.

5. **Monitoring and Troubleshooting**: Monitor the CI/CD pipeline execution using the GitHub Actions dashboard. In case of issues, refer to the logs and error messages for troubleshooting.

## Contributing

Contributions are welcome! If you find any issues or have suggestions for improvement, please submit them as GitHub issues in this repository. You can also create pull requests to contribute changes or new features.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

This project is built upon the work of GitHub Actions and Google Kubernetes Engine. We would like to express our gratitude to the teams behind these technologies for their valuable contributions.
