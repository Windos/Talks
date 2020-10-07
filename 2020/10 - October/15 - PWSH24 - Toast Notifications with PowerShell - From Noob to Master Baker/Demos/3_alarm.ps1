
$Splat = @{
    Text    = 'Hey You!', 'Time''s up, get off the computer!'
    AppLogo = 'https://thumbs.gfycat.com/GraveOddballKomododragon-size_restricted.gif'
    Sound   = 'Alarm5'
    SnoozeAndDismiss = $true
}

New-BurntToastNotification @Splat
