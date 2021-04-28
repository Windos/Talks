$TestSplat = @{
    Title      = 'Performance Laid Bare: Naked .NET'
    CtrlNote   = 'Windows PowerShell: Cmdlet, deliver me GUIDs'
    VarNote    = 'PowerShell 7.1: Cmdlet, deliver me GUIDs'
    CtrlPath   = 'E:\TestCases\05a_GuidCmdlet.ps1'
    VarPath    = 'E:\TestCases\05a_GuidCmdlet.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Performance Laid Bare: Naked .NET'
    CtrlNote   = 'PowerShell 7.1: Cmdlet, deliver me GUIDs'
    VarNote    = 'PowerShell 7.1: Running naked'
    CtrlPath   = 'E:\TestCases\05a_GuidCmdlet.ps1'
    VarPath    = 'E:\TestCases\05b_GuidDotNet.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat