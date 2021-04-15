$TestSplat = @{
    Title      = 'Are All Cmdlets Bad?'
    CtrlNote   = 'Windows PowerShell: Grouping Random Numbers'
    VarNote    = 'PowerShell 7.1: Grouping Random Numbers'
    CtrlPath   = 'E:\TestCases\04a_Groupies.ps1'
    VarPath    = 'E:\TestCases\04a_Groupies.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Are All Cmdlets Bad?'
    CtrlNote   = 'Windows PowerShell: Grouping Services'
    VarNote    = 'PowerShell 7.1: Grouping Services'
    CtrlPath   = 'E:\TestCases\03a_Groupies.ps1'
    VarPath    = 'E:\TestCases\03a_Groupies.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat