$Content1.GetContent()

# <?xml version="1.0" encoding="utf-8"?>
# <toast scenario="incomingCall">
#   <visual>
#     <binding template="ToastGeneric">
#       <text>{No... Like FOREVER!}</text>
#       <text>{When you absolutley have to get a message across, play up the "scenario".}</text>
#       <image src="C:\Users\JoshKing\AppData\Local\Temp\https---i.imgur.com-ZbdyG6F.gif" placement="appLogoOverride" />
#     </binding>
#   </visual>
#   <audio src="ms-winsoundevent:Notification.Looping.Call10" loop="true" />
# </toast>

$CleanContent = $Content1.GetContent() -Replace '<text(.*?)>{', '<text$1>'
$CleanContent = $CleanContent.Replace('}</text>', '</text>')
$CleanContent = $CleanContent.Replace('="{', '="')
$CleanContent = $CleanContent.Replace('}" ', '" ')
$CleanContent

# <?xml version="1.0" encoding="utf-8"?>
# <toast scenario="incomingCall">
#   <visual>
#     <binding template="ToastGeneric">
#       <text>No... Like FOREVER!</text>
#       <text>When you absolutley have to get a message across, play up the "scenario".</text>
#       <image src="C:\Users\JoshKing\AppData\Local\Temp\https---i.imgur.com-ZbdyG6F.gif" placement="appLogoOverride" />
#     </binding>
#   </visual>
#   <audio src="ms-winsoundevent:Notification.Looping.Call10" loop="true" />
# </toast>

$AppId = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
$ToastXml = [Windows.Data.Xml.Dom.XmlDocument]::new()
$ToastXml.LoadXml($Content1.GetContent())

$Toast = [Windows.UI.Notifications.ToastNotification]::new($ToastXml)
[Windows.UI.Notifications.ToastNotificationManager]::CreateToastNotifier($AppId).Show($Toast)

# NOTE: This only works in PowerShell 7.1 with BurntToast imported, prior version need to load some WinRT stuff manually.
#       Details: https://toast.click/NoBurntToast