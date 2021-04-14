$Collection = @();

$Random = New-Object -TypeName System.Random;

foreach ($i in 1..1000) {
    $Collection += $Random.Next(0,1000)
}