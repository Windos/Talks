$Collection = New-Object -TypeName System.Collections.ArrayList;

$Random = New-Object -TypeName System.Random;

foreach ($i in 1..1000) {
    $null = $Collection.Add($Random.Next(0,1000))
}