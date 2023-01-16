
# unlocks files
attrib -h -s -r FILE

# locks key file
attrib +h +s +r FILE


# disable UAC
 
 Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0


 #ssh 

 Add-WindowsCapability -Online -Name OpenSSH.Server~~~~.0.1.0 Start-Service sshd Set-Service -Name sshd -StartupType 'Automatic' Get-NetFirewallRule -Name *ssh*



 ##
function create_account {
    [CmdletBinding()]
    param (
        [string] $NewLocalAdmin, 
        [securestring] $Password
)
begin {
}
process {
    New-LocalUser 
    "$NewLocalAdmin" 
    -Password $Password 
    -FullName "$NewLocalAdmin"
    -Description "Temporary local admin"
    Write-Verbose 
    "$NewLocalAdmin local user crated"
    Add-LocalGroupMember 
    -Group "Administrators" 
    -Member "$NewLocalAdmin"
    Write-Verbose 
    "$NewLocalAdmin added to
    the local administrator group"
}