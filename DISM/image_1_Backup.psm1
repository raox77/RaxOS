function image_1_Backup {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root
    $ImageOutputFolder = "$RootDir\extractImage"

    # find install archive (esd or wim)
    $script:installFile = ""
    if (Test-Path -Path "$ImageOutputFolder\sources\install.esd" -PathType Leaf) {
        $script:installFile = "install.esd"
    }
    elseif (Test-Path -Path "$ImageOutputFolder\sources\install.wim" -PathType Leaf) {
        $script:installFile = "install.wim"
    }
    else {
        Write-Host "[ERR] no install.esd/.wim found to unpack"
        Exit
    }

    # delete the old (modified) install.wim
    if (Test-Path -Path "$RootDir\install.wim" -PathType Leaf) {
        Write-Host "delete the old (modified) install.wim..."
        Write-Host ("delete the old (modified) install.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
            Remove-item "$RootDir\install.wim"
        })) -ForegroundColor Yellow
    }

    # delete the old (modified) install.esd
    if (Test-Path -Path "$RootDir\install.esd" -PathType Leaf) {
        Write-Host "delete the old (modified) install.esd..."
        Write-Host ("delete the old (modified) install.esd: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
            Remove-item "$RootDir\install.esd"
        })) -ForegroundColor Yellow
    }

    # if the *.esd format is used we convert it to a *.wim file
    if ($script:installFile -eq "install.esd") {
        Write-Host "install.esd => install.wim..."
        Write-Host ("install.esd => install.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
            Start-Process -FilePath dism.exe -ArgumentList "/Export-Image /SourceImageFile:$RootDir\extractImage\sources\$script:installFile /SourceIndex:1 /DestinationImageFile:$RootDir\install.wim /Compress:max /CheckIntegrity" -NoNewWindow -Wait
        })) -ForegroundColor Yellow
    }
    elseif ($script:installFile -eq "install.wim") {
        Write-Host "copy original install.wim..."
        Write-Host ("copy original install.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
            Copy-Item "$RootDir\extractImage\sources\$script:installFile" -Destination "$RootDir\$script:installFile"
        })) -ForegroundColor Yellow
    }
}

Export-ModuleMember -Function '*'