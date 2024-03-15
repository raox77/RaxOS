function image_7_Registry {
	Write-Verbose "Start: $($MyInvocation.MyCommand)"
	$RootDir = $Global:settings.ISO_Root
	$Version = $Global:settings.Version
	$OSName = $Global:OSName

	Write-Host 'Registry...'
	Write-Host ('Registry: {0:hh}h:{0:mm}m:{0:ss}s' -f (Measure-Command {
				$HKCU_RegFiles = "`"$RootDir\Registry\HKCU.reg`""
				$HKU_DEFAULT_RegFiles = "`"$RootDir\Registry\HKU_DEFAULT.reg`""
				$SYSTEM_RegFiles = "`"$RootDir\Registry\HKLM_SYSTEM.reg`""
				$SOFTWARE_RegFiles = "`"$RootDir\Registry\HKCR.reg`",`"$RootDir\Registry\HKLM_SOFTWARE.reg`""

				if (Test-Path -Path "$RootDir\Registry\HKLM_SOFTWARE_ProvisionedApps.reg" -PathType Leaf) {
					# Registry keys for provisioned apps https://docs.microsoft.com/en-us/windows/application-management/remove-provisioned-apps-during-update#registry-keys-for-provisioned-apps
					$SOFTWARE_RegFiles += ",`"$RootDir\Registry\HKLM_SOFTWARE_ProvisionedApps.reg`""
				}

				Start-Process $RootDir\Tools\GoOfflineReg.exe -ArgumentList "-path `"$RootDir\extractWIMImage\Users\Default\NTUSER.DAT`" -import $HKCU_RegFiles -commit" -NoNewWindow -Wait
				Start-Process $RootDir\Tools\GoOfflineReg.exe -ArgumentList "-path `"$RootDir\extractWIMImage\Windows\System32\config\DEFAULT`" -import $HKU_DEFAULT_RegFiles -commit" -NoNewWindow -Wait
				Start-Process $RootDir\Tools\GoOfflineReg.exe -ArgumentList "-path `"$RootDir\extractWIMImage\Windows\System32\config\SYSTEM`" -import $SYSTEM_RegFiles -commit" -NoNewWindow -Wait
				Start-Process $RootDir\Tools\GoOfflineReg.exe -ArgumentList "-path `"$RootDir\extractWIMImage\Windows\System32\config\SOFTWARE`" -import $SOFTWARE_RegFiles -commit" -NoNewWindow -Wait

				Write-Host "$RootDir\Tools\GoOfflineReg.exe -path `"$RootDir\extractWIMImage\Windows\System32\config\SOFTWARE`" -import $SOFTWARE_RegFiles -commit"
			})) -ForegroundColor Yellow

	[gc]::collect()
	[gc]::WaitForPendingFinalizers()
}

Export-ModuleMember -Function '*'