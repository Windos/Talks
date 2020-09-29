function Start-Progress {
    param(
        $countdownTime = 1,
        $DataBinding,
        $UniqueId
    )
    $loading = @('Waiting for Windos to hit enter',
                 'Warming up processors',
                 'Downloading the internet',
                 'Trying common passwords',
                 'Commencing infinite loop',
                 'Injecting double negatives',
                 'Breeding bits',
                 'Capturing escaped bits',
                 'Dreaming of a faster computer',
                 'Calculating gravitational constant',
                 'Adding Hidden Agendas',
                 'Adjusting Bell Curves',
                 'Aligning Covariance Matrices',
                 'Attempting to Lock Back-Buffer',
                 'Building Data Trees',
                 'Calculating Inverse Probability Matrices',
                 'Calculating Llama Expectoration Trajectory',
                 'Compounding Inert Tessellations',
                 'Concatenating Sub-Contractors',
                 'Containing Existential Buffer',
                 'Deciding What Message to Display Next',
                 'Increasing Accuracy of RCI Simulators',
                 'Perturbing Matrices')

    $startTime = Get-Date
    $endTime = $startTime.AddMinutes($countdownTime)
    $totalSeconds = (New-TimeSpan -Start $startTime -End $endTime).TotalSeconds

    $totalSecondsChild = Get-Random -Minimum 4 -Maximum 10
    $startTimeChild = $startTime
    $endTimeChild = $startTimeChild.AddSeconds($totalSecondsChild)
    $loadingMessage = $loading[(Get-Random -Minimum 0 -Maximum ($loading.Length - 1))]

    Do {
        $now = Get-Date
        $secondsElapsed = (New-TimeSpan -Start $startTime -End $now).TotalSeconds
        $secondsRemaining = $totalSeconds - $secondsElapsed
        $percentDone = ($secondsElapsed / $totalSeconds)

        if ($percentDone -le 0.99) {
            $DataBinding['ParentStatus'] = '{0:n0} seconds remaining' -f $secondsRemaining
        } else {
            $DataBinding['ParentStatus'] = 'Done'
        }

        $DataBinding['ParentTitle'] = 'Stream starting soon'
        $DataBinding['ParentStatus'] = '{0:n0} seconds remaining' -f $secondsRemaining
        $DataBinding['ParentValue'] = $percentDone

        $secondsElapsedChild = (New-TimeSpan -Start $startTimeChild -End $now).TotalSeconds
        $secondsRemainingChild = $totalSecondsChild - $secondsElapsedChild
        $percentDoneChild = ($secondsElapsedChild / $totalSecondsChild)

        if ($percentDoneChild -le 1) {
            $DataBinding['ChildTitle'] = $loadingMessage
            $DataBinding['ChildStatus'] = '{0:n0} seconds remaining' -f $secondsRemainingChild
            $DataBinding['ChildValue'] = $percentDoneChild
		} else {
            $DataBinding['ChildTitle'] = $loadingMessage
            $DataBinding['ChildStatus'] = 'Done'
            $DataBinding['ChildValue'] = 1
        }

        if ($percentDoneChild -ge 1 -and $percentDone -le 0.90) {
            $totalSecondsChild = Get-Random -Minimum 4 -Maximum 10
            $startTimeChild = $now
            $endTimeChild = $startTimeChild.AddSeconds($totalSecondsChild)
            if ($endTimeChild -gt $endTime.AddSeconds(-2)) {
                $totalSecondsChild = $secondsRemaining
                $endTimeChild = $startTimeChild.AddSeconds($totalSecondsChild)
            }
            $loadingMessage = $loading[(Get-Random -Minimum 0 -Maximum ($loading.Length - 1))]
        }

        $null = Update-BTNotification -UniqueIdentifier $UniqueId -DataBinding $DataBinding -ErrorAction SilentlyContinue

        Start-Sleep 0.5
    } Until ($now -ge $endTime)
}
