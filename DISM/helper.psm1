# https://en.wikipedia.org/wiki/Windows_11_version_history

<#
    Windows 11 22H2 ist seit einiger Zeit fertig und erhält nur noch Updates.
    Das offizielle Rollout fehlt noch. Was wir bisher wissen ist, dass Microsoft nicht alle neuen Funktionen in die 22621 packen wird.
    Diese werden durch die Moment Updates nachgereicht.

    Im Beta-Kanal sind wir derzeit mit der 22622 unterwegs.
    Damals hieß es von Microsoft, dass diese Versionen für ein paar Wochen bleiben werden.
    Man legte sich aber noch nicht auf einen Zeitrahmen fest. Wie Albacore jetzt schreibt, sind diejenigen, die die Windows 11 22H2 22622 im Beta-Kanal nutzen,
    effektiv schon mit der Moments 1 unterwegs, die dann im Oktober als 228xx erscheinen soll.

    Intern ist Microsoft schon am Moment 2 Update dran. Dieses „Paket" soll dann im nächsten Jahr als 229xx erscheinen.
    Beide „Moment" -Updates werden dann als kleines Update (Enablement Pakage) bereitgestellt. Kennen wir ja schon von der Windows 10 2004 19041/2/3/4 und 19045.
    #>

# Build-only can be seen in:				MSInfo32.exe
# Friendly display info can be seen in: 	explorer.exe ms-settings:about
#
#
# Wiki:
# 	Win10:	https://en.wikipedia.org/wiki/Windows_10_version_history#Channels
#	Win11:	https://en.wikipedia.org/wiki/Windows_11_version_history#Channels
#
# MS
# https://docs.microsoft.com/en-us/windows/release-health/release-information
#
# Per: https://www.reddit.com/r/PowerShell/comments/pb0ir9/convert_windows_10_build_number_to_feature_update/
#
# [Build Num] : [Release Name Translation for Win10]
#		15063 = 1703
#		16299 = 1709
#		17134 = 1803
#		17763 = 1809
#		18362 = 1903
#		18363 = 1909
#		19041 = 2004
#		19042 = 20H2
#		19043 = 21H1
#		19044 = 21H2
#		19045 = 22H2
#
# [Build Num] : [Release Name Translation for Win11]
#		22000 = 21H2
#		22621 = 22H2

# function Get-WinVer {
#     param (
#         [int] $Build
#     )

#     if ($build -lt 15063) {
#         return "10"
#     }
#     elseif ($build -lt 16299) {
#         return "10 1703"
#     }
#     elseif ($build -lt 17134) {
#         return "10 1709"
#     }
#     elseif ($build -lt 17763) {
#         return "10 1803"
#     }
#     elseif ($build -lt 18362) {
#         return "10 1809"
#     }
#     elseif ($build -lt 18363) {
#         return "10 1903"
#     }
#     elseif ($build -lt 19041) {
#         return "10 1909"
#     }
#     elseif ($build -lt 19042) {
#         return "10 2004"
#     }
#     elseif ($build -lt 19043) {
#         return "10 20H2"
#     }
#     elseif ($build -lt 19044) {
#         return "10 21H1"
#     }
#     elseif ($build -lt 19045) {
#         return "10 21H2"
#     }
#     elseif ($build -lt 22000) {
#         return "10 22H2"
#     }
#     elseif ($build -lt 22621) {
#         return "11 21H2"
#     }
#     elseif ($build -lt 22800) {
#         return "11 22H2 Moment 0"
#     }
#     elseif ($build -lt 22900) {
#         return "11 22H2 Moment 1"
#     }
#     elseif ($build -lt 25000) {
#         return "11 22H2 Moment 2"
#     }
#     else {
#         return "11 24H2"
#     }
# }

# function is21H2 {
#     Param(
#         [Switch]$verbose
#     )

#     if ($Version.MAJOR -eq 10 -and $Version.MINOR -eq 0) {
#         if ($Version.BUILD -lt 22621) {
#             if ($verbose) {
#                 write-host ("Version 21H2 (Build {0}.{1}.{2}.{3}.{4})" -f $Global:settings.Version.MAJOR, $Global:settings.Version.MINOR, $Global:settings.Version.BUILD, $Global:settings.Version.SPBUILD, $Global:settings.Version.SPLEVEL)
#             }
#             return $true
#         } else {
#             if ($verbose) {
#                 write-host ("Version 22H2 (Build {0}.{1}.{2}.{3}.{4})" -f $Global:settings.Version.MAJOR, $Global:settings.Version.MINOR, $Global:settings.Version.BUILD, $Global:settings.Version.SPBUILD, $Global:settings.Version.SPLEVEL)
#             }
#             return $false
#         }
#     }
#     return $false
# }

# function is22H2 {
#     Param(
#         [Switch]$verbose
#     )

#     if ($Global:settings.Version.MAJOR -eq 10 -and $Global:settings.Version.MINOR -eq 0) {
#         if ($Global:settings.Version.BUILD -lt 22621) {
#             if ($verbose) {
#                 write-host ("Version 21H2 (Build {0}.{1}.{2}.{3}.{4})" -f $Global:settings.Version.MAJOR, $Global:settings.Version.MINOR, $Global:settings.Version.BUILD, $Global:settings.Version.SPBUILD, $Global:settings.Version.SPLEVEL)
#             }
#             return $false
#         }
#         else {
#             if ($verbose) {
#                 write-host ("Version 22H2 (Build {0}.{1}.{2}.{3}.{4})" -f $Global:settings.Version.MAJOR, $Global:settings.Version.MINOR, $Global:settings.Version.BUILD, $Global:settings.Version.SPBUILD, $Global:settings.Version.SPLEVEL)
#             }
#             return $true
#         }
#     }
#     return $false
# }

# function WinVer {
#     if ($Global:settings.Version.MAJOR -eq 10 -and $Global:settings.Version.MINOR -eq 0) {
#         $winver = Get-WinVer -Build $Global:settings.Version.BUILD
#         Write-Host ("Version {0} (Build {1}.{2}.{3}.{4}.{5})" -f $winver, $Global:settings.Version.MAJOR, $Global:settings.Version.MINOR, $Global:settings.Version.BUILD, $Global:settings.Version.SPBUILD, $Global:settings.Version.SPLEVEL) -ForegroundColor Green
#     }
# }

function consonance {
    Param(
        [String]$source,
        [String]$target
    )
    $target = $target.replace('~','*').replace('!','?')
    # No * replaced with ~
    # No ? replaced with !
    # No |
    # No #
    if ($source -like $target) {
        return $true
    }
    return $false
}

Export-ModuleMember -Function '*'