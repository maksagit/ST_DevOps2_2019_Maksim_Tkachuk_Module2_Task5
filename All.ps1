### 1. При помощи WMI перезагрузить все виртуальные машины.

# Проверяем разрешения подключаться к удаленной машине с той машины (Host) с которой будет происходить управление:
# get-item wsman:\localhost\Client\TrustedHosts
# Для разрешения подключаться ко всем:
# set-item wsman:localhost\client\trustedhosts -value *

$hosts = @("VM1-TKACHUK", "VM2-TKACHUK", "VM3-TKACHUK")
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName $hosts -Credential "Ser2012R2-Y550\Administrator"

### 2. При помощи WMI просмотреть список запущенных служб на удаленном компьютере. 

[string]$host = "VM2-TKACHUK"
[string]$cred = "Ser2012R2-Y550\Administrator"
Invoke-Command -ScriptBlock { Get-Service | Where-Object {$_.Status -eq "Running" }} -ComputerName $host -Credential $cred

### 3. Настроить PowerShell Remoting, для управления всеми виртуальными машинами с хостовой.

Enter-PSSession -ComputerName "VM2-TKACHUK"

### 4. Для одной из виртуальных машин установить для прослушивания порт 42658. Проверить работоспособность PS Remoting.

[string]$host = "VM2-TKACHUK"
[string]$cred = "Ser2012R2-Y550\Administrator"
Invoke-Command -ScriptBlock {Set-Item WSMan:\localhost\listener\listener*\port -Value 42658} -ComputerName $host -Credential $cred

# Проверим порт для прослушивания одной из виртуальных машин (default port 5985)
# Get-Item WSMan:\localhost\listener\listener*\port | fl name, value
# Результат в 4.ps1_screen.jpg

### 5. Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.

[string]$cred = Get-Credential "VM2-TKACHUK\Administrator"
New-PSSessionConfigurationFile -Path "D:\git\ST_DevOps2_2019_Maksim_Tkachuk_Module2_Task5\AD.pssc" -ModulesToImport ″ActiveDirectory″ -VisibleCmdlets *-ADUser, Get-ChildItem 
Register-PSSessionConfiguration -Name ADUser -Path  "D:\git\ST_DevOps2_2019_Maksim_Tkachuk_Module2_Task5\AD.pssc" -RunAsCredential $cred -ShowSecurityDescriptorUI