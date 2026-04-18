# SonarQube Tooling (Backend + Frontend)

This folder runs SonarQube in Docker and scans both projects without modifying their codebases.

## 1) Setup

From `ping-watch-tooling/ping-watch-sonarqube`:

```powershell
Copy-Item .env.example .env
```

Edit `.env` and set a real `SONAR_TOKEN`.

## 2) Start SonarQube

```powershell
.\scripts\start.ps1
```

Open SonarQube UI:

- http://localhost:9000

Login dashboard

- username: admin
- password: admin

Create a user token in SonarQube:

- My Account -> Security -> Generate Token
- Paste token into `.env` as `SONAR_TOKEN=...`

## 3) Run scans

Backend only:

```powershell
.\scripts\scan-backend.ps1
```

Frontend only:

```powershell
.\scripts\scan-frontend.ps1
```

Both:

```powershell
.\scripts\scan-all.ps1
```

## 4) Stop SonarQube

```powershell
.\scripts\stop.ps1
```

## Notes

- Backend scan compiles classes first via `gradlew.bat classes`.
- Frontend scan runs `npm ci` and `npm run test:coverage` (Jest) before Sonar scan.
- Scanner runs in Docker and reaches SonarQube via `host.docker.internal`.
- Project scan settings are now in each project root:
  - `ping-watch/sonar-project.properties`
  - `ping-watch-ui/sonar-project.properties`
