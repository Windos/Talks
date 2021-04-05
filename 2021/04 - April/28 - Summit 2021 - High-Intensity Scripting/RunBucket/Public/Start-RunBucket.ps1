function Start-RunBucket {
    param (
        [string] $CtrlPath = 'C:\Users\JoshKing\Documents\.git\Talks\2021\04 - April\28 - Summit 2021 - High-Intensity Scripting\Demos\Test1.ps1',

        [string] $VarPath = 'C:\Users\JoshKing\Documents\.git\Talks\2021\04 - April\28 - Summit 2021 - High-Intensity Scripting\Demos\Test1.ps1',

        [int] $Iterations = 100,

        [int] $Throttle = 10,

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
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content C:\UD-Assets\content.json

    $ControlResult = switch ($CtrlHost) {
        'PS5' {
            powershell.exe -Command {$ScriptPath = Join-Path $Args[3] '\Private\SpeedTest.ps1'; . $ScriptPath -Path $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -args $CtrlPath, $Iterations, $Throttle, (Split-Path $PSScriptRoot)
        }
        'PS7' {
            pwsh.exe -Command {$ScriptPath = Join-Path $Args[3] '\Private\SpeedTest.ps1'; . $ScriptPath -Path $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -args $CtrlPath, $Iterations, $Throttle, (Split-Path $PSScriptRoot)
        }
    }

    Start-Sleep -Milliseconds 50

    $VariationResult = switch ($VarHost) {
        'PS5' {
            powershell.exe -Command {$ScriptPath = Join-Path $Args[3] '\Private\SpeedTest.ps1'; . $ScriptPath -Path $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -args $VarPath, $Iterations, $Throttle, (Split-Path $PSScriptRoot)
        }
        'PS7' {
            pwsh.exe -Command {$ScriptPath = Join-Path $Args[3] '\Private\SpeedTest.ps1'; . $ScriptPath -Path $Args[0] -Iterations $Args[1] -Throttle $Args[2]} -args $VarPath, $Iterations, $Throttle, (Split-Path $PSScriptRoot)
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
    } | ConvertTo-Json -Depth 100 -Compress | Set-Content C:\UD-Assets\content.json
}