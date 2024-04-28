# RunOrInst

Here's a little bash app to launch or install an app via apt or snap.

This app checks whether the requested program is present on the machine, displays the PATH if it is, and proposes to launch it.

If it's not present, it searches for it on apt, and installs it if it's referenced. Otherwise, it suggests searching and installing on snap.

Finally, if the app is neither on apt nor on snap, a google search is proposed. 

You can modify the code to change the colors in the prompt. Your default browser is automatically detected for search purposes

## Installation:

- 1 Make the file executable: `sudo chmod 777 runOrInst.sh`
- 2 Move the made executable file to the PATH: `sudo mv runOrInst.sh /usr/local/bin/`
- 3 You can create an alias (easier to type) in your bash.rc
    (sudo nano .bashrc), at the end of the file, edit :
    alias "yourAliasName"="runOrInst.sh"
- 4 Relaunch bashrc `source ~/.bashrc`.
