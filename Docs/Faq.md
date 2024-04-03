- Why am not using NTLite license

I can`t afford to renew license, even if i could am not gonna pay.

Why? Using Spddl Winiso-Wizard is much eaiser to use because i know what i removed unlike NTLite which is not open-source.

----

|  How does it work  :question:|
|----------------------------------------------|


0. First we need a Windows ISO, if it is not clear which build number from which channel is the latest recommend using the overview [changewindows.org](https://changewindows.org/timeline/pc).
The build number we can search and configure on [UUP dump](https://uupdump.net/).
- Language: (personal preferences)
- Edition: I recommend to select only "Windows Pro"
- Download method: "Download and convert to ISO" with the checkbox "Include updates (Windows converter only) & "Run component cleanup (Windows converter only) & Integrate .NET Framework 3.5 (Windows converter only)"
- After Downloading the .Zip Extract it then Run uup_download_windows.cmd.
1. Download the github files [Here](https://github.com/raox77/RaxOS/archive/refs/heads/main.zip)
2. Place your .ISO file into _UUPdump_ISO
3. Open Powershell and cd to wherever HereWeGo.ps1 is located and then run it ***Do not run it by right clicking and Run with Powershell***
4. If you got any error "about_Execution_Policies" run this command in powershell 
```powershell
Set-ExecutionPolicy Unrestricted
```
5. Or open cmd cd to Root folder and run this command
```bat
PowerShell.exe -ExecutionPolicy Bypass -File _HereWeGo.ps1
```
https://github.com/raox77/RaxOS/assets/116083042/632644dd-51fb-4e26-950a-1da14d0be843

---

| *How to fix Valorant or Faceit doesnt work on windows 11* :question: |
|----------------------------------------------|

**You need to enable TPM & Secure boot**

**Enable Meltdown if you play Faceit 'https://www.grc.com/inspectre.htm'**

| *Why is my network speed slow*  :question: |
|----------------------------------------------|

**Update your drivers**

| *How to activate windows*  :question: |
|----------------------------------------------|

**Buy a licensed key from Microsoft**

| *How to fix "X" not working*  :question: |
|----------------------------------------------|

**Revert To Windows Deafult Services in 3-Services folder**

| *How to update windows*  :question: |
|----------------------------------------------|

**To update your windows the correct way you would need to apply windows default services then get download your update from [ Microsoft®Update Catalog](https://www.catalog.update.microsoft.com/Home.aspx) download and install latest **Security** update**