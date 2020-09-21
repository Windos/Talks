$Header = @{'X-API-Key' = 'ddd01090'}
$Uri = 'https://my.api.mockaroo.com/demodata.json'

$UserData = Invoke-RestMethod $Uri -Headers $Header | ConvertFrom-Csv

[datetime]::Now

$Results = foreach ($User in $UserData) {
    $TestSplat = @{
        ComputerName = $User.ip_address
        Count        = 2
        Quiet        = $true
        ErrorAction  = 'SilentlyContinue'
    }
    Test-Connection @TestSplat
}

$TotalCount = $Results.Count
$SuccessCount = ($Results | Where-Object {$_ -eq $true}).Count
$PctSuccess = ($SuccessCount / $TotalCount).ToString('P')

'Employees online: {0}' -f $PctSuccess

[datetime]::Now
