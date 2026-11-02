# Lab 6 - all Docker commands. Run from this folder in PowerShell:
#   powershell -ExecutionPolicy Bypass -File .\run-lab.ps1
$ErrorActionPreference = "Stop"
Set-Location "$PSScriptRoot\getting-started-app"

Write-Host "== Building image 'getting-started' from Dockerfile =="
docker build -t getting-started .

Write-Host "== Running the todo app on http://localhost:3000 =="
docker rm -f todo-app 2>$null
docker run -d --name todo-app -p 127.0.0.1:3000:3000 getting-started

Write-Host "== Pulling and starting MySQL on port 3306 =="
if (-not (docker ps -a -q -f name=^some-mysql$)) {
    docker pull mysql
    docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -p 3306:3306 -d mysql:latest
} else {
    docker start some-mysql | Out-Null
    Write-Host "some-mysql already exists - started it."
}

docker ps
Write-Host "Done. Open http://localhost:3000 and connect MySQL Workbench to 127.0.0.1:3306 (root / my-secret-pw)."
