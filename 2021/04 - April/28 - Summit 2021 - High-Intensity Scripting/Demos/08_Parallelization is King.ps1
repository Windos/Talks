$TestSplat = @{
    Title      = 'Parallelization is Dead, Long Live Parallelization!'
    CtrlNote   = 'PowerShell 7.1: PoshRSJob, My Long Time Go To'
    VarNote    = 'PowerShell 7.1: ForEach-Object Parallel, My New Squeeze?'
    CtrlPath   = 'E:\TestCases\08a_RSJob.ps1'
    VarPath    = 'E:\TestCases\08b_ForEachParallel.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat