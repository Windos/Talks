function Start-RunBucket {
    [CmdletBinding()]

    param (
        [Parameter(Mandatory)]
        [scriptblock] $Control,

        [Parameter(Mandatory)]
        [scriptblock] $Variation,

        [ValidateSet('Control', 'Variation', 'Both')]
        [string[]] $UseWinPS,

        [Parameter()]
        [string] $Title,

        [Parameter()]
        [int] $Iterations = 100
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

    $ControlResult = if ($UseWinPS -contains 'Control' -or $UseWinPS -contains 'Both') {
        Start-TestCaseMeasurement -ScriptBlock $Control -Throttle 25 -Iterations $Iterations -UseWinPS
    } else {
        Start-TestCaseMeasurement -ScriptBlock $Control -Throttle 25 -Iterations $Iterations
    }

    Start-Sleep -Milliseconds 50

    $VariationResult = if ($UseWinPS -contains 'Control' -or $UseWinPS -contains 'Both') {
        Start-TestCaseMeasurement -ScriptBlock $Variation -Throttle 25 -Iterations $Iterations -UseWinPS
    } else {
        Start-TestCaseMeasurement -ScriptBlock $Variation -Throttle 25 -Iterations $Iterations
    }

    $Difference = [PSCustomObject] @{
        Minimum = Measure-RBDifference -Control $ControlResult.Minimum -Variation $VariationResult.Minimum
        Maximum = Measure-RBDifference -Control $ControlResult.Maximum -Variation $VariationResult.Maximum
        Average = Measure-RBDifference -Control $ControlResult.Average -Variation $VariationResult.Average
    }

        $Params = @{
            ControlResult = $ControlResult
            VariationResult = $VariationResult
            Difference = $Difference
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
