function image_6_CopyFileSystem {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

    Write-Host "takeown Web Folder..."
    Write-Host ("takeown Web Folder: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        Get-ChildItem -Path "$RootDir\FileSystem\Windows\Web\*.*" -Recurse -Force | ForEach-Object -Process {
            $newFile = $_.FullName.replace("$RootDir\FileSystem\", "$RootDir\extractWIMImage\")
            if (Test-Path -Path $newFile -PathType Leaf) {
                Start-Process takeown -ArgumentList "/f `"$newFile`"" -Wait -NoNewWindow
                Start-Process icacls -ArgumentList "`"$newFile`" /grant *S-1-3-4:F /t /c /l" -Wait -NoNewWindow
            }
        }
    })) -ForegroundColor Yellow

    Write-Host "Copy 'FileSystem' Folder..."
    Write-Host ("Copy 'FileSystem' Folder: {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
        Copy-Item "$RootDir\FileSystem\*" -Destination "$RootDir\extractWIMImage" -Recurse -Force
    })) -ForegroundColor Yellow
}

Export-ModuleMember -Function '*'