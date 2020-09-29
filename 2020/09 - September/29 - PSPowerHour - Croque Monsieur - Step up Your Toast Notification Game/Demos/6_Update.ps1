$Id = 'DemoUpdate'

$DataBinding = @{
    HeadingPlaceholder = 'Demo Update'
    TextPlaceholder    = 'This is the first example line of text'
}

New-BurntToastNotification -Text 'HeadingPlaceholder', 'TextPlaceholder' -UniqueIdentifier $Id -DataBinding $DataBinding


$DataBinding['TextPlaceholder'] = 'This is the second example line of text'
Update-BTNotification -UniqueIdentifier $Id -DataBinding $DataBinding -ErrorAction SilentlyContinue


$DataBinding['TextPlaceholder'] = 'This is the third example line of text'
Update-BTNotification -UniqueIdentifier $Id -DataBinding $DataBinding -ErrorAction SilentlyContinue


# Turns out there's an issue with this... https://github.com/Windos/BurntToast/issues/120