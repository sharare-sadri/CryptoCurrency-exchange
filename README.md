# CryptoCurrency-exchange

## Kubernetes Deployment for Crypto Exchange App
This repository contains the full infrastructure-as-code configuration to containerize and deploy a Django-based cryptocurrency exchange application on Kubernetes. The project uses Docker, Helm, and GitHub Actions (or GitLab CI/CD) to create a scalable, automated, and observable environment.

## Core Technologies

* **Orchestration:** Kubernetes (Minikube for local development)
* **Containerization:** Docker
* **CI/CD:** GitHub Actions (or GitLab CI/CD)
* **Configuration Management:** Helm
* **Database:** PostgreSQL
* **Monitoring:** Prometheus & Grafana
* **Logging:** Grafana Loki
* **Ingress:** NGINX Ingress Controller

## Architecture Overview
The architecture is designed for a cloud-native environment:

* **Application Layer:** The stateless Django application runs as a Kubernetes Deployment, allowing for easy scaling and zero-downtime updates.

* **Data Layer:** PostgreSQL is deployed as a StatefulSet to ensure stable, persistent storage.

* **DRouting:** An NGINX Ingress Controller manages external traffic, routing it to the appropriate application service.

* **DObservability:** Prometheus scrapes metrics and Loki aggregates logs, with Grafana providing a unified dashboard for visualization.

* **DAutomation:** The CI/CD pipeline automatically builds a new Docker image on every push to the main branch and deploys it to the cluster using Helm.

Local Development Setup (Minikube):

Follow these steps to run the entire stack on your local machine.

Prerequisites
**Docker**
**Git**