# This file is meant to be included in any UNIX-like system's ~/.bashrc
# Repository containing this file is located in https://github.com/erkkimon/scripts

# Open remote IRC client with one command
alias irc="ssh -t usernamen@domain.tld screen -DRU"

# Resumable encrypted file transfers, used exactly like scp
alias rscp="rsync -avzP --rsh=ssh"

# Resume rscp transfer, just replace rscp with rscp-resume
alias rscp-resume="rsync --partial --progress --rsh=ssh"

# Pushes altered files to github w/ comment given as parameter: pushit "foo bar"
pushit() { git add --all :/ && git commit -m "$@" && git push ;}

# Download github as zip and unzip it. Give repo name as parameter.
instantiate() { wget -O .master.temp.zip https://github.com/erkkimon/$@/archive/master.zip && unzip .master.temp.zip && rm .master.temp.zip ;}

# Re-encode video to DVD quality
dvdify() { ffmpeg -i $@ -c:v libx264 -crf 23 ${@}.dvdquality.mp4;}

# Compress PDF, note that you will lose active links
pdfcompress() { gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=${@}.compressed.pdf ${@} ;}

# Compress image
imgcompress() { ffmpeg -i ${@} -q:v 10 ${@}-compressed.jpg }

# Convert PDF to JPG
pdf2jpg() { convert -density 300 ${@} ${@}-%04d.jpg ;}

# Combine four 9:16 images into one 16:9 image
4to1() { for i in ${@}*; do convert $i -resize 400x900 ${i}.sm.jpg; done; convert +append ${@}*.sm.jpg ${@}combined.jpg; rm ${@}*.sm.jpg }

# Shrink MP3
shrinkMP3() { lame -b 16 ${@} ${@}-16-bit.mp3 }
