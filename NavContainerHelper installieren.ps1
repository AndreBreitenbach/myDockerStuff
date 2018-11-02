# NAV Container Helper installieren
Save-Module -Name navcontainerhelper -Path 'C:\Users\abreitenbach\OneDrive - MODUS Consult AG\Dokumente\NAVDocker'
Install-Module -Name navcontainerhelper -force
Update-Module -Name navcontainerhelper -force
UnInstall-Module -Name navcontainerhelper -force

# Test
Write-NavContainerHelperWelcomeText
