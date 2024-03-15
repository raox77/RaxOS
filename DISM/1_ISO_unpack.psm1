function 1_ISO_unpack {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root
    $ISO_Image = $Global:settings.ISO_Image

    Write-Host "ISO unpack... "
    Write-Host ("ISO unpack: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        If (Test-Path $RootDir\extractImage) {
            Remove-item $RootDir\extractImage -Recurse
        }
        Start-Process -FilePath $RootDir\Tools\7z.exe -ArgumentList "x -y -o`"$RootDir\extractImage`" `"$RootDir\_UUPdump_ISO\$ISO_Image`"" -NoNewWindow -Wait
    })) -ForegroundColor Yellow

    if (Test-Path -Path "$RootDir\extractImage\sources\install.esd" -PathType Leaf) {
        Start-Process "$RootDir\Tools\wimlib-imagex.exe" -ArgumentList "info `"$RootDir\extractImage\sources\install.esd`" --extract-xml $RootDir\info" -NoNewWindow -Wait
    } elseif (Test-Path -Path "$RootDir\extractImage\sources\install.wim" -PathType Leaf) {
        Start-Process "$RootDir\Tools\wimlib-imagex.exe" -ArgumentList "info `"$RootDir\extractImage\sources\install.wim`" --extract-xml $RootDir\info" -NoNewWindow -Wait
    } else {
        Throw "[ERR] no install.esd/.wim found to extract"
    }

    If (Test-Path -Path "$RootDir\info" -PathType Leaf) {
        [xml]$XML = Get-Content -Path "$RootDir\info"
        $Global:settings.Version = New-Object -TypeName psobject -Property @{
            MAJOR   = $XML.WIM.IMAGE.WINDOWS.VERSION.MAJOR
            MINOR   = $XML.WIM.IMAGE.WINDOWS.VERSION.MINOR
            BUILD   = $XML.WIM.IMAGE.WINDOWS.VERSION.BUILD
            SPBUILD = $XML.WIM.IMAGE.WINDOWS.VERSION.SPBUILD
            SPLEVEL = $XML.WIM.IMAGE.WINDOWS.VERSION.SPLEVEL
        }
        Remove-Item "$RootDir\info" -Force
    }
}

Export-ModuleMember -Function '*'