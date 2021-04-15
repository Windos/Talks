$TestSplat = @{
    Title      = 'Turn(ary) Around'
    CtrlNote   = 'PowerShell 7.1: If, Else, Blah'
    VarNote    = 'PowerShell 7.1: Turnary'
    CtrlPath   = 'E:\TestCases\09a_IfElse.ps1'
    VarPath    = 'E:\TestCases\09b_Ternary.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 1000
}

Start-RunBucket @TestSplat