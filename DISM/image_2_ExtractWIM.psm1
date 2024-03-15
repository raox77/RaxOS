function image_2_ExtractWIM {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

    if (-Not(Test-Path "$RootDir\install.wim" -PathType Leaf) -And -Not(Test-Path "$RootDir\install.esd" -PathType Leaf)) {
        Write-Host "'$RootDir\install.wim/esd' Not available"
        Exit
    }

    Write-Host "copy Data in 'extractWIMImage' Folder..."
    Write-Host ("copy Data in 'extractWIMImage' Folder: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        try {
            New-Item -Path "$RootDir\extractWIMImage" -ItemType Directory
            Mount-WindowsImage -ImagePath "$RootDir\install.wim" -Index 1 -Path "$RootDir\extractWIMImage"
        }
        catch {
            Write-Host $_
            Dismount-WindowsImage -Path "$RootDir\extractWIMImage" -Discard
            throw $_
        }
    })) -ForegroundColor Yellow
}

Export-ModuleMember -Function '*'