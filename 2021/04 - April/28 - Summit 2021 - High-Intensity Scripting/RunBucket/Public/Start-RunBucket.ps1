function Start-RunBucket {
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $CtrlPath,

        [string] $VarPath,

        [string] $Title = 'Default',

        [ValidateSet('PS5', 'PS7')]
        [string] $CtrlHost = 'PS5',

        [ValidateSet('PS5', 'PS7')]
        [string] $VarHost = 'PS7',

        [string] $CtrlNote,

        [string] $VarNote,

        [int] $Iterations = 100,

        [int] $Throttle = 5
    )

    [PSCustomObject] @{
        Title    = $Title
        Winner   = $null
        CtrlNote = $CtrlNote
        VarNote  = $VarNote
        CtrlMin  = ''
        CtrlMax  = ''
        CtrlAvg  = ''
        VarMin   = ''
        VarMax   = ''
        VarAvg   = ''
        DifMin   = ''
        DifMax   = ''
        DifAvg   = ''
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content E:\UD-Assets\content.json

    if ($null -eq $VarPath -or $VarPath -eq '') {
        $VarPath = $CtrlPath
    }

    $ControlResult = switch ($CtrlHost) {
        'PS5' {
            powershell.exe -NoProfile -ExecutionPolicy Bypass -Command {Start-TestCaseMeasurement -ScriptPath $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -Args $CtrlPath, $Iterations, $Throttle
        }
        'PS7' {
            pwsh.exe -NoProfile -ExecutionPolicy Bypass -Command {Start-TestCaseMeasurement -ScriptPath $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -Args $CtrlPath, $Iterations, $Throttle
        }
    }

    [PSCustomObject] @{
        Title    = $Title
        Winner   = $null
        CtrlNote = $CtrlNote
        VarNote  = $VarNote
        CtrlMin = $ControlResult.Minimum.ToString('0,0.000')
        CtrlMax = $ControlResult.Maximum.ToString('0,0.000')
        CtrlAvg = $ControlResult.Average.ToString('0,0.000')
        VarMin   = ''
        VarMax   = ''
        VarAvg   = ''
        DifMin   = ''
        DifMax   = ''
        DifAvg   = ''
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content E:\UD-Assets\content.json

    Start-Sleep -Milliseconds 50

    $VariationResult = switch ($VarHost) {
        'PS5' {
            powershell.exe -NoProfile -ExecutionPolicy Bypass -Command {Start-TestCaseMeasurement -ScriptPath $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -Args $VarPath, $Iterations, $Throttle
        }
        'PS7' {
            pwsh.exe -NoProfile -ExecutionPolicy Bypass -Command {Start-TestCaseMeasurement -ScriptPath $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -Args $VarPath, $Iterations, $Throttle
        }
    }

    [PSCustomObject] @{
        Title    = $Title
        Winner   = $null
        CtrlNote = $CtrlNote
        VarNote  = $VarNote
        CtrlMin = $ControlResult.Minimum.ToString('0,0.000')
        CtrlMax = $ControlResult.Maximum.ToString('0,0.000')
        CtrlAvg = $ControlResult.Average.ToString('0,0.000')
        VarMin  = $VariationResult.Minimum.ToString('0,0.000')
        VarMax  = $VariationResult.Maximum.ToString('0,0.000')
        VarAvg  = $VariationResult.Average.ToString('0,0.000')
        DifMin   = ''
        DifMax   = ''
        DifAvg   = ''
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content E:\UD-Assets\content.json

    $Difference = [PSCustomObject] @{
        Minimum = Measure-RBDifference -Control $ControlResult.Minimum -Variation $VariationResult.Minimum
        Maximum = Measure-RBDifference -Control $ControlResult.Maximum -Variation $VariationResult.Maximum
        Average = Measure-RBDifference -Control $ControlResult.Average -Variation $VariationResult.Average
    }

    $Winner = if ($ControlResult.Average -le $VariationResult.Average) {
        'Control'
    } else {
        'Variation'
    }

    [PSCustomObject] @{
        Title   = $Title
        Winner  = $Winner
        CtrlNote = $CtrlNote
        VarNote  = $VarNote
        CtrlMin = $ControlResult.Minimum.ToString('0,0.000')
        CtrlMax = $ControlResult.Maximum.ToString('0,0.000')
        CtrlAvg = $ControlResult.Average.ToString('0,0.000')
        VarMin  = $VariationResult.Minimum.ToString('0,0.000')
        VarMax  = $VariationResult.Maximum.ToString('0,0.000')
        VarAvg  = $VariationResult.Average.ToString('0,0.000')
        DifMin  = $Difference.Minimum.ToString('0.00 %')
        DifMax  = $Difference.Maximum.ToString('0.00 %')
        DifAvg  = $Difference.Average.ToString('0.00 %')
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content E:\UD-Assets\content.json
}