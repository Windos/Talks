# See the UA sample script: https://docs.universalautomation.io/sample-script

Import-Module "UniversalAutomation.Dashboard" -Force

$Dashboard = New-UADashboard

$AuthMethod = New-UDAuthenticationMethod -Endpoint {
    param([pscredential]$Credential)
    New-UDAuthenticationResult -Success -UserName $Credential.UserName
}

$AuthPolicy = New-UDAuthorizationPolicy -Name "Policy" -Endpoint {
    param($ClaimsPrincipal)

    $UserName = $ClaimsPrincipal.Identity.Name

    if (-not $Session:AppToken) {
        $Identity = Get-UAIdentity -Name $UserName
        if ($Identity -eq $null) {
            if ($UserName -eq 'Admin') {
                $Role = Get-UARole -Name "Administrator"
                New-UAIdentity -Name $UserName -Role $Role
            } else {
                $Role = Get-UARole -Name "Reader"
                New-UAIdentity -Name $UserName -Role $Role
            }
        }

        $Session:AppToken = Grant-UAAppToken -Identity $Identity
    }

    $true
}

$LoginPage = New-UDLoginPage -AuthenticationMethod $AuthMethod -AuthorizationPolicy $AuthPolicy
$Dashboard.LoginPage = $LoginPage

Start-UDDashboard -Dashboard $Dashboard -Port 10001 -AllowHttpForLogin

Start-Process http://localhost:10001
