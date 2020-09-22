using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Sign up for your own key: https://www.mockaroo.com
$Header = @{'X-API-Key' = 'ddd01090'}
$Uri = 'https://my.api.mockaroo.com/demodata.json'

$UserData = Invoke-RestMethod $Uri -Headers $Header | ConvertFrom-Csv

Write-Warning "Start: $([datetime]::Now)"

$Results = foreach ($User in $UserData) {
    $TestSplat = @{
        ComputerName = $User.ip_address
        TcpPort      = 80
        Quiet        = $true
        ErrorAction  = 'SilentlyContinue'
    }
    Test-Connection @TestSplat

    Start-Sleep -Seconds 2
}

$TotalCount = $Results.Count
$SuccessCount = ($Results | Where-Object {$_ -eq $true}).Count
$PctSuccess = ($SuccessCount / $TotalCount).ToString('P')

$body = 'Employees online: {0}' -f $PctSuccess

Write-Warning "End: $([datetime]::Now)"

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
