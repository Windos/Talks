$Services = Get-Service |
    Where-Object {$_.Status -eq 'Running'} |
    Select-Object -First 5