$Services = Get-Service |
    Where-Object Status -eq Running |
    Select-Object -First 5