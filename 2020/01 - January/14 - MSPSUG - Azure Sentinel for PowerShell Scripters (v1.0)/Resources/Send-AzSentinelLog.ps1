function Send-AzSentinelLog {
    param (
        [Parameter(Mandatory)]
        [string] $Message,
    
        [ValidateSet('Information', 'Verbose', 'Warning', 'Error')]
        [string] $Level = 'Information',

        [string] $Log = 'PowerShell',

        [string] $FunctionName = ((Get-PSCallStack)[0].Command),
        [string] $ModuleName   = ((Get-PSCallStack)[0].InvocationInfo.MyCommand.ModuleName),
        [string] $File         = ((Get-PSCallStack)[0].Position.File),
        [int] $Line            = ((Get-PSCallStack)[0].Position.StartLineNumber)
    )

    # Additional data "borrowed" from PowershellFrameworkCollective / psframework
    # https://github.com/PowershellFrameworkCollective/psframework

    Import-Module -Name 'OMSIngestionAPI'
    $OMSCreds = Get-StoredCredential -Target 'OMS'

    $TimeStamp = (Get-Date -Format 'o')

    $MessageData = @{
        'Message'      = $Message
        'LogLevel'     = $Level
        'FunctionName' = $FunctionName
        'ModuleName'   = $ModuleName
        'File'         = $File
        'Line'         = $Line
        'TimeStamp'    = $TimeStamp
        'Computer'     = $env:COMPUTERNAME
    } | ConvertTo-Json

    $OmsSplat = @{
        'customerId'     = $OMSCreds.UserName
        'sharedKey'      = $OMSCreds.GetNetworkCredential().Password
        'body'           = $MessageData
        'logType'        = $Log
        'TimeStampField' = 'TimeStamp'
    }

    Send-OMSAPIIngestionFile @OmsSplat
}
