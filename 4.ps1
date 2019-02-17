### 4. Для одной из виртуальных машин установить для прослушивания порт 42658. Проверить работоспособность PS Remoting.

[string]$host = "VM2-TKACHUK"
[string]$cred = "Ser2012R2-Y550\Administrator"
Invoke-Command -ScriptBlock {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658} -ComputerName $host -Credential $cred

# Проверим порт для прослушивания одной из виртуальных машин (default port 5985)
# Get-Item WSMan:\localhost\listener\listener*\port | fl name, value
# Результат в 4.ps1_screen.jpg