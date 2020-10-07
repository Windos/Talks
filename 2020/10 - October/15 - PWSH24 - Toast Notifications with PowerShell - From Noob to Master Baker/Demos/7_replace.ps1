
$ToastSplat = @{
    Text             = 'Demo Replacement',
                       'This is the first example line of text'
    UniqueIdentifier = 'DemoReplace'
}

New-BurntToastNotification @ToastSplat


$ToastSplat['Text'][1] = 'This is the second example line of text'
New-BurntToastNotification @ToastSplat

$ToastSplat['Text'][1] = 'This is the third example line of text'
New-BurntToastNotification @ToastSplat
