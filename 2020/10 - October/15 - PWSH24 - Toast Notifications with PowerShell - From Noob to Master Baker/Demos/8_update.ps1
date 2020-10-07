
$Id = 'DemoUpdate'

$DataBinding = @{
    HeadingPlaceholder = 'Demo Update'
    TextPlaceholder    = 'This is the first example line of text'
}

$Splat = @{
    Text             = 'HeadingPlaceholder', 'TextPlaceholder'
    UniqueIdentifier = $Id
    DataBinding      = $DataBinding
}
New-BurntToastNotification @Splat


$DataBinding['TextPlaceholder'] = 'This is the second example line of text'
Update-BTNotification -UniqueIdentifier $Id -DataBinding $DataBinding


$DataBinding['TextPlaceholder'] = 'This is the third example line of text'
Update-BTNotification -UniqueIdentifier $Id -DataBinding $DataBinding
