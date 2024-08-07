@echo off
powercfg /setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 0
powercfg /setacvalueindex scheme_current 2a737441-1930-4402-8d77-b2bebba308a3 48e6b7a6-50f5-4782-a5d4-53bb8f07e226 0
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318583 100
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 0cc5b647-c1df-4637-891a-dec35c318584 100
powercfg /setacvalueindex scheme_current 54533251-82be-4824-96c1-47b60b740d00 4d2b0152-7d5c-498b-88e2-34345392a2c5 5000
powercfg /setacvalueindex 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c SUB_VIDEO VIDEOIDLE 0
powercfg -changename 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c "RaxOS PowerPlan" "Made for RaxOS, Credits to AMITXV."
powercfg /setactive scheme_current
powercfg -h off
for %a in ("SleepStudy" "Kernel-Processor-Power" "UserModePowerService") do (wevtutil sl Microsoft-Windows-%~a/Diagnostic /e:false)