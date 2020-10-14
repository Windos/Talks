$AppIcon = New-BTImage -Source 'https://i.imgur.com/ZbdyG6F.gif' -AppLogoOverride

$Text1 = New-BTText -Text 'No... Like FOREVER!'
$Text2 = New-BTText -Text 'When you absolutley have to get a message across, play up the "scenario".'

$Audio1 = New-BTAudio -Source ms-winsoundevent:Notification.Looping.Call10 -Loop

$Binding1 = New-BTBinding -Children $Text1, $Text2 -AppLogoOverride $AppIcon
$Visual1 = New-BTVisual -BindingGeneric $Binding1
$Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1 -Scenario IncomingCall

Submit-BTNotification -Content $Content1
