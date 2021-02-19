#User Profile Transfer

$FoldersToCopy = @(
    'Desktop'
    'Videos'
    # Microsoft Edge Favorites
    'AppData\Local\Packages\Microsoft.MicrosoftEdge_8wekyb3d8bbwe\AC\MicrosoftEdge\User\Default\Favorites'
    # Outlook Signatures
    'AppData\Roaming\Microsoft\Signatures'
    # Google Chrome Favorites
    'AppData\Local\Google\Chrome\User Data\Default'


    )

$ConfirmComp1 = $null
$ConfirmComp2 = $null
$ConfirmUser = $null

while( $ConfirmComp1 -ne 'y' ){
    $FromComputer = Read-Host -Prompt 'Enter the computer to copy from'

    if( -not ( Test-Connection -ComputerName $FromComputer -Count 2 -Quiet ) ){
        Write-Warning "$FromComputer is not online. Please enter another computer name."
        continue
        }

    $ConfirmComp1 = Read-Host -Prompt "The entered computer name was:`t$FromComputer`r`nIs this correct? (y/n)"
    }

    while( $ConfirmComp2 -ne 'y' ){
    $ToComputer = Read-Host -Prompt 'Enter the computer to copy to'

    if( -not ( Test-Connection -ComputerName $ToComputer -Count 2 -Quiet ) ){
        Write-Warning "$ToComputer is not online. Please enter another computer name."
        continue
        }

    $ConfirmComp2 = Read-Host -Prompt "The entered computer name was:`t$ToComputer`r`nIs this correct? (y/n)"
    }

while( $ConfirmUser -ne 'y' ){
    $User = Read-Host -Prompt 'Enter the user profile to copy from'

    if( (-not ( Test-Path -Path "\\$FromComputer\c$\Users\$User" -PathType Container)) -and (-not (Test-Path -Path "\\$ToComputer\c$\Users\$User" -PathType Container))){
        Write-Warning "$User could not be found on $FromComputer. Please enter another user profile."
        continue
        }

    $ConfirmUser = Read-Host -Prompt "The entered user profile was:`t$User`r`nIs this correct? (y/n)"
    }

$SourceRoot      = "\\$FromComputer\c$\Users\$User"
#$DestinationRoot = "C:\Users\$User"
$DestinationRoot = "\\$ToComputer\c$\Users\$User"

foreach( $Folder in $FoldersToCopy ){
    $Source      = Join-Path -Path $SourceRoot -ChildPath $Folder
    $Destination = Join-Path -Path $DestinationRoot -ChildPath $Folder

    if( -not ( Test-Path -Path $Source -PathType Container ) ){
        Write-Warning "Could not find path`t$Source"
        continue
        }

    Robocopy.exe $Source $Destination /E /IS /NP /NFL /MT 
    }
