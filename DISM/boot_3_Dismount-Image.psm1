function boot_3_Dismount_Image {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

    Write-Host "Dismount-WindowsImage..."
    Write-Host ("Dismount-WindowsImage: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        try {
            Dismount-WindowsImage -Path "$RootDir\extractBootImage" -Save -CheckIntegrity
            Remove-Item "$RootDir\extractBootImage"
        }
        catch {
            Write-Host $_
            Dismount-WindowsImage -Path "$RootDir\extractBootImage" -Discard -ErrorAction Stop
            Remove-Item "$RootDir\extractBootImage"
            Pause
        }
    })) -ForegroundColor Yellow
}

Export-ModuleMember -Function '*'