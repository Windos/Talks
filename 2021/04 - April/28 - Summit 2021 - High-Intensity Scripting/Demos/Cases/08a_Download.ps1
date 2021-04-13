$FileName = New-TemporaryFile;
$Download = 'http://ipv4.download.thinkbroadband.com/20MB.zip';
Invoke-WebRequest -Uri $Download -OutFile $FileName