function 2_CopyData {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root
    $Debug = $Global:settings.Debug

    if (Test-Path -Path "$RootDir\boot.wim" -PathType Leaf) {
        Write-Host "Copy: boot.wim"
        Write-Host ("Copy: boot.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
            Copy-Item "$RootDir\boot.wim" -Destination "$RootDir\extractImage\sources\boot.wim"
        })) -ForegroundColor Yellow
    }

    Write-Host "Copy: install.wim... "
    Write-Host ("Copy: install.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        if ($Debug -eq $false) {
            if (Test-Path -Path "$RootDir\install.esd" -PathType Leaf) {
                Write-Host "Copy-Item $RootDir\install.esd"
                Copy-Item "$RootDir\install.esd" -Destination "$RootDir\extractImage\sources\install.esd"
                if (Test-Path -Path "$RootDir\extractImage\sources\install.wim" -PathType Leaf) {
                    Write-Host "Remove-Item $RootDir\extractImage\sources\install.wim"
                    Remove-Item "$RootDir\extractImage\sources\install.wim" -Force
                }
            } elseif (Test-Path -Path "$RootDir\install.wim" -PathType Leaf) {
                Write-Host "Copy-Item $RootDir\install.wim"
                Copy-Item "$RootDir\install.wim" -Destination "$RootDir\extractImage\sources\install.wim"
            }
        } else {
            if (Test-Path -Path "$RootDir\install.wim" -PathType Leaf) {
                Write-Host "Copy-Item $RootDir\install.wim"
                Copy-Item "$RootDir\install.wim" -Destination "$RootDir\extractImage\sources\install.wim"
            }
        }
    })) -ForegroundColor Yellow

    if (Test-Path -Path "$RootDir\autounattend.xml" -PathType Leaf) {
        Copy-Item "$RootDir\autounattend.xml" -Destination "$RootDir\extractImage\autounattend.xml" -Force
    }
}

Export-ModuleMember -Function '*'