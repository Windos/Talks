$Targets = 'toastit.dev',
           'king.geek.nz',
           'fake.address',
           '8.8.8.8',
           '1.1.1.1',
           'sdf.org'
$Targets = $Targets -join ','

$Uri = 'https://func-serverlessdays.azurewebsites.net/api/orchestrators/FuncOrchestrator?Address=' +
    $Targets

$Response = Invoke-RestMethod -Uri $Uri