
$GoogleButton = New-BTButton -Content 'Google' -Arguments 'https://google.com'

$Splat = @{
    Text    = 'There''s a new thing on the internet!'
    Sound   = 'IM'
    Button  = $GoogleButton
}

New-BurntToastNotification @Splat
