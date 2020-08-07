$UserCredential = Get-Credential
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
Import-PSSession $Session -DisableNameChecking
# $Test = Import-PSSession $Session -DisableNameChecking
# $Test.ExportedCommands
# $test
Write-Host "

Calendar Perms:
  Get-MailboxFolderPermission -identity `"Username:\Calendar`"
  Add-MailboxFolderPermission -identity `"Username:\Calendar`" -user `"new-username`" -AccessRights Reviewer|Editor|Publisher
  Remove-MailboxFolderPermission -identity `"Username:\Calendar`" -user `"old-username`"

Audting:
  Get-Mailbox -identity `"username`" | fl Audit*
  Set-Mailbox -Identity `"username`" -AuditEnabled $true
  Get-InboxRule -Mailbox username | Select Name, Description | fl
  Disable-InboxRule -Identity <rule identity> -Mailbox username
  Enable-InboxRule -Identity <rule identity> -Mailbox username
  // use US-style dates MM/DD/YYYY
  Search-MailboxAuditLog -Identity username -LogonTypes Admin,Delegate -ShowDetails -StartDate 1/1/2016 -EndDate 3/1/2016 | Where-Object {$_.Operation -eq `"HardDelete`"}
  Search-MailboxAuditLog -Identity username -LogonTypes Admin,Delegate -ShowDetails -StartDate 1/1/2016 -EndDate 3/1/2016 | Export-Csv -Path output.csv
  $Search = Search-AdminAuditLog -StartDate `"31/12/2019 12:00:00 AM`" -EndDate `"01/01/2020 12:59:00 PM`"
  $Search | Get-SimpleAuditLogReport.ps1 -agree

Mailbox Permissions:
  Add-MailboxPermission -Identity mailbox -User username -AccessRights:FullAccess -AutoMapping $false
  // add without automapping
  
Aliases:
  Get-Recipient -Filter {EmailAddresses -like `"smtp:st*`" -or EmailAddresses -like `"st*`"}
  
Modern Authentication
  Get-OrganizationConfig | Format-Table Name,OAuth* -Auto
  
"
