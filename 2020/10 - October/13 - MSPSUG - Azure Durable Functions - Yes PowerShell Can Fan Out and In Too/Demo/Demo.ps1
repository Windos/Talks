# $Uri = 'https://func-mspsug-demo.azurewebsites.net/api/funcStd'

$Uri = 'https://func-mspsug-demo.azurewebsites.net/api/orchestrators/funcOrch'

$AddressList = 'toastit.dev',
               'king.geek.nz',
               'fake.address',
               'sdf.org',
               'shell.insomnia247.nl',
               '8.8.8.8',
               '1.1.1.1'

$Body = @{Address = $AddressList} | ConvertTo-Json

$Response = Invoke-RestMethod -Uri $Uri -Body $Body -Method Post -ContentType 'application/json'

$Status = 'Running'
while ($Status -eq 'Running' -or $Status -eq 'Pending') {
    Start-Sleep -Second 5
    $Query = Invoke-RestMethod -Uri $Response.statusQueryGetUri
    $Status = $Query.runtimeStatus
    $Status
}