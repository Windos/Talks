$TestSplat = @{
    Title      = 'Silence is Golden!'
    CtrlNote   = 'Windows PowerShell: Pipe to Out-Null'
    VarNote    = 'PowerShell 7.1: Pipe to Out-Null'
    CtrlPath   = 'E:\Tests\02a_outnull.ps1'
    Iterations = 1000
    Throttle   = 10
}

Start-RunBucket @TestSplat


$TestSplat = @{
    Title      = 'Silence is Golden!'
    CtrlNote   = 'PowerShell 7.1: Pipe to Out-Null'
    VarNote    = 'PowerShell 7.1: Assign to Null'
    CtrlPath   = 'E:\Tests\02a_outnull.ps1'
    VarPath    = 'E:\Tests\02b_assignnull.ps1'
    Iterations = 1000
    Throttle   = 10
    CtrlHost    = 'PS7'
}

Start-RunBucket @TestSplat