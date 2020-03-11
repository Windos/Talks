$WorkspaceID = ''
$Key = ''

$Log = 'PS_Test'

$Data = Get-Service

$Data | Add-Member -MemberType NoteProperty -Name 'Timestamp' -Value (Get-Date -Format 'o')

$Body = $Data | ConvertTo-Json

Send-OMSAPIIngestionFile -customerId $WorkspaceID -sharedKey $Key -body $Body -logType $Log -TimeStampField 'Timestamp'