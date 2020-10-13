using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$Address = $Request.Body.Address

if (-not $Address) {
    $body = "Please pass an address in the request body."
    $status = [HttpStatusCode]::BadRequest
} else {
    $Results = foreach ($Target in $Address) {
        Start-Sleep -Seconds 20

        try {
            $PortOpen = Test-Connection -TargetName $Target -TcpPort 22 -ErrorAction Stop
        } catch {
            $PortOpen = $null
        }

        [PSCustomObject] @{
            Target   = $Target
            PortOpen = $PortOpen
        }
    }

    $body = $Results
    $status = [HttpStatusCode]::OK
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = $status
    Body = $body
})
