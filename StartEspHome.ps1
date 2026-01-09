if (-not (Test-Path ".venv")) {
    python -m venv .venv
}
.venv\Scripts\activate
pip.exe install esphome -U
esphome version
Start-Process chrome.exe http://localhost:6052/
esphome dashboard .
pause