function boot_2_TPM_ByPass {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

    # TODO: TPM Bypass is only necessary/possible in Windows 11
    Write-Host "write BypassTPMCheck..."
    Write-Host ("write BypassTPMCheck: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        Start-Process $RootDir\Tools\GoOfflineReg.exe -ArgumentList "-path `"$RootDir\extractBootImage\Windows\System32\config\SYSTEM`" -import `"$RootDir\Registry\Boot_TPM_ByPass.reg`" -commit" -NoNewWindow -Wait
    })) -ForegroundColor Yellow
    [gc]::collect()

     if (Test-Path -Path "$RootDir\winpe.jpg" -PathType Leaf) {
        # Replace the background image
        # https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-mount-and-customize?view=windows-11#replace-the-background-image
        # Copy-Item -Path "$RootDir\winpe.jpg" -Destination "$RootDir\extractBootImage\Windows\System32\winpe.jpg"
        # Copy-Item -Path "$RootDir\winpe.jpg" -Destination "$RootDir\extractBootImage\Windows\System32\winre.jpg"
    }

    # Set the power scheme to high performance https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/winpe-mount-and-customize?view=windows-11#set-the-power-scheme-to-high-performance
    # Add-Content -Path "$RootDir\extractBootImage\Windows\System32\startnet.cmd" -Value "powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
}

Export-ModuleMember -Function '*'