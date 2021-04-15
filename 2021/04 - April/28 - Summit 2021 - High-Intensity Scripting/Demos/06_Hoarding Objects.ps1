$TestSplat = @{
    Title      = 'Hoarding Objects (I Don''t Have a Problem!)'
    CtrlNote   = 'Windows PowerShell: Just += All Day Long'
    VarNote    = 'PowerShell 7.1: Just += All Day Long'
    CtrlPath   = 'E:\TestCases\06a_Array.ps1'
    VarPath    = 'E:\TestCases\06a_Array.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Hoarding Objects (I Don''t Have a Problem!)'
    CtrlNote   = 'PowerShell 7.1: Just += All Day Long'
    VarNote    = 'PowerShell 7.1: Always a More Efficient Option'
    CtrlPath   = 'E:\TestCases\06a_Array.ps1'
    VarPath    = 'E:\TestCases\06b_List.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat