
# unlocks files
attrib -h -s -r FILE

# locks key file
attrib +h +s +r FILE


# disable UAC
 
 Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -Value 0