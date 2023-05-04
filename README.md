<!DOCTYPE html>
<html lang="en">
  <body>
    <h1>User Profile Transfer Tool</h1>
    <p>This tool is a PowerShell script that can be used to transfer a user profiles from one computer to another. It is designed to help IT professionals to quickly and easily move user data from an old computer to a new one, or to transfer user data between two computers. NOTE: the user must have logged into the new computer BEFORE running this. </p>
    <h2>Getting Started</h2>
    <ol>
      <li>Clone or download the User_Profile_Transfer.ps1 file to your local computer.</li>
      <li>Open PowerShell ISE or PowerShell console with administrative privileges.</li>
      <li>Run the script by typing the file path or using the "Run Script" button.</li>
    </ol>
    <h2>How to Use</h2>
    <ol>
      <li>Enter the name of the computer you want to copy from.</li>
      <li>Enter the name of the computer you want to copy to.</li>
      <li>Enter the name of the user profile you want to copy.</li>
      <li>Wait for the script to finish running.</li>
    </ol>
    <h2>Features</h2>
    <ul>
      <li>Ability to copy multiple folders and files from the source computer to the destination computer.</li>
      <li>Error checking to ensure that the specified computers and user profile exist.</li>
      <li>Uses Robocopy.exe to transfer files, which is faster and more reliable than other file transfer methods.</li>
    </ul>
    <h2>Known Issues</h2>
    <ul>
      <li>Taskbar Icons do not transfer onto the taskbar. The icons transfer to that folder but they are not automapped to the taskbar. I am still looking for that setting </li>
      <li>The program throws a lot of errors once it starts transferring Google Chrome data. This happens because the user has google Chrome open. If you get to this point, you can cancle and everything should have transferred. I am looking for a solution. </li>
    <h2>What I would like to do Next</h2>
    <ul>
      <li>Automatically Set Outlook Settings</li>
      <li>Automatically Set Default Apps</li>
      <li>Automatically rerun Failed programs in Software Center/li>
      <li>Automatically Find the exact directory bookmarks are saved in. </li>
    </ul>
    </body>
</html>
