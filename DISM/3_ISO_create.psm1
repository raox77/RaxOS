function 3_ISO_create {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root
    $ProjectName = $Global:settings.ProjectName

    [int]$i = 0
    [string]$Timestamp = Get-Date -f yyyy-MM-dd
    if ($ProjectName -ne "") {
        $ISONAME += $ProjectName
    }

    while ($true) {
        if ($null -eq (Get-ChildItem -Path "$RootDir\_FINISH_ISO\$($timestamp)_$($i)_$($ISONAME)*")) {
           break
        }
        $i += 1
    }

    $ISONAME = "$RootDir\_FINISH_ISO\$($timestamp)_$($i)_$($ISONAME)"
    Write-Debug "ISONAME: $ISONAME"

    Write-Host "create ISO..."
    Write-Host ("create ISO: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        # https://oofhours.com/2022/08/15/want-your-own-windows-11-21h2-arm64-isos/
        Start-Process "$RootDir\Tools\oscdimg.exe" -ArgumentList "-l$ProjectName", "-o", "-u2", "-m", "-udfver102", "-bootdata:1#pEF,e,b$RootDir\extractImage\EFI\Microsoft\boot\efisys.bin", "$RootDir\extractImage", "$ISONAME.iso" -NoNewWindow -Wait
    })) -ForegroundColor Yellow

    Write-Host $("{0:n3} MB" -f $((Get-Item -Path "$ISONAME.iso").Length / 1MB))

    if (Test-Path -Path "$RootDir\extractImage") {
        Remove-Item "$RootDir\extractImage" -Recurse -Force
    }

    Write-Host "calculate hash..."
    Write-Host ("calculate hash: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        $hash = (Get-FileHash "$ISONAME.iso" -Algorithm SHA256).Hash
        Rename-Item -Path "$ISONAME.iso" -NewName "$($ISONAME)_$hash.iso"
        Write-host "SHA-256: $hash"
    })) -ForegroundColor Yellow
}

Export-ModuleMember -Function '*'