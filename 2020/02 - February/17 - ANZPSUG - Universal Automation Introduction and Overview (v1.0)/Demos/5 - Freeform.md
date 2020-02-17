## Out of Scope Authentication Options

https://docs.universaldashboard.io/security/authentication

## Add PowerShell Version

Demo adding new PS version and setting a script to use it

See script output difference

```
7.0.0-rc.2
C:\Program Files\PowerShell\7-preview\pwsh.exe
```


## Native PowerShell Integration

### Read Host

```powershell
$Name = Read-Host -Prompt 'Who are you?'
Write-Host "Hi there, $Name"
```

### Parameters

```powershell
param (
    [string] $Address,
    [int] $PingCount
)

if (Test-Connection -ComputerName $Address -Count $PingCount -Quiet) {
    "$Address is online"
} else {
    "$Address is DOWN!"
}
```

### Write Progress

```powershell
foreach ($Num in 1..100) {
    Write-Progress -Activity "Progress $Num" -PercentComplete $Num
    Start-Sleep -Seconds 1
}
```

### Pipeline Output

```powershell
Get-Process | Sort-Object Name
```


## Enable GIT

```powershell
$GitHubURL = 'https://github.com/Windos/UA-Remote.git'
$GitHubPAT = Get-Secret -Name 'GIT-PAT'

$KeepAlive = Start-UAServer -Port 10000 -GitRemoteCredential $GitHubPAT -GitRemote $GitHubURL
```

Show changes commiting up to GitHub

See changes in GitHub syncing back to UA

Delete local repo, see it self recover (start & stop UA)


## Tags

Prod - #323f97
Dev - #e5312b
