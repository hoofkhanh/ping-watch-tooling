# Purpose

This application is built to solve a common problem: **reliably monitoring deployed APIs over time without depending on a local or host machine**.

In many cases, running health checks directly on the same server as the API is not reliable, as the host environment may differ from real-world conditions (network, configuration, dependencies, etc.). Similarly, using a personal machine to run checks continuously is not practical, as it requires keeping your computer running at all times.

This application provides a centralized solution to:

- Continuously monitor API availability over long periods (e.g., 24/7)
- Detect and surface failures as soon as they occur
- Observe API behavior from an external, more realistic environment
- Access monitoring results from any device without needing to keep a machine running

It is designed for scenarios where **consistent, external, and long-running API health monitoring** is required without missing critical failures.

# TOOLING

This repository contains shared tooling for Ping Watch projects.
Current focus: SonarQube setup and scan scripts for backend and frontend.

Details: https://github.com/hoofkhanh/ping-watch-tooling/tree/main/ping-watch-sonarqube

Related repositories:

- Backend: https://github.com/hoofkhanh/ping-watch
- Frontend: https://github.com/hoofkhanh/ping-watch-ui
