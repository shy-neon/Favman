chflags nouchg ~/Library/SafariTechnologyPreview/Touch\ Icons\ Cache/Images 

echo "welcome in favtool by @shyne-on on reddit"
echo "READ THE README FILE IN THE MAIN DIRECTORY BEFORE USING"
echo "drag here one of your favourite sites from the safari home"
read favsite
domain=$(awk -F/ '{n=split($3, a, "/"); printf("%s %s", a[n-1], a[n])}' <<< $favsite)
echo $domain
md5=$(md5 -q -s $domain)
MD5=$(echo "$md5" |  tr '[:lower:]' '[:upper:]' )
echo "md5 name:" $MD5

echo "drag the icon you want to insert:"
read iconpath
iconame=$(basename $iconpath)

mv $iconpath ~/Library/SafariTechnologyPreview/Touch\ Icons\ Cache/Images 
cd ~/Library/SafariTechnologyPreview/Touch\ Icons\ Cache/Images 
mv -f $iconame $MD5.png
chflags uchg ~/Library/SafariTechnologyPreview/Touch\ Icons\ Cache/Images 

Echo please restart Safari Technology Preview by pressing cmd+alt+esc
read respond 



