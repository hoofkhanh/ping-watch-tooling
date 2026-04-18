function Import-ToolingEnv {
    param(
        [string]$EnvFilePath
    )

    if (-not (Test-Path $EnvFilePath)) {
        throw "Missing env file: $EnvFilePath. Copy .env.example to .env first."
    }

    Get-Content $EnvFilePath | ForEach-Object {
        $line = $_.Trim()
        if ([string]::IsNullOrWhiteSpace($line) -or $line.StartsWith("#")) {
            return
        }

        $parts = $line -split "=", 2
        if ($parts.Length -eq 2) {
            [System.Environment]::SetEnvironmentVariable($parts[0], $parts[1])
        }
    }
}

function Get-RepoRoot {
    return (Resolve-Path "$PSScriptRoot\..\..\..").Path
}
