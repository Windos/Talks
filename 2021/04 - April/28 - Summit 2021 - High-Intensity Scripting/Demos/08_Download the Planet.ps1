$TestSplat = @{
    Title      = 'Download All The Things'
    CtrlNote   = 'Windows PowerShell: Download with Invoke-WebRequest'
    VarNote    = 'PowerShell 7.1: Download with Invoke-WebRequest'
    CtrlPath   = 'E:\Tests\08a_Download.ps1'
    Iterations = 10
    Throttle   = 1
}

Start-RunBucket @TestSplat



$TestSplat = @{
    Title      = 'Download All The Things'
    CtrlNote   = 'Windows PowerShell: Download with Invoke-WebRequest'
    VarNote    = 'PowerShell 7.1: Download with Invoke-WebRequest'
    CtrlPath   = 'E:\Tests\08a_Download.ps1'
    VarPath    = 'E:\Tests\08b_DownloadProgress.ps1'
    Iterations = 10
    Throttle   = 1
    CtrlHost   = 'PS7'
}

Start-RunBucket @TestSplat