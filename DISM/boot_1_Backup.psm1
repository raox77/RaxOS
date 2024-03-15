function boot_1_Backup {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

    # delete the old (modified) boot.wim
    if (Test-Path -Path "$RootDir\boot.wim" -PathType Leaf) {
        Write-Host "delete the old (modified) boot.wim..."
        Write-Host ("delete the old (modified) boot.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
            Remove-item "$RootDir\boot.wim"
        })) -ForegroundColor Yellow
    }

    Write-Host "copy original boot.wim..."
    Write-Host ("copy original boot.wim: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        Copy-Item "$RootDir\extractImage\sources\boot.wim" -Destination "$RootDir\boot.wim"
    })) -ForegroundColor Yellow

    Write-Host "copy data in 'extractBootImage' Folder..."
    Write-Host ("copy data in 'extractBootImage' Folder: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        try {
            New-Item -Path "$RootDir\extractBootImage" -ItemType Directory
            Mount-WindowsImage -ImagePath "$RootDir\boot.wim" -Index 2 -Path "$RootDir\extractBootImage"
        }
        catch {
            Write-Host $_
            Write-Host "Dismount-WindowsImage"
            Dismount-WindowsImage -Path "$RootDir\extractBootImage" -Discard -ErrorAction Stop
            pause
            Exit
        }
    })) -ForegroundColor Yellow
}

Export-ModuleMember -Function '*'
