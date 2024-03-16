Set-StrictMode -Version 3.0

If (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]'Administrator')) {
    # Is not an admin, will restart as admin
    $filename = (Get-ChildItem $PSCommandPath).Name
    $CWD = [Environment]::CurrentDirectory
    Start-Process powershell.exe -ArgumentList ("-NoProfile -NoExit -Command &{cd '$CWD';.\\$filename}") -Verb RunAs
    Exit
}

Get-ChildItem $PSScriptRoot\DISM -Filter *.psm1 -Name | ForEach-Object {
    Import-Module $PSScriptRoot\DISM\$_ -Force
}

$Global:ErrorActionPreference = 'Stop'
$Global:VerbosePreference = 'Continue'
$Global:DebugPreference = 'Continue'

$Global:Debug = $false
$Global:OSName = 'WinISO_Wizard'

$data = @(
    # [pscustomobject]@{ ProjectName = 'RaxOS'; ISO_Image = '22631.3235.240225-1138.23H2_NI_RELEASE_SVC_PROD3_CLIENTPRO_OEMRET_X64FRE_EN-US.ISO' }
)

If ($data.Count -eq 0) {
    [System.Reflection.Assembly]::LoadWithPartialName('System.windows.forms') | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.Multiselect = $true
    if (Test-Path $PSScriptRoot\_UUPdump_ISO -PathType Container) {
        $OpenFileDialog.initialDirectory = "$PSScriptRoot\_UUPdump_ISO"
    } else {
        $OpenFileDialog.initialDirectory = $PSScriptRoot
    }
    $OpenFileDialog.filter = 'Windows UUP Dump Image (*.iso)|*iso'
    $OpenFileDialog.ShowDialog() | Out-Null

    foreach ($FileName in $OpenFileDialog.SafeFileNames) {
        $data += [pscustomobject]@{ ISO_Image = $FileName }
    }
} 

foreach ($item in $data) {
    Clear-Variable settings -Scope Global -ErrorAction SilentlyContinue

    $item | Add-Member -MemberType NoteProperty -Name 'ISO_Root' -Value ''
    $item | Add-Member -MemberType NoteProperty -Name Version -Value {}
    $Global:settings = [pscustomobject]$item

    try {
        Write-Host ((Get-Date).ToString('HH:mm:ss'), "ISO: $($item.ProjectName) {0:hh}h:{0:mm}m:{0:ss}s" -f (Measure-Command {
                    #
                    0_Preparation
                    1_ISO_unpack

                    boot_1_Backup
                    boot_2_TPM_ByPass
                    boot_3_Dismount_Image

                    image_1_Backup
                    image_2_extractWIM
                    image_3_AppxProvisionedPackage
                    image_4_CleanUp
                    image_5_AddDotNet
                    image_6_CopyFileSystem
                    image_7_Registry
                    image_8_Dismount_Image

                    2_CopyData
                    3_ISO_create
                    #
                })) -ForegroundColor Yellow
        [gc]::collect()
        [gc]::WaitForPendingFinalizers()
    } Catch {
        $item | Format-Table | Out-String | Write-Host
        Write-Host $_.Exception.Message -Foreground Red
        Write-Host $_.ScriptStackTrace -Foreground DarkGray
        [console]::beep(800, 200)
        Pause
        exit 1
    }
}
