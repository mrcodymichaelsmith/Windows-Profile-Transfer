# User Profile Transfer

$FoldersToCopy = @(
    'Desktop'
    'Videos'
    'Favorites'
    # Microsoft Edge Favorites
    'AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Favorites'
    # Outlook Signatures
    'AppData\Roaming\Microsoft\Signatures'
    # Adding Taskbar Icons
    'AppData\Roaming\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar'
    # Google Chrome Favorites
    'AppData\Local\Google\Chrome\User Data\Default'
)

# Source Computer 
$ConfirmComp1 = $null
# Destination Computer
$ConfirmComp2 = $null
# Username
$ConfirmUser = $null

# Checks to see if the source computer is online.
while( $ConfirmComp1 -ne 'y' ){
    $FromComputer = Read-Host -Prompt 'Enter the computer to copy from'

    if( -not ( Test-Connection -ComputerName $FromComputer -Count 2 -Quiet ) ){
        Write-Warning "$FromComputer is not online. Please enter another computer name."
        continue
    }

    $ConfirmComp1 = Read-Host -Prompt "The entered computer name was:`t$FromComputer`r`nIs this correct? (y/n)"
}

# Checks to see if the destination computer is online
while( $ConfirmComp2 -ne 'y' ){
    $ToComputer = Read-Host -Prompt 'Enter the computer to copy to'

    if( -not ( Test-Connection -ComputerName $ToComputer -Count 2 -Quiet ) ){
        Write-Warning "$ToComputer is not online. Please enter another computer name."
        continue
    }

    $ConfirmComp2 = Read-Host -Prompt "The entered computer name was:`t$ToComputer`r`nIs this correct? (y/n)"
}

# Checks to make sure the users profile already exist on both computers.
# You can run this without this check but it causes strange errors. 
# It is better to make sure each computer already have a copy of the users profile on it
while( $ConfirmUser -ne 'y' ){
    $User = Read-Host -Prompt 'Enter the user profile to copy from'

    if( (-not ( Test-Path -Path "\\$FromComputer\c$\Users\$User" -PathType Container)) -and (-not (Test-Path -Path "\\$ToComputer\c$\Users\$User" -PathType Container))){
        Write-Warning "$User could not be found on $FromComputer. Please enter another user profile."
        continue
    }

    $ConfirmUser = Read-Host -Prompt "The entered user profile was:`t$User`r`nIs this correct? (y/n)"
}

# Setting the file Path variables. 
$SourceRoot      = "\\$FromComputer\c$\Users\$User"
$DestinationRoot = "\\$ToComputer\c$\Users\$User"

# This piece of code actually transfers the profile. 
foreach( $Folder in $FoldersToCopy ){
    $Source      = Join-Path -Path $SourceRoot -ChildPath $Folder
    $Destination = Join-Path -Path $DestinationRoot -ChildPath $Folder

    if( -not ( Test-Path -Path $Source -PathType Container ) ){
        Write-Warning "Could not find path`t$Source"
        continue
    }

    robocopy.exe $Source $Destination /E /IS /NP /NFL
