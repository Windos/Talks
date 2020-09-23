param($Context)

# Sign up for your own key: https://www.mockaroo.com
$Header = @{'X-API-Key' = 'ddd01090'}
$Uri = 'https://my.api.mockaroo.com/demodata.json'

$UserData = Invoke-RestMethod $Uri -Headers $Header | ConvertFrom-Csv

Write-Warning "Start: $([datetime]::Now)"

$Tasks = foreach ($User in $UserData) {
    Invoke-ActivityFunction -FunctionName 'FuncActivity' -Input $User -NoWait
}

$output = Wait-ActivityFunction -Task $Tasks

$TotalCount = $output.Result.Count
$SuccessCount = ($output | Where-Object {$_.Result -eq $true}).Count
$PctSuccess = ($SuccessCount / $TotalCount).ToString('P')

'Employees online: {0}' -f $PctSuccess
