$TestSplat = @{
    Title      = 'Silence is Golden!'
    CtrlNote   = 'Windows PowerShell: Pipe to Out-Null'
    VarNote    = 'PowerShell 7.1: Pipe to Out-Null'
    CtrlPath   = 'E:\TestCases\03a_OutNull.ps1'
    VarPath    = 'E:\TestCases\03a_OutNull.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 1000
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Silence is Golden!'
    CtrlNote   = 'PowerShell 7.1: Pipe to Out-Null'
    VarNote    = 'PowerShell 7.1: Assign to null'
    CtrlPath   = 'E:\TestCases\03a_OutNull.ps1'
    VarPath    = 'E:\TestCases\03b_AssignNull.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 1000
}

Start-RunBucket @TestSplat