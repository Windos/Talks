$TestSplat = @{
    Title      = 'Download All The Things'
    CtrlNote   = 'Windows PowerShell: Download with Invoke-WebRequest'
    VarNote    = 'PowerShell 7.1: Download with Invoke-WebRequest'
    CtrlPath   = 'E:\TestCases\08a_Download.ps1'
    VarPath    = 'E:\TestCases\08a_Download.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Download All The Things'
    CtrlNote   = 'PowerShell 7.1: Show me the progress'
    VarNote    = 'PowerShell 7.1: Actually... maybe don''t'
    CtrlPath   = 'E:\TestCases\08a_Download.ps1'
    VarPath    = 'E:\TestCases\08b_DownloadProgress.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat