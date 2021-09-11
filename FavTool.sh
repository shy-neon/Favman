#!/bin/bash

printf '\033[8;24;91t'
reset 


color1='\033[0;33m'
color2='\033[0;36m'
color3='\033[0;35m'
color4='\033[0,31m'
NC='\033[0m'

mainView () {
  echo ""
  echo "-Nicola D."
  echo ""
  echo -e  " ${color1}███████╗ █████╗ ██╗   ██╗████████╗ ██████╗  ██████╗ ██╗      ";
  echo m            " ██╔════╝██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔═══██╗██║      ";
  echo -e           " █████╗  ███████║██║   ██║   ██║   ██║   ██║██║   ██║██║       ${color3}## beta 2.0 ##${NC} ";
  echo -e  " ${color1}██╔══╝  ██╔══██║╚██╗ ██╔╝   ██║   ██║   ██║██║   ██║██║      ";
  echo      	   " ██║     ██║  ██║ ╚████╔╝    ██║   ╚██████╔╝╚██████╔╝███████╗ ";
  echo -e   	   " ╚═╝     ╚═╝  ╚═╝  ╚═══╝     ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝${NC}";
  
  echo "* this tool allows you to change the icons of your favourite sites in Safari"
  echo "* for any help or to report any malfunctioning, contact me via reddit @shyne-on"
  echo -e "${color2}* please, consider supporting me via PayPal: www.paypal.me/favtool${NC}"    
  echo ""
}




while true 
do
mainView
options=("Change an icon" "Unlock image folder" "Restore default icons" "Quit")
PS3='## Please enter your choice: '
select opt in "${options[@]}"
do
    case $opt in
    
        "Change an icon")
			clear -x
		    mainView

			chflags nouchg ~/Library/Safari/Touch\ Icons\ Cache/Images 
            echo "## drag here one of your favourite site from the Safari home ##"
            read favsite
            clear -x
            mainView
            domain=$(awk -F/ '{n=split($3, a, "/"); printf("%s %s", a[n-1], a[n])}' <<< $favsite)
            echo -e "# The MD5 name will be calcutade based on the string: ${color3}$domain${NC}"
            md5=$(md5 -q -s $domain)
            MD5=$(echo "$md5" |  tr '[:lower:]' '[:upper:]' )
            echo -e "# MD5 name: ${color3}$MD5${NC}"
            echo ""
            echo "## drag the icon you want to insert ##"
            read iconpath
            clear -x
            iconame=$(basename $iconpath)
            mainView
            echo -e "file choosen: ${color3}$iconame${NC}"
            
            cp $iconpath ~/Library/Safari/Touch\ Icons\ Cache/Images 
            cd ~/Library/Safari/Touch\ Icons\ Cache/Images 
            mv -f $iconame $MD5.png
            chflags uchg ~/Library/Safari/Touch\ Icons\ Cache/Images 
            
            echo "Safari is going to be closed. Press enter"
            read respond 
            Killall Safari
            open /Applications/Safari.app 

            echo -e "\033[33;5mDone! Press any key to continue\033[0m"
            read respond 
            reset 
            break
            
            ;;

            
        "Unlock image folder")
		  
		   clear -x
		   mainView
		   echo "" 
		   echo  "+ WARNING, favtool locks the image folder located in Library/Safari/Touch Icons Cache"
 		   echo  "  in order to prevent Safari from restore the original icons."
  		   echo  "  Unloking it might restore them and ruin all your work. "
           echo ""
  		   
		   read -r -p "## Do you want to procede? [y/n] " response
		   case "$response" in
		      	 [yY][eE][sS]|[yY]) 
		      	   chflags nouchg ~/Library/Safari/Touch\ Icons\ Cache/Images
		           Killall Safari
		           open /Applications/Safari.app

				   echo ""
		           echo -e "\033[33;5mThe folder is now unlock. Press any key to continue\033[0m"
				   read response
		           reset 
		           break
		           ;;

		       *)
		           reset 
		           break
		           ;;
		   esac
		   		
		   
            ;;
            
        "Restore default icons")
            clear -x
            mainView
			echo "* If Safari have not downloaded icons correctly or you want "
			echo "  to restore the original icons, type yes and run this."
		    echo "  However, all of your personal icon are going to be erased."
            
           
            echo ""
            read -r -p "## Do you want to procede? [y/n] " response
            		   case "$response" in
            		      	 [yY][eE][sS]|[yY]) 
            		           chflags nouchg ~/Library/Safari/Touch\ Icons\ Cache/Images
            		           rm -r -f  ~/Library/Safari/Touch\ Icons\ Cache
            		           Killall Safari
            		           open /Applications/Safari.app
                               echo -e "\033[33;5mIcons have been restored! press any key to continue\033[0m"
            				   read response
            		           reset 
            		           break
            		           ;;
            		         *)
		           				reset 
		           				break
		         			   ;;
            
            esac
            ;;
            
        "Quit") 
        	clear -x
			exit 0
             ;;
            
        *) echo "invalid option $REPLY";;
    esac
done
done
