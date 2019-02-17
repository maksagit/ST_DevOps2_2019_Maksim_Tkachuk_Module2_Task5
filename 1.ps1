### 1. При помощи WMI перезагрузить все виртуальные машины.

# Проверяем разрешения подключаться к удаленной машине с той машины (Host) с которой будет происходить управление:
# get-item wsman:\localhost\Client\TrustedHosts
# Для разрешения подключаться ко всем:
# set-item wsman:localhost\client\trustedhosts -value *

$hosts = @("VM1-TKACHUK", "VM2-TKACHUK", "VM3-TKACHUK")
Invoke-Command -ScriptBlock {Restart-Computer -Force} -ComputerName $hosts -Credential "Ser2012R2-Y550\Administrator"