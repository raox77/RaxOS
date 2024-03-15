$ErrorActionPreference = 'SilentlyContinue'
Start-Transcript -Path "C:\ProgramData\chocolatey\installChoco.log" -Append | Out-Null

& ping community.chocolatey.org -n 1 | Out-Null
if ($LASTEXITCODE -eq 0) {
    # internet available
    if (!(Test-Path -Path "$Env:ProgramData\chocolatey")) {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
        Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
        Start-Process -FilePath $Env:ProgramData\chocolatey\choco.exe -ArgumentList 'feature', 'enable', '-n=useRememberedArgumentsForUpgrades' -NoNewWindow -Wait
        Start-Process -FilePath $Env:ProgramData\chocolatey\choco.exe -ArgumentList 'install', 'directx', '-y', '--ignore-checksums' -NoNewWindow -Wait
    }
} else {
    # No internet available
    Stop-Transcript
    [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
    [System.Windows.Forms.MessageBox]::Show('First establish an internet connection to download programs from the internet.', 'Installer', [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Error)
    Exit
}

[int] $global:column = 0
[int] $maxColumn = 1
[int] $separate = 30
[int] $global:lastPos = 50
[bool]$global:install = $false
[bool]$global:update = $false
[bool]$global:task = $false

[bool]$global:CPU_Intel = $true
[bool]$global:CPU_AMD = $true
[bool]$global:GPU_AMD = $true
[bool]$global:GPU_Nvidia = $true

if ((Get-Service -Name winmgmt).Status -eq 'Running') {
    $Manufacturer = (Get-WmiObject -Query 'select Manufacturer from win32_processor').Manufacturer
    if ($Manufacturer -eq 'AuthenticAMD') {
        $global:CPU_Intel = $false
    } elseif ($Manufacturer -eq 'GenuineIntel') {
        $global:CPU_AMD = $false
    }

    $PNPDeviceID = (Get-WmiObject -Query 'select PNPDeviceID from win32_videocontroller').PNPDeviceID
    if ($PNPDeviceID -like '*VEN_10DE&*') {
        # Nvidia
        $global:GPU_AMD = $false
    }
}

function generate_checkbox {
    param(
        [string]$checkboxText,
        [string]$package,
        [bool]$enabled = $true
    )
    $checkbox = New-Object System.Windows.Forms.checkbox
    if ($global:column -ge $maxColumn) {
        $checkbox.Location = New-Object System.Drawing.Size(($global:column * 300), $global:lastPos)
        $global:column = 0
        $global:lastPos += $separate
    } else {
        $checkbox.Location = New-Object System.Drawing.Size(30, $global:lastPos)
        $global:column = $column + 1
    }
    $checkbox.Size = New-Object System.Drawing.Size(250, 18)
    $checkbox.Text = $checkboxText
    $checkbox.Name = $package
    $checkbox.Enabled = $enabled

    $checkbox
}

if (!(Test-Path -Path 'C:\ProgramData\chocolatey')) {
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}

[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')
[void] [System.Reflection.Assembly]::LoadWithPartialName('System.Drawing')

# Set the size of your form
$Form = New-Object System.Windows.Forms.Form
[System.Windows.Forms.Application]::EnableVisualStyles()
$Form.Text = 'Install Software' # Titlebar
$Form.ShowIcon = $false
$Form.MaximizeBox = $false
$Form.MinimizeBox = $false
$Form.Size = New-Object System.Drawing.Size(600, 210)
$Form.AutoSizeMode = 0
$Form.KeyPreview = $True
$Form.SizeGripStyle = 2

# label
$Label = New-Object System.Windows.Forms.label
$Label.Location = New-Object System.Drawing.Size(11, 15)
$Label.Size = New-Object System.Drawing.Size(255, 15)
$Label.Text = 'download and install software from chocolatey:'
$Form.Controls.Add($Label)

# https://community.chocolatey.org/packages/amd-ryzen-chipset
$Form.Controls.Add((generate_checkbox 'AMD Ryzen Chipset Drivers' 'amd-ryzen-chipset' $global:CPU_AMD))

# https://community.chocolatey.org/packages/zentimings
$Form.Controls.Add((generate_checkbox 'ZenTimings' 'zentimings' $global:CPU_AMD))

# https://community.chocolatey.org/packages/Firefox
$Form.Controls.Add((generate_checkbox 'Firefox' 'firefox'))

# https://community.chocolatey.org/packages/waterfox
$Form.Controls.Add((generate_checkbox 'Waterfox' 'waterfox'))

# https://community.chocolatey.org/packages/librewolf
$Form.Controls.Add((generate_checkbox 'LibreWolf' 'librewolf'))

# https://community.chocolatey.org/packages/chromium
$Form.Controls.Add((generate_checkbox 'Chromium' 'chromium'))

# https://community.chocolatey.org/packages/GoogleChrome
$Form.Controls.Add((generate_checkbox 'Google Chrome' 'googlechrome'))

# https://community.chocolatey.org/packages/brave
$Form.Controls.Add((generate_checkbox 'Brave' 'brave'))

# https://community.chocolatey.org/packages/Vivaldi
$Form.Controls.Add((generate_checkbox 'Vivaldi' 'vivaldi'))

# https://community.chocolatey.org/packages/steam-client
$Form.Controls.Add((generate_checkbox 'Steam' 'steam-client'))

# https://community.chocolatey.org/packages/teamspeak
$Form.Controls.Add((generate_checkbox 'Teamspeak' 'teamspeak'))

# https://community.chocolatey.org/packages?q=discord
$Form.Controls.Add((generate_checkbox 'Discord' 'discord'))

# https://community.chocolatey.org/packages/spotify
$Form.Controls.Add((generate_checkbox 'Spotify' 'spotify'))

# https://community.chocolatey.org/packages/foobar2000
$Form.Controls.Add((generate_checkbox 'foobar2000' 'foobar2000'))

# https://community.chocolatey.org/packages/obs-studio
$Form.Controls.Add((generate_checkbox 'OBS Studio' 'obs-studio'))

# https://community.chocolatey.org/packages/msiafterburner
$Form.Controls.Add((generate_checkbox 'MSI Afterburner' 'msiafterburner'))

# https://community.chocolatey.org/packages/notepadplusplus
$Form.Controls.Add((generate_checkbox 'Notepad++' 'notepadplusplus.install'))

# https://community.chocolatey.org/packages/hwinfo
$Form.Controls.Add((generate_checkbox 'HWiNFO' 'hwinfo'))

# https://community.chocolatey.org/packages/sdio
$Form.Controls.Add((generate_checkbox 'SDIO' 'sdio'))

# https://community.chocolatey.org/packages/mpc-hc
$Form.Controls.Add((generate_checkbox 'MPC-HC' 'mpc-hc'))

# https://community.chocolatey.org/packages/gpu-z
$Form.Controls.Add((generate_checkbox 'GPU-Z' 'gpu-z'))

# https://community.chocolatey.org/packages/rare
$Form.Controls.Add((generate_checkbox 'Rare' 'rare'))

# https://community.chocolatey.org/packages/lightshot.install
$Form.Controls.Add((generate_checkbox 'Lightshot' 'lightshot.install'))

# https://community.chocolatey.org/packages/anydesk
$Form.Controls.Add((generate_checkbox 'Anydesk' 'anydesk'))

# https://community.chocolatey.org/packages/nanazip
$Form.Controls.Add((generate_checkbox 'NanaZip' 'nanazip'))

# https://community.chocolatey.org/packages/7zip/23.1.0
$Form.Controls.Add((generate_checkbox '7zip' '7zip'))

if ($global:column -ne 0) {
    $global:lastPos += $separate
}

$Form.height = $global:lastPos + 80

$lastPosWidth = $form.Width - 80 - 31
$TaskButton = New-Object System.Windows.Forms.Button
$TaskButton.Location = New-Object System.Drawing.Size($lastPosWidth, $global:lastPos)
$TaskButton.Size = New-Object System.Drawing.Size(80, 23)
$TaskButton.Text = 'Create Task'
$TaskButton.Add_Click({
        $global:task = $true
        $Form.Close()
    })
$Form.Controls.Add($TaskButton)

$lastPosWidth = $lastPosWidth - 80 - 7
$UpdateButton = New-Object System.Windows.Forms.Button
$UpdateButton.Location = New-Object System.Drawing.Size($lastPosWidth, $global:lastPos)
$UpdateButton.Size = New-Object System.Drawing.Size(80, 23)
$UpdateButton.Text = 'Update'
$UpdateButton.Add_Click({
        $global:update = $true
        $Form.Close()
    })
$Form.Controls.Add($UpdateButton)

$lastPosWidth = $lastPosWidth - 80 - 7
$InstallButton = New-Object System.Windows.Forms.Button
$InstallButton.Location = New-Object System.Drawing.Size($lastPosWidth, $global:lastPos)
$InstallButton.Size = New-Object System.Drawing.Size(80, 23)
$InstallButton.Text = 'Install'
$InstallButton.Add_Click({
        $global:install = $true
        $Form.Close()
    })
$Form.Controls.Add($InstallButton)

# Activate the form
$Form.Add_Shown({ $Form.Activate() })
[void] $Form.ShowDialog()

if ($global:install) {
    $installPackages = [System.Collections.ArrayList]::new()
    $installSeparatedPackages = [System.Collections.ArrayList]::new()
    $Form.Controls | Where-Object { $_ -is [System.Windows.Forms.Checkbox] } | ForEach-Object {
        if ($_.Checked) {
            if ($_.Name.contains('--')) {
                # Packages with parameters are installed separately from the others
                [void]$installSeparatedPackages.Add($_.Name)
            } else {
                # are all installed in series
                [void]$installPackages.Add($_.Name)
            }
        }
    }

    if ($installPackages.count -ne 0) {
        Write-Host "$Env:ProgramData\chocolatey\choco.exe install $($installPackages -join ' ') -y"
        Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "install $($installPackages -join ' ') -y --ignore-checksums" -Wait
    }
    if ($installSeparatedPackages.count -ne 0) {
        foreach ($paket in $installSeparatedPackages) {
            Write-Host "$Env:ProgramData\chocolatey\choco.exe install $paket -y"
            Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "install $paket -y --ignore-checksums" -Wait
            if ($paket.contains('--version')) {
                # Packages with version parameters should not be updated
                Write-Host "$Env:ProgramData\chocolatey\choco.exe pin add -n $($paket.split(' ')[0])"
                Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -ArgumentList "pin add -n $($paket.split(' ')[0])" -Wait
            }
        }
    }
} elseif ($global:update) {
    Write-Host "$Env:ProgramData\chocolatey\choco.exe upgrade all"
    Start-Process -FilePath "$Env:ProgramData\chocolatey\choco.exe" -Verb RunAs -ArgumentList 'upgrade all' -Wait
} elseif ($global:task) {
    $action = New-ScheduledTaskAction -Execute "$Env:ProgramData\chocolatey\choco.exe" -Argument 'upgrade all'
    $trigger = New-ScheduledTaskTrigger -AtLogOn
    $principal = New-ScheduledTaskPrincipal -UserId (Get-CimInstance -ClassName Win32_ComputerSystem | Select-Object -expand UserName) -RunLevel Highest

    Register-ScheduledTask -Action $action -Trigger $trigger -Principal $principal -TaskName 'Update chocolatey packages' -TaskPath '\Choco\' -Description 'Update chocolatey packages - Choco'
    [System.Windows.Forms.MessageBox]::Show('Done', 'Task created', 0)
}
Stop-Transcript