$TestSplat = @{
    Title      = 'Verbosity is Fast! Shorthand vs Shorthand'
    CtrlNote   = 'Windows PowerShell: Using all the shorthand'
    VarNote    = 'PowerShell 7.1: Using all the shorthand'
    CtrlPath   = 'E:\Tests\01a_aliases.ps1'
    Iterations = 1000
    Throttle   = 10
}

Start-RunBucket @TestSplat


$TestSplat = @{
    Title      = 'Verbosity is Fast! Shorthand vs Verbose'
    CtrlNote   = 'PowerShell 7.1: Using all the shorthand'
    VarNote    = 'PowerShell 7.1: Much... much more verbose'
    CtrlPath   = 'E:\Tests\01a_aliases.ps1'
    VarPath    = 'E:\Tests\01b_verbose.ps1'
    Iterations = 100
    Throttle   = 5
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
}

Start-RunBucket @TestSplat