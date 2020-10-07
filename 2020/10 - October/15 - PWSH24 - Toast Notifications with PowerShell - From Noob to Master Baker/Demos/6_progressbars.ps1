
$Printer = 'GroundFloor'

$CyanPB = New-BTProgressBar -Status 'Cyan' -Value '0.75'
$MagentaPB = New-BTProgressBar -Status 'Magenta' -Value '0.9'
$YellowPB = New-BTProgressBar -Status 'Yellow' -Value '0.5'
$BlackPB = New-BTProgressBar -Status 'Black' -Value '0.09'

$Splat = @{
    Text        = "$Printer low on toner!", "One color less than 10% remaining."
    Sound       = 'Call2'
    ProgressBar = $CyanPB, $MagentaPB, $YellowPB, $BlackPB
}

New-BurntToastNotification @Splat
