Get-ChildItem -Path C:\temp -Recurse |
    Where-Object -FilterScript { $_.Length -gt 5000 }