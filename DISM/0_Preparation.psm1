function 0_Preparation {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"

    $path = $PSScriptRoot
    if ($path -eq "") {
        $path = Get-Location
    }

    [string]$path = $(Split-Path $path -Parent)

    $Global:settings.ISO_Root = $path

    if ($Global:settings.ISO_Image -eq "") {
        Write-Host "no ISO_Image specified"
        Exit
    }
    elseif (-not (Test-Path $(@($Global:settings.ISO_Root, "_UUPdump_ISO", $Global:settings.ISO_Image) -join "\"))) {
        Write-Host "no ISO_Image not found"
        Exit
    }

    $ISO_Image = $Global:settings.ISO_Image
    $RootDir = $Global:settings.ISO_Root

    if ((get-command dism.exe).Path -eq "") {
        Throw "dism.exe was not found"
    }

    if (-Not (Test-Path -Path "$RootDir\Tools\7z.exe" -PathType Leaf)) {
        Throw "$RootDir\Tools\7z.exe was not found"
    }

    if (-Not (Test-Path -Path "$RootDir\Tools\oscdimg.exe" -PathType Leaf)) {
        Throw "$RootDir\Tools\oscdimg.exe was not found"
    }

    try {
        Get-WindowsImage -Mounted -ErrorAction Stop | ForEach-Object {
            Write-Host "Dismount-WindowsImage: $($_.Path)"
            Dismount-WindowsImage -Path $_.Path -Discard -ErrorAction Stop
        }
    } catch {
        Write-Host $_
        Get-Content -Path "C:\Windows\Logs\DISM\dism.log" -tail 20
        pause
    }

    Start-Process dism -ArgumentList "/Cleanup-Wim" -Wait -NoNewWindow

    if (Test-Path -Path "$RootDir\extractImage") {
        Write-Host "delete: $RootDir\extractImage"
        Remove-Item "$RootDir\extractImage" -Recurse -Force
    }

    if (Test-Path -Path "$RootDir\extractBootImage") {
        Write-Host "delete: $RootDir\extractBootImage"
        Remove-Item "$RootDir\extractBootImage" -Recurse -Force
    }

    if (Test-Path -Path "$RootDir\extractWIMImage") {
        Write-Host "delete: $RootDir\extractWIMImage"
        Start-Process "$RootDir\Tools\PowerRun.exe" -ArgumentList "/SW:0 cmd.exe /c rd /S /Q `"$RootDir\extractWIMImage`"" -Wait -NoNewWindow
    }

    Write-Debug "ISO_Image: $ISO_Image"
    Write-Debug "RootDir: $RootDir"
}

Export-ModuleMember -Function '*'