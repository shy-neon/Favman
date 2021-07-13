# Favtool



<img width="1392" alt="Screenshot 2021-07-12 at 00 37 59" src="https://user-images.githubusercontent.com/87037145/125211840-a4f80480-e2a9-11eb-8d8e-b6413305ec38.png">


Sometimes the homescreen of Safari looks ugly because of the inconsistent design of the favorite icons.
With Favtool you can easly costumize them by simply dropping your personal icons in your terminal.

In spite of being a command line tool, I tried to make the documentation clear and the experiece as user-friendly as possible.

# Getting started
Befor running the script make sure your terminal have full access to the disk.
To do it, go to  *> System Preferences> Security and privacy> Privacy> Full disk access > check the terminal bar* \
⚠️ IMPORTANT: if "terminal" is not shown, momentarely skip this step, close System Preference, run the script at least once (it will fail) and check again for it

<img width="780" alt="Screenshot 2021-07-12 at 00 36 27" src="https://user-images.githubusercontent.com/87037145/125211796-3c108c80-e2a9-11eb-940d-5cbe67cf1b85.png">

# How to run
Firstly, get the source.
You can download the zip file by pressing the green "code" button above, or you can run git clone.
Now right-click the Favtool folder you got, select "new terminal at folder" and a shell will appear.
Here you can type this to run the script:

```console
$ bash favtool.sh
```
Congratulations, the script is runnig! 
Now you can drag and drop one of your favourite sites to which you want to replace the icon, from the home of Safari directly to your terminal and press return.
![Screenshot 2021-07-12 at 01 10 29](https://user-images.githubusercontent.com/87037145/125212565-97914900-e2ae-11eb-8307-c67f787f32d1.png)

Then the script will ask you to drop the icon you have chosen, you can drop it in the terminal and press return (please take a look at the "icon rules" section below)
Now by pressing any key, Safary will close, if you want to close Safari manually press ctrl+c. As soon as it will be reopened, the new icon will show up.
Repeat the process as many times as you want and enjoy!

<img width="1042" alt="Screenshot 2021-07-12 at 01 28 01" src="https://user-images.githubusercontent.com/87037145/125212852-69ad0400-e2b0-11eb-91c2-da95b0777e0e.png">



# Icon rules

You can download icons for free in many sites, these are the one I often use:

* https://icons8.com, here you can find a very big library with many styles;
* https://macosicons.com, here you can find many styles but more app/programm-oriented;
* https://www.macosicongallery.com, Here you can find original mac icons.

Icons has to be .png files, about 144x144p (Safari seems to be quite flexible, however, make sure to not overshoot 256x256p) and most importantly the **ICONS NAME CANNOT CONTAIN SPACES OR ANY OTHER SPECIAL CHARACTER**, they can be transparent.

PS: you can even make them by yourself!
Take a look at the Apple User Interface Guidelines https://developer.apple.com/design/human-interface-guidelines/macos/icons-and-images/app-icon/

# Notes

Once Favtool has changed one icon, it write-block the image folder located in ~/Library/Safari/Touch Icons Cache, in order to prevent Safari from restoring the old icons. When a favourite is added, you should set the icon manually through Favtool.

If you want to restore the original icon, run in your terminal:

```console
$ chflags nouchg ~/Library/Safari/Touch\ Icons\ Cache/Images 
$ rm -f ~/Library/Safari/Touch\ Icons\ Cache/Images 
$ killall safari
```

# if you are running Safari Technology preview

The procedure is the same but run the script by tiping (instead of bash Favtool.sh)

```console
$ bash favtoolSTP.sh
```
once you have finisced manually close Safari Technology preview with cmd+q and restart it






















