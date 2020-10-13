param($Address)

Start-Sleep -Seconds 20

try {
    $PortOpen = Test-Connection -TargetName $Address -TcpPort 22 -ErrorAction Stop
} catch {
    $PortOpen = $null
}

[PSCustomObject] @{
    Target   = $Address
    PortOpen = $PortOpen
}
