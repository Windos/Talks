param($Context)

$Addresses = ($Context.input | ConvertFrom-Json).Address

# $output = foreach ($Address in $Addresses) {
#     Invoke-ActivityFunction -FunctionName 'Hello1' -Input $Address
# }
#
# $output

$ParallelTasks = foreach ($Target in $Addresses) {
    Invoke-ActivityFunction -FunctionName 'funcActivity' -Input $Target -NoWait
}

Wait-ActivityFunction -Task $ParallelTasks | Sort-Object -Property PortOpen, Target
