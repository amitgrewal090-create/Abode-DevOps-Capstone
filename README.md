# Abode DevOps Capstone Project

## Project Overview
This project demonstrates an automated CI/CD workflow using GitHub, Jenkins, Docker, and Ansible.

## Technologies Used
- Git and GitHub
- Jenkins
- Docker
- Apache and PHP
- Ansible
- Ubuntu Linux (WSL)

## Project Structure
- Dockerfile – Builds the application Docker image.
- Jenkinsfile – Defines the CI/CD pipeline.
- app/ – Contains application source code.
- ansible/ – Contains Ansible installation playbook.

## CI/CD Pipeline
1. Developer pushes code to GitHub.
2. GitHub Webhook triggers Jenkins automatically.
3. Jenkins checks out the source code.
4. Docker builds the application image.
5. Jenkins tests the application using HTTP.
6. Jenkins deploys the application container.
7. Temporary test container is removed.

## Application Access
http://localhost:8085

## Docker Image
abode-webapp:1.0

## Ansible
The Ansible playbook installs Git, cURL, Python3, and Python3-pip on localhost.

Run the playbook using:

```bash
ansible-playbook install.yml --ask-become-pass

ansible localhost -m ping
```
