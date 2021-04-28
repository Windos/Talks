# Icon care of Wikimedia Commons
# https://commons.wikimedia.org/wiki/File:Circle-icons-chat.svg
# https://commons.wikimedia.org/wiki/File:Pictogram_reply_soft_green_wbg.svg

$ChatIcon = 'C:\Demos\Circle-icons-chat.svg.png'
$ReplyIcon = 'C:\Demos\Pictogram_reply_soft_green_wbg.svg.png'

$Text1 = New-BTText -Content 'New Message from Mr Judd'
$Text2 = New-BTText -Content 'I love Ignite, but Summit is still the absolute best.'

$Image1 = New-BTImage -Source $ChatIcon -AppLogoOverride -Crop Circle

$Attrib = [Microsoft.Toolkit.Uwp.Notifications.ToastGenericAttributionText]::new()
$Attrib.Text = 'via PowerChat'

$BindingSplat = @{
    Children        = $Text1, $Text2
    AppLogoOverride = $Image1
    Attribution     = $Attrib
}
$Binding1 = New-BTBinding @BindingSplat
$Visual1 = New-BTVisual -BindingGeneric $Binding1

$TextInput = New-BTInput -PlaceholderContent 'Type reply here' -Id 'ConfirmBox'

$ButtonSplat = @{
    Content        = 'Reply'
    Arguments      = 'Reply'
    ActivationType = 'Background'
    ImageUri       = $ReplyIcon
}
$ConfirmButton = New-BTButton @ButtonSplat
$ConfirmButton.TextBoxId = 'ConfirmBox'

$Actions = New-BTAction -Inputs $TextInput -Buttons $ConfirmButton

$Content1 = New-BTContent -Visual $Visual1 -Actions $Actions

$GetReply = {
    if ($Event.SourceArgs[1].UserInput.value -ne '' -and
        $Event.SourceArgs[1].Arguments -eq 'Reply') {
        $Output = 'User replied @ {0}: {1}' -f [datetime]::Now.ToString('s'),
                                               $Event.SourceArgs[1].UserInput.value
        Write-Warning $Output
    }
}

Submit-BTNotification -Content $Content1 -ActivatedAction $GetReply
