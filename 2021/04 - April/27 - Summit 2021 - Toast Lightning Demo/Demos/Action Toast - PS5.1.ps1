# Icon care of Wikimedia Commons
# https://commons.wikimedia.org/wiki/File:Circle-icons-chat.svg
# https://commons.wikimedia.org/wiki/File:Pictogram_reply_soft_green_wbg.svg

$ChatIcon = 'C:\Demos\Circle-icons-chat.svg.png'
$ReplyIcon = 'C:\Demos\Pictogram_reply_soft_green_wbg.svg.png'



Add-Type -Path 'C:\temp\toolkit.7.0.0\lib\net461\Microsoft.Toolkit.Uwp.Notifications.dll'

$CompatMgr = [Microsoft.Toolkit.Uwp.Notifications.ToastNotificationManagerCompat]
Register-ObjectEvent -InputObject $CompatMgr -EventName OnActivated -Action {
    if ($Event.SourceArgs.UserInput.value -ne '' -and
        $Event.SourceArgs.Argument -eq 'Reply') {
        $Output = 'User replied @ {0}: {1}' -f [datetime]::Now.ToString('s'),
                                               $Event.SourceArgs.UserInput.value
        Write-Warning $Output
    }
}

[Microsoft.Toolkit.Uwp.Notifications.ToastContentBuilder]::new().
    AddText('New Message from Mr Judd').
    AddText('I love Ignite, but Summit is still the absolute best.').
    AddAppLogoOverride($ChatIcon).
    AddAttributionText('via PowerChat').
    AddInputTextBox('ConfirmBox', 'Type reply here').
    AddButton([Microsoft.Toolkit.Uwp.Notifications.ToastButton]::new().
              SetContent('Reply').
              AddArgument('Reply').
              SetImageUri($ReplyIcon).
              SetTextBoxId('ConfirmBox')).
    Show()





Register-BTEvent -Trigger 'Activated' -Argument 'Reply' -Action {
    if ($Event.SourceArgs.UserInput.value -ne '') {
        $Output = 'User replied @ {0}: {1}' -f [datetime]::Now.ToString('s'),
                                               $Event.SourceArgs.UserInput.value
        Write-Warning $Output
    }
}

New-BTContentBuilder |
    Add-BTText 'New Message from Mr Judd' |
    Add-BTText 'I love Ignite, but Summit is still the absolute best.' |
    Add-BTAppLogo $ChatIcon |
    Add-BTAttribution 'via PowerChat' |
    Add-BTTextBox -Id 'ConfirmBox' -Help 'Type reply here' |
    Add-BTButton -Content 'Reply' -Argument 'Reply' -Image $ReplyIcon -TextBoxId 'ConfirmBox' |
    Show-BTNotification
    