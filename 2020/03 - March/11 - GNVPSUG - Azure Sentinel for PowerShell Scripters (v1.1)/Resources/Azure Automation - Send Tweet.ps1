param (
    [string] $Message = 'This is a test tweet from an Azure Automation #PowerShell runbook'
)

Import-Module -Name 'PSTwitterAPI'

$TwitterAccess = Get-AutomationPSCredential -Name 'Twitter-Access'
$TwitterAPI = Get-AutomationPSCredential -Name 'Twitter-API'

$OAuthSettings = @{
    ApiKey            = $TwitterAPI.UserName
    ApiSecret         = $TwitterAPI.GetNetworkCredential().Password
    AccessToken       = $TwitterAccess.UserName
    AccessTokenSecret = $TwitterAccess.GetNetworkCredential().Password
}

Set-TwitterOAuthSettings @OAuthSettings

Send-TwitterStatuses_Update -Status $Message
