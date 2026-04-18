. "$PSScriptRoot\common.ps1"

$toolingRoot = (Resolve-Path "$PSScriptRoot\..").Path
$envFile = Join-Path $toolingRoot ".env"
$composeFile = Join-Path $toolingRoot "docker-compose.yml"

Import-ToolingEnv -EnvFilePath $envFile

docker compose --env-file $envFile -f $composeFile down
Write-Host "SonarQube stopped."
