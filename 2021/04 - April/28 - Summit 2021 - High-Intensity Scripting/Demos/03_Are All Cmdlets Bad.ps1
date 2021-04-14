$TestSplat = @{
    Title      = 'Are All Cmdlets Bad?'
    CtrlNote   = 'Windows PowerShell: Grouping Services'
    VarNote    = 'PowerShell 7.1: Grouping Services'
    CtrlPath   = 'E:\TestCases\03a_Groupies.ps1'
    VarPath    = 'E:\TestCases\03a_Groupies.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 100
    Throttle   = 5
}

Start-RunBucket @TestSplat