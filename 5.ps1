### 5. Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.

[string]$cred = Get-Credential "VM2-TKACHUK\Administrator"
New-PSSessionConfigurationFile -Path "D:\git\ST_DevOps2_2019_Maksim_Tkachuk_Module2_Task5\AD.pssc" -ModulesToImport ″ActiveDirectory″ -VisibleCmdlets *-ADUser, Get-ChildItem 
Register-PSSessionConfiguration -Name ADUser -Path  "D:\git\ST_DevOps2_2019_Maksim_Tkachuk_Module2_Task5\AD.pssc" -RunAsCredential $cred -ShowSecurityDescriptorUI