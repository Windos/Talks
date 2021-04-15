$RandomVariable = "The content of this doesn't really matter";

$DoesMatter = if ($RandomVariable -match 'matter') {
    'Yes'
} else {
    'No'
}