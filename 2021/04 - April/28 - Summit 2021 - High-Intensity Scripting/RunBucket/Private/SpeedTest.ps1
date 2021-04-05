param (
    $Path = 'C:\Users\JoshKing\Documents\.git\Talks\2021\04 - April\28 - Summit 2021 - High-Intensity Scripting\Demos\Test1.ps1',
    $Iterations = 100,
    $Throttle = 10
)

$JobBlock = {
    Import-Module PSProfiler
    ((Measure-Script -Path $_.Path).ExecutionTime.TotalMilliseconds | Measure-Object -Sum).Sum
}

$RunTime = (1..$Iterations | ForEach-Object {[PSCustomObject] @{Iteration = $_; Path = $Path}} |
    Start-RSJob -ScriptBlock $JobBlock -Name {$_.Iteration} -Throttle $Throttle |
    Wait-RSJob |
    Receive-RSJob) | Sort-Object
$RunTime[1..($RunTime.Length-2)] | Measure-Object -Average -Maximum -Minimum