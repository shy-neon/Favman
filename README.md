# Favtool

Since macOS BigSur, apple gave users a certian degree of customisation on Safari homescreen. However, it is not unusual to see Safari not rendering favicon correctly, leaving ugly grey squares. This issue is well known, and related with the fact that sites have to provide special "Apple Touch Icon" images (which is the equivalent of a generic favicon), complient to some Apple Guidelines. Favtool allows you to quickly and easily customize favicons, by just dropping your custom icons. 

☕️ Take in mind that Favtool is a free-to-use software, developed by a single person, who spent month trobleshooting lines of code, trying to provide regular updateds and listening to users hints. So, enjoy  Favtool, leave a nice comment and if you can contribute even with a small donation! 

You can contribute by clicking the "donate" button on the app 🙏🏻 

![main](https://github.com/shy-neon/favtool/blob/main/images/main.gif)



### Getting Started

Get the source and double clik on the `.dmg` file. Here you will find the application itself.

⚠️ Whenever Favtool is run for the first time, the message ***"Apple can’t check app for malicious software"*** might be shown. In order to run favtool ctrl-click the app and select *"Open"*.

Morover, you have to grant acces to the image folder located in  `~/Library/Safari/Touch Icons Cache/Images`.  Select *"Grant Access"* under the Favtool logo and Authorize the access: this will allow favtool to read/write the folder in which the icons are located. Once the access in granted, you can restart Favtool and enjoy

### How to use

Congratulations! You are now ready to customize your Icons: select a site from the sidebar and drop an icon on the gray box. You can now customize another icon or restart Safari to apply changes.

💡 Your site list might contain many sites, even sites you don't have in your home page. Safari saves data even for sites you've visited once, to clean it up chech the  *[Manage site list](#Manage-site-list)* below this will make your life easier.

💡For suggestions about where to find custom icons or how to create icons check the section  [icon suggestion](#Icons-suggestions) below.

❓Before opening an issue or if you have further questions, check the FAQ section on wiki.

<img src="https://github.com/shy-neon/favtool/blob/main/images/guide.png" width="474" height="382" />

### Lock/Unlock image folder

The first tome FavTool is run, it locks the folder located in: `~/Library/Safari/Touch Icons Cache/Images`. This prevents Safari from automatically restore the default icons. If you want to unlock this folder click on *"File"* in the menu bar and then *"Unlock Images Folder"* (or use the ⌘U shortcut. However, make sure to keep Safari closed as long as the folder is unlocked, otherwise this may lead to issues.

### Manage site list

The site list might be very long and you might see sites twice or sites you don't even know. This is because Safari saves datas and touch icons even of sites you've visited once. To clean Safari's database and the list you can click on the round arrow above the sidebar. Wait a few seconds and restart Favtool. The list will clean the site list on the sidebar. 

If you whant do delete a single site, you can select it and click the "trash" button above.

### Restore default icons

This option allows you to delete any change you've done on icons. To do this, go to *Edit* > *Reset default icons* or use the keyboard shortcut ⌘⌥D . The whole `Touch Icons Cache` folder will be deleted, and recreated as soon as Safari is opened. Safari will reload all the icons from scratch. This option *might* fix missing icons.

### Icons suggestions

You can download icons for free in many sites, these are the one I often use:

- [https://icons8.com](https://icons8.com/) - A very big library with many styles
- [https://macosicons.com](https://macosicons.com/) - Many styles with more of an app /program focus
- [https://www.macosicongallery.com](https://www.macosicongallery.com/) - Original Mac icons

Icons has to be `.png` files, about `144`x`144p` (Safari seems to be quite flexible, however, make sure to not overshoot `256`x`256p`), they can be transparent.

You can even make them by yourself! Get started by taking a look at the [Apple User Interface Guidelines](https://developer.apple.com/design/human-interface-guidelines/macos/icons-and-images/app-icon/).

