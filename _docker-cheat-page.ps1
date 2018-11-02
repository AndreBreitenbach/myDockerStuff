# NAV Version holen oder aktualisieren
docker pull microsoft/dynamics-nav:2018-cu10-de
docker pull microsoft/bcsandbox:de
docker pull mcr.microsoft.com/businesscentral/onprem:de
docker pull breitenbachandre/bcsmartscan:latest

# NAV BC Sandbox holen und Container erstellen
New-NavContainer        -accept_eula `
                        -ACCEPT_OUTDATED `
                        -includeCSide `
                        -enableSymbolLoading `
                        -assignPremiumPlan `
                        -containerName BCOnPrem-DE `
                        -licenseFile 'C:\Users\abreitenbach\OneDrive - MODUS Consult AG\20181015 modus_DemoDev BC.flf' `
                        -memoryLimit 3G `
                        -doNotExportObjectsToText `
                        -auth 'NavUserPassword' `
                        -useBestContainerOS `
                        -updatehosts `
                        mcr.microsoft.com/businesscentral/onprem:de

                        
                        
# Container in neues Image sichern
docker commit -p NAVBC-SmartScan breitenbachandre/bcsmartscan
                     
# NAV User in Umgebung hinzufügen
New-NavContainerNavUser -containerName NAVBC-SmartScan -Credential smartscan

# Open a new PowerShell session for a Nav Container
Open-NavContainer -containerName NAV11CU8DE-DEV 

# Image in DockerHub hochladen
docker push breitenbachandre/bcsmartscan
docker save breitenbachandre/bcsmartscan -o c:\temp\bcsmartscan.zip

Get-NavContainerSharedFolders BCOnPrem

# BC Version aktualisieren
docker pull microsoft/bcsandbox:de
#docker pull microsoft/bcsandbox:12.3.23590.23730-de

# docker container starten
docker start BCOnPrem-DE
docker stop BCOnPrem-DE
docker start NAV11CU9DE-DEV
docker stop NAV11CU9DE-DEV

# show IP-Address of Container
Get-NavContainerIpAddress -containerName NAVBC-SmartScan

# get latest nav version
docker run -e accept_eula=Y -m 4G microsoft/dynamics-nav
docker run -e accept_eula=Y -m 4G microsoft/bcsandbox

# List Docker CLI commands
docker
docker container --help

## Display Docker version and info
docker --version
docker version
docker info

# List Docker images
docker image ls

# List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -aq

# alte Versionen
# spezielles NAV CU holen als Image und Container erstellen
New-CSideDevContainer -accept_eula `
                      -ACCEPT_OUTDATED `
                      -containerName NAV11CU9DE-DEV `
                      -licenseFile 'C:\Users\abreitenbach\OneDrive - MODUS Consult AG\modus_DemoDev.flf' `
                      -memoryLimit 4G `
                      -doNotExportObjectsToText `
                      -updatehosts `
                      -additionalParameters @("-v C:\_DockerShare:c:\navdbfiles") `
                      microsoft/dynamics-nav:2018-de
                      #microsoft/dynamics-nav:2018-cu9-de
                      
                      #-myScripts @('C:\NavOnDocker\DockerSharedFolder\My') `
