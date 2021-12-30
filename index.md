## Windows Profile Transfer

Hay, you, do you need to build a new computer for a user but they want all of there desktop files, and favorites, and email signatures and pictures and downloads and literally everything else on their computer where they saved something where they were not suppose to? Well, do I have a tool for you.

This PowerShell script works by copying most of that stuff from one computer to another. To make it work you must first have them log into the new PC. Then with both computers powered on and connected to the same network, open an admin PowerShell prompt. Run the script, enter the hostname of the first computer. Then enter the hostname of the second computer, then enter the username of the profile. This script will copy all items on the desktop, videos, outlook signatures, their MS Edge Favorites, and their chrome favorites. 

I would love some comments on how to improve it. 

And really quick, Yes, there is a better way to do this from an infrastructure point of view. With that said, I do not have control over the infrastructure. I use this script to make my life easier. I hope it makes your life easier too. 
