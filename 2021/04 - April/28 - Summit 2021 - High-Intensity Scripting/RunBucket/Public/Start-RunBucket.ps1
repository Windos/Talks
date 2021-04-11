function Start-RunBucket {
    param (
        [string] $CtrlPath,

        [string] $VarPath,

        [string] $Title = 'Default',

        [ValidateSet('PS5', 'PS7')]
        [string] $CtrlHost = 'PS5',

        [ValidateSet('PS5', 'PS7')]
        [string] $VarHost = 'PS7'
    )

    [PSCustomObject] @{
        Title   = $Title
        Winner  = $null
        CtrlMin = ''
        CtrlMax = ''
        CtrlAvg = ''
        VarMin  = ''
        VarMax  = ''
        VarAvg  = ''
        DifMin  = ''
        DifMax  = ''
        DifAvg  = ''
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content E:\UD-Assets\content.json

    $CtrlString = Get-Content -Path $CtrlPath
    $CtrlScript = [Scriptblock]::Create($CtrlString)

    $VarString = Get-Content -Path $VarPath
    $VarScript = [Scriptblock]::Create($VarString)

    $ControlResult = switch ($CtrlHost) {
        'PS5' {
            powershell.exe -Command {Start-TestCaseMeasurement -ScriptBlock $Args[0]} -Args $CtrlScript
        }
        'PS7' {
            pwsh.exe -Command {Start-TestCaseMeasurement -ScriptBlock $Args[0]} -Args $CtrlScript
        }
    }

    Start-Sleep -Milliseconds 50

    $VariationResult = switch ($VarHost) {
        'PS5' {
            powershell.exe -Command {Start-TestCaseMeasurement -ScriptBlock $Args[0]} -Args $VarScript
        }
        'PS7' {
            pwsh.exe -Command {Start-TestCaseMeasurement -ScriptBlock $Args[0]} -Args $VarScript
        }
    }

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