$Folder = New-UAFolder -Name 'ANZPSUG Demo'

$Script = New-UAScript -Name 'Check Blog Online' -ManualTime 30 -Folder $Folder -ScriptBlock {
if (Test-Connection -ComputerName toastit.dev -Count 2 -Quiet) {
    'Blog is online'
} else {
    'Blog is DOWN!'
}
}

New-UASchedule -Script $Script -Cron '*/5 * * * *'

Get-UAJob

Invoke-UAScript -Script $Script

Get-UAJobOutput -JobId 1
