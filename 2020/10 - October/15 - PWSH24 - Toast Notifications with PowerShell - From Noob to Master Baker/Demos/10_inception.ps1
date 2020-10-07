
$Dismissed = {
    if ($Event.SourceArgs[1].Reason -eq 'TimedOut') {
        New-BurntToastNotification -Text "Don't ignore me!" -DismissedAction $Dismissed
    }
}

New-BurntToastNotification -Text 'This is important!' -DismissedAction $Dismissed
