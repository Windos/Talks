$Activated = {
    Write-Warning 'Activated'
    $Global:ToastEvent = $Event
}

$Dismissed = {
    Write-Warning 'Dismissed'
    $Global:ToastEvent = $Event
}

New-BurntToastNotification -ActivatedAction $Activated -DismissedAction $Dismissed







$ToastEvent

$ToastEvent.SourceArgs[1]







$Dismissed = {
    if ($Event.SourceArgs[1].Reason -eq 'TimedOut') {
        Write-Warning 'Hey, wake up!'
    } elseif ($Event.SourceArgs[1].Reason -eq 'UserCanceled') {
        Write-Warning "I didn't want to talk to you anyway..."
    } else {
        Write-Warning "Well, this is awkward"
    }
}

New-BurntToastNotification -ActivatedAction $Activated -DismissedAction $Dismissed







$DismissButton = New-BTButton -Dismiss

New-BurntToastNotification -ActivatedAction $Activated -DismissedAction $Dismissed -Button $DismissButton

$ToastEvent.SourceArgs[1]







$Activated = {
    if ($Event.SourceArgs[1].Arguments -eq 'dismiss') {
        Write-Warning 'Activley Dimissed'
    } else {
        Write-Warning 'Activated'
        $Global:ToastEvent = $Event
    }
}

New-BurntToastNotification -ActivatedAction $Activated -DismissedAction $Dismissed -Button $DismissButton

$ToastEvent.SourceArgs[1]







$Text1 = New-BTText -Content 'Default Notification'
$ImagePath = Join-Path -Path (Get-Module BurntToast -ListAvailable)[0].ModuleBase -ChildPath 'Images\BurntToast.png'
$Image1 = New-BTImage -Source $ImagePath -AppLogoOverride -Crop Circle
$Audio1 = New-BTAudio -Source 'ms-winsoundevent:Notification.Default'

$Binding1 = New-BTBinding -Children $Text1 -AppLogoOverride $Image1
$Visual1 = New-BTVisual -BindingGeneric $Binding1
$Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1 -Launch 'Body Click'

Submit-BTNotification -Content $Content1 -ActivatedAction $Activated -DismissedAction $Dismissed


$ToastEvent.SourceArgs[1]
