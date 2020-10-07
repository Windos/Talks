
$GoogleIco = 'https://freeiconshop.com/wp-content/uploads/edd/google-flat.png'
$GoogleBtn = New-BTButton -Content 'Google' -Arguments 'https://google.com' -ImageUri $GoogleIco

$BingIco = 'https://cdn.iconscout.com/icon/free/png-256/bing-10-569345.png'
$BingBtn = New-BTButton -Content 'Bing' -Arguments 'https://bing.com' -ImageUri $BingIco

$Splat = @{
    Text    = 'There''s a new thing on the internet!',
              'Choose your favorite search engine to find it'
    Sound   = 'IM'
    Button  = $GoogleBtn, $BingBtn
}

New-BurntToastNotification @Splat
