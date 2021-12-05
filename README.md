# FavTool
<br/>
<p align="justify">
Sometimes, the homescreen of Safari looks ugly because of the inconsistent design of the favourite icons. 
With Favtool you can easly costumize them by simply dropping your personal icons in your terminal.
In spite of being a command line tool, I tried to make the documentation clear and the experiece as user-friendly as possible.
</p>
<br/>

<img src="images/favtool%20-2.gif" width="1100">




 
# Getting Started 
<br/>

<img align="left" src="images/Screenshot%202021-12-04%20at%2015.25.44.png" width="480">
</p>

<p align="justify">
The first time you try to change an icon, an allert will be shown. Press "go to settings", and grant full disk acces to FavTool. This is mandatory for For FavTool to work.

### how to run

Get the source and double clik on the .dmg file. Here you will find the application itself. 

⚠️ Whenever FavTool is run for the first time, the message ***"Apple can’t check app for malicious software"*** might be shown. In order to run favtool crtl-click the app and select "open". 
  
<br/>
<br/>
 <br/>
 <br/>


# Features
<br/>

<img align="right" src="images/Screenshot%202021-12-05%20at%2000.12.15.png" width="480">


### Change an icon 
<p align="justify">
To change an icon drag and drop one of your favourite sites to which you want to replace the icon, from the home of Safari. 

Then, you can drop the icon you have chosen (please take a look at the "icon rules" section below). Now by pressing the orange "Customize" button, the icon will be cahged. If you want to manually close Safari later, press ctrl+c to stop FavTool. As soon as it will be reopened, the new icon will show up. Press any key to continue.![Schermata 2021-09-11 alle 09](/Users/nicoladigregorio/Desktop/Schermata 2021-09-11 alle 09.png)
</p>

### Unlock image folder 

<p align="justify">
Once FavTool is run, it locks the folder located in _ ~/Library/Safari/Touch\ Icons\ Cache/Images_. This prevents Safari from automatically restore the default icons. If you want to unlock this folder click on "Action" (situated in the menu bar) and then "Unlock Images Folder" or use the ⌥⌘U shortcut. However, make sure to keep Safari closed as long as the folder is unlock, otherwise this may lead to issues.
</p>

### Restore default icons 

<p align="justify">
This option allows you to delete any change you've done on icons. To do this, go to _Actions> Dismiss changes_ or use the ⌥⌘D . The whole Touch Icons Chache folder will be deleted, and recreated as soon as Safari is opened. Safary will reload all the icons from scratch. This option might fix missing icons
</p>


  

# Icon rules

You can download icons for free in many sites, these are the one I often use:

* https://icons8.com, here you can find a very big library with many styles;
* https://macosicons.com, here you can find many styles but more app/programm-oriented;
* https://www.macosicongallery.com, Here you can find original Mac icons.

Icons has to be .png files, about 144x144p (Safari seems to be quite flexible, however, make sure to not overshoot 256x256p) and most importantly the **ICONS NAME CANNOT CONTAIN SPACES OR ANY OTHER SPECIAL CHARACTER**, they can be transparent.

PS: you can even make them by yourself!
Take a look at the Apple User Interface Guidelines https://developer.apple.com/design/human-interface-guidelines/macos/icons-and-images/app-icon/ 


