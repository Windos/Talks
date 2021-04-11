$DashSplat = @{
    Stylesheets  = '/assets/theme.css'
    DefaultTheme = 'Dark'
}

# [PSCustomObject] @{
#     Title   = 'Loops'
#     Winner  = 'Control'
#     CtrlMin = '4.588'
#     CtrlMax = '29.465'
#     CtrlAvg = '11.576'
#     VarMin  = '3.188'
#     VarMax  = '31.875'
#     VarAvg  = '7.662'
#     DifMin  = '-30.53'
#     DifMax  = '8.18'
#     DifAvg  = '-33.81'
# } |
# ConvertTo-Json -Depth 100 -Compress | Set-Content E:\UD-Assets\content.json

$PSDefaultParameterValues=@{"New-UD*:Elevation"=2}

$Style_BgRed = @{backgroundColor = '#8B0000'}
$Style_BgGreen = @{backgroundColor = '#006400'}
$Style_BgDark = @{backgroundColor = '#171717'}

$Icon_RightArrow   = New-UDIcon -Icon 'long_arrow_right'
$Icon_Random       = New-UDIcon -Icon 'random'
$Icon_ChevronDown  = New-UDIcon -Icon 'chevron_down'
$Icon_ChevronUp    = New-UDIcon -Icon 'chevron_up'
$Icon_ChevronRight = New-UDIcon -Icon 'chevron_right'
$Icon_Percent      = New-UDIcon -Icon 'percent'
$Icon_Award        = New-UDIcon -Icon 'award'

$Chip_Award = New-UDChip -Label 'Winner' -Icon $Icon_Award -Style @{backgroundColor = '#B88005'}
$Chip_Blank = New-UDChip -Style $Style_BgRed

New-UDDashboard @DashSplat -Content {
    New-UDDynamic -AutoRefresh -AutoRefreshInterval 5 -Content {
        $Content = Get-Content 'E:\UD-Assets\content.json' | ConvertFrom-Json

        New-UDGrid -Container -Content {
            #########
            # Row 1 #
            #########
            New-UDGrid -Item -ExtraSmallSize 12 -Content {
                New-UDPaper -Content {
                    New-UDTypography -Text "$($Content.Title)" -Variant h2
                }
            }

            #########
            # Row 2 #
            #########
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                $Style, $Chip = if ($Content.Winner -eq 'Control') {
                    $Style_BgGreen, $Chip_Award
                } else {
                    $Style_BgRed, $Chip_Blank
                }
                New-UDPaper -Style $Style -Content {
                    $Icon_RightArrow
                    New-UDTypography -Text 'Control' -Variant h4
                    $Chip
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                $Style, $Chip = if ($Content.Winner -eq 'Variation') {
                    $Style_BgGreen, $Chip_Award
                } else {
                    $Style_BgRed, $Chip_Blank
                }
                New-UDPaper -Style $Style -Content {
                    $Icon_Random
                    New-UDTypography -Text 'Variation' -Variant h4
                    $Chip
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {}

            #########
            # Row 3 #
            #########
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDPaper -Style $Style_BgDark  -Content {
                    New-UDTypography -Text $Content.CtrlNote -Variant h5
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDPaper -Style $Style_BgDark -Content {
                    New-UDTypography -Text $Content.VarNote -Variant h5
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {}

            #########
            # Row 4 #
            #########
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDCard -Title 'Minimum (ms)' -Content {
                    $Icon_ChevronDown
                    New-UDTypography -Text $Content.CtrlMin -Variant h3
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDCard -Title 'Minimum (ms)' -Content {
                    $Icon_ChevronDown
                    New-UDTypography -Text $Content.VarMin -Variant h3
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                $Style = if ($Content.DifMin -like '-*') {$Style_BgGreen} else {$Style_BgRed}
                New-UDCard -Style $Style -Title 'Difference' -Content {
                    $Icon_Percent
                    New-UDTypography -Text $Content.DifMin -Variant h3
                }
            }

            #########
            # Row 5 #
            #########
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDCard -Title 'Maximum (ms)' -Content {
                    $Icon_ChevronUp
                    New-UDTypography -Text $Content.CtrlMax -Variant h3
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDCard -Title 'Maximum (ms)' -Content {
                    $Icon_ChevronUp
                    New-UDTypography -Text $Content.VarMax -Variant h3
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                $Style = if ($Content.DifMax -like '-*') {$Style_BgGreen} else {$Style_BgRed}
                New-UDCard -Style $Style -Title 'Difference' -Content {
                    $Icon_Percent
                    New-UDTypography -Text $Content.DifMax -Variant h3
                }
            }

            #########
            # Row 6 #
            #########
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDCard -Title 'Average' -Content {
                    $Icon_ChevronRight
                    New-UDTypography -Text $Content.CtrlAvg -Variant h3
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                New-UDCard -Title 'Average' -Content {
                    $Icon_ChevronRight
                    New-UDTypography -Text $Content.VarAvg -Variant h3
                }
            }
            New-UDGrid -Item -ExtraSmallSize 4 -Content {
                $Style = if ($Content.DifAvg -like '-*') {$Style_BgGreen} else {$Style_BgRed}
                New-UDCard -Style $Style -Title 'Difference' -Content {
                    $Icon_Percent
                    New-UDTypography -Text $Content.DifAvg -Variant h3
                }
            }

            #########
            # Row 7 #
            #########
            New-UDGrid -Item -ExtraSmallSize 12 -Content {
                New-UDPaper -Content {

                }
            }
        }
    }
}
