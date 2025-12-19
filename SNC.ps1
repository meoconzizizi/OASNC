# run_SNC.ps1
# Tai va chay SNC.bat tu GitHub, tu dong xoa sau khi chay

$url = "https://raw.githubusercontent.com/meoconzizizi/OASNC/refs/heads/main/SNC.bat"
$tempFile = "$env:TEMP\SNC.bat"

Write-Host "Dang tai SNC.bat tu GitHub..." -ForegroundColor Cyan

try {
    Invoke-WebRequest -Uri $url -OutFile $tempFile -ErrorAction Stop
    Write-Host "Tai thanh cong: $tempFile" -ForegroundColor Green
}
catch {
    Write-Host "Loi khi tai file tu GitHub!" -ForegroundColor Red
    exit 1
}

Write-Host "Dang chay SNC.bat..." -ForegroundColor Yellow

# Chay bat va doi chay xong
Start-Process "cmd.exe" -ArgumentList "/c `"$tempFile`"" -Verb RunAs -Wait

# Xoa file bat sau khi chay xong
if (Test-Path $tempFile) {
    Remove-Item $tempFile -Force
    Write-Host "Da xoa file tam SNC.bat" -ForegroundColor DarkGray
}

Write-Host "Hoan tat." -ForegroundColor Green
