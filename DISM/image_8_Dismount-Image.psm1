function image_8_Dismount_Image {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root
    $Debug = $Global:Debug

    Write-Host "Dismount-WindowsImage..."
    Write-Host ("Dismount-WindowsImage: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        try {
            Dismount-WindowsImage -Path "$RootDir\extractWIMImage" -Save -CheckIntegrity
        }
        catch {
            Write-Host $_
            Dismount-WindowsImage -Path "$RootDir\extractWIMImage" -Discard
            Get-Content -Path "C:\Windows\Logs\DISM\dism.log" -tail 20
            pause
        }
        finally {
            Remove-Item "$RootDir\extractWIMImage" -Recurse -Force
        }
    })) -ForegroundColor Yellow

    # Max
    if (Test-Path "$RootDir\install_none.wim" -PathType Leaf) {
        Remove-Item "$RootDir\install_none.wim" -Force
    }
    Rename-Item -Path "$RootDir\install.wim" -NewName "$RootDir\install_none.wim"
    Export-WindowsImage -SourceImagePath "$RootDir\install_none.wim" -SourceIndex 1 -DestinationImagePath "$RootDir\install.wim"
    Remove-Item "$RootDir\install_none.wim" -Force
}

Export-ModuleMember -Function '*'