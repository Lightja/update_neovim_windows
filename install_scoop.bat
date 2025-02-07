powershell -Command "Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force"
powershell -Command "Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression"
pause