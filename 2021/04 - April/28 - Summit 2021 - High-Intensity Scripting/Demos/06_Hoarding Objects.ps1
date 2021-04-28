$TestSplat = @{
    Title      = 'Hoarding Objects (I Don''t Have a Problem!)'
    CtrlNote   = 'Windows PowerShell: Just += all day long'
    VarNote    = 'PowerShell 7.1: Just += all day long'
    CtrlPath   = 'E:\TestCases\06a_Array.ps1'
    VarPath    = 'E:\TestCases\06a_Array.ps1'
    CtrlHost   = 'PS5'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat





$TestSplat = @{
    Title      = 'Hoarding Objects (I Don''t Have a Problem!)'
    CtrlNote   = 'PowerShell 7.1: Just += all day long'
    VarNote    = 'PowerShell 7.1: I''m making a list'
    CtrlPath   = 'E:\TestCases\06a_Array.ps1'
    VarPath    = 'E:\TestCases\06b_List.ps1'
    CtrlHost   = 'PS7'
    VarHost    = 'PS7'
    Iterations = 10
}

Start-RunBucket @TestSplat