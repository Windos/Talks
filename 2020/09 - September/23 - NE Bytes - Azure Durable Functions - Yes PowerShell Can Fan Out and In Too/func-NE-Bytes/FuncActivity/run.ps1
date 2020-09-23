param($User)

$TestSplat = @{
    ComputerName = $User.ip_address
    TcpPort      = 80
    Quiet        = $true
    ErrorAction  = 'SilentlyContinue'
}
$Result = Test-Connection @TestSplat

[PSCustomObject]@{
    Address = $User.ip_address
    Result  = $Result
}
