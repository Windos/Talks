$CityMap = @{
    'Hastings' = '2190224'
    'Palmerston North' = '2185018'
    'Christchurch' = '2192362'
}

$WeatherIcon = @{
    '01d' = 'C:\Demos\Icons\001-sunny.png'
    '02d' = 'C:\Demos\Icons\002-cloudy.png'
    '03d' = 'C:\Demos\Icons\002-cloudy.png'
    '04d' = 'C:\Demos\Icons\002-cloudy.png'
    '09d' = 'C:\Demos\Icons\003-rain.png'
    '10d' = 'C:\Demos\Icons\005-heavy rain.png'
    '11d' = 'C:\Demos\Icons\007-thunder.png'
    '13d' = 'C:\Demos\Icons\009-snow.png'
    '50d' = 'C:\Demos\Icons\010-wind.png'
    '01n' = 'C:\Demos\Icons\014-waxing moon.png'
    '02n' = 'C:\Demos\Icons\016-cloudy.png'
    '03n' = 'C:\Demos\Icons\016-cloudy.png'
    '04n' = 'C:\Demos\Icons\016-cloudy.png'
    '09n' = 'C:\Demos\Icons\017-rain.png'
    '10n' = 'C:\Demos\Icons\005-heavy rain.png'
    '11n' = 'C:\Demos\Icons\007-thunder.png'
    '13n' = 'C:\Demos\Icons\009-snow.png'
    '50n' = 'C:\Demos\Icons\010-wind.png'
}
# Icons made by Freepik from www.flaticon.com

$AppId = Get-Secret -Name 'OpenWeather-API' -AsPlainText

$CityId = $CityMap['Hastings']
$HastingsWeather = Invoke-RestMethod -Uri "api.openweathermap.org/data/2.5/weather?id=$CityId&APPID=$AppId&units=metric"


$City = Invoke-RestMethod -Uri "api.openweathermap.org/data/2.5/weather?id=$CityId&appid=$AppId"

$HastingsWeather = Invoke-RestMethod -Uri "https://api.openweathermap.org/data/2.5/onecall?lat=$($City.coord.lat)&lon=$($City.coord.lon)&exclude=minutely,hourly,alerts&units=metric&appid=$AppId"

[datetime]$origin = '1970-01-01 00:00:00'

$CityTZ = $HastingsWeather.timezone.Split('/')[1]
$TZ = [System.TimeZoneInfo]::GetSystemTimeZones() | Where-Object {$_.DisplayName -like "*$CityTZ*"}


#region Column1
$WeatherDate = $origin.AddSeconds($HastingsWeather.daily[0].dt)

$Day = New-BTText -Text ([System.TimeZoneInfo]::ConvertTimeFromUtc($WeatherDate, $TZ).ToString('ddd')) -Align Center
$Icon = New-BTImage -Source ($WeatherIcon[$HastingsWeather.daily[0].weather.icon]) -RemoveMargin
$High = New-BTText -Text ([math]::Round($HastingsWeather.daily[0].temp.max, 1).ToString() + '°C') -Align Center
$Low = New-BTText -Text ([math]::Round($HastingsWeather.daily[0].temp.min, 1).ToString() + '°C') -Align Center -Style CaptionSubtle

$Column1 = New-BTColumn -Weight 1 -Children $Day, $Icon, $High, $Low
#endregion

#region Column2
$WeatherDate = $origin.AddSeconds($HastingsWeather.daily[1].dt)

$Day = New-BTText -Text ([System.TimeZoneInfo]::ConvertTimeFromUtc($WeatherDate, $TZ).ToString('ddd')) -Align Center
$Icon = New-BTImage -Source ($WeatherIcon[$HastingsWeather.daily[1].weather.icon]) -RemoveMargin
$High = New-BTText -Text ([math]::Round($HastingsWeather.daily[1].temp.max, 1).ToString() + '°C') -Align Center
$Low = New-BTText -Text ([math]::Round($HastingsWeather.daily[1].temp.min, 1).ToString() + '°C') -Align Center -Style CaptionSubtle

$Column2 = New-BTColumn -Weight 1 -Children $Day, $Icon, $High, $Low
#endregion

#region Column3
$WeatherDate = $origin.AddSeconds($HastingsWeather.daily[2].dt)

$Day = New-BTText -Text ([System.TimeZoneInfo]::ConvertTimeFromUtc($WeatherDate, $TZ).ToString('ddd')) -Align Center
$Icon = New-BTImage -Source ($WeatherIcon[$HastingsWeather.daily[2].weather.icon]) -RemoveMargin
$High = New-BTText -Text ([math]::Round($HastingsWeather.daily[2].temp.max, 1).ToString() + '°C') -Align Center
$Low = New-BTText -Text ([math]::Round($HastingsWeather.daily[2].temp.min, 1).ToString() + '°C') -Align Center -Style CaptionSubtle

$Column3 = New-BTColumn -Weight 1 -Children $Day, $Icon, $High, $Low
#endregion

#region Column4
$WeatherDate = $origin.AddSeconds($HastingsWeather.daily[3].dt)

$Day = New-BTText -Text ([System.TimeZoneInfo]::ConvertTimeFromUtc($WeatherDate, $TZ).ToString('ddd')) -Align Center
$Icon = New-BTImage -Source ($WeatherIcon[$HastingsWeather.daily[3].weather.icon]) -RemoveMargin
$High = New-BTText -Text ([math]::Round($HastingsWeather.daily[3].temp.max, 1).ToString() + '°C') -Align Center
$Low = New-BTText -Text ([math]::Round($HastingsWeather.daily[3].temp.min, 1).ToString() + '°C') -Align Center -Style CaptionSubtle

$Column4 = New-BTColumn -Weight 1 -Children $Day, $Icon, $High, $Low
#endregion

#region Column5
$WeatherDate = $origin.AddSeconds($HastingsWeather.daily[4].dt)

$Day = New-BTText -Text ([System.TimeZoneInfo]::ConvertTimeFromUtc($WeatherDate, $TZ).ToString('ddd')) -Align Center
$Icon = New-BTImage -Source ($WeatherIcon[$HastingsWeather.daily[4].weather.icon]) -RemoveMargin
$High = New-BTText -Text ([math]::Round($HastingsWeather.daily[4].temp.max, 1).ToString() + '°C') -Align Center
$Low = New-BTText -Text ([math]::Round($HastingsWeather.daily[4].temp.min, 1).ToString() + '°C') -Align Center -Style CaptionSubtle

$Column5 = New-BTColumn -Weight 1 -Children $Day, $Icon, $High, $Low
#endregion

$Text = "The forecast for today features $($HastingsWeather.daily[0].weather.description) with a high of $([math]::Round($HastingsWeather.daily[0].temp.max, 1).ToString() + '°C') and a low of $([math]::Round($HastingsWeather.daily[0].temp.min, 1).ToString() + '°C')"

New-BurntToastNotification -Column $Column1, $Column2, $Column3, $Column4, $Column5 -Text $Text
