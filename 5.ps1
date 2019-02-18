### 5. Создать конфигурацию сессии с целью ограничения использования всех команд, кроме просмотра содержимого дисков.

[string]$cred = Get-Credential "S2012R2\Administrator"
New-PSSessionConfigurationFile -Path "D:\git\ST_DevOps2_2019_Maksim_Tkachuk_Module2_Task5\User.pssc" -VisibleCmdlets 'Get-ChildItem'
Register-PSSessionConfiguration -Name User -Path "D:\git\ST_DevOps2_2019_Maksim_Tkachuk_Module2_Task5\User.pssc" -RunAsCredential $cred -ShowSecurityDescriptorUI