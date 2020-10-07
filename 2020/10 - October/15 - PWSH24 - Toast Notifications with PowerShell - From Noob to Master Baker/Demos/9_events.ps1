
$Activated = {
    Write-Warning 'Activated'
}

$Dismissed = {
    Write-Warning 'Dismissed'
}

New-BurntToastNotification -ActivatedAction $Activated -DismissedAction $Dismissed
