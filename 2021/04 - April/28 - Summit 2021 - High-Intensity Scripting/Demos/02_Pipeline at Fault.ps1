$TestSplat = @{
    Title      = 'Is the Pipeline at Fault?'
    CtrlNote   = 'PowerShell 7.1: Down the pipeline we go'
    VarNote    = 'PowerShell 7.1: Method to the madness'
    CtrlPath   = 'E:\TestCases\02a_PipelineCmdlet.ps1'
    VarPath    = 'E:\TestCases\02b_Methods.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 100
    Throttle   = 5
}

Start-RunBucket @TestSplat