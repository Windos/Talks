$TestSplat = @{
    Title      = 'Are All Cmdlets Bad?'
    CtrlNote   = 'Windows PowerShell: Grouping random numbers'
    VarNote    = 'PowerShell 7.1: Grouping random numbers'
    CtrlPath   = 'E:\TestCases\04a_Groupies.ps1'
    VarPath    = 'E:\TestCases\04a_Groupies.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Are All Cmdlets Bad?'
    CtrlNote   = 'Windows PowerShell: Grouping services'
    VarNote    = 'PowerShell 7.1: Grouping services'
    CtrlPath   = 'E:\TestCases\03a_Groupies.ps1'
    VarPath    = 'E:\TestCases\03a_Groupies.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat