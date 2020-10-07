
# <- Imagine a script which takes a long time to run is here ->

$Time = Get-Date -Format t

$Splat = @{
    Text    = 'Script Done', "Completed at $Time"
    AppLogo = 'https://freeiconshop.com/wp-content/uploads/edd/document-done-flat.png'
    Sound   = 'Reminder'
}

New-BurntToastNotification @Splat
