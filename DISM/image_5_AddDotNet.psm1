function image_5_AddDotNet {
    Write-Verbose "Start: $($MyInvocation.MyCommand)"
    $RootDir = $Global:settings.ISO_Root

	try {
		Repair-WindowsImage -Path "$RootDir\extractWIMImage" -StartComponentCleanup -ResetBase -LimitAccess
	} catch {
		Write-Warning $_.Exception.Message
	}

    # https://learn.microsoft.com/en-us/windows-hardware/manufacture/desktop/deploy-net-framework-35-by-using-deployment-image-servicing-and-management--dism?view=windows-11
    if ((Get-ChildItem -Path "$RootDir\extractImage\sources\sxs\*netfx3*.cab" -ErrorAction SilentlyContinue).Count -ne 0) {
        Write-Verbose "NetFx3 will be installed (Enable-WindowsOptionalFeature)"
        Enable-WindowsOptionalFeature -Path "$RootDir\extractWIMImage" -FeatureName NetFx3 -All -LimitAccess -Source "$RootDir\extractImage\sources\sxs"
    }
}

Export-ModuleMember -Function '*'
