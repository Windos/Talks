#Requires -Module OMSIngestionAPI, Microsoft.PowerShell.SecretsManagement

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
    Import-Module -Name 'Microsoft.PowerShell.SecretsManagement'
    $WorkspaceId = Get-Secret -Name 'OMS Workspace Id' -AsPlainText
    $WorkspaceKey = Get-Secret -Name 'OMS Key' -AsPlainText

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
        'customerId'     = $WorkspaceId
        'sharedKey'      = $WorkspaceKey
        'body'           = $MessageData
        'logType'        = $Log
        'TimeStampField' = 'TimeStamp'
    }

    Send-OMSAPIIngestionFile @OmsSplat
}

#region Scheduled Job

$BlogAddress = 'toastit.dev'

if (Test-Connection -ComputerName $BlogAddress -Count 2 -Quiet) {
    $SentinelSplat = @{
        Message    = 'All OK, blog is online.'
        Level      = 'Information'
        Log        = 'BlogCheck'
        ModuleName = 'Scheduled Job'
    }
} else {
    $SentinelSplat = @{
        Message    = 'Panic stations, blog is OFFLINE!'
        Level      = 'Error'
        Log        = 'BlogCheck'
        ModuleName = 'Scheduled Job'
    }
}

Send-AzSentinelLog @SentinelSplat

#endregion
