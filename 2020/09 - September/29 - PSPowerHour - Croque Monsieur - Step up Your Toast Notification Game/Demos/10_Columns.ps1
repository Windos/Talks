$MusicInfo = Import-Csv 'C:\Demos\Music\Tags.txt' -Delimiter "`t" -Header 'Artist', 'Album', 'Year', 'Title'
$AlbumInfo = '{0} ({1})' -f $MusicInfo.Album, $MusicInfo.Year

$Header = New-BTText -Text 'Now Playing'

$LogoPath = Join-Path -Path (Get-Module BurntToast -ListAvailable)[0].ModuleBase -ChildPath 'Images\BurntToast.png'
$AppLogo = New-BTImage -Source $LogoPath -AppLogoOverride -Crop Circle

$ImagePath = 'C:\Demos\Music\CoverArtwork.jpg'
$ToastImage = New-BTImage -Source $ImagePath -RemoveMargin -Align Right




$TitleLabel = New-BTText -Text 'Title:' -Style Base
$AlbumLabel = New-BTText -Text 'Album:' -Style Base
$ArtistLabel = New-BTText -Text 'Artist:' -Style Base

$Title = New-BTText -Text $MusicInfo.Title -Style BaseSubtle
$Album = New-BTText -Text $MusicInfo.Artist -Style BaseSubtle
$Artist = New-BTText -Text $AlbumInfo -Style BaseSubtle

$Column1 = New-BtColumn -Weight 2 -Children $TitleLabel, $AlbumLabel, $ArtistLabel -Weight 2
$Column2 = New-BtColumn -Weight 6 -Children $Title, $Album, $Artist




$Audio1 = New-BTAudio -Silent

$Binding1 = New-BTBinding -Children $Header, $ToastImage -Column $Column1, $Column2 -AppLogoOverride $AppLogo
$Visual1 = New-BTVisual -BindingGeneric $Binding1
$Content1 = New-BTContent -Visual $Visual1 -Audio $Audio1 -Duration Long

Submit-BTNotification -Content $Content1
