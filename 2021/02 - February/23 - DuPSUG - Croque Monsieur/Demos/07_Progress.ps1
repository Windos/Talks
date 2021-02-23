$ParentBar = New-BTProgressBar -Title 'ParentTitle' -Status 'ParentStatus' -Value 'ParentValue'
$ChildBar = New-BTProgressBar -Title 'ChildTitle' -Status 'ChildStatus' -Value 'ChildValue'

$DataBinding = @{
    'ParentTitle'  = 'Stream starting soon'
    'ParentStatus' = ''
    'ParentValue'  = 0
    'ChildTitle'   = ''
    'ChildStatus'  = ''
    'ChildValue'   = 0
}

$Id = 'SecondUpdateDemo'

$Text = 'Progress Bar Update Demo', 'There is two progress bars, they should be updated dynamically'

$ToastSplat = @{
    Text             = $Text
    UniqueIdentifier = $Id
    ProgressBar      = $ParentBar, $ChildBar
    DataBinding      = $DataBinding
}
New-BurntToastNotification @ToastSplat

. C:\Demos\Functions\Start-Progress.ps1

Start-Progress -DataBinding $DataBinding -UniqueId $Id
