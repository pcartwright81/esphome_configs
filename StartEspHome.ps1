if (-not (Test-Path ".venv")) {
    uv venv
}
.venv\Scripts\activate
uv pip install esphome -U
esphome version
Start-Process chrome.exe http://localhost:6052/
esphome dashboard .
pause