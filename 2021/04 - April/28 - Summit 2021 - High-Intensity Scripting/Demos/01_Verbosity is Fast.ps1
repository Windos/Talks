$TestSplat = @{
    Title      = 'Verbosity is Fast! Old vs New'
    CtrlNote   = 'Windows PowerShell: Using all the shorthand'
    VarNote    = 'PowerShell 7.1: Using all the shorthand'
    CtrlPath   = 'E:\TestCases\01a_aliases.ps1'
    VarPath    = 'E:\TestCases\01a_aliases.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 100
    Throttle   = 5
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Verbosity is Fast! Shorthand vs Verbose'
    CtrlNote   = 'PowerShell 7.1: Using all the shorthand'
    VarNote    = 'PowerShell 7.1: Much... much more verbose'
    CtrlPath   = 'E:\TestCases\01a_aliases.ps1'
    VarPath    = 'E:\TestCases\01b_verbose.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 100
    Throttle   = 5
}

Start-RunBucket @TestSplat