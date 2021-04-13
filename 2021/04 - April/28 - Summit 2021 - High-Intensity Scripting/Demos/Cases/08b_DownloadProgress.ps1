$FileName = New-TemporaryFile;
$Download = 'http://ipv4.download.thinkbroadband.com/20MB.zip';
$Web = New-Object Net.WebClient;
$Web.Downloadfile($Download, $FileName)