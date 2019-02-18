### 2. При помощи WMI просмотреть список запущенных служб на удаленном компьютере. 

[string]$host = "VM2-TKACHUK"
[string]$cred = "S2012R2\Administrator"
Invoke-Command -ScriptBlock { Get-Service | Where-Object {$_.Status -eq "Running" }} -ComputerName $host -Credential $cred