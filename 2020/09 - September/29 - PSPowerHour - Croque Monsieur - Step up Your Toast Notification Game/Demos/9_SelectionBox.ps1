$Activated = {
    if ($Event.SourceArgs[1].Arguments -ne 'dismiss') {
        switch ($Event.SourceArgs[1].UserInput.value) {
            Item1 {
                $Text1 = New-BTText -Content 'GIF: Picard Facepalm'
                $ImagePath = 'C:\Demos\Gifs\facepalm.gif'
            }
            Item2 {
                $Text1 = New-BTText -Content 'GIF: Get It Girl'
                $ImagePath = 'C:\Demos\Gifs\get-it-girl.gif'
            }
            Item3 {
                $Text1 = New-BTText -Content 'GIF: Seinfeld - Oh, right right right'
                $ImagePath = 'C:\Demos\Gifs\oh-right.gif'
            }
            Item4 {
                $Text1 = New-BTText -Content 'GIF: Bob Ross?'
                $ImagePath = 'C:\Demos\Gifs\bob-ross.gif'
            }
        }

        $Image1 = New-BTImage -Source $ImagePath -HeroImage

        $ImagePath2 = 'C:\Program Files\PowerShell\7-preview\assets\Powershell_av_colors.ico'
        $Image2 = New-BTImage -Source $ImagePath2 -AppLogoOverride -Crop None

        $Audio1 = New-BTAudio -Silent

        $Binding1 = New-BTBinding -Children $Text1 -HeroImage $Image1 -AppLogoOverride $Image2
        $Visual1 = New-BTVisual -BindingGeneric $Binding1

        $Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1 -Duration Long

        Submit-BTNotification -Content $Content1
    }
}

$Text1 = New-BTText -Content 'New Batch of GIFs'
$ImagePath = 'C:\Program Files\PowerShell\7-preview\assets\Powershell_av_colors.ico'
$Image1 = New-BTImage -Source $ImagePath -AppLogoOverride -Crop None
$Audio1 = New-BTAudio -Source 'ms-winsoundevent:Notification.Default'

$Binding1 = New-BTBinding -Children $Text1 -AppLogoOverride $Image1
$Visual1 = New-BTVisual -BindingGeneric $Binding1

$Item1 = New-BTSelectionBoxItem -Id 'Item1' -Content 'Picard Facepalm'
$Item2 = New-BTSelectionBoxItem -Id 'Item2' -Content 'Get It Girl'
$Item3 = New-BTSelectionBoxItem -Id 'Item3' -Content 'Seinfeld - Oh, right right right'
$Item4 = New-BTSelectionBoxItem -Id 'Item4' -Content 'Bob Ross?'

$BTInput = New-BTInput -Id 'Selection001' -Title 'Select a GIF to view now' -DefaultSelectionBoxItemId  'Item1' -Items $Item1, $Item2, $Item3, $Item4

$Submit = New-BTButton -Content 'Submit' -Arguments 'SubmitButton' -ActivationType Foreground
$Dismiss = New-BTButton -Dismiss

$Actions = New-BTAction -Inputs $BTInput -Buttons $Submit, $Dismiss

$Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1 -Actions $Actions

Submit-BTNotification -Content $Content1 -ActivatedAction $Activated
