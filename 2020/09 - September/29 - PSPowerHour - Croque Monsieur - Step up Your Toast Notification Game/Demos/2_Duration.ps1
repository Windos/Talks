$AppIcon = New-BTImage -Source 'https://i.imgur.com/ZbdyG6F.gif' -AppLogoOverride

$Text1 = New-BTText -Text 'Stay a While!'
$Text2 = New-BTText -Text 'Some toasts need to stay on screen longer than others.'
$Text3 = New-BTText -Text 'You can crank up their "duration".'

$Audio1 = New-BTAudio -Source ms-winsoundevent:Notification.Reminder

$Binding1 = New-BTBinding -Children $Text1, $Text2, $Text3 -AppLogoOverride $AppIcon
$Visual1 = New-BTVisual -BindingGeneric $Binding1
$Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1 -Duration Long

Submit-BTNotification -Content $Content1
