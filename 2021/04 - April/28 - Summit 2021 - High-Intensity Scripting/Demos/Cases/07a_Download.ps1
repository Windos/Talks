$FileName = New-TemporaryFile;
$Download = 'https://stfiledump.blob.core.windows.net/public/20MB.zip';
Invoke-WebRequest -Uri $Download -OutFile $FileName.FullName