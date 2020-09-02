param($Context)

$WorkBatch = $Context.Input.Address.ToString().Split(',')

$ParallelTasks = foreach ($WorkItem in $WorkBatch) {
    Invoke-ActivityFunction -FunctionName 'FuncAction' -Input $WorkItem -NoWait
}

$output = Wait-ActivityFunction -Task $ParallelTasks | Sort-Object -Property PortOpen, Target

$output
