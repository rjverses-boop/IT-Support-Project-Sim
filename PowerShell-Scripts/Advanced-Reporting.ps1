# Export all AD users with key attributes to CSV
Get-ADalice.j -Filter * -Property DisplayName,Department,EmailAddress,LastLogonDate |
Select-Object DisplayName,Department,EmailAddress,LastLogonDate |
Export-Csv "C:\ADUserReport.csv" -NoTypeInformation

Write-Host "User report generated at C:\ADUserReport.csv"

# Export all AD groups and their members
Get-AD -Filter * | ForEach-Object {
    $group = $_.Name
    Get-ADGroupMember -Identity $group | Select-Object @{Name="Group";Expression={$group}},Name,SamAccountName
} | Export-Csv "C:\ADGroupMembership.csv" -NoTypeInformation

Write-Host "Group membership report generated at C:\ADGroupMembership.csv"

# Create and link a GPO to an OU
$GPOName = "Security Policy - Disable USB"
$OU = "OU=Users,DC=lab,DC=local"

# Create GPO
New-GPO -Name $GPOName

# Link GPO to OU
New-GPLink -Name $GPOName -Target $OU

# Configure registry setting to disable USB storage devices
Set-GPRegistryValue -Name $GPOName `
-Key "HKLM\System\CurrentControlSet\Services\USBSTOR" `
-ValueName "Start" -Type DWord -Value 4

Write-Host "GPO '$GPOName' created, linked, and configured."

# Reset passwords for all users in a specific OU
Get-ADUser -Filter * -SearchBase "OU=Users,DC=lab,DC=local" | ForEach-Object {
    Set-ADAccountPassword -Identity $_.SamAccountName `
    -NewPassword (ConvertTo-SecureString "NewP@ssword123" -AsPlainText -Force)
    Write-Host "Password reset for user:" $_.SamAccountName
}

# Example command for Task Scheduler
powershell.exe -File "C:\Scripts\GenerateUserReport.ps1"