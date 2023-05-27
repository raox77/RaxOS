@echo off
sc config vmickvpexchange start=demand
sc config vmicguestinterface start=demand
sc config vmicshutdown start=demand
sc config vmicheartbeat start=demand
sc config vmicvmsession start=demand
sc config vmicrdv start=demand
sc config vmictimesync start=demand
sc config vmicvss start=demand
sc config RasMan start=demand
sc config SessionEnv start=demand
sc config TermService start=demand
sc config hyperkbd start=demand
sc config hypervideo start=demand
sc config gencounter start=demand
sc config vmgid start=demand
sc config storflt start=boot
sc config bttflt start=boot
sc config vpci start=boot
sc config hvservice start=demand
sc config hvcrash start=disabled
sc config HvHost start=demand
sc config rdbss start=system
DISM /Online /Enable-Feature /FeatureName:"Microsoft-Hyper-V-All" /NoRestart
devmanview /enable "Remote Desktop Device Redirector Bus"
devmanview /enable "Microsoft Hyper-V Virtualization Infrastructure Driver"
cls
echo HyperV enabled. Please reboot.
pause