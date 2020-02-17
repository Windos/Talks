Import-Module "UniversalAutomation" -Force

# DEMO ONLY! This will delete you UA database!
# Remove-Item "$Env:LocalAppData\UniversalAutomation" -Force -Recurse -ErrorAction SilentlyContinue

$ComputerName = "http://localhost:10000"

$KeepAlive = Start-UAServer -Port 10000

if (! $KeepAlive) {
    $AppToken = Grant-UAAppToken -IdentityName System -Role Administrator -ComputerName $ComputerName
    Connect-UAServer -ComputerName $ComputerName -AppToken $AppToken.Token
} else {
    Connect-UAServer -ComputerName $ComputerName -AppToken $KeepAlive
}
