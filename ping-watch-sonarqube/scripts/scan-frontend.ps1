. "$PSScriptRoot\common.ps1"

$toolingRoot = (Resolve-Path "$PSScriptRoot\..").Path
$envFile = Join-Path $toolingRoot ".env"
$repoRoot = Get-RepoRoot
$frontendRoot = Join-Path $repoRoot "ping-watch-ui"

Import-ToolingEnv -EnvFilePath $envFile

if (-not $env:SONAR_TOKEN -or $env:SONAR_TOKEN -eq "replace_with_your_sonar_token") {
    throw "SONAR_TOKEN is missing. Update ping-watch-tooling/ping-watch-sonarqube/.env first."
}

Push-Location $frontendRoot
try {
    npm ci
    npm run test:coverage
}
finally {
    Pop-Location
}

docker run --rm `
    --add-host host.docker.internal:host-gateway `
    -e SONAR_HOST_URL=$env:SONAR_HOST_URL `
    -e SONAR_TOKEN=$env:SONAR_TOKEN `
    -v "${frontendRoot}:/usr/src" `
    sonarsource/sonar-scanner-cli:latest `
    sonar-scanner
