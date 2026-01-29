New-ADUser -Name "Alice Johnson" -SamAccountName "alice.j" -UserPrincipalName "alice.j@lab.local" `
-Path "OU=IT,DC=lab,DC=local" -AccountPassword (ConvertTo-SecureString "P@ssword123" -AsPlainText -Force) `
-Enabled $true

Set-ADDefaultDomainPasswordPolicy -MinPasswordLength 12 -ComplexityEnabled $true -MaxPasswordAge 30.00:00:00

New-GPO -Name "Disable Control Panel"
New-GPLink -Name "Disable Control Panel" -Target "OU=Users,DC=lab,DC=local"
Set-GPRegistryValue -Name "Disable Control Panel" -Key "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" `
-ValueName "NoControlPanel" -Type DWord -Value 1

Set-ADAccountPassword -Identity "alice.j" -NewPassword (ConvertTo-SecureString "NewP@ssword123" -AsPlainText -Force)
Unlock-ADAccount -Identity "alice.j"

Import-Csv "C:\Users.csv" | ForEach-Object {
    New-ADUser -Name $_.Name -SamAccountName $_.Username -UserPrincipalName "$($_.Username)@lab.local" `
    -Path "OU=Users,DC=lab,DC=local" -AccountPassword (ConvertTo-SecureString $_.Password -AsPlainText -Force) `
    -Enabled $true
}