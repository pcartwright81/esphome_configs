if (-not (Test-Path ".venv")) {
    python -m venv .venv
}
.venv\Scripts\activate
pip.exe install esphome -U

$yamlFiles = Get-ChildItem -Path . -Filter *.yaml -File | Where-Object { $_.Name -notlike "secret*" }

foreach ($file in $yamlFiles) {
    Write-Host "Compiling $($file.Name)..." -ForegroundColor Cyan
    esphome compile $file.FullName
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to compile $($file.Name)" -ForegroundColor Red
    }
    else {
        Write-Host "Successfully compiled $($file.Name)" -ForegroundColor Green
    }
}
