$Targets = @('8.8.8.8',
             '8.8.4.4',
             '1.1.1.1',
             '1.0.0.1',
             'stuff.co.nz',
             'powershell.org',
             'toastit.dev',
             'github.com',
             '4.2.2.2',
             '4.2.2.1',
             '10.1.1.6',
             '172.21.1.1',
             '172.21.2.1',
             '9.9.9.9',
             'stackoverflow.com',
             'reddit.com',
             'youtube.com',
             'google.com',
             'chocolatey.org',
             'microsoft.com');

$Targets | Start-RSJob -Throttle 5 -Name {$_} -ScriptBlock {
    $Response = Test-Connection -ComputerName $_ -Count 2 -Quiet;

    [PSCustomObject] @{
        Host = $_;
        Online = $Response
    }
} | Wait-RSJob | Receive-RSJob