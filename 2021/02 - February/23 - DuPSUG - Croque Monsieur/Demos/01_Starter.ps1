$AppIconSrc = 'https://i.imgur.com/ZbdyG6F.gif'
$AppIcon = New-BTImage -Source $AppIconSrc -AppLogoOverride

$HeroImgSrc = 'https://i2.wp.com/shopatourkitchentable.com/wp-content/uploads/2019/09/MG_4091a.jpg'
$HeroImage = New-BTImage -Source $HeroImgSrc -HeroImage

$Text1 = New-BTText -Text 'Hello, PSPowerHour!'
$Text2 = New-BTText -Text 'This is a fairly simple toast, all things considered'

$Audio1 = New-BTAudio -Source 'ms-winsoundevent:Notification.Mail'

$Binding1 = New-BTBinding -Children $Text1, $Text2 -HeroImage $HeroImage -AppLogoOverride $AppIcon
$Visual1 = New-BTVisual -BindingGeneric $Binding1
$Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1

Submit-BTNotification -Content $Content1

# Troubleshooting sound:
# https://www.4winkey.com/windows-10/fix-windows-10-notification-sound-not-working.html
